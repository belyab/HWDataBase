CREATE TABLE tour_hotel(
                           hotel_id INT,
                           tour_id INT,
                           CONSTRAINT hotel_id FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id),
                           CONSTRAINT tour_id FOREIGN KEY (tour_id) REFERENCES tour(tour_id)
)
