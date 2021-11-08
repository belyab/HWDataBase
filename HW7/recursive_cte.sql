CREATE TABLE recursive_cte (
    to_node varchar,
    from_node varchar,
    weight integer
);

INSERT INTO recursive_cte VALUES (NULL,'S',0),
                                 ('S','Y',3),
                                 ('U','S',3),
                                 ('X','S',5),
                                 ('V','U',6),
                                 ('Y','V',2),
                                 ('V','Y',7),
                                 ('Y','X',6),
                                 ('V','X',4),
                                 ('U','X',1),
                                 ('X','U',2);

WITH recursive path_cte (to_node2, path, cycle , weight, way) AS (
    SELECT DISTINCT from_node, array[from_node], FALSE,0, 'S'
    FROM recursive_cte
    WHERE from_node = 'S'

    UNION ALL

    SELECT arrival.to_node,
           departure.path || arrival.to_node,
           arrival.to_node = ANY (departure.path),
           arrival.weight + departure.weight,
           departure.way || ',' || arrival.to_node
    FROM recursive_cte as arrival
    INNER JOIN path_cte as departure on (departure.to_node2 = arrival.from_node) AND NOT cycle)

SELECT * FROM path_cte WHERE to_node2 = 'Y' and cycle is false

//кратчайший путь
WITH recursive path_cte (to_node2, path, cycle , weight, way) AS (
    SELECT DISTINCT from_node, array[from_node], FALSE,0, 'S'
    FROM recursive_cte
    WHERE from_node = 'S'

    UNION ALL

    SELECT arrival.to_node,
           departure.path || arrival.to_node,
           arrival.to_node = ANY (departure.path),
           arrival.weight + departure.weight,
           departure.way || ',' || arrival.to_node
    FROM recursive_cte as arrival
    INNER JOIN path_cte as departure on (departure.to_node2 = arrival.from_node) AND NOT cycle)
short_way (weight) AS (
SELECT MIN(weight) FROM path_cte WHERE to_node2 = 'Y'
)

SELECT to_node2, way, g.weight from path_cte g INNER JOIN short_way s ON g.weight = s.weight where cycle is false
