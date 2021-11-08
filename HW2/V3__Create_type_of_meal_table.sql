CREATE TABLE type_of_meal(
                             type_of_meal_id serial PRIMARY KEY,
                             type_of_meal VARCHAR(10) NOT NULL CHECK (type_of_mael = "RO" || type_of_mael = "BB" || type_of_mael = "HB" || type_of_mael = "AI" || type_of_mael = "UAI")
)
