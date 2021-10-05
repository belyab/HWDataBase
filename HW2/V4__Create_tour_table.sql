CREATE TABLE tour(
                     tour_id serial PRIMARY KEY,
                     type_of_meal_id INT ,
                     hotel_id INT ,
                     tour VARCHAR(255) NOT NULL,
                     cost INT NOT NULL,
                     departure_date CHAR(15) NOT NULL,
                     departure_city VARCHAR (255) NOT NULL,
                     adult_kids CHAR(10) NOT NULL,
                     nights_days CHAR(10) NOT NULL,
                     CONSTRAINT type_of_meal_id FOREIGN KEY (type_of_meal_id) REFERENCES type_of_meal(type_of_meal_id),
                     CONSTRAINT hotel_id FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
)