/* 1. How many of the sales reps have more than 5 accounts that they manage? */
    SELECT s.name, COUNT(a.name) AS cuentas
    FROM sales_reps s
    JOIN accounts a
    ON s.id = a.sales_rep_id
    GROUP BY s.name
    HAVING COUNT(a.name) > 5
    ORDER BY  s.name ASC 

/* 2. How many accounts have more than 20 orders? */
    SELECT o.account_id, a.name, COUNT(*) AS ordenes
    FROM  orders o
    JOIN accounts a
    ON a.id = o.account_id
    GROUP BY o.account_id, a.name
    HAVING COUNT(*) > 20
    ORDER BY ordenes DESC;

/* 3. Which account has the most orders? */
    SELECT o.account_id, a.name, COUNT(*) AS ordenes
    FROM  orders o
    JOIN accounts a
    ON a.id = o.account_id
    GROUP BY o.account_id, a.name
    HAVING COUNT(*) > 20
    ORDER BY ordenes DESC
    LIMIT 1;

/* 4. Which accounts spent more than 30,000 usd total across all orders? */
    SELECT o.account_id, a.name, SUM(total_amt_usd) AS gasto
    FROM  orders o
    JOIN accounts a
    ON a.id = o.account_id
    GROUP BY o.account_id, a.name
    HAVING SUM(total_amt_usd) > 30000
    ORDER BY gasto DESC;

/* 5. Which accounts spent less than 1,000 usd total across all orders? */
    SELECT o.account_id, a.name, SUM(total_amt_usd) AS gasto
    FROM  orders o
    JOIN accounts a
    ON a.id = o.account_id
    GROUP BY o.account_id, a.name
    HAVING SUM(total_amt_usd) < 1000
    ORDER BY gasto DESC;

/* 6. Which account has spent the most with us? */
    SELECT o.account_id, a.name, SUM(total_amt_usd) AS gasto
    FROM  orders o
    JOIN accounts a
    ON a.id = o.account_id
    GROUP BY o.account_id, a.name
    ORDER BY gasto DESC
    LIMIT 1;

/* 7. Which account has spent the least with us? */
    SELECT o.account_id, a.name, SUM(total_amt_usd) AS gasto
    FROM  orders o
    JOIN accounts a
    ON a.id = o.account_id
    GROUP BY o.account_id, a.name
    ORDER BY gasto ASC
    LIMIT 1;

/* 8. Which accounts used facebook as a channel to contact customers more than 6 times? */
    SELECT  a.name, w.channel, COUNT(w.channel) AS canal
    FROM  accounts a
    JOIN web_events w
    ON a.id = w.account_id
    WHERE w.channel = 'facebook'
    GROUP BY  a.name, w.channel
    HAVING COUNT(w.channel) > 6
    ORDER BY canal ASC;

/* 9. Which account used facebook most as a channel? */
    SELECT  a.name, w.channel, COUNT(w.channel) AS canal
    FROM  accounts a
    JOIN web_events w
    ON a.id = w.account_id
    WHERE w.channel = 'facebook'
    GROUP BY  a.name, w.channel
    HAVING COUNT(w.channel) > 6
    ORDER BY canal DESC
    LIMIT 1;

/* 10. Which channel was most frequently used by most accounts? */
    SELECT  a.name, w.channel, COUNT(w.channel) AS canal
    FROM  accounts a
    JOIN web_events w
    ON a.id = w.account_id
    GROUP BY  a.name, w.channel
    ORDER BY canal DESC
    LIMIT 1;
