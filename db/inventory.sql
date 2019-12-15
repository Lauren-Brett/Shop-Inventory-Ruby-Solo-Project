DROP TABLE designer_product;
DROP TABLE products;
DROP TABLE designers;



CREATE TABLE designers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255)
  -- markup_return INT
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  stock_quantity INT,
  buy_price INT,
  sell_price INT,
  designer_id INT REFERENCES designers(id)
);


CREATE TABLE designer_product (
  id SERIAL PRIMARY KEY,
  designer_id INT REFERENCES designers(id),
  product_id INT REFERENCES products(id)
);
