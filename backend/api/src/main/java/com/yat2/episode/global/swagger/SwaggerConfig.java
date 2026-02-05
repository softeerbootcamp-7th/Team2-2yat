package com.yat2.episode.global.swagger;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.examples.Example;
import io.swagger.v3.oas.models.media.Content;
import io.swagger.v3.oas.models.responses.ApiResponse;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springdoc.core.customizers.OperationCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.AnnotatedElementUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.yat2.episode.auth.security.Public;
import com.yat2.episode.global.exception.ErrorCode;

import static com.yat2.episode.auth.cookie.AuthCookieNames.ACCESS_COOKIE_NAME;
import static com.yat2.episode.auth.cookie.AuthCookieNames.REFRESH_COOKIE_NAME;

@Configuration
public class SwaggerConfig {
    public static final String SWAGGER_ACCESS_TOKEN = "COOKIE_ACCESS_TOKEN";
    public static final String SWAGGER_REFRESH_TOKEN = "COOKIE_REFRESH_TOKEN";

    @Bean
    public OpenAPI openAPI() {
        SecurityScheme accessTokenScheme =
                new SecurityScheme().type(SecurityScheme.Type.APIKEY).in(SecurityScheme.In.COOKIE)
                        .name(ACCESS_COOKIE_NAME).description("입력하지 마시고, 로그인 api를 실행해주세요.");

        SecurityScheme refreshTokenScheme =
                new SecurityScheme().type(SecurityScheme.Type.APIKEY).in(SecurityScheme.In.COOKIE)
                        .name(REFRESH_COOKIE_NAME).description("입력하지 마시고, 로그인 api를 실행해주세요.");

        Components components = new Components().addSecuritySchemes(SWAGGER_ACCESS_TOKEN, accessTokenScheme)
                .addSecuritySchemes(SWAGGER_REFRESH_TOKEN, refreshTokenScheme);

        SecurityRequirement globalRequirement = new SecurityRequirement().addList(SWAGGER_ACCESS_TOKEN);

        return new OpenAPI().components(components).security(List.of(globalRequirement));
    }

    @Bean
    public OperationCustomizer apiErrorCodeCustomizer() {
        return (operation, handlerMethod) -> {
            Set<ErrorCode> errorCodes = Stream.of(handlerMethod.getMethod(), handlerMethod.getBeanType())
                    .map(elem -> AnnotatedElementUtils.findAllMergedAnnotations(elem, ApiErrorCodes.class))
                    .flatMap(Collection::stream).flatMap(ann -> Arrays.stream(ann.value()))
                    .collect(Collectors.toCollection(LinkedHashSet::new));

            if (errorCodes.isEmpty()) return operation;

            errorCodes.stream().collect(Collectors.groupingBy(ec -> ec.getHttpStatus().value(),
                                                              Collectors.mapping(this::errorExample,
                                                                                 Collectors.toList()))).forEach(
                    (status, examples) -> operation.getResponses()
                            .addApiResponse(String.valueOf(status), createApiResponse(status, examples)));

            return operation;
        };
    }

    @Bean
    public OperationCustomizer publicApiCustomizer() {
        return (operation, handlerMethod) -> {

            boolean isPublic = AnnotatedElementUtils.hasAnnotation(handlerMethod.getMethod(), Public.class) ||
                               AnnotatedElementUtils.hasAnnotation(handlerMethod.getBeanType(), Public.class);

            if (isPublic) {
                operation.setSecurity(Collections.emptyList());
            }

            return operation;
        };
    }

    private ApiResponse createApiResponse(int status, List<Example> examples) {
        Map<String, Example> exampleMap = examples.stream()
                .collect(Collectors.toMap(Example::getSummary, e -> e, (e1, e2) -> e1, LinkedHashMap::new));

        return new ApiResponse().description(HttpStatus.valueOf(status).getReasonPhrase()).content(
                new Content().addMediaType(MediaType.APPLICATION_JSON_VALUE,
                                           new io.swagger.v3.oas.models.media.MediaType().examples(exampleMap)));
    }

    private Example errorExample(ErrorCode e) {
        return new Example().summary(e.getCode())
                .value(new ErrorExample(e.getHttpStatus().value(), e.getCode(), e.getMessage()));
    }

    record ErrorExample(
            int status,
            String code,
            String message
    ) {}
}
