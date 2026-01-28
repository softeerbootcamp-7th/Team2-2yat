package com.yat2.episode.mindmap;

import com.yat2.episode.auth.AuthService;
import com.yat2.episode.mindmap.dto.MindmapArgsReqDto;
import com.yat2.episode.mindmap.dto.MindmapDataDto;
import com.yat2.episode.mindmap.dto.MindmapIdentityDto;
import io.swagger.v3.oas.annotations.Operation;
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
            description = "로그인한 사용자가 소유하거나 참여 중인 마인드맵 중 비공개 상태인 마인드맵 목록을 조회합니다."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "비공개 마인드맵 목록 조회 성공"),
            @ApiResponse(responseCode = "401", description = "인증 실패 (access_token 없음 또는 만료)")
    })
    public ResponseEntity<List<MindmapDataDto>> getMyPrivateMindmapList(@CookieValue(name = "access_token", required = false) String token) {
        Long userId = authService.getUserIdByToken(token);

        return ResponseEntity.ok(mindmapService.getPrivateMindmapById(userId));
    }

    @GetMapping("/my/public")
    @Operation(
            summary = "내 전체 마인드맵 목록 조회",
            description = """
        로그인한 사용자가 소유하거나 참여 중인 모든 마인드맵을 조회합니다.
        즐겨찾기 여부 및 최근 수정일 기준으로 정렬됩니다.
        """
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "전체 마인드맵 목록 조회 성공"),
            @ApiResponse(responseCode = "401", description = "인증 실패")
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
            @ApiResponse(responseCode = "401", description = "인증 실패")
    })
    public ResponseEntity<List<MindmapDataDto>> getMyAllMindmapList() {
        //todo: userId 가져오기
        //todo: 마인드맵_참여자 table에서 userId 기준 mindmap 데이터 모두 가져오기
        //todo: 즐겨찾기/수정 순 기준으로 정렬하기

        return ResponseEntity.ok(null);
    }

    @GetMapping("/my/list")
    public ResponseEntity<List<MindmapIdentityDto>> getMyMindmapNames() {
        //todo: userId 가져오기
        //todo: 마인드맵_참여자 table에서 userId 기준 mindmap 데이터(shared = true) 가져오기
        //todo: 생성 순 기준으로 정렬하기

        return ResponseEntity.ok(null);
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
