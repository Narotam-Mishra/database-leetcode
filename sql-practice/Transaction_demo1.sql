
create database TransactionDemoDB1;

use TransactionDemoDB1;

drop table Accounts

CREATE TABLE Accounts (
    BALANCE INT NOT NULL,
    ACCOUNT_ID INT PRIMARY KEY AUTO_INCREMENT,
    ACCOUNT_HOLDER VARCHAR(50) NOT NULL
)

INSERT INTO Accounts (`BALANCE`, `ACCOUNT_HOLDER`) VALUES (10000, "Peter"), (20000, "Martin"), (30000, "Rayan");

DESC Accounts;

SELECT * FROM Accounts;