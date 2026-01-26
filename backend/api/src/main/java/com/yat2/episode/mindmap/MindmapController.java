package com.yat2.episode.mindmap;

import com.yat2.episode.mindmap.dto.MindmapDataDto;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class MindmapController  {
    private final MindmapService mindmapService;

    MindmapController(MindmapService mindmapService) {
        this.mindmapService = mindmapService;
    }

    @GetMapping("/private")
    public ResponseEntity<List<MindmapDataDto>> privateMindmap() {
        //todo: userId 가져오기
        //todo: 마인드맵_참여자 table에서 userId 기준 mindmap 데이터(shared = false) 가져오기
        //todo: 즐겨찾기 기준으로 정렬하기

        return ResponseEntity.ok(null);
    }

    @GetMapping("/public")
    public ResponseEntity<List<MindmapDataDto>> publicMindmap() {
        //todo: userId 가져오기
        //todo: 마인드맵_참여자 table에서 userId 기준 mindmap 데이터(shared = true) 가져오기
        //todo: 즐겨찾기 기준으로 정렬하기

        return ResponseEntity.ok(null);
    }
}
