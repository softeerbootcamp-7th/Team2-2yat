package com.yat2.episode.mindmap;

import com.yat2.episode.mindmap.dto.MindmapArgsReqDto;
import com.yat2.episode.mindmap.dto.MindmapCreatedWithUrlDto;
import com.yat2.episode.mindmap.dto.MindmapDataExceptDateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MindmapFacade {
    private final MindmapService mindmapService;
    public MindmapCreatedWithUrlDto createMindmap(long userId, MindmapArgsReqDto reqBody) {
        MindmapDataExceptDateDto mindmapData = mindmapService.saveMindmapAndParticipant(userId, reqBody);
        try {
            return mindmapService.getUploadInfo(mindmapData);
        } catch (Exception e) {
            mindmapService.rollbackMindmap(mindmapData.mindmapId());
            throw e;
        }
    }
}