CREATE TABLE type_of_meal_tour(
                                  type_of_meal_id INT ,
                                  tour_id INT ,
                                  CONSTRAINT type_of_meal_id FOREIGN KEY (type_of_meal_id) REFERENCES type_of_meal (type_of_meal_id),
                                  CONSTRAINT tour_id FOREIGN KEY (tour_id) REFERENCES tour (tour_id)
)