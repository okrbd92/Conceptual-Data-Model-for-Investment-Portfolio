### Conceptual Data Model for Investment Portfolio

The conceptual data model for investment portfolio data includes the following entities:

#### Entities:
- **Users**: Represent individuals who interact with the investment portfolio system. Each user has a unique username and may have additional attributes such as name.
- **Accounts**: Represent accounts associated with users. Each account has a unique number and attributes like cash balance, investment value, and total value.
- **Trades**: Represent transactions made within the system. Each trade is uniquely identified by an ID and can be a buy or sell transaction. Trade attributes include trade date time, number of shares, price per share, and total amount.
- **Instruments**: Represent financial instruments like stocks, mutual funds, and ETFs. Each instrument has a unique symbol and a current quote.
- **Positions**: Describe the ownership of instruments within accounts. Each position includes the instrument symbol, quantity, and current value.

#### Relationships:
- Users can have multiple accounts, but each account belongs to exactly one user.
- An account can have multiple trades, and each trade is associated with one account and one instrument.
- An instrument can participate in multiple trades and be owned by multiple accounts.
- Derived attributes such as investment value, total value, current value, and amount are computed based on other attribute values.

#### Questions:
1. List all usernames of users in ascending order.
2. Find the name of the user whose account number is 122000247.
3. List the trade IDs generated after 2023-03-10 09:00:00 and their corresponding usernames, sorted by trade date time.
4. Find instruments owned by at least two users.
5. Find the user with the maximum account total value.
6. List the username and instruments of the user who bought the maximum shares of an instrument in 2022.
7. Find the user who has bought every instrument.
8. Insert a new user.
9. Increase $1 to instruments whose current quote is lower than $25.
10. Delete users without trade records.
