# Introdução
[Steel Data SQL Challenge 1](https://steeldata.org.uk/SQL1.html)

--- 1.	What are the details of all cars purchased in the year 2022?

SELECT cars.car_id, make, type, style, cost_$ FROM cars
INNER JOIN sales
ON cars.car_id = sales.car_id
WHERE purchase_date BETWEEN '2022-01-01' AND '2022-12-31';

--- 2.	What is the total number of cars sold by each salesperson?

SELECT name, COUNT(sale_id) FROM sales
INNER JOIN salespersons
ON sales.salesman_id = salespersons.salesman_id
GROUP BY name;

--- 3.	What is the total revenue generated by each salesperson?

SELECT name, COUNT(cars.cost_$) as total_revenue FROM salesperson sp
INNER JOIN sales s
ON sp.salesman_id = s.salesman_id
INNER JOIN cars c
ON s.car_id = c.car_id
GROUP BY name
ORDER BY total_revenue DESC;

--- 4.	What are the details of the cars sold by each salesperson?

SELECT salespersons.name, make, type, style FROM cars
INNER JOIN sales
ON cars.car_id = sales.car_id
INNER JOIN salespersons
ON salespersons.salesman_id = sales.salesman_id
ORDER BY name;

--- 5.	What is the total revenue generated by each car type?

SELECT type, SUM(cost_$) as total_revenue FROM cars c
INNER JOIN sales s
ON c.car_id = s.car_id
GROUP BY type
ORDER BY total_revenue DESC;

--- 6.	What are the details of the cars sold in the year 2021 by salesperson 'Emily Wong'?

SELECT name, make, type, style, cost_$, purchase_date FROM sales s
INNER JOIN salespersons sp
ON s.salesman_id = sp.salesman_id
INNER JOIN cars c
ON s.car_id = c.car_id
WHERE name = 'Emily Wong'
AND purchase_date BETWEEN '2021-01-01' AND '2021-12-31';

--- 7.	What is the total revenue generated by the sales of hatchback cars?

SELECT SUM(cost_$) as total_revenue FROM cars c
INNER JOIN sales s
ON c.car_id = s.car_id
WHERE type = 'Hatchback';

--- 8.	What is the total revenue generated by the sales of SUV cars in the year 2022?

SELECT SUM(cost_$) as total_revenue FROM cars c
INNER JOIN sales s
ON c.car_id = s.car_id
WHERE style = 'SUV'
AND purchase_date BETWEEN '2022-01-01' AND '2022-12-31';

--- 9. What is the name and city of the salesperson who sold the most number of cars in the year 2023?

SELECT name, city, COUNT(s.salesman_id) as total_sales FROM salespersons sp
INNER JOIN sales s
ON sp.salesman_id = s.salesman_id
GROUP BY name, city
ORDER BY total_sales DESC
LIMIT 1;

--- 10. What is the name and age of the salesperson who generated the highest revenue in the year 2022?

SELECT name, age, SUM(cost_$) as total_revenue FROM salespersons sp
INNER JOIN sales s
ON sp.salesman_id = s.salesman_id
INNER JOIN cars c
ON s.car_id = c.car_id
WHERE purchase_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY name, age
ORDER BY total_revenue DESC
LIMIT 1;