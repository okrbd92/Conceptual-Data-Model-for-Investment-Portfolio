

--- 1- List all usernames of users in ascending order.

SELECT username FROM Users ORDER BY username ASC;

--- 2-Find the name of the user whose account number is 122000247.

select name from Users, Accounts Where Users.username=Accounts.username and account_number=122000247;

---3- List the tradeIDs that were generated after 2023-03-10 09:00:00 and their corresponding usernames. List your result in the ascending order of the trade date time.

SELECT T.trade_id, U.username, U.name
FROM Trades T
JOIN Accounts A ON T.account_number = A.account_number
JOIN Users U ON A.username = U.username
WHERE T.trade_datetime > TO_TIMESTAMP('2023-03-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS')
ORDER BY T.trade_datetime ASC;

--- 4- Find the instruments that have been owned by at least two users.
SELECT symbol
FROM Positions
GROUP BY symbol
HAVING COUNT(DISTINCT account_number) >= 2;


 ---5 Find the user who holds the maximum account total value.

SELECT u.username, u.name, a.total_value
FROM Users u, Accounts a
WHERE u.username = a.username and a.total_value = (SELECT MAX(total_value) FROM Accounts);

--- 6 List the username and instruments of the user who has bought maximum shares of instrument in 2022.
SELECT U.username, T.symbol, U.name AS instrument
FROM Users U
JOIN Accounts A ON U.username = A.username
JOIN Trades T ON A.account_number = T.account_number
WHERE T.trade_type = 'buy'
  AND EXTRACT(YEAR FROM T.trade_datetime) = 2022
  AND T.number_of_shares = (
    SELECT MAX(T2.number_of_shares)
    FROM Trades T2
    WHERE T2.trade_type = 'buy'
      AND EXTRACT(YEAR FROM T2.trade_datetime) = 2022
      AND T2.symbol = T.symbol
  );
--- 7- Find the user who has bought every instrument.

Select u.username 
from Users u,Accounts a,Trades t, Instruments i
Where u.username = a.username and a.account_number = t.account_number and t.symbol = i.symbol and t.trade_type = 'buy'
GROUP BY u.username HAVING COUNT(DISTINCT t.symbol) = (SELECT COUNT(*) FROM Instruments);


-- 8 Insert a new user.

INSERT INTO Users (username, name) VALUES ('user6', 'James Bond');

--- 9- Increase $1 to those instruments whose current quote is lower than $25.
UPDATE Instruments
SET current_quote = current_quote + 1
WHERE current_quote < 25;

---10- Delete users without trade records.
DELETE FROM Users
WHERE username NOT IN (
    SELECT DISTINCT username
    FROM Accounts a, Trades t
    Where a.account_number = t.account_number
);