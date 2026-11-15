
CREATE DATABASE IF NOT EXISTS store_management;

CREATE TABLE governorates (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    city VARCHAR(15) NOT NULL,
    postal_code INT
);

CREATE TABLE stores (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE suppliers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(60) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE products (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(11) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE gov_stores (
	governorate_id INT,
	store_id INT
);

-- Creating the foreign keys constraints

-- m:m between governorates and stores
ALTER TABLE gov_stores
	ADD CONSTRAINT fk_governorate_id
		FOREIGN KEY (governorate_id) REFERENCES governorates(id)
        ON DELETE NO ACTION,
    ADD CONSTRAINT fk_store_id
    	FOREIGN KEY (store_id) REFERENCES stores(id)
        ON DELETE NO ACTION;

-- 1:1 between products and supplier
ALTER table products
	ADD COLUMN supplier_id INT UNIQUE,
    ADD CONSTRAINT fk_product_supplier
    	FOREIGN KEY (supplier_id) REFERENCES  suppliers(id)
        ON DELETE NO ACTION ON UPDATE CASCADE;

-- 1:m between products and stores "Any specific product can be found in many stores. 1:m"
ALTER table stores
	ADD COLUMN product_id INT NOT NULL,
    ADD CONSTRAINT fk_store_product
    	FOREIGN KEY (product_id) REFERENCES  products(id)
        ON DELETE CASCADE ON UPDATE CASCADE;