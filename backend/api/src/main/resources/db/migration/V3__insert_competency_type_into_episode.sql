ALTER TABLE `episode`
    ADD COLUMN `competency_type_id` INT NULL,
ADD INDEX `episode2competency_type_idx` (`competency_type_id` ASC),
ADD CONSTRAINT `episode2competency_type`
FOREIGN KEY (`competency_type_id`)
REFERENCES `competency_type` (`id`)
ON DELETE SET NULL
ON UPDATE CASCADE;