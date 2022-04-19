CREATE OR REPLACE PROCEDURE track_late_payment(
	_status VARCHAR
)

LANGUAGE plpgsql
AS $$
BEGIN 
		--insert late payments into late payment table	
	INSERT INTO late_payment(car_payment_id)
	SELECT car_payment_id
	FROM car_payment
	WHERE car_payment_id in(
		SELECT car_payment_id
		FROM car_payment
		WHERE payment_date - payment_due_date > 1
	);
COMMIT;
END;
$$
CALL track_late_payment('late');

SELECT *
FROM late_payment;

