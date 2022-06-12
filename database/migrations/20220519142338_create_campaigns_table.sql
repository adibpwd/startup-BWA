-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS campaigns (
  id SERIAL NOT NULL,
  user_id integer NOT NULL,
  name character(255),
  short_description character(255),
  description TEXT,
  goal_amount integer,
  current_amount integer,
  perks TEXT,
  backer_count integer,
  slug character(255),
  created_at integer,
  updated_at integer DEFAULT NULL
  -- PRIMARY KEY pk_id(id),
  -- FOREIGN KEY (user_id) references users(id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS campaigns;
-- +goose StatementEnd
