-- +goose Up
-- +goose StatementBegin
ALTER TABLE `transactions` ADD COLUMN `payment_url` VARCHAR(255) default NULL AFTER `code`;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
ALTER TABLE `transactions` DROP COLUMN `payment_url`;
-- +goose StatementEnd
