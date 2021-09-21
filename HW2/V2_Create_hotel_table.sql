CREATE TABLE hotel(
                      hotel_id INT NOT NULL PRIMARY KEY,
                      country_id INT NOT NULL,
                      category INT(5) NOT NULL,
                      CONSTRAINT country_id FOREIGN KEY (country_id) REFERENCES country(country_id)
)