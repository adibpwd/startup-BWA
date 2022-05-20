-- +goose Up
-- +goose StatementBegin

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `campaign_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `amount` INT,
  `status` VARCHAR(255),
  `code` VARCHAR(255),
  `created_at` INT,
  `updated_at` INT DEFAULT NULL,
  PRIMARY KEY `pk_id`(`id`),
  FOREIGN KEY (campaign_id) references campaigns(id),
  FOREIGN KEY (user_id) references users(id)
) ENGINE = InnoDB;

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS `transactions`;
-- +goose StatementEnd
