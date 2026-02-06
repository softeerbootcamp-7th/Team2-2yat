package com.yat2.episode.api.competency;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import com.yat2.episode.api.auth.AuthService;
import com.yat2.episode.api.competency.dto.CompetencyTypeDto;
import com.yat2.episode.api.mindmap.MindmapService;

import static com.yat2.episode.api.global.constant.RequestAttrs.USER_ID;

@RequiredArgsConstructor
@RestController
@RequestMapping("/competency-type")
public class CompetencyTypeController {

    private final CompetencyTypeService competencyTypeService;
    private final MindmapService mindmapService;
    private final AuthService authService;

    @GetMapping
    public ResponseEntity<List<CompetencyTypeDto>> getAllCompetencies() {
        return ResponseEntity.ok(competencyTypeService.getAllData());
    }

    @GetMapping("/mindmap/{mindmapId}")
    public ResponseEntity<List<CompetencyTypeDto>> getCompetenciesInMindmap(
            @RequestAttribute(USER_ID) long userId,
            @PathVariable String mindmapId
    ) {
        mindmapService.getMindmapByUUIDString(userId, mindmapId);
        return ResponseEntity.ok(competencyTypeService.getCompetencyTypesInMindmap(mindmapId));
    }

}
