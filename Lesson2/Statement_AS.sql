SELECT id, account_id, (standard_amt_usd / standard_qty) AS unit_price_std
FROM orders
LIMIT 10;


SELECT id, account_id, (poster_amt_usd / (standard_amt_usd + gloss_amt_usd  + poster_amt_usd)) AS post_per
FROM orders
LIMIT 10;
