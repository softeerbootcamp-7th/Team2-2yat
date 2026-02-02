ALTER TABLE mindmap DROP COLUMN is_favorite;

ALTER TABLE mindmap_participant
    ADD COLUMN is_favorite BOOLEAN DEFAULT FALSE;