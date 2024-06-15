CREATE TABLE stars (
  id serial PRIMARY KEY,
  name varchar(25) UNIQUE NOT NULL,
  distance integer CHECK(distance > 0) NOT NULL,
  spectral_type char(1),
  companions integer CHECK(companions >= 0) NOT NULL
);

CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1) UNIQUE,
  mass integer
);

ALTER TABLE planets
ADD COLUMN star_id integer REFERENCES stars(id) NOT NULL;

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);

ALTER TABLE stars
ALTER COLUMN distance TYPE numeric;

-- When using the ENUM type we need to create an alias first.

CREATE TYPE valid_letters AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

-- The reason why the USING clause is needed has to do with Postgre not
-- having implicit conversion from char to valid_letters.

ALTER TABLE stars
ALTER COLUMN spectral_type TYPE valid_letters
USING spectral_type::valid_letters;

ALTER TABLE planets
ADD CHECK(mass >= 0.0),
ALTER COLUMN designation SET NOT NULL,
ALTER COLUMN mass SET NOT NULL,
ALTER COLUMN mass TYPE numeric;

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;

CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation integer CHECK(designation > 0) NOT NULL,
  semi_major_axis numeric CHECK(semi_major_axis > 0),
  mass numeric CHECK(mass > 0),
  planet_id integer REFERENCES planets(id) ON DELETE CASCADE NOT NULL
);
