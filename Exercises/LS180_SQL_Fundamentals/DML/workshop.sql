CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  -- CURRENT_TIMESTAMP is equivalent to NOW()
  created_at timestamp DEFAULT NOW()
);

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number integer UNIQUE NOT NULL,
  device_id integer REFERENCES devices(id)
);
--- DDL above

INSERT INTO devices
(name)
VALUES ('Accelerometer'), ('Gyroscope');

INSERT INTO parts
(part_number, device_id)
VALUES (1, 1), (13, 1), (131, 1), (1313, 2), (2, 2), (26, 2), (262, 2), (2626, 2), (3131, NULL), (1331, NULL), (3113, NULL);

SELECT name, part_number FROM
devices JOIN parts ON devices.id = parts.device_id;

-- We can convert type on the go with the below syntax
SELECT * FROM parts
WHERE part_number::text LIKE '3%';

SELECT name, count(parts.id) FROM
devices JOIN parts ON devices.id = parts.device_id
GROUP BY name
ORDER BY name DESC;

SELECT part_number, device_id FROM parts
WHERE device_id IS NULL;

SELECT part_number, device_id FROM parts
WHERE device_id IS NOT NULL;

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);

SELECT name FROM devices
ORDER BY created_at LIMIT 1;

UPDATE parts
SET device_id = 1
WHERE id = 7 OR id = 8;

UPDATE parts
SET device_id = 2
WHERE id IN (SELECT MIN(part_number) FROM parts);

DELETE FROM parts
WHERE device_id = 1;

DELETE FROM devices
WHERE name = 'Accelerometer';
