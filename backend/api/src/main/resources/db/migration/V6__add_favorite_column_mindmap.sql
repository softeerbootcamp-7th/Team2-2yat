ALTER TABLE mindmap
    ADD COLUMN is_favorite TINYINT(1) NULL;

UPDATE mindmap
SET is_favorite = FALSE;

ALTER TABLE mindmap
    MODIFY is_favorite TINYINT(1) NOT NULL;
