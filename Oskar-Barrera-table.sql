

-- Users table
CREATE TABLE Users ( username VARCHAR(255) PRIMARY KEY, name VARCHAR(255));
INSERT INTO Users (username, name) VALUES ('okrbd92', 'Oskar Barrera');
INSERT INTO Users (username, name) VALUES ('rcaricote', 'Rodolfo Caricote');
INSERT INTO Users (username, name) VALUES ('rivasruben', 'Ruben Rivas');
INSERT INTO Users (username, name) VALUES ('meme44','Marielena Rodriguez');
INSERT INTO Users (username, name) VALUES ('mdiaz1413','Mario Diaz');

-- Accounts table
CREATE TABLE Accounts ( account_number INT PRIMARY KEY, cash_balance DECIMAL(10, 2), investment_value DECIMAL(10, 2), total_value DECIMAL(10, 2), username VARCHAR(255), FOREIGN KEY (username) REFERENCES Users(username));
INSERT INTO Accounts (account_number, cash_balance, investment_value, total_value, username) VALUES (122000247, 6000.00, 15000.00, 21000.00, 'okrbd92');
INSERT INTO Accounts (account_number, cash_balance, investment_value, total_value, username) VALUES (122000248, 5000.00, 12000.00, 17000.00, 'rcaricote');
INSERT INTO Accounts (account_number, cash_balance, investment_value, total_value, username) VALUES (122000249, 9000.00, 20000.00, 29000.00, 'rivasruben');
INSERT INTO Accounts (account_number, cash_balance, investment_value, total_value, username) VALUES (122000250, 6000.00, 13000.00, 19000.00, 'meme44');
INSERT INTO Accounts (account_number, cash_balance, investment_value, total_value, username) VALUES (122000251, 8000.00, 18000.00, 26000.00, 'mdiaz1413');

-- Instruments Table
CREATE TABLE Instruments ( symbol VARCHAR(255) PRIMARY KEY, current_quote DECIMAL(10, 2),instrument_type VARCHAR(255));

INSERT INTO Instruments (symbol, current_quote, instrument_type) VALUES('AAPL', 13.34, 'Stock');
INSERT INTO Instruments (symbol, current_quote, instrument_type) VALUES('GOOGL', 13.34, 'Stock');
INSERT INTO Instruments (symbol, current_quote, instrument_type) VALUES('AMD', 13.47, 'Stock');
INSERT INTO Instruments (symbol, current_quote, instrument_type) VALUES('AMZN', 15.12, 'ETF');
INSERT INTO Instruments (symbol, current_quote, instrument_type) VALUES('TSLA', 18.14, 'Mutual Fund');


--- Trade Table

CREATE TABLE Trades (trade_id INT PRIMARY KEY,trade_type VARCHAR(255),trade_datetime TIMESTAMP,number_of_shares INT,
price_per_share DECIMAL(10, 2),total_amount DECIMAL(10, 2),account_number INT,symbol VARCHAR(255),
FOREIGN KEY (account_number) REFERENCES Accounts(account_number), FOREIGN KEY (symbol) REFERENCES Instruments(symbol));

INSERT INTO Trades (trade_id, trade_type, trade_datetime, number_of_shares, price_per_share, total_amount, account_number, symbol) VALUES (1, 'buy', TO_TIMESTAMP('2023-05-22 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 194.83, 1948.30, 122000247, 'AAPL');
INSERT INTO Trades (trade_id, trade_type, trade_datetime, number_of_shares, price_per_share, total_amount, account_number, symbol) VALUES (2, 'buy', TO_TIMESTAMP('2023-05-23 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 138.34, 2075.10, 122000248, 'GOOGL');
INSERT INTO Trades (trade_id, trade_type, trade_datetime, number_of_shares, price_per_share, total_amount, account_number, symbol) VALUES (3, 'buy', TO_TIMESTAMP('2023-08-17 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 135.47, 2709.40, 122000249, 'AMD');
INSERT INTO Trades (trade_id, trade_type, trade_datetime, number_of_shares, price_per_share, total_amount, account_number, symbol) VALUES (4, 'buy', TO_TIMESTAMP('2022-09-18 06:20:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 152.12, 3803.00, 122000250, 'AMZN');
INSERT INTO Trades (trade_id, trade_type, trade_datetime, number_of_shares, price_per_share, total_amount, account_number, symbol) VALUES (5, 'buy', TO_TIMESTAMP('2022-10-23 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 7, 247.14, 7414.20, 122000251, 'TSLA');
INSERT INTO Trades (trade_id, trade_type, trade_datetime, number_of_shares, price_per_share, total_amount, account_number, symbol) VALUES (6, 'buy', TO_TIMESTAMP('2022-02-22 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 105.83, 105.85, 122000247, 'GOOGL');
INSERT INTO Trades (trade_id, trade_type, trade_datetime, number_of_shares, price_per_share, total_amount, account_number, symbol) VALUES (7, 'buy', TO_TIMESTAMP('2023-04-22 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 100.00, 200.00, 122000247, 'AMD');
INSERT INTO Trades (trade_id, trade_type, trade_datetime, number_of_shares, price_per_share, total_amount, account_number, symbol) VALUES (8, 'buy', TO_TIMESTAMP('2023-02-22 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 140.83, 422.49, 122000247, 'AMZN');
INSERT INTO Trades (trade_id, trade_type, trade_datetime, number_of_shares, price_per_share, total_amount, account_number, symbol) VALUES (9, 'buy', TO_TIMESTAMP('2023-06-22 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 110.83, 443.32, 122000247, 'TSLA');


-- Positions Table
CREATE TABLE Positions ( account_number INT, symbol VARCHAR(255), quantity INT, current_value DECIMAL(10, 2), PRIMARY KEY (account_number, symbol), FOREIGN KEY (account_number) REFERENCES Accounts(account_number),FOREIGN KEY (symbol) REFERENCES Instruments(symbol));
INSERT INTO Positions (account_number, symbol, quantity, current_value) VALUES (122000247, 'AAPL', 10, 1948.30);;
INSERT INTO Positions (account_number, symbol, quantity, current_value) VALUES (122000248, 'GOOGL', 5, 691.70);
INSERT INTO Positions (account_number, symbol, quantity, current_value) VALUES (122000249, 'AMD', 8, 1558.64);
INSERT INTO Positions (account_number, symbol, quantity, current_value) VALUES (122000250, 'AMZN', 26, 1658.04);
INSERT INTO Positions (account_number, symbol, quantity, current_value) VALUES (122000251, 'TSLA', 27, 3042.40);
INSERT INTO Positions (account_number, symbol, quantity, current_value) VALUES (122000247, 'GOOGL', 5, 691.70);;
INSERT INTO Positions (account_number, symbol, quantity, current_value) VALUES (122000247, 'AMD', 8, 1558.64);
INSERT INTO Positions (account_number, symbol, quantity, current_value) VALUES (122000247, 'AMZN', 26, 1658.04);
INSERT INTO Positions (account_number, symbol, quantity, current_value) VALUES (122000247, 'TSLA', 27, 3042.40);






