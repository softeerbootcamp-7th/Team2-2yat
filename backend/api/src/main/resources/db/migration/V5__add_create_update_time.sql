ALTER TABLE mindmap
    CHANGE COLUMN created_time created_at DATETIME(6) NOT NULL
    DEFAULT CURRENT_TIMESTAMP (6);

ALTER TABLE mindmap
    ADD COLUMN updated_at DATETIME(6) NULL
    COMMENT '마지막 수정 시간'
    AFTER created_at;

UPDATE mindmap
SET updated_at = created_at;

ALTER TABLE mindmap
    MODIFY updated_at DATETIME(6) NOT NULL
    DEFAULT CURRENT_TIMESTAMP (6)
    ON
UPDATE CURRENT_TIMESTAMP(6);



ALTER TABLE episode
    ADD COLUMN created_at DATETIME(6) NULL
COMMENT '생성 시간';

UPDATE episode
SET created_at = NOW(6);

ALTER TABLE episode
    MODIFY created_at DATETIME(6) NOT NULL;
