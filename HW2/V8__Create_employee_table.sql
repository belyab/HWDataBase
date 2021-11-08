CREATE TABLE employee(
                         employee_id serial PRIMARY KEY,
                         full_name VARCHAR(255) NOT NULL check(char_length(full_name) > 0 ),
                         phone_number varchar(11) NOT NULL check (char_length(phone_number) = 11 )
)
