ALTER TABLE orders
ADD CONSTRAINT orders_link_customers
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE order_items
ADD CONSTRAINT order_items_to_orders
FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_items
ADD CONSTRAINT order_items_to_products
FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE order_items
ADD CONSTRAINT order_items_to_sellers
FOREIGN KEY (seller_id) REFERENCES sellers(seller_id);

ALTER TABLE order_payments
ADD CONSTRAINT order_payments_to_orders
FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_reviews
ADD CONSTRAINT order_reviews_to_orders
FOREIGN KEY (order_id) REFERENCES orders(order_id);