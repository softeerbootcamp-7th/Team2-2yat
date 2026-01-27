ALTER TABLE mindmap
    ADD COLUMN updated_time DATETIME(6) NULL
COMMENT '마지막 수정 시간'
AFTER created_time;

UPDATE mindmap
SET updated_time = created_time;

ALTER TABLE mindmap
    MODIFY updated_time DATETIME(6) NOT NULL;


ALTER TABLE episode
    ADD COLUMN created_time DATETIME(6) NULL
COMMENT '생성 시간';

UPDATE episode
SET created_time = NOW(6);

ALTER TABLE episode
    MODIFY created_time DATETIME(6) NOT NULL;
