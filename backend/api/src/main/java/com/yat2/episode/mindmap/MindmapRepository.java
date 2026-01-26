package com.yat2.episode.mindmap;

import com.yat2.episode.users.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface MindmapRepository  extends JpaRepository<Mindmap, UUID> {
}
