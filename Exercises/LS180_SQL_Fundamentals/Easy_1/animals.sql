CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(25),
  age int,
  species varchar(15)
);

INSERT INTO birds
(id, name, age, species)
VALUES (1, 'Charlie', 3 , 'Finch'),
(  2 , 'Allie', 5 , 'Owl' ),
(  3 , 'Jennifer', 3 , 'Magpie' ),
(  4 , 'Jamie', 4 , 'Owl' ),
(  5 , 'Roy', 8 , 'Crow' );

SELECT * FROM birds;

SELECT * FROM birds WHERE age < 5;

UPDATE birds
SET species = 'Raven'
WHERE species = 'Crow';

DELETE FROM birds WHERE species = 'Finch';

ALTER TABLE birds
ADD CHECK(age >= 0);

-- INSERT INTO birds
-- (name, age, species)
-- VALUES ('Marcus', -13, 'Pidgey')

DROP TABLE birds;
