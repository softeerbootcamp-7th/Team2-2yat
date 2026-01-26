
ALTER TABLE `user2mindmap` DROP FOREIGN KEY `2mindmap`;
ALTER TABLE `user2mindmap` DROP FOREIGN KEY `2user`;

ALTER TABLE `user2mindmap` RENAME TO `mindmap_participant`;

ALTER TABLE `mindmap_participant` RENAME INDEX `2mindmap_idx` TO `idx_participant_mindmap`;
ALTER TABLE `mindmap_participant` RENAME INDEX `2user_idx` TO `idx_participant_user`;

ALTER TABLE `mindmap_participant`
    ADD CONSTRAINT `fk_participant_mindmap`
    FOREIGN KEY (`mindmap_id`) REFERENCES `mindmap` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE `mindmap_participant`
    ADD CONSTRAINT `fk_participant_user`
    FOREIGN KEY (`user_id`) REFERENCES `users` (`kakao_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;


ALTER TABLE `diagnosis2question` DROP FOREIGN KEY `2question`;
ALTER TABLE `diagnosis2question` DROP FOREIGN KEY `diagnosis_result`;

ALTER TABLE `diagnosis2question` RENAME TO `diagnosis_item`;

ALTER TABLE `diagnosis_item` RENAME INDEX `2question_idx` TO `idx_item_question`;
ALTER TABLE `diagnosis_item` RENAME INDEX `2diagnosis_result_idx` TO `idx_item_result`;

ALTER TABLE `diagnosis_item`
    ADD CONSTRAINT `fk_item_question`
    FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE `diagnosis_item`
    ADD CONSTRAINT `fk_item_result`
    FOREIGN KEY (`diagnosis_result_id`) REFERENCES `diagnosis_result` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;