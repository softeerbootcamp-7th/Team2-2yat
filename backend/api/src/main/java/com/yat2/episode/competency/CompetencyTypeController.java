package com.yat2.episode.competency;

import com.yat2.episode.competency.dto.DetailCompetencyTypeDto;
import com.yat2.episode.users.Users;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/competency-type")
public class CompetencyTypeController {

    private final CompetencyTypeService competencyTypeService;

    public CompetencyTypeController(CompetencyTypeService competencyTypeService) {
        this.competencyTypeService = competencyTypeService;
    }

    @GetMapping
    public ResponseEntity<List<DetailCompetencyTypeDto>> getAllCompetencies() {
        return ResponseEntity.ok(competencyTypeService.getAllData());
    }
}
