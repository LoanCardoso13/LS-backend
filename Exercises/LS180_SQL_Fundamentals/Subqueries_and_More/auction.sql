CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6,2) NOT NULL,
  sales_price numeric(6,2)
);

CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id int REFERENCES bidders(id) ON DELETE CASCADE NOT NULL,
  item_id int REFERENCES items(id) ON DELETE CASCADE NOT NULL,
  amount numeric(6,2) NOT NULL
);

\copy bidders FROM 'Subqueries_and_More/bidders.csv' WITH CSV HEADER;
\copy items FROM 'Subqueries_and_More/items.csv' WITH CSV HEADER;
\copy bids FROM 'Subqueries_and_More/bids.csv' WITH CSV HEADER;

SELECT name AS "Bids on items" FROM items
WHERE items.id IN (SELECT item_id FROM bids);

SELECT name AS "Not Bid On" FROM items
WHERE items.id NOT IN (SELECT item_id FROM bids);

SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bidders.id = bids.bidder_id);

--- JOIN equivalent:
SELECT DISTINCT name FROM bidders
JOIN bids ON bidders.id = bidder_id;
---

-- SELECT column_name FROM
--   (SELECT column_name FROM a_table) AS alias_name

--- Attention to the insight into how SQL envolops its values, i.e. 
--- tables/relations, columns etc that the following provides:
SELECT MAX(bids_per_bidder.count) FROM
(SELECT count(bidder_id) FROM bidders JOIN bids ON bidders.id = bidder_id
GROUP BY bidder_id) AS bids_per_bidder;

SELECT name, (SELECT count(bids.id) FROM bids WHERE item_id = items.id) FROM items;

--- JOIN equivalent:
SELECT name, count(bids.id) FROM items
LEFT JOIN bids ON items.id = item_id
GROUP BY name;

SELECT id FROM items WHERE ROW(name, initial_price, sales_price) = ROW('Painting', 100.00, 250.00);
