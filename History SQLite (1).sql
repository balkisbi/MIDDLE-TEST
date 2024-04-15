--- 15-04-2024 21:05:15
--- SQLite
CREATE TABLE employee_table (
    employee TEXT NOT NULL,
    salary INTEGER
);

--- 15-04-2024 21:05:20
--- SQLite.1
INSERT INTO employee_table (employee, salary) 
	VALUES ('Alice', 11),('Benn', 43),('Charles', 33),('Dorothy', 55),('Emma', 22),('Franklin', 33);

--- 15-04-2024 21:05:25
--- SQLite.2
SELECT * FROM employee_table;

--- 15-04-2024 21:05:31
--- SQLite.3
SELECT DISTINCT salary
FROM employee_table
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

--- 15-04-2024 21:05:45
--- SQLite.4
CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

--- 15-04-2024 21:06:01
--- SQLite.5
INSERT INTO item_bought (buyer, item) 
	VALUES ('A', 'Asus'),('B', 'Lenovo'),('C', 'Lenovo'),('D', 'Acer'),('E', 'Acer'),('F', 'Acer');

--- 15-04-2024 21:06:09
--- SQLite.6
SELECT * FROM item_bought;

--- 15-04-2024 21:06:10
--- SQLite.6
SELECT * FROM item_bought;

--- 15-04-2024 21:06:18
--- SQLite.7
SELECT item
FROM (
    SELECT item, COUNT(item) AS total_bought
    FROM item_bought
    GROUP BY item
) AS item_counts
WHERE total_bought != (SELECT MAX(total_bought) FROM (SELECT COUNT(item) AS total_bought FROM item_bought GROUP BY item) AS temp)
AND total_bought != (SELECT MIN(total_bought) FROM (SELECT COUNT(item) AS total_bought FROM item_bought GROUP BY item) AS temp);

