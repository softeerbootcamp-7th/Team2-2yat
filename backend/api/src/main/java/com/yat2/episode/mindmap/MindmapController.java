package com.yat2.episode.mindmap;

import com.yat2.episode.auth.AuthService;
import com.yat2.episode.mindmap.dto.MindmapArgsReqDto;
import com.yat2.episode.mindmap.dto.MindmapDataDto;
import com.yat2.episode.mindmap.dto.MindmapIdentityDto;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RequiredArgsConstructor
@RestController
@RequestMapping("/mindmap")
@Tag(name = "Mindmap", description = "마인드맵 관리 API")
public class MindmapController {
    public enum MindmapVisibility {
        ALL, PRIVATE, PUBLIC
    }

    private final MindmapService mindmapService;
    private final AuthService authService;

    @Operation(
            summary = "마인드맵 목록 조회 (통합)",
            description = """
                    로그인한 사용자의 마인드맵 목록을 조회합니다.
                    Query Parameter를 통해 전체(ALL), 비공개(PRIVATE), 공개/팀(PUBLIC)을 필터링합니다.
                    파라미터가 없으면 기본값은 ALL입니다.
                    """
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "마인드맵 목록 조회 성공"),
            @ApiResponse(responseCode = "401", description = "인증 실패")
    })
    @GetMapping
    public ResponseEntity<List<MindmapDataDto>> getMindmaps(
            @CookieValue(name = "access_token", required = false) String token,
            @Parameter(description = "조회할 마인드맵 유형 (ALL, PRIVATE, PUBLIC)")
            @RequestParam(name = "type", required = false, defaultValue = "ALL") MindmapVisibility type
    ) {
        Long userId = authService.getUserIdByToken(token);
        return ResponseEntity.ok(mindmapService.getMindmaps(userId, type));
    }

    @Operation(
            summary = "내 마인드맵 이름 목록 조회",
            description = """
                    로그인한 사용자가 참여 중인 마인드맵의 식별 정보(아이디, 이름) 목록을 조회합니다.
                    마인드맵 선택 드롭다운, 사이드바 등에 사용됩니다.
                    """
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "마인드맵 이름 목록 조회 성공"),
            @ApiResponse(
                    responseCode = "401",
                    description = """
                            인증 실패  
                            - UNAUTHORIZED  
                            - AUTH_EXPIRED  
                            - INVALID_TOKEN  
                            - INVALID_TOKEN_SIGNATURE  
                            - INVALID_TOKEN_ISSUER  
                            - INVALID_TOKEN_TYPE  
                            """,
                    content = @Content
            )

    })
    @GetMapping("/titles")
    public ResponseEntity<List<MindmapIdentityDto>> getMyMindmapNames(@CookieValue(name = "access_token", required = false) String token) {
        Long userId = authService.getUserIdByToken(token);
        return ResponseEntity.ok(mindmapService.getMindmapList(userId));
    }


    @PostMapping()
    public ResponseEntity<Object> createMindmap(@RequestBody MindmapArgsReqDto reqBody) {
        // todo: userId 가져오기
        // todo: isShared 여부 기반 웹소켓 로직 추가
        // todo: 기본 활동 타입 인자 기반으로 yDoc 베이스 제공 필요
        return ResponseEntity.ok(null);
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

    @DeleteMapping("/{mindmapId}")
    public ResponseEntity<Object> deleteMindmap(@PathVariable String mindmapId) {
        // todo: userId 가져오기
        // todo: mindmap participant 테이블 반영
        return ResponseEntity.ok(null);
    }
}
