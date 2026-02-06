package com.yat2.episode.competency;

import org.springframework.stereotype.Service;

import java.util.List;

import com.yat2.episode.competency.dto.CompetencyTypeDto;

@Service
public class CompetencyTypeService {
    private final CompetencyTypeRepository competencyTypeRepository;

    public CompetencyTypeService(CompetencyTypeRepository competencyTypeRepository) {
        this.competencyTypeRepository = competencyTypeRepository;
    }

    public List<CompetencyTypeDto> getAllData() {
        return competencyTypeRepository.findAll().stream().map(CompetencyTypeDto::of).toList();
    }

    public List<CompetencyTypeDto> getCompetencyTypesInMindmap(String mindmapId) {
        return competencyTypeRepository.findByMindmapId(mindmapId).stream().map(CompetencyTypeDto::of).toList();
    }
}
