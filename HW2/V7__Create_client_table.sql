CREATE TABLE client(
                       client_id serial PRIMARY KEY,
                       full_name VARCHAR(255) NOT NULL CHECK (char_length(full_name) > 1),
                       passport varchar(10) NOT NULL (char_length(passport) =10 ) ,
                       phone_number varchar(11) NOT NULL (char_length(passport) =11 )
)
