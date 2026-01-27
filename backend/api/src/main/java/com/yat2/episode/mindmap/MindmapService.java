package com.yat2.episode.mindmap;

import com.yat2.episode.users.Users;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class MindmapService {
    private final MindmapRepository mindmapRepository;

    public MindmapService(MindmapRepository mindmapRepository) {
        this.mindmapRepository = mindmapRepository;
    }

    public Optional<Mindmap> getMindmapById(String mindmapIdStr) {
        try {
            UUID mindmapId = UUID.fromString(mindmapIdStr);
            return mindmapRepository.findById(mindmapId);
        } catch (IllegalArgumentException e) {
            return Optional.empty();
        }
    }

    public List<Mindmap> getPrivateMindmapById(Users user) {
        //todo: 구현 필요
        return null;
    }
}
