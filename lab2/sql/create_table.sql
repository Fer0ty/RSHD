-- создание партиционированной таблицы
CREATE TABLE orders (
  order_id SERIAL,
  order_date DATE NOT NULL,
  table_id INT NOT NULL,
PRIMARY KEY (order_id, order_date)
) PARTITION BY RANGE (order_date);

-- создание дочерних таблиц
CREATE TABLE orders_ycv6 PARTITION OF orders
    FOR VALUES FROM ('2024-01-01') TO ('2024-07-01') TABLESPACE ycv6;

CREATE TABLE orders_hxb42 PARTITION OF orders
   FOR VALUES FROM ('2024-07-01') TO ('2025-01-01') TABLESPACE hxb42;
