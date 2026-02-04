package com.yat2.episode.mindmap;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;
import java.util.List;

import com.yat2.episode.auth.AuthService;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.global.exception.ErrorResponse;
import com.yat2.episode.global.swagger.ApiErrorCodes;
import com.yat2.episode.global.swagger.AuthRequiredErrors;
import com.yat2.episode.mindmap.dto.MindmapArgsReqDto;
import com.yat2.episode.mindmap.dto.MindmapCreatedWithUrlDto;
import com.yat2.episode.mindmap.dto.MindmapDataDto;
import com.yat2.episode.mindmap.dto.MindmapIdentityDto;
import com.yat2.episode.mindmap.dto.MindmapNameUpdateReqDto;

import static com.yat2.episode.global.constant.RequestAttrs.USER_ID;


@RequiredArgsConstructor
@RestController
@RequestMapping("/mindmap")
@Tag(name = "Mindmap", description = "마인드맵 관리 API")
public class MindmapController {
    private final MindmapService mindmapService;
    private final AuthService authService;
    private final MindmapFacade mindmapFacade;

    @Operation(summary = "마인드맵 목록 조회 (통합)", description = """
            로그인한 사용자의 마인드맵 목록을 조회합니다.
            Query Parameter를 통해 전체(ALL), 비공개(PRIVATE), 공개/팀(PUBLIC)을 필터링합니다.
            파라미터가 없으면 기본값은 ALL입니다.
            """)
    @ApiResponses({ @ApiResponse(responseCode = "200", description = "마인드맵 목록 조회 성공"),
                    @ApiResponse(responseCode = "401", description = "인증 실패",
                            content = @Content(schema = @Schema(implementation = ErrorResponse.class))),
                    @ApiResponse(responseCode = "404", description = "존재하지 않는 사용자", content = @Content),
                    @ApiResponse(responseCode = "500", description = "서버 오류", content = @Content) })
    @GetMapping
    public ResponseEntity<List<MindmapDataDto>> getMindmaps(
            @CookieValue(name = "access_token", required = false) String token,
            @Parameter(description = "조회할 마인드맵 유형 (ALL, PRIVATE, PUBLIC)")
            @RequestParam(name = "type", required = false, defaultValue = "ALL") MindmapVisibility type) {
        Long userId = authService.getUserIdByToken(token);
        return ResponseEntity.ok(mindmapService.getMindmaps(userId, type));
    }

    @Operation(summary = "마인드맵 조회", description = """
            입력된 마인드맵의 UUID를 기반으로 마인드맵 데이터를 조회합니다.
            """)
    @ApiResponses({ @ApiResponse(responseCode = "200", description = "마인드맵 조회 성공"),
                    @ApiResponse(responseCode = "401", description = "인증 실패(토큰 없음/만료/유효하지 않음)", content = @Content),
                    @ApiResponse(responseCode = "404", description = "존재하지 않는 사용자", content = @Content),
                    @ApiResponse(responseCode = "500", description = "서버 " + "오류", content = @Content) })
    @GetMapping("/{mindmapId}")
    public ResponseEntity<MindmapDataDto> getMindmap(@RequestAttribute(USER_ID) long userId,
                                                     @PathVariable String mindmapId) {
        return ResponseEntity.ok(mindmapService.getMindmapById(userId, mindmapId));
    }

    @Operation(summary = "내 마인드맵 이름 목록 조회", description = """
            로그인한 사용자가 참여 중인 마인드맵의 식별 정보(아이디, 이름) 목록을 조회합니다.
            마인드맵 선택 드롭다운, 사이드바 등에 사용됩니다.
            """)
    @ApiResponses({ @ApiResponse(responseCode = "200", description = "마인드맵 이름 목록 조회 성공"),
                    @ApiResponse(responseCode = "401", description = "인증 실패(토큰 없음/만료/유효하지 않음)", content = @Content),
                    @ApiResponse(responseCode = "404", description = "존재하지 않는 사용자", content = @Content),
                    @ApiResponse(responseCode = "500", description = "서버 " + "오류", content = @Content)

    })
    @GetMapping("/titles")
    public ResponseEntity<List<MindmapIdentityDto>> getMyMindmapNames(@RequestAttribute(USER_ID) long userId) {
        return ResponseEntity.ok(mindmapService.getMindmapList(userId));
    }

