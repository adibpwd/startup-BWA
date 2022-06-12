-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS users (
  id SERIAL NOT NULL PRIMARY KEY,
  name character(255),
  occupation character(255),
  email character(255),
  password_hash character(255),
  avatar_file_name character(255),
  role character(255),
  token character(255),
  created_at integer,
  updated_at integer NULL
  -- PRIMARY KEY pk_id(id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS users;
-- +goose StatementEnd
