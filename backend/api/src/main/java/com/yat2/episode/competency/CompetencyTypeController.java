package com.yat2.episode.competency;

import com.yat2.episode.auth.AuthService;
import com.yat2.episode.competency.dto.DetailCompetencyTypeDto;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.Mindmap;
import com.yat2.episode.mindmap.MindmapService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/competency-type")
public class CompetencyTypeController {

    private final CompetencyTypeService competencyTypeService;
    private final MindmapService mindmapService;
    private final AuthService authService;

    @GetMapping
    public ResponseEntity<List<DetailCompetencyTypeDto>> getAllCompetencies() {
        return ResponseEntity.ok(competencyTypeService.getAllData());
    }

    @Transactional(readOnly = true)
    @GetMapping("/mindmap/{mindmapId}")
    public ResponseEntity<List<DetailCompetencyTypeDto>> getCompetenciesInMindmap(
            @CookieValue(name = "access_token", required = false) String token,
            @PathVariable String mindmapId) {

        Long userId = authService.getUserIdByToken(token);
        mindmapService.validAccessMindmap(userId, mindmapId);
        return ResponseEntity.ok(
                competencyTypeService.getCompetencyTypesInMindmap(mindmapId)
        );
    }

}
