ALTER TABLE customers ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
ALTER TABLE orders ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
ALTER TABLE products ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
ALTER TABLE sellers ADD CONSTRAINT sellers_pkey PRIMARY KEY (seller_id);