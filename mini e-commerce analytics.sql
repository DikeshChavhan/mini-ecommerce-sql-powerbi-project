CREATE DATABASE mini_ecommerce;
USE mini_ecommerce;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);


SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    stock_qty INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    order_status ENUM('Placed','Shipped','Delivered','Cancelled') DEFAULT 'Placed',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

# CUSTOMERS
INSERT INTO customers (customer_id, customer_name, email, phone, city, state) VALUES
(1,'Rahul Sharma','rahul@gmail.com','9876543210','Mumbai','MH'),
(2,'Priya Singh','priya@gmail.com','9988776655','Pune','MH'),
(3,'Amit Verma','amit@gmail.com','9900112233','Delhi','DL'),
(4,'Neha Patel','neha@gmail.com','9933445566','Ahmedabad','GJ');

#PRODUCTS
INSERT INTO products VALUES
(101,'Laptop','Electronics',55000,10,TRUE),
(102,'Headphones','Electronics',2500,40,TRUE),
(103,'T-Shirt','Clothing',799,100,TRUE),
(104,'Shoes','Footwear',1999,60,TRUE);

#ORDERS AND ORDER ITEMS
INSERT INTO orders VALUES
(201,1,'2025-01-01','Delivered'),
(202,2,'2025-01-02','Shipped'),
(203,1,'2025-01-03','Placed'),
(204,3,'2025-01-04','Delivered');

INSERT INTO order_items VALUES
(1,201,101,1,55000),
(2,201,102,2,2500),
(3,202,103,3,799),
(4,203,104,1,1999),
(5,204,101,1,55000),
(6,204,103,2,799);


CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_products_category ON products(category);

#TOTAL REVENUE
SELECT SUM(quantity * unit_price) AS total_revenue
FROM order_items;

#REVENUE BY CUSTOMER
SELECT c.customer_name,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY revenue DESC;

#CATEGORY-WISE SALES
SELECT p.category,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

#MONTHLY SALES TREND
SELECT DATE_FORMAT(order_date,'%Y-%m') AS month,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;


CREATE VIEW vw_customer_revenue AS
SELECT c.customer_name,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name;


DELIMITER //
CREATE PROCEDURE GetCustomerOrders(IN cust_id INT)
BEGIN
    SELECT o.order_id, o.order_date, o.order_status,
           SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.customer_id = cust_id
    GROUP BY o.order_id;
END //
DELIMITER ;

CALL GetCustomerOrders(1);