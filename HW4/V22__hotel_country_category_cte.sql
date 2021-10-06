//выбор отеля по определенной стране и категории
WITH hotel_country_category_cte AS(
FROM hotel
WHERE country_id = 1 AND category = 5
RETURNING *
)
SELECT * FROM hotel_country_category_cte