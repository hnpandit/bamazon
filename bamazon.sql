
-- Rutgers Coding BootCamp - Full Stack Developer - Mon/Wed
-- bamazon (mySQL and node) homework 
-- February 11, 2019

DROP DATABASE IF EXISTS bamazon;
CREATE DATABASE bamazon;
USE bamazon;

CREATE TABLE products (
 id INTEGER(11) AUTO_INCREMENT NOT NULL,
 product_name VARCHAR(100) NOT NULL,
 department_name VARCHAR(100) NOT NULL,
 price DECIMAL(10,2) NOT NULL,
 product_sales DECIMAL(10,2) NOT NULL,
 stock_quantity INT NOT NULL,
 PRIMARY KEY (id)
);

CREATE TABLE departments (
 department_id INTEGER(11) AUTO_INCREMENT NOT NULL,
 department_name VARCHAR(100) NOT NULL,
 over_head_costs DECIMAL(10,2) NOT NULL,
 PRIMARY KEY (department_id)
);

-- INSERT test data
INSERT INTO products (product_name, department_name, price, product_sales, stock_quantity) 
            values ("Bananas", "Produce", 1.0, 0.0, 110);

INSERT INTO products (product_name, department_name, price, product_sales, stock_quantity) 
            values ("Pencil", "Stationary", 1.0, 0.0, 120);

INSERT INTO products (product_name, department_name, price, product_sales, stock_quantity) 
            values ("TV", "Electronics", 200.0, 0.0, 130);      

INSERT INTO products (product_name, department_name, price, product_sales, stock_quantity) 
            values ("Laptop", "Electronics", 500.0, 0.0, 140);      

INSERT INTO products (product_name, department_name, price, product_sales, stock_quantity) 
            values ("Tylenol", "Pharmacy", 50.0, 0.0, 150);  
            
INSERT INTO products (product_name, department_name, price, product_sales, stock_quantity) 
            values ("Picture Frame", "Stationary", 15.0, 0.0, 160); 

INSERT INTO products (product_name, department_name, price, product_sales, stock_quantity) 
            values ("Lipstic", "Cosmestics", 5.0, 0.0, 170);                     

INSERT INTO products (product_name, department_name, price, product_sales, stock_quantity) 
            values ("Shirt", "Clothing", 25.0, 0.0, 180);    

INSERT INTO products (product_name, department_name, price, product_sales, stock_quantity) 
            values ("Watch", "Jewellary", 250.0, 0.0, 190);   

INSERT INTO products (product_name, department_name, price, product_sales, stock_quantity) 
            values ("Cereal", "Grocery", 4.0, 0.0, 200);   

INSERT INTO products (product_name, department_name, price, product_sales, stock_quantity) 
            values ("Milk", "Dairy", 3.0, 0.0, 210);     

SELECT * FROM products;
SELECT * FROM departments;