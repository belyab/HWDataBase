CREATE TABLE client(
                       client_id serial PRIMARY KEY,
                       full_name VARCHAR(255) NOT NULL,
                       passport INT NOT NULL,
                       phone_number INT NOT NULL
)