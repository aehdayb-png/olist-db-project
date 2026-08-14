--Just docuemntation nothing to see here
--duplication corrected and now we are getting exactly 99441 rows exactly

CREATE TABLE order_level_features AS
SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_estimated_delivery_date,
    o.order_delivered_customer_date,
    c.customer_state,
    c.customer_city,
    items.n_items,
    items.total_price,
    items.total_freight,
    items.n_distinct_products,
    items.n_distinct_sellers,
    pay.total_payment,
    pay.n_payment_entries,
    pay.max_installments
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN (
    SELECT order_id, COUNT(*) AS n_items, SUM(price) AS total_price,
           SUM(freight_value) AS total_freight,
           COUNT(DISTINCT product_id) AS n_distinct_products,
           COUNT(DISTINCT seller_id) AS n_distinct_sellers
    FROM order_items GROUP BY order_id
) items ON o.order_id = items.order_id
LEFT JOIN (
    SELECT order_id, SUM(payment_value) AS total_payment,
           COUNT(*) AS n_payment_entries,
           MAX(payment_installments) AS max_installments
    FROM order_payments GROUP BY order_id
) pay ON o.order_id = pay.order_id;