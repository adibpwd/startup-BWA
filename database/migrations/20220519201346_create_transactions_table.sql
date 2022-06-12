-- +goose Up
-- +goose StatementBegin

CREATE TABLE IF NOT EXISTS transactions (
  id SERIAL NOT NULL,
  campaign_id integer NOT NULL,
  user_id integer NOT NULL,
  amount integer,
  status character(255),
  code character(255),
  payment_url character(255) DEFAULT NULL,
  created_at integer,
  updated_at integer DEFAULT NULL
  -- PRIMARY KEY pk_id(id),
  -- FOREIGN KEY (campaign_id) references campaigns(id),
  -- FOREIGN KEY (user_id) references users(id)
);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS transactions;
-- +goose StatementEnd
