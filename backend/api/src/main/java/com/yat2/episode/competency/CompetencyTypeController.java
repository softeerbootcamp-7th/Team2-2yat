package com.yat2.episode.competency;

import com.yat2.episode.competency.dto.DetailCompetencyTypeDto;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.Mindmap;
import com.yat2.episode.mindmap.MindmapService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/competency-type")
public class CompetencyTypeController {

    private final CompetencyTypeService competencyTypeService;
    private final MindmapService mindmapService;

    public CompetencyTypeController(CompetencyTypeService competencyTypeService,
                                    MindmapService mindmapService) {
        this.competencyTypeService = competencyTypeService;
        this.mindmapService = mindmapService;
    }

    @GetMapping
    public ResponseEntity<List<DetailCompetencyTypeDto>> getAllCompetencies() {
        return ResponseEntity.ok(competencyTypeService.getAllData());
    }

    @GetMapping("/mindmap/{mindmapId}")
    public ResponseEntity<List<DetailCompetencyTypeDto>> getCompetenciesInMindmap(@PathVariable String mindmapId) {
        Optional<Mindmap> mindmap = mindmapService.getMindmapById(mindmapId);
        //todo : 사용자 id 추출해서 해당 사용자의 episode 역량 태그만 조회하도록 수정
        if(mindmap.isEmpty()) throw new CustomException(ErrorCode.NOT_FOUND_MINDMAP);

        return ResponseEntity.ok(
                competencyTypeService.getCompetencyTypesInMindmap(mindmapId)
        );
    }

}
