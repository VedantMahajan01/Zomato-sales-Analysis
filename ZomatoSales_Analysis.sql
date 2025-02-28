
select * from food;
select * from menu;
select * from orders_Type;
select * from restaurant;
select * from users;
select * from orders;

ALTER TABLE food
ALTER COLUMN veg_or_non_veg nvarchar(50);

ALTER TABLE orders
ALTER COLUMN user_id int NULL;
ALTER TABLE restaurant
ALTER COLUMN user_id int NULL;

ALTER TABLE restaurant
ALTER COLUMN city NVARCHAR(MAX);


--Total Orders 
SELECT count(order_date) AS Total_Orders
FROM orders;

--Rating Count
SELECT count(rating_count) AS Total_Ratings
FROM restaurant;

--Total number of Non-Veg orders
SELECT count(Type) AS Total_NonVeg_Orders
FROM orders_Type
WHERE Type = 'Non-Veg';

--Total number of Veg orders
SELECT count(Type) AS Total_NonVeg_Orders
FROM orders_Type
WHERE Type = 'Veg';

--Count of Activ User
SELECT COUNT(DISTINCT user_id) AS Active_User
FROM orders;

--User by Age
SELECT * FROM users
ORDER BY Age;

--Sales value by city
SELECT r.city, SUM(o.sales_amount) AS total_sales
FROM restaurant r
JOIN orders o ON r.user_id = o.user_id
GROUP BY r.city;

--Active Users by City
SELECT 
    r.city, 
    COUNT(DISTINCT o.user_id) AS Active_User
FROM restaurant r
JOIN 
    orders o 
ON 
    r.user_id = o.user_id
GROUP BY 
    r.city;

--Rating count by city
select city, COUNT(city) as rating_count
from restaurant
group by city;

--Top 5 cities by sales
SELECT TOP 5 
    r.city, 
    SUM(o.sales_amount) AS total_sales
FROM 
    orders o
JOIN 
    restaurant r
ON 
    r.user_id = o.user_id
GROUP BY 
    r.city
ORDER BY 
    total_sales DESC;

--Sales and Orders Totals
SELECT COUNT(user_id) AS Total_Orders, 
       SUM(sales_amount) AS Total_Sales
FROM orders;

--Retrieve the number of users grouped by age 
SELECT Age, COUNT(user_id) AS User_count
FROM users
GROUP BY Age
ORDER BY Age;

-- Top-Selling Categories
SELECT Top 1 type, count(order_id) AS total_sold FROM orders_Type GROUP BY type ORDER BY total_sold DESC;

-- Customer Demographics
SELECT city, COUNT(USER_ID) AS customer_count FROM restaurant GROUP BY city ORDER BY customer_count DESC;