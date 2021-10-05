CREATE TABLE hotel(
                      hotel_id serial PRIMARY KEY,
                      country_id INT ,
                      category INT NOT NULL,
                      country_name VARCHAR(255) NOT NULL,
                      CONSTRAINT country_id FOREIGN KEY (country_id) REFERENCES country(country_id)
)