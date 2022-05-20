-- +goose Up
-- +goose StatementBegin

CREATE TABLE IF NOT EXISTS `users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  `occupation` VARCHAR(255),
  `email` VARCHAR(255),
  `password_hash` VARCHAR(255),
  `avatar_file_name` VARCHAR(255),
  `role` VARCHAR(255),
  `token` VARCHAR(255),
  `created_at` INT,
  `updated_at` INT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS `users`;
-- +goose StatementEnd
