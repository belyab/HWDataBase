create table airport (
                         airport_id serial primary key,
                         airport_name varchar(40) check (char_length(airport_name) > 1)
);

insert into airport(airport_name)
values ('Domodedovo');
insert into airport(airport_name)
values ('Ufa');
insert into airport(airport_name)
values ('Kazan');

create table airplane (
                          airplane_id serial primary key,
                          model varchar(40) check (char_length(model) > 1)
);

insert into airplane(model)
values ('A350-900');
insert into airplane(model)
values ('DH8D');
insert into airplane(model)
values ('777-300ER');

create table flights (
                         flight_id serial primary key,
                         flight_number varchar(40) check (char_length(flight_number) > 1),
                         flight_duration real constraint duration_length check (flight_duration > 0),
                         date date not null,
                         arrival_time time not null,
                         airplane_id integer not null,
                         foreign key (airplane_id) references airplane (airplane_id),
                         departure_airport_id integer not null,
                         foreign key (departure_airport_id) references airport (airport_id),
                         arrival_airport_id integer not null,
                         foreign key (arrival_airport_id) references airport (airport_id),
                         flight_crew_id integer,
                         foreign key (flight_crew_id) references flight_crew(flight_crew_id)
);

insert into flights(flight_number, flight_duration, date, arrival_time, airplane_id, departure_airport_id, arrival_airport_id,flight_crew_id)
values ('SU106', '2.15', '2021-08-12','12:15', 1, 1, 3,1);
insert into flights(flight_number, flight_duration, date, arrival_time, airplane_id, departure_airport_id, arrival_airport_id,flight_crew_id)
values ('LO805', '4.20', '2021-06-23', '12:25', 1, 1, 2,1);
insert into flights(flight_number, flight_duration, date, arrival_time, airplane_id, departure_airport_id, arrival_airport_id,flight_crew_id)
values ('FR112', '2', '2020-05-14', '13:55', 2, 1, 3,1);
insert into flights(flight_number, flight_duration, date, arrival_time, airplane_id, departure_airport_id, arrival_airport_id)
values ('PO782', '4.10', '2020-05-14', '22:15', 3, 1, 2);
insert into flights(flight_number, flight_duration, date, arrival_time, airplane_id, departure_airport_id, arrival_airport_id)
values ('GE008', '4.14', '2020-05-14', '16:15', 1, 2, 1);
insert into flights(flight_number, flight_duration, date, arrival_time, airplane_id, departure_airport_id, arrival_airport_id)
values ('LНЕ80', '2.30', '2021-06-23', '23:32', 2, 3, 1);
insert into flights(flight_number, flight_duration, date, arrival_time, airplane_id, departure_airport_id, arrival_airport_id)
values ('TTG43', '4', '2021-08-12', '02:15', 2, 2, 1);
insert into flights(flight_number, flight_duration, date, arrival_time, airplane_id, departure_airport_id, arrival_airport_id)
values ('WER78', '2.23', '2020-04-22', '22:18', 3, 1, 3);
insert into flights(flight_number, flight_duration, date, arrival_time, airplane_id, departure_airport_id, arrival_airport_id)
values ('UY068', '2.15', '2020-04-22', '12:15', 1, 3, 2);
insert into flights(flight_number, flight_duration, date, arrival_time, airplane_id, departure_airport_id, arrival_airport_id)
values ('HH551', '2', '2021-03-03', '15:15', 1, 1, 3);

create table passengers (
                            passenger_id serial primary key,
                            first_name varchar(256) check (char_length(first_name) > 1),
                            last_name varchar(256) check (char_length(last_name) > 1),
                            passport varchar(256) check (char_length(passport) > 1),
                            flight_id integer not null,
                            foreign key (flight_id) references flights (flight_id)
);

insert into passengers(first_name, last_name, passport, flight_id)
values ('Zukhra', 'Shagiakhmetova',80165092786, 1);
insert into passengers(first_name, last_name, passport, flight_id)
values ('Elmira', 'Baigulova',83165492786, 3);
insert into passengers(first_name, last_name, passport, flight_id)
values ('Elmira', 'Baigulova',83165492786, 5);
insert into passengers(first_name, last_name, passport, flight_id)
values ('Yana', 'Nasyrova',80165092736, 2);

create table pilot (
                       pilot_id serial primary key,
                      name varchar(255) check (char_length(name) > 1)
);
create table stewardess (
                            stewardess_id serial primary key,
                       name varchar(255) check (char_length(name) > 1)
);
create table engineer (
                          engineer_id serial primary key,
                       name varchar(255) check (char_length(name) > 1)
);

insert into pilot (name)
values ('Tambi');
insert into stewardess (name)
values ('Elina');
insert into engineer (name)
values ('Ruslan');

create table flight_crew (
                         flight_crew_id serial primary key,
                         pilot_id integer not null,
                         stewardess_id integer not null,
                         engineer_id integer not null,
                      foreign key (pilot_id) references pilot(pilot_id),
                         foreign key (stewardess_id) references stewardess(stewardess_id),
                         foreign key (engineer_id) references engineer(engineer_id)
);

Insert into flight_crew(flight_crew_id, pilot_id, stewardess_id, engineer_id);
values (1,1,1,1);

-- Для каждого пилота вывести цепочку городов, по которым он летал.
Select pilot.name, array_agg(airport.airport_name order by flights.departure_airport_id asc) towndown
From pilot
         Right join flight_crew on pilot.pilot_id = flight_crew.pilot.pilot_id
         Right join flights
                    On flights.crew_id = flight_crew.flight_crew_id
         Right join airport on flights.departure_airport_id=airport.airport_id
Group by pilot.pilot_id


-- Самый продолжительный по времени рейс.
select flight_number, flight_duration from flights
where flights.flight_duration = (select max(flights.flight_duration) from flights);

-- Количество рейсов для каждого аэропорта за указанный день
select airport_name, count(distinct flight_id) as count_of_flights from flights, airport
where flights.departure_airport_id = airport.airport_id
  and flights.date = '2020-05-14'
group by airport.airport_name;

-- ФИО пассажира, который провел в полетах наибольшее количество часов и наименьшее
with t1 as (
    select first_name as firstName, last_name as lastName, sum(flight_duration) as total
    from passengers join flights f on passengers.flight_id = f.flight_id group by first_name, last_name
)
select firstName, lastName, total as hours from t1 where total = (select min(total) from t1)
UNION
select firstName, lastName, total as hours from t1 where total = (select max(total) from t1);