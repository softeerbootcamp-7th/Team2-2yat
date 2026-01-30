ALTER TABLE occupation MODIFY name VARCHAR(20) NOT NULL;
ALTER TABLE job        MODIFY name VARCHAR(20) NOT NULL;

DROP INDEX name_UNIQUE ON job;
CREATE UNIQUE INDEX uk_job_occupation_name ON job (occupation_id, name);
