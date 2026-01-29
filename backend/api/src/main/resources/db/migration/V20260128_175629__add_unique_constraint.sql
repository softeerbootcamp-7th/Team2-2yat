ALTER TABLE mindmap_participant
    ADD CONSTRAINT uk_mindmap_participant_user_mindmap
        UNIQUE (user_id, mindmap_id);
