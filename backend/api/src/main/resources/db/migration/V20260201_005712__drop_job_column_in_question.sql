ALTER TABLE `question`
DROP FOREIGN KEY `question2job`,
DROP INDEX `question2job_idx`,
DROP COLUMN `job_id`;