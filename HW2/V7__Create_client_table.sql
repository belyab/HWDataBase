CREATE TABLE client(
                       client_id serial PRIMARY KEY,
                       full_name VARCHAR(255) NOT NULL,
                       passport BIGINT NOT NULL,
                       phone_number BIGINT NOT NULL
)