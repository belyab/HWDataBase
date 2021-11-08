CREATE MATERIALIZED VIEW check_all_sales AS
SELECT *
FROM sale
where  tour_id = 1;

CREATE MATERIALIZED VIEW check_tour_name AS
SELECT *
FROM tour
where  tour ILIKE '%USUAL TURKEY%'