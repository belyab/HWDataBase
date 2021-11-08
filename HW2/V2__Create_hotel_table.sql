CREATE TABLE hotel(
                      hotel_id serial PRIMARY KEY,
                      country_id INT NOT NULL,
                      category INT NOT NULL CHECK (category >= 0),
                      country_name VARCHAR(255) NOT NULL,
                      CONSTRAINT country_id FOREIGN KEY (country_id) REFERENCES country(country_id)
)
