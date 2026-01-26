package com.yat2.episode.global;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

import static com.yat2.episode.global.constant.cookieConstants.*;

@Configuration
public class SwaggerConfig {

    @Bean
    public OpenAPI openAPI() {
        SecurityScheme accessTokenScheme = new SecurityScheme()
                .type(SecurityScheme.Type.APIKEY)
                .in(SecurityScheme.In.COOKIE)
                .name(ACCESS_TOKEN)
                .description("입력하지 마시고, 로그인 api를 실행해주세요.");

        SecurityScheme refreshTokenScheme = new SecurityScheme()
                .type(SecurityScheme.Type.APIKEY)
                .in(SecurityScheme.In.COOKIE)
                .name(REFRESH_TOKEN)
                .description("입력하지 마시고, 로그인 api를 실행해주세요.");

        Components components = new Components()
                .addSecuritySchemes(SWAGGER_ACCESS_TOKEN, accessTokenScheme)
                .addSecuritySchemes(SWAGGER_REFRESH_TOKEN, refreshTokenScheme);

        SecurityRequirement globalRequirement = new SecurityRequirement()
                .addList(SWAGGER_ACCESS_TOKEN);

        return new OpenAPI()
                .components(components)
                .security(List.of(globalRequirement));
    }
}