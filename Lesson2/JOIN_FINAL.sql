SELECT * 
FROM orders
JOIN accounts
ON account_id = accounts.id


/*Si queremos extraer elementos individuales de la tabla de pedidos o de 
cuentas, se debe considerar que:
    El nombre de la tabla siempre está antes del punto.
    La columna que desea de esa tabla siempre está después del punto.
*/
SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

/**Si queremos extraer todos los elementos de la tabla de pedidos o de 
 * cuentas. */
SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

/*Try pulling all the data from the accounts table, and all the data 
from the orders table.*/
SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON orders.account_id = accounts.id;

/**Try pulling standard_qty, gloss_qty, and poster_qty from the orders 
 * table, and the website and the primary_poc from the accounts table. */
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc 
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

/**
 * Para unir más de una tabla**/
SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id
