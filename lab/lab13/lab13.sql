.read data.sql


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price FROM products GROUP BY category;

CREATE TABLE lowest AS
  SELECT item, min(price) AS low FROM inventory GROUP BY item;

CREATE TABLE lowest_prices AS
  SELECT a.store, a.item, a.price FROM inventory AS a, lowest AS b
  WHERE a.item = b.item AND a.price = b.low;

CREATE TABLE mins AS
  SELECT category, name FROM products GROUP BY category HAVING MIN(MSRP/rating);

CREATE TABLE shopping_list AS
  SELECT name, store FROM mins, lowest_prices 
  WHERE name = item;

CREATE TABLE total_bandwidth AS
  SELECT SUM(Mbs) FROM stores AS a, shopping_list AS b
  WHERE a.store = b.store;

