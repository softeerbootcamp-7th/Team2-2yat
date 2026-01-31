CREATE TABLE `question_job_mapping` (
                                `id` INT NOT NULL AUTO_INCREMENT,
                                `question_id` INT NOT NULL,
                                `job_id` INT NOT NULL,
                                PRIMARY KEY (`id`),
                                INDEX `idx_question_job_question` (`question_id`),
                                INDEX `idx_question_job_job` (`job_id`),
                                CONSTRAINT `fk_qj_question`
                                    FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
                                        ON DELETE CASCADE,
                                CONSTRAINT `fk_qj_job`
                                    FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
                                        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `question_job_mapping` (
                                        `id` INT NOT NULL AUTO_INCREMENT,
                                        `question_id` INT NOT NULL,
                                        `job_id` INT NOT NULL,
                                        PRIMARY KEY (`id`),
                                        UNIQUE KEY `uq_question_job` (`question_id`, `job_id`),
                                        INDEX `idx_question_job_job` (`job_id`),

                                        CONSTRAINT `fk_qj_question`
                                            FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
                                                ON DELETE CASCADE,
                                        CONSTRAINT `fk_qj_job`
                                            FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
                                                ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;