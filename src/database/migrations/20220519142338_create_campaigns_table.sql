-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(255),
  `short_description` VARCHAR(255),
  `description` TEXT,
  `goal_amount` INT,
  `current_amount` INT,
  `perks` TEXT,
  `backer_count` INT,
  `slug` VARCHAR(255),
  `created_at` INT,
  `updated_at` INT DEFAULT NULL,
  PRIMARY KEY `pk_id`(`id`),
  FOREIGN KEY (user_id) references users(id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS `campaigns`;
-- +goose StatementEnd
