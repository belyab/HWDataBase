CREATE TABLE client(
                       client_id INT NOT NULL PRIMARY KEY,
                       full_name VARCHAR(255) NOT NULL,
                       passport INT(11) NOT NULL,
                       phone_number INT(12) NOT NULL
)