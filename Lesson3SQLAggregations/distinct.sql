/* 1. Use DISTINCT to test if there are any accounts associated with more than one region.*/
    SELECT DISTINCT a.name, r.name as region
    FROM accounts a
    JOIN sales_reps s
    ON s.id = a.sales_rep_id
    JOIN region r
    ON r.id = s.region_id
    ORDER BY a.name

/* 2. Have any sales reps worked on more than one account?*/
    SELECT DISTINCT  s.name, COUNT(s.name) as sales_reps_count
    FROM accounts a
    JOIN sales_reps s
    ON s.id = a.sales_rep_id
    GROUP BY s.name
    ORDER BY sales_reps_count, s.name ASC;