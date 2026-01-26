CREATE TABLE `occupation` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `job` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(15) NOT NULL,
    `occupation_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
    INDEX `job2occupation_idx` (`occupation_id` ASC) VISIBLE,
    CONSTRAINT `job2occupation`
    FOREIGN KEY (`occupation_id`)
    REFERENCES `occupation` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
   `kakao_id` BIGINT NOT NULL,
   `job_id` INT,
   `nickname` VARCHAR(45) NOT NULL,
    `has_watched_feature_guide` BIT(1) NOT NULL,
    PRIMARY KEY (`kakao_id`),
    INDEX `user2job_idx` (`job_id` ASC) VISIBLE,
    CONSTRAINT `user2job`
    FOREIGN KEY (`job_id`)
    REFERENCES `job` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE )
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `competency_type` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `type_name` VARCHAR(50) NOT NULL,
    `category` ENUM(
    '협업_커뮤니케이션_역량',
    '문제해결_사고_역량',
    '실행_성장_역량') NOT NULL,
    PRIMARY KEY (`id`))
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `question` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `competency_type_id` INT NOT NULL,
    `job_id` INT NOT NULL,
    `content` VARCHAR(200) NOT NULL,
    `guidance_message` VARCHAR(200) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `question2competency_type_idx` (`competency_type_id` ASC) VISIBLE,
    INDEX `question2job_idx` (`job_id` ASC) VISIBLE,
    CONSTRAINT `question2competency_type`
    FOREIGN KEY (`competency_type_id`)
    REFERENCES `competency_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `question2job`
    FOREIGN KEY (`job_id`)
    REFERENCES `job` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `mindmap` (
    `id` BINARY(16) NOT NULL,
    `created_time` DATETIME NOT NULL,
    `is_shared` BIT(1) NOT NULL,
    PRIMARY KEY (`id`))
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `episode` (
    `node_id` INT NOT NULL COMMENT '개인 마인드맵의 에피소드 노드만\n',
    `user_id` BIGINT NOT NULL,
    `mindmap_id` BINARY(16) NOT NULL,
    `situation` VARCHAR(200) NULL,
    `task` VARCHAR(200) NULL,
    `action` VARCHAR(200) NULL,
    `result` VARCHAR(200) NULL,
    `content` VARCHAR(100) NULL,
    PRIMARY KEY (`node_id`, `user_id`),
    INDEX `experience2user_idx` (`user_id` ASC) VISIBLE,
    INDEX `experience2mindmap_idx` (`mindmap_id` ASC) VISIBLE,
    CONSTRAINT `experience2user`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`kakao_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `experience2mindmap`
    FOREIGN KEY (`mindmap_id`)
    REFERENCES `mindmap` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `user2mindmap` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `mindmap_id` BINARY(16) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `2mindmap_idx` (`mindmap_id` ASC) VISIBLE,
    INDEX `2user_idx` (`user_id` ASC) VISIBLE,
    CONSTRAINT `2mindmap`
    FOREIGN KEY (`mindmap_id`)
    REFERENCES `mindmap` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT `2user`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`kakao_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `diagnosis_result` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `job_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `diagnosis_result2job_idx` (`job_id` ASC) VISIBLE,
    INDEX `diagnosis_result2user_idx` (`user_id` ASC) VISIBLE,
    CONSTRAINT `diagnosis_result2job`
    FOREIGN KEY (`job_id`)
    REFERENCES `job` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT `diagnosis_result2user`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`kakao_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `diagnosis2question` (
    `id`                  INT NOT NULL AUTO_INCREMENT,
    `diagnosis_result_id` INT NOT NULL,
    `question_id`         INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `2question_idx` (`question_id` ASC) VISIBLE,
    INDEX `2diagnosis_result_idx` (`diagnosis_result_id` ASC) VISIBLE,
    CONSTRAINT `2question`
    FOREIGN KEY (`question_id`)
    REFERENCES `question` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT `diagnosis_result`
    FOREIGN KEY (`diagnosis_result_id`)
    REFERENCES `diagnosis_result` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;
