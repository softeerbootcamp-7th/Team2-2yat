package com.yat2.episode.mindmap;

import com.yat2.episode.auth.AuthService;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.dto.MindmapArgsReqDto;
import com.yat2.episode.mindmap.dto.MindmapDataDto;
import com.yat2.episode.mindmap.dto.MindmapIdentityDto;
import com.yat2.episode.users.Users;
import org.springframework.context.annotation.Description;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class MindmapController  {
    private final MindmapService mindmapService;
    private final AuthService authService;

    MindmapController(MindmapService mindmapService, AuthService authService) {
        this.mindmapService = mindmapService;
        this.authService = authService;
    }

    @GetMapping("/private")
    @Description("개인 마인드맵 리스트를 가져옵니다.")
    public ResponseEntity<List<MindmapDataDto>> privateMindmap(@CookieValue(name = "access_token", required = false) String token) {
        Long userId = authService.getUserIdByToken(token);

        //todo: 마인드맵_참여자 table에서 userId 기준 mindmap 데이터(shared = false) 가져오기
        //todo: 즐겨찾기/수정 순 기준으로 정렬하기

        return ResponseEntity.ok(null);
    }

    @GetMapping("/public")
    public ResponseEntity<List<MindmapDataDto>> publicMindmap() {
        //todo: userId 가져오기
        //todo: 마인드맵_참여자 table에서 userId 기준 mindmap 데이터(shared = true) 가져오기
        //todo: 즐겨찾기/수정 순 기준으로 정렬하기

        return ResponseEntity.ok(null);
    }

    @GetMapping("/all")
    public ResponseEntity<List<MindmapDataDto>> allMindmap() {
        //todo: userId 가져오기
        //todo: 마인드맵_참여자 table에서 userId 기준 mindmap 데이터 모두 가져오기
        //todo: 즐겨찾기/수정 순 기준으로 정렬하기

        return ResponseEntity.ok(null);
    }

    @GetMapping("/list")
    public ResponseEntity<List<MindmapIdentityDto>> getMindmapNames() {
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
    public ResponseEntity<Object> connectMindmap(@PathVariable String mindmapId){
        // todo: userId 가져오기
        // todo: isShared 체크
        // todo: 기본 활동 타입 인자 기반으로 yDoc 베이스 제공 필요
        return ResponseEntity.ok(null);
    }

    @PostMapping("/disconnect/{mindmapId}")
    public ResponseEntity<Object> disconnectMindmap(@PathVariable String mindmapId){
        // todo: userId 가져오기
        // todo: 웹소켓 해제
        // todo: 기본 활동 타입 인자 기반으로 yDoc 베이스 제공 필요
        return ResponseEntity.ok(null);
    }

    @DeleteMapping("/{mindmapId}")
    public ResponseEntity<Object> deleteMindmap(@PathVariable String mindmapId){
        // todo: userId 가져오기
        // todo: mindmap participant 테이블 반영
        return ResponseEntity.ok(null);
    }
}
