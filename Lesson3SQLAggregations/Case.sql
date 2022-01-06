
    /* 1. Write a query to display for each order, the account ID, total amount of the order, and the level of the 
        order - ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.*/
        SELECT account_id, total_amt_usd,
            CASE WHEN total_amt_usd >= 3000 THEN 'Large' ELSE 'Small' END AS LevelOrder
        FROM orders
        ORDER BY 2 DESC;

    /* 2. Write a query to display the number of orders in each of three categories, based on the total number of 
        items in each order. The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.*/
        SELECT 
            CASE 
                WHEN total > 2000 THEN 'At Least 2000' 
                WHEN total BETWEEN 1000 AND 2000 THEN 'Between 1000 and 2000' 
                    ELSE 'Less than 1000' END AS LevelOrder,
                COUNT(*) as Conteo
        FROM orders
        GROUP BY 1
        ORDER BY 2 DESC;

    /* 3. We would like to understand 3 different levels of customers based on the amount associated with their 
        purchases. The top level includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000
        usd. The second level is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd. Provide 
        a table that includes the level associated with each account. You should provide the account name, the total 
        sales of all orders for the customer, and the level. Order with the top spending customers listed first.*/
        SELECT a.name,  SUM(o.total_amt_usd) as Total,
            CASE 
                WHEN SUM(o.total_amt_usd) > 200000 THEN 'Lifetime Value' 
                WHEN SUM(o.total_amt_usd) BETWEEN 100000 AND 200000 THEN 'second level'
                WHEN SUM(o.total_amt_usd) < 100000 THEN 'lowest level'
                END AS Level
        FROM accounts a
        JOIN orders o
        ON a.id = o.account_id
        GROUP BY 1
        ORDER BY 2 DESC;

    /* 4. We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent
        by customers only in 2016 and 2017. Keep the same levels as in the previous question. Order with the top 
        spending customers listed first.*/
        SELECT a.name,  SUM(o.total_amt_usd) as Total,
            CASE 
                WHEN SUM(o.total_amt_usd) > 200000 THEN 'Lifetime Value' 
                WHEN SUM(o.total_amt_usd) BETWEEN 100000 AND 200000 THEN 'second level'
                WHEN SUM(o.total_amt_usd) < 100000 THEN 'lowest level'
                END AS Level
        FROM accounts a
        JOIN orders o
        ON a.id = o.account_id
        WHERE occurred_at BETWEEN '2016-01-01' AND  '2017-12-31'
        GROUP BY 1
        ORDER BY 2 DESC;

    /* 5. We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders.
        Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if
        they have more than 200 orders. Place the top sales people first in your final table.*/
        SELECT s.name, COUNT (o.id) VentasTot,
            CASE
                WHEN COUNT (o.id) >= 200 THEN 'top'
                WHEN COUNT (o.id) < 200 THEN 'NO top' END
                AS level
        FROM sales_reps s
        JOIN accounts a
        ON a.sales_rep_id = s.id
        JOIN orders o
        ON a.id =  o.account_id
        GROUP BY s.name
        ORDER BY 2 DESC;

    /* 6. The previous didn't account for the middle, nor the dollar amount associated with the sales. Management decides
        they want to see these characteristics represented as well. We would like to identify top performing sales reps, 
        which are sales reps associated with more than 200 orders or more than 750000 in total sales. The middle group has 
        any rep with more than 150 orders or 500000 in sales. Create a table with the sales rep name, the total number of 
        orders, total sales across all orders, and a column with top, middle, or low depending on this criteria. Place the 
        top sales people based on dollar amount of sales first in your final table. You might see a few upset sales people 
        by this criteria!*/
        SELECT s.name, COUNT (o.id) VentasTot, SUM(o.total_amt_usd) TotalUSD,
            CASE
                WHEN COUNT (o.id) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
                WHEN COUNT (o.id) > 150  OR SUM(o.total_amt_usd) > 500000 THEN 'middle' 
                ELSE 'low'END
                AS level
        FROM sales_reps s
        JOIN accounts a
        ON a.sales_rep_id = s.id
        JOIN orders o
        ON a.id =  o.account_id
        GROUP BY s.name
        ORDER BY 3 DESC;