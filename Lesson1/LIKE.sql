SELECT *
FROM accounts
WHERE name LIKE 'C%'; ---Empieza con C


SELECT *
FROM accounts
WHERE name LIKE '%one%'; -- Tiene en algun punto de en medio "one"


SELECT *
FROM accounts
WHERE name LIKE '%s'; -- termina en s