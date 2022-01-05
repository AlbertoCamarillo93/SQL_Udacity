/* 1. Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends 
    in the yearly sales totals?*/
    SELECT DATE_TRUNC('year', occurred_at) AS date_year, SUM(total_amt_usd) as total
    FROM orders
    GROUP BY 1
    ORDER BY 2 DESC;

/* 2. Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset? */
    SELECT DATE_PART('month', occurred_at) AS date_month, SUM(total_amt_usd) AS total_usd 
    FROM orders
    GROUP BY 1
    ORDER BY 2 DESC;

/* 3. Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?*/
    SELECT DATE_PART('year', occurred_at) AS date_month, COUNT(total) AS total_orders 
    FROM orders
    GROUP BY 1
    ORDER BY 2 DESC;

/* 4. Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?*/
    SELECT DATE_PART('month', occurred_at) AS date_month, COUNT(total) AS total_orders 
    FROM orders
    GROUP BY 1
    ORDER BY 2 DESC;

/* 5. In which month of which year did Walmart spend the most on gloss paper in terms of dollars?*/
    SELECT DATE_TRUNC('month', o.occurred_at) AS month, a.name, SUM(o.gloss_amt_usd) total_gloss_usd
    FROM orders o
    JOIN accounts a
    ON a.id = o.account_id
    WHERE a.name = 'Walmart'
    GROUP BY 1, 2
    ORDER BY 3 DESC
    LIMIT 1;