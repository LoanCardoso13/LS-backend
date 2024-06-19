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
