--Get all customers and their addresses.
SELECT * FROM customers JOIN addresses ON customers.id = addresses.customer_id;


-- Get all orders and their line items.
SELECT * FROM line_items JOIN orders ON line_items.order_id = orders.id;

-- Which warehouses have cheetos?
SELECT warehouse, products.description, on_hand, products.unit_price FROM warehouse LEFT OUTER JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id JOIN products ON warehouse_product.product_id = products.id WHERE description='cheetos';

-- Which warehouses have diet pepsi?
SELECT warehouse, products.description, on_hand, products.unit_price FROM warehouse LEFT OUTER JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id JOIN products ON warehouse_product.product_id = products.id WHERE description='diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.*, count(orders.id) FROM customers
LEFT JOIN addresses ON customers.id = addresses.customer_id
LEFT JOIN orders ON addresses.id = orders.address_id
GROUP BY customers.id;

-- How many customers do we have?
SELECT count(*) FROM customers;


-- How many products do we carry?
SELECT count(*) FROM products;

-- What is the total available on-hand quantity of diet pepsi?
SELECT sum(on_hand) FROM warehouse_product JOIN products ON warehouse_product.product_id = products.id WHERE description='diet pepsi';
