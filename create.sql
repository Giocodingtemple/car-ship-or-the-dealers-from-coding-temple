-- DDL Clauses: Data Definition Language
-- SQL CREATE STATEMENTS
-- name data_type column-constraint (if available)

DROP TABLE IF EXISTS car_dealership CASCADE;
create table Car_Dealership(
    dealership_id serial primary key,
    name VARCHAR(50),
    phone VARCHAR(13),
);

DROP TABLE IF EXISTS mechanic CASCADE;
CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	name VARCHAR(50)
	email VARCHAR(100),
    number VARCHAR(13),
    FOREIGN KEY (dealership_id) REFERENCES Car Dealership(dealership_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS sales rep CASCADE;
CREATE TABLE Sales Rep(
	sales_rep_id SERIAL PRIMARY KEY,
	name VARCHAR(50)
	email VARCHAR(100),
    number VARCHAR(13),
    FOREIGN KEY (dealership_id) REFERENCES Car Dealership(dealership_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	name VARCHAR(50),
    number VARCHAR(13),
    email VARCHAR(50),
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS invoice CASCADE;
CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
    FOREIGN KEY (service_parts_id) REFERENCES service_parts(service_parts_id) ON DELETE CASCADE,
    FOREIGN KEY (car_id) REFERENCES car(car_id) ON DELETE CASCADE,
    FOREIGN KEY (sales_rep_id) REFERENCES sales_rep(sales_rep_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS service_car CASCADE;
CREATE TABLE service_car(
	service_car_id SERIAL PRIMARY KEY,
    FOREIGN KEY (car_id) REFERENCES car(car_id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES service(service_id) ON DELETE CASCADE,
);

DROP TABLE IF EXISTS service CASCADE;
CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS car CASCADE;
CREATE TABLE car(
	car_id serial PRIMARY KEY,
	make VARCHAR(50),
    model VARCHAR(50),
    YEAR VARCHAR(50),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS parts CASCADE;
CREATE TABLE parts(
	parts_id SERIAL PRIMARY KEY,
    list_of_parts VARCHAR(50),
    "desc" VARCHAR(50)
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS service_parts CASCADE;
CREATE TABLE service_parts(
    service_parts_id serial primary key
    FOREIGN KEY (parts_id) REFERENCES parts(parts_id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES service(service_id) ON DELETE CASCADE
);

