-- 1 (Deberia haber agregado un atributo director_id que sea la primary key)
CREATE TABLE directors (
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    numbers_of_movies INT,
    PRIMARY KEY (first_name, last_name)
);

-- 2
INSERT INTO directors (first_name, last_name, numbers_of_movies)
SELECT actor.first_name, actor.last_name, COUNT(*) AS number_movies
FROM film_actor
INNER JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY (film_actor.actor_id)
ORDER BY number_movies DESC
LIMIT 5;

-- 3
ALTER TABLE customer
ADD COLUMN premium_customer CHAR(1) DEFAULT 'F';

ALTER TABLE customer 
ADD COLUMN premium_customer ENUM('T','F') NOT NULL DEFAULT 'F';

-- 4
UPDATE customer
SET premium_customer = 'T'
WHERE customer.customer_id IN (
    SELECT premium.customer_id
    FROM (
        SELECT payment.customer_id, SUM(payment.amount) AS total_spent
        FROM payment
        GROUP BY (payment.customer_id)
        ORDER BY total_spent DESC
        LIMIT 10 
    ) AS premium
);

-- 5
SELECT rating, count(film_id) AS total_movies
FROM film
GROUP BY rating
ORDER BY total_movies DESC;

-- 6
SELECT min(payment_date) AS min_payment_date, max(payment_date) as max_payment_date
FROM payment;

-- 7
SELECT MONTH(payment_date) AS payment_month, avg(amount) as average_amount
FROM payment
GROUP BY payment_month;

-- 8
WITH rental_per_address (address_id, total) AS (
    SELECT customer.address_id AS address_id, count(rental_id) AS total
    FROM rental
    INNER JOIN customer ON customer.customer_id = rental.customer_id
    GROUP BY customer.address_id
)
SELECT address.district AS district, sum(rental_per_address.total) AS total
FROM address
INNER JOIN rental_per_address ON rental_per_address.address_id = address.address_id
GROUP BY district
ORDER BY total DESC
LIMIT 10;

-- Interesante la utilidad del doble INNER JOIN
SELECT district, count(rental_id) AS count_rental
FROM address
INNER JOIN customer ON address.address_id=customer.address_id
INNER JOIN rental ON rental.customer_id=customer.customer_id
GROUP BY district 
ORDER BY count_rental DESC LIMIT 10;

-- 9 (Agregar la key NOT NULL)
ALTER TABLE inventory
ADD COLUMN stock INT DEFAULT 5;

-- 10
CREATE TRIGGER update_stock 
AFTER INSERT ON rental 
FOR EACH ROW
UPDATE inventory
SET stock = stock - 1
WHERE inventory.inventory_id = new.inventory_id;
-- new.inventory_id se refiere al inventory_id de la tabla rental

INSERT INTO `rental` VALUES (100000000, '2024-01-29 09:03:14', 4581, 393, '2024-01-29 09:03:14', 2, '2024-01-29 09:03:14');

-- 11
CREATE TABLE fines (
    fines_id INT AUTO_INCREMENT,
    rental_id INT,
    amount NUMERIC(20,2),
    PRIMARY KEY (fines_id),
    FOREIGN KEY (rental_id) REFERENCES rental(rental_id)
);

-- 12
CREATE PROCEDURE check_date_and_fine ()
INSERT INTO fines (rental_id, amount)
SELECT rental_id, TIMESTAMPDIFF(DAY, rental_date, return_date) * 1.5
FROM rental
WHERE TIMESTAMPDIFF(DAY, rental_date, return_date) > 3;
-- para llamarlo tenes que usar CALL check_date_and_fine;


-- 13
CREATE ROLE employee;
GRANT INSERT, UPDATE, DELETE ON rental
TO employee;

-- 14
REVOKE DELETE ON rental
FROM employee;

CREATE ROLE administrator;
GRANT ALL PRIVILEGES ON sakila.*
TO administrator;

-- 15
CREATE ROLE employee1;
CREATE ROLE employee2;

GRANT employee TO employee1;
GRANT administrator TO employee2;

