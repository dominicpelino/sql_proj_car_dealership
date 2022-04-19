CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30)
);

CREATE TABLE car(
	vin VARCHAR(20) PRIMARY KEY,
	make VARCHAR(20),
	model VARCHAR(20),
	color VARCHAR(20),
	year_ INTEGER
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	billing_info VARCHAR(100),
	email VARCHAR(30),
	phone_number VARCHAR(20)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_date DATE DEFAULT CURRENT_DATE,
	invoice_amount NUMERIC(8,2),
	salesperson_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	vin VARCHAR(20) NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(vin) REFERENCES car(vin)
);

CREATE TABLE service_ticket(
	service_ticket_id SERIAL PRIMARY KEY,
	service_date DATE DEFAULT CURRENT_DATE,
	total_amount NUMERIC(8,2),
	service_amount NUMERIC(8,2),
	service_type VARCHAR(100),
	payment_type VARCHAR(20),
	customer_id INTEGER NOT NULL,
	part_id VARCHAR(20) NOT NULL,
	mechanic_id INTEGER NOT NULL,
	vin VARCHAR(20) NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(part_id) REFERENCES part(part_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(vin) REFERENCES car(vin)
);

SELECT *
FROM service_ticket;

CREATE TABLE service_history(
	service_history_id SERIAL PRIMARY KEY,
	ticket_date VARCHAR(20),
	vin VARCHAR(20) NOT NULL,
	service_ticket_id INTEGER NOT NULL,
	FOREIGN KEY(vin) REFERENCES car(vin),
	FOREIGN KEY(service_ticket_id) REFERENCES service_ticket(service_ticket_id)
);

CREATE TABLE car_payment(
	car_payment_id SERIAL PRIMARY KEY,
	vin VARCHAR(20) NOT NULL,
	customer_id INTEGER NOT NULL,
	payment_date DATE,
	payment_amount NUMERIC(8,2),
	payment_due_date DATE,
	FOREIGN KEY(vin) REFERENCES car(vin),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE late_payment(
	late_payment_id SERIAL PRIMARY KEY,
	car_payment_id INTEGER NOT NULL,
	status VARCHAR DEFAULT 'LATE',
	FOREIGN KEY(car_payment_id) REFERENCES car_payment(car_payment_id)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20),
	last_name VARCHAR(20)
);

CREATE TABLE part(
	part_id VARCHAR(20) PRIMARY KEY,
	part_name VARCHAR(50),
	part_price NUMERIC(8,2)
);