CREATE OR REPLACE FUNCTION add_salesperson(_salesperson_id INTEGER, _first_name VARCHAR,
_last_name VARCHAR)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO salesperson(salesperson_id, first_name, last_name)
	VALUES(_salesperson_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_salesperson(1, 'Ricky', 'Gervais');
SELECT add_salesperson(2, 'Ace', 'Ventura');
SELECT add_salesperson(3, 'Joe', 'Exotic');

SELECT *
FROM salesperson;

CREATE OR REPLACE FUNCTION add_customer(_customer_id INTEGER, _first_name VARCHAR,
_last_name VARCHAR, _billing_info VARCHAR, _email VARCHAR, _phone_number VARCHAR)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO customer(customer_id, first_name, last_name, billing_info, email, phone_number)
	VALUES(_customer_id, _first_name, _last_name, _billing_info, _email, _phone_number);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_customer(1, 'Carol', 'Baskins', '4242-4242-4242-4242', 'thatcarolbaskins@tiger.com', '813-555-5555');
SELECT add_customer(2, 'Silent', 'Bob', '4242-4242-4242-4242', 'silentbob@aol.com', '420-420-4200');
SELECT add_customer(3, 'Mike', 'Wazowski', '4242-4242-4242-4242', 'mwazowski@monsters.org', '789-789-7890');

SELECT *
FROM customer;

CREATE OR REPLACE FUNCTION add_car(_vin VARCHAR,
_make VARCHAR, _model VARCHAR, _color VARCHAR, _year INTEGER)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO car(vin, make, model, color, year_)
	VALUES(_vin, _make, _model, _color, _year);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_car('4Y1SL65848Z411439', 'Honda', 'Civic', 'Blue', 1997);
SELECT add_car('48123658489411439', 'Ford', 'Explorer', 'Green', 2001);
SELECT add_car('7F1SL65848Z411439', 'Jeep', 'Grand Cherokee', 'Grey', 2019);


SELECT *
FROM car;

CREATE OR REPLACE FUNCTION add_invoice(_invoice_id INTEGER, _invoice_date Timestamp without time zone,
_invoice_amount NUMERIC, _salesperson_id INTEGER, _customer_id INTEGER, _vin VARCHAR)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO invoice(invoice_id, invoice_date, invoice_amount, salesperson_id, customer_id, vin)
	VALUES(_invoice_id, _invoice_date, _invoice_amount, _salesperson_id, _customer_id, _vin);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_invoice(1, NOW()::Timestamp, 30000.00, 3, 1, '4Y1SL65848Z411439');
SELECT add_invoice(2, NOW()::Timestamp, 20000.00, 2, 2, '48123658489411439');
SELECT add_invoice(3, NOW()::Timestamp, 42000.00, 2, 3, '7F1SL65848Z411439');

SELECT *
FROM invoice;

CREATE OR REPLACE FUNCTION add_part(_part_id INTEGER, _part_name VARCHAR, _part_price NUMERIC)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO part(part_id, part_name, part_price)
	VALUES(_part_id, _part_name, _part_price);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_part(101, 'bumper', 300.00);
SELECT add_part(102, 'headlight', 75.00);
SELECT add_part(103, 'radiator', 150.00);

SELECT *
FROM part;

CREATE OR REPLACE FUNCTION add_mechanic(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO mechanic(mechanic_id, first_name, last_name)
	VALUES(_mechanic_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_mechanic(22, 'John', 'Cena');
SELECT add_mechanic(23, 'Jason', 'Statham');
SELECT add_mechanic(24, 'Dwayne', 'Johnson');
SELECT add_mechanic(25, 'Vin', 'Diesal');

SELECT *
FROM mechanic;

CREATE OR REPLACE FUNCTION add_service_ticket(_service_ticket_id INTEGER, _service_date Timestamp without time zone,
_total_amount NUMERIC, _service_amount NUMERIC, _service_type VARCHAR, _payment_type VARCHAR, _part_id INTEGER, _mechanic_id INTEGER, 
_vin VARCHAR, _customer_id INTEGER)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO service_ticket(service_ticket_id, service_date, total_amount, service_amount, service_type, 
				payment_type, part_id, mechanic_id, vin, customer_id)
	VALUES(_service_ticket_id , _service_date, _total_amount, _service_amount, _service_type, _payment_type, 
		   _part_id, _mechanic_id, _vin, _customer_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_service_ticket(1, NOW()::Timestamp, 400.00, 100, 'repair', 'Credit Card', 101, 24, '48123658489411439', 1);
SELECT add_service_ticket(2, NOW()::Timestamp, 175.00, 100, 'repair', 'Credit Card', 102, 22, '7F1SL65848Z411439', 2);

SELECT *
FROM service_ticket;

CREATE OR REPLACE FUNCTION add_service_history(_service_history_id INTEGER,  _ticket_date VARCHAR, 
						   _vin VARCHAR, _service_ticket_id INTEGER)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO service_history(service_history_id, ticket_date, vin, service_ticket_id)
	VALUES(_service_history_id, _ticket_date, _vin, _service_ticket_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_service_history(1, '2022-04-17','48123658489411439', 1);
SELECT add_service_history(2, '2022-04-17', '7F1SL65848Z411439', 2);

SELECT *
FROM service_history;

CREATE OR REPLACE FUNCTION add_car_payment(_car_payment_id INTEGER, _vin VARCHAR, _customer_id INTEGER,
						   _payment_date DATE, _payment_amount NUMERIC, 
						   _payment_due_date DATE)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO car_payment(car_payment_id, vin, customer_id, payment_date, payment_amount, payment_due_date)
	VALUES(_car_payment_id, _vin, _customer_id, _payment_date, _payment_amount, _payment_due_date);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_car_payment(1, '4Y1SL65848Z411439', 1, '2022-05-25', 500.00, '2022-05-17');	   
		   
SELECT *
FROM car_payment;

