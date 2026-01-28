package com.yat2.episode.mindmap;

import com.yat2.episode.auth.AuthService;
import com.yat2.episode.mindmap.dto.MindmapArgsReqDto;
import com.yat2.episode.mindmap.dto.MindmapDataDto;
import com.yat2.episode.mindmap.dto.MindmapIdentityDto;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/mindmap")
@Tag(name = "Mindmap", description = "마인드맵 관리 API")
public class MindmapController {
    private final MindmapService mindmapService;
    private final AuthService authService;

    MindmapController(MindmapService mindmapService, AuthService authService) {
        this.mindmapService = mindmapService;
        this.authService = authService;
    }

    @GetMapping("/my/private")
    @Operation(
            summary = "내 비공개 마인드맵 목록 조회",
            description = """
                    로그인한 사용자가 소유한 개인 마인드맵을 조회합니다.
                    즐겨찾기 여부 및 최근 수정일 기준으로 정렬됩니다.
                    """
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "비공개 마인드맵 목록 조회 성공"),
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
    public ResponseEntity<List<MindmapDataDto>> getMyPrivateMindmapList(@CookieValue(name = "access_token", required = false) String token) {
        Long userId = authService.getUserIdByToken(token);

        return ResponseEntity.ok(mindmapService.getPrivateMindmapById(userId));
    }

    @GetMapping("/my/public")
    @Operation(
            summary = "내 전체 마인드맵 목록 조회",
            description = """
                    로그인한 사용자가 참여 중인 팀 마인드맵을 조회합니다.
                    즐겨찾기 여부 및 최근 수정일 기준으로 정렬됩니다.
                    """
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "전체 마인드맵 목록 조회 성공"),
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
    public ResponseEntity<List<MindmapDataDto>> getMyPublicMindmapList(@CookieValue(name = "access_token", required = false) String token) {
        Long userId = authService.getUserIdByToken(token);
        return ResponseEntity.ok(mindmapService.getPublicMindmapById(userId));
    }

    @GetMapping("/my/all")
    @Operation(
            summary = "내 전체 마인드맵 목록 조회",
            description = """
                    로그인한 사용자가 참여 중인 모든 마인드맵을 조회합니다.
                    즐겨찾기 여부 및 최근 수정일 기준으로 정렬됩니다.
                    """
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "전체 마인드맵 목록 조회 성공"),
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
    public ResponseEntity<List<MindmapDataDto>> getMyAllMindmapList(@CookieValue(name = "access_token", required = false) String token) {
        Long userId = authService.getUserIdByToken(token);
        return ResponseEntity.ok(mindmapService.getAllMindmapById(userId));
    }

    @GetMapping("/my/list")
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
    public ResponseEntity<List<MindmapIdentityDto>> getMyMindmapNames(@CookieValue(name = "access_token", required = false) String token) {
        Long userId = authService.getUserIdByToken(token);
        return ResponseEntity.ok(mindmapService.getMindmapListById(userId));
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
