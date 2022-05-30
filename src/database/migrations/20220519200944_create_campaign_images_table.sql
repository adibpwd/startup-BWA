-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS `campaign_images` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `campaign_id` INT UNSIGNED NOT NULL,
  `file_name` VARCHAR(255),
  `is_primary` BOOLEAN, 
  `created_at` INT,
  `updated_at` INT DEFAULT NULL,
  PRIMARY KEY `pk_id`(`id`),
  FOREIGN KEY (campaign_id) REFERENCES campaigns(id)
) ENGINE = InnoDB;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS `campaign_images`;
-- +goose StatementEnd
