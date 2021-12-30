/* 1. Which account (by name) placed the earliest order? Your solution should have the account name and the date of 
    the order.*/
    SELECT a.name, o.occurred_at  
    FROM accounts a
    JOIN orders o
    ON a.id = o.account_id 
    ORDER BY o.occurred_at  
    LIMIT 1

/* 2. Find the total sales in usd for each account. You should include two columns - the total sales for each 
    company's orders in usd and the company name. */
    SELECT a.name, SUM(o.total_amt_usd) AS total_usd  
    FROM accounts a
    JOIN orders o
    ON a.id = o.account_id 
    GROUP BY a.name


/* 3. Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? 
    Your query should return only three values - the date, channel, and account name.*/
    SELECT a.name, w.channel, w.occurred_at 
    FROM accounts a
    JOIN web_events w
    ON w.account_id = a.id
    ORDER BY w.occurred_at DESC
    LIMIT 1


/* 4. Find the total number of times each type of channel from the web_events was used. Your final table should have 
    two columns - the channel and the number of times the channel was used. */
    SELECT w.channel, COUNT(*)
    FROM web_events w
    GROUP BY w.channel

/* 5. Who was the primary contact associated with the earliest web_event? */
    SELECT a.name, a.primary_poc
    FROM web_events w
    JOIN accounts a
    ON w.account_id = a.id
    ORDER BY occurred_at 
    LIMIT 1;

/* 6. What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account 
    name and the total usd. Order from smallest dollar amounts to largest.*/
    SELECT a.name, MIN(o.total_amt_usd) as total_usd
    FROM orders o
    JOIN accounts a
    ON o.account_id = a.id
    GROUP BY a.name
    ORDER BY total_usd ASC

/* 7. Find the number of sales reps in each region. Your final table should have two columns - the region and the number 
    of sales_reps. Order from fewest reps to most reps.*/
    SELECT r.name, COUNT(s.region_id) as region
    FROM region r
    JOIN sales_reps s
    ON r.id = s.region_id
    GROUP BY r.name
    ORDER BY region