    @Operation(summary = "내 마인드맵 생성", description = """
            마인드맵을 생성합니다.
            팀 마인드맵 생성 시에는 중심 노드가 되는 프로젝트 명이 default 마인드맵 명이 됩니다. 입력이 필수입니다.
            개인 마인드맵 생성 시에는 사용자 명을 기반으로 생성된 이름이 default 마인드맵 명이 됩니다.
             입력 값이 있으면 해당 이름으로 생성됩니다. (프론트에서의 api 호출 유연성을 위함.)
            웹 소켓 연결은 별도 요청이 필요합니다.
            """)
    @ApiResponses({ @ApiResponse(responseCode = "201", description = "마인드맵 생성 성공"),
                    @ApiResponse(responseCode = "400", description = """
                            잘못된 요청
                            - MINDMAP_TITLE_REQUIRED: 팀 마인드맵 생성 시 제목 누락
                            """, content = @Content),
                    @ApiResponse(responseCode = "401", description = "인증 실패(토큰 없음/만료/유효하지 않음)", content = @Content),
                    @ApiResponse(responseCode = "404", description = "존재하지 않는 사용자", content = @Content),
                    @ApiResponse(responseCode = "500", description = "서버 오류", content = @Content)

    })
    @PostMapping()
    public ResponseEntity<MindmapCreatedWithUrlDto> createMindmap(@RequestAttribute(USER_ID) long userId,
                                                                  @RequestBody MindmapArgsReqDto reqBody) {
        MindmapCreatedWithUrlDto resBody = mindmapFacade.createMindmap(userId, reqBody);
        URI location = mindmapService.getCreatedURI(resBody.mindmap().mindmapId());
        return ResponseEntity.created(location).body(resBody);
    }

    @PostMapping("/connect/{mindmapId}")
    public ResponseEntity<Object> connectMindmap(@PathVariable String mindmapId) {
        // todo: userId 가져오기
        // todo: isShared 체크
        // todo: 기본 활동 타입 인자 기반으로 yDoc 베이스 제공 필요
        return ResponseEntity.ok(null);
    }

    @PostMapping("/disconnect/{mindmapId}")
    public ResponseEntity<Object> disconnectMindmap(@PathVariable String mindmapId) {
        // todo: userId 가져오기
        // todo: 웹소켓 해제
        // todo: 기본 활동 타입 인자 기반으로 yDoc 베이스 제공 필요
        return ResponseEntity.ok(null);
    }

    @Operation(summary = "마인드맵 삭제", description = """
            마인드맵을 삭제합니다.
            팀 마인드맵/개인 마인드맵 참여 목록에서 사용자를 삭제합니다.
            다른 참여자가 존재하는 경우, 마인드맵 자체 데이터는 유지되어
            다른 참여자에게 영향이 가지 않습니다.
            """)
    @ApiResponses({ @ApiResponse(responseCode = "204", description = "삭제 성공", content = @Content) })
    @AuthRequiredErrors
    @ApiErrorCodes({ ErrorCode.USER_NOT_FOUND, ErrorCode.INTERNAL_ERROR, ErrorCode.MINDMAP_NOT_FOUND })
    @DeleteMapping("/{mindmapId}")
    public ResponseEntity<?> deleteMindmap(@RequestAttribute(USER_ID) long userId, @PathVariable String mindmapId) {
        mindmapService.deleteMindmap(userId, mindmapId);
        return ResponseEntity.noContent().build();
    }

    @Operation(summary = "마인드맵 즐겨찾기 상태 변경", description = "마인드맵의 즐겨찾기 여부를 설정하거나 해제합니다.")
    @ApiResponses({ @ApiResponse(responseCode = "200", description = "업데이트 성공",
            content = @Content(schema = @Schema(implementation = MindmapDataDto.class))) })
    @AuthRequiredErrors
    @ApiErrorCodes({ ErrorCode.USER_NOT_FOUND, ErrorCode.INTERNAL_ERROR, ErrorCode.MINDMAP_NOT_FOUND })
    @PatchMapping("/{mindmapId}/favorite")
    public ResponseEntity<MindmapDataDto> updateFavoriteStatus(@RequestAttribute(USER_ID) long userId,
                                                               @PathVariable String mindmapId,
                                                               @RequestParam boolean status) {
        MindmapDataDto updatedMindmap = mindmapService.updateFavoriteStatus(userId, mindmapId, status);
        return ResponseEntity.ok(updatedMindmap);
    }

    @Operation(summary = "마인드맵 이름 변경", description = "마인드맵의 이름을 변경합니다. 팀 마인드맵 또한 모든 사용자에게 반영되는 수정 사항입니다.")
    @ApiResponses({ @ApiResponse(responseCode = "200", description = "업데이트 성공",
            content = @Content(schema = @Schema(implementation = MindmapDataDto.class))) })
    @AuthRequiredErrors
    @ApiErrorCodes({ ErrorCode.USER_NOT_FOUND, ErrorCode.INTERNAL_ERROR, ErrorCode.MINDMAP_NOT_FOUND })
    @PatchMapping("/{mindmapId}/name")
    public ResponseEntity<MindmapDataDto> updateName(@RequestAttribute(USER_ID) long userId,
                                                     @PathVariable String mindmapId,
                                                     @Valid @RequestBody MindmapNameUpdateReqDto request) {
        MindmapDataDto updatedMindmap = mindmapService.updateName(userId, mindmapId, request.name());
        return ResponseEntity.ok(updatedMindmap);
    }

    public enum MindmapVisibility {
        ALL, PRIVATE, PUBLIC
    }
}
