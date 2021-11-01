//Inner join
//Обьединение таблиц по отелям и странам где отель находится
SELECT hotel.hotel_name,country.country_name

From hotel

    Join country on country.country_id=hotel.country_id


//Left join
//обьединение таблиц тура и типа питания, которого может и не быть

SELECT tour.tour_id,tour.tour,type_of_meal_id
FROM tour
         LEFT JOIN type_of_meal_tour on type_of_meal_tour.tour_id = tour.tour_id

//RIGHT JOIN
//обьединение таблиц тура и типа питания

SELECT tour.tour_id,tour.tour,type_of_meal_id
FROM tour
         RIGHT JOIN type_of_meal_tour on type_of_meal_tour.tour_id = tour.tour_id

//Full join
    SELECT * from sale full join "tour" on sale.tour_id = "tour".tour_id

//Cross join
select * from sale cross join employee;

//Natural join
select * from sale natural join employee;

//Semi join
select s.tour_id
from "sale" s
where exists(select *
             from tour t
             where t.tour_id = s.tour_id)

//Anti join
select s.tour_id
from "sale" s
where not exists(select 1
                 from tour t
                 where t.tour_id = s.tour_id)