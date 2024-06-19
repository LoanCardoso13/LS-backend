CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8)
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2) NOT NULL
);

INSERT INTO customers
(name, payment_token)
VALUES
('Pat Johnson'  , 'XHGOAHEQ'),
('Nancy Monreal', 'JKWQPJKL'),
('Lynn Blake'   , 'KLZXWEEE'),
('Chen Ke-Hua'  , 'KWETYCVX'),
('Scott Lakso'  , 'UUEAPQPS'),
('Jim Pornot'   , 'XKJEYAZA');

INSERT INTO services
(description, price)
VALUES
('Unix Hosting'        , 5.95),
('DNS'                 , 4.95),
('Whois Registration'  , 1.95),
('High Bandwidth'      , 15.00),
('Business Support'    , 250.00),
('Dedicated Hosting'   , 50.00),
('Bulk Email'          , 250.00),
('One-to-one Training' , 999.00);

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id int REFERENCES customers(id) ON DELETE CASCADE,
  service_id int REFERENCES services(id),
  UNIQUE(customer_id, service_id)
);

INSERT INTO customers_services
(customer_id, service_id)
VALUES
(1, 1), (1, 2), (1, 3),
(3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
(4, 1), (4, 4),
(5, 1), (5, 2), (5, 6),
(6, 1), (6, 6), (6, 7);

SELECT customers.* FROM customers
JOIN customers_services ON customers.id = customers_services.customer_id
GROUP BY customers.id;

SELECT DISTINCT customers.* FROM customers
JOIN customers_services ON customers.id = customers_services.customer_id;

SELECT customers.* FROM customers
LEFT JOIN customers_services ON customers.id = customers_services.customer_id
WHERE customers_services.id IS NULL;

SELECT customers.*, services.* FROM customers
LEFT JOIN customers_services ON customers.id = customers_services.customer_id
FULL JOIN services ON services.id = customers_services.service_id
WHERE customers_services.id IS NULL;

SELECT description FROM customers_services
RIGHT JOIN services ON services.id = customers_services.service_id
WHERE customers_services.id IS NULL;

SELECT name, string_agg(description, ', ') AS services FROM customers
LEFT JOIN customers_services ON customers.id = customer_id
LEFT JOIN services ON services.id = service_id
GROUP BY name;

SELECT CASE
          WHEN lag(customers.name) OVER (ORDER BY customers.name) = name
            THEN NULL
          ELSE name
       END,
       services.description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id;

SELECT description, count(customer_id) FROM services
JOIN customers_services ON services.id = service_id
GROUP BY services.id
HAVING count(customer_id) >= 3;

SELECT sum(price) AS gross FROM customers
JOIN customers_services ON customers.id = customer_id
JOIN services ON services.id = service_id;

INSERT INTO customers
(name, payment_token)
VALUES ('John doe', 'EYODHLCN');

INSERT INTO customers_services
(customer_id, service_id)
VALUES (7, 1), (7, 2), (7, 3);

SELECT sum(price) FROM customers
JOIN customers_services ON customers.id = customer_id
JOIN services ON services.id = service_id
WHERE price > 100;

SELECT sum(price) FROM 
customers CROSS JOIN services
WHERE price > 100;

--- DDL below
ALTER TABLE customers_services
DROP CONSTRAINT customers_services_service_id_fkey;

ALTER TABLE customers_services
ADD CONSTRAINT customers_services_service_id_fkey
FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE;
--- DDL above

DELETE FROM customers
WHERE name = 'Chen Ke-Hua';

DELETE FROM services
WHERE description = 'Bulk Email'
