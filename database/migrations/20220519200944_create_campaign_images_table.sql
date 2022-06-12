-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS campaign_images (
  id SERIAL NOT NULL ,
  campaign_id integer NOT NULL,
  file_name character(255),
  is_primary BOOLEAN, 
  created_at integer,
  updated_at integer DEFAULT NULL
  -- PRIMARY KEY pk_id(id),
  -- FOREIGN KEY (campaign_id) REFERENCES campaigns(id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS campaign_images;
-- +goose StatementEnd
