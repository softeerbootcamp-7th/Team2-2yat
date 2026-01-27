package com.yat2.episode.competency;

import com.yat2.episode.competency.dto.DetailCompetencyTypeDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompetencyTypeService {
    private final CompetencyTypeRepository competencyTypeRepository;

    public CompetencyTypeService(CompetencyTypeRepository competencyTypeRepository) {
        this.competencyTypeRepository = competencyTypeRepository;
    }

    public List<DetailCompetencyTypeDto> getAllData(){
        return competencyTypeRepository.findAll().stream().map(
                DetailCompetencyTypeDto::of
        ).toList();
    }

    public List<DetailCompetencyTypeDto> getCompetencyTypesInMindmap(String mindmapId){
        return competencyTypeRepository.findByMindmapId(mindmapId)
                .stream().map(
                        DetailCompetencyTypeDto::of
                ).toList();
    }
}
