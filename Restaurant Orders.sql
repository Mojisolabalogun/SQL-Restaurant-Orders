
-- What is the total number of orders?

SELECT COUNT(*)as total_orders
FROM order_details;

-- What meun has the least ordered items? What categories were they in?
SELECT 
  order_id, 
  mi.category, 
  mi.item_name
FROM 
  order_details o
  JOIN menu_item mi ON o.item_id = mi.menu_item_id
GROUP BY 
  order_id, 
  mi.category, 
  o.order_date, 
  mi.item_name
ORDER BY 
  o.order_date asc
LIMIT 5;





-- Which item has been ordered the most?

SELECT 
  mi.menu_item_id, 
  mi.item_name, 
  COUNT(*) AS order_count
FROM 
  order_details od
  JOIN menu_item mi ON od.item_id = mi.menu_item_id
GROUP BY 
  mi.menu_item_id, 
  mi.item_name
ORDER BY 
  order_count DESC
LIMIT 5;



-- What is the total revenue generated from all orders?

SELECT SUM(price) AS total_revenue 
FROM order_details
JOIN menu_item ON order_details.item_id = menu_item.menu_item_id;


-- Which order has the highest total price?
SELECT order_id, SUM(price) AS total_price
FROM order_details
JOIN menu_item ON order_details.item_id = menu_item.menu_item_id 
GROUP BY order_id 
ORDER BY total_price DESC 
LIMIT 3;


--What is the name of the most expensive menu item?

SELECT item_name
FROM menu_item
ORDER BY price DESC
LIMIT 5;


-- Which category has the most menu items?

SELECT category, COUNT(*) AS item_count
FROM menu_item 
GROUP BY category
ORDER BY item_count DESC
LIMIT 5;


--What is the average price of all menu items?

SELECT AVG(price) AS average_price 
FROM menu_item;


-- Which menu item has the lowest price?

SELECT item_name, price 
FROM menu_item
ORDER BY price ASC 
LIMIT 6;


-- How many menu items are there in each category?

SELECT category, COUNT(*) AS item_count
FROM menu_item
GROUP BY category;

-- Analyze orders profitability by category
SELECT 
  o.order_id, 
  mi.item_name, 
  mi.category, 
  SUM(mi.price) AS total_price
FROM 
  order_details o
  JOIN menu_item mi ON o.item_id = mi.menu_item_id
GROUP BY 
  o.order_id, 
  mi.item_name, 
  mi.category
ORDER BY 
  total_price desc
LIMIT 10;

