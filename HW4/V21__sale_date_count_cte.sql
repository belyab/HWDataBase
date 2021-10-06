//количество продаж в разбивке по датам
WITH sale_date_count_cte AS (
    SELECT *
    FROM sale
)
SELECT count(sale_id) as count_sale, date
FROM sale_date_count_cte
group by date