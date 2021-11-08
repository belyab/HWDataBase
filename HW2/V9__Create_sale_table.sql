CREATE TABLE sale(
                     sale_id serial PRIMARY KEY,
                     client_id INT NOT NULL,
                     employee_id INT NOT NULL,
                     tour_id INT NOT NULL,
                     date CHAR(11) NOT NULL,
                     count INT NOT NULL check (count > 0),
                     CONSTRAINT client_id FOREIGN KEY (client_id) REFERENCES client (client_id),
                     CONSTRAINT employee_id FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
                     CONSTRAINT tour_id FOREIGN KEY (tour_id) REFERENCES tour (tour_id)
)
