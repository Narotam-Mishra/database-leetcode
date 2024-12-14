
-- Problem link : https://leetcode.com/problems/combine-two-tables/description/?envType=problem-list-v2&envId=database&status=TO_DO&difficulty=EASY

drop table Person;

CREATE TABLE Person (
    personId INT PRIMARY KEY,
    lastName VARCHAR(50),
    firstName VARCHAR(50)
);

CREATE TABLE Address (
    addressId INT PRIMARY KEY,
    personId INT,
    city VARCHAR(50),
    state VARCHAR(50),
    FOREIGN KEY (personId) REFERENCES Person(personId)
);

INSERT INTO Person (personId, lastName, firstName)
VALUES 
(1, 'Smith', 'John'),
(2, 'Johnson', 'Emily'),
(3, 'Williams', 'Michael');

INSERT INTO Address (addressId, personId, city, state)
VALUES 
(1, 1, 'New York', 'NY'),
(2, 2, 'Los Angeles', 'CA'),
(3, 3, 'Chicago', 'IL');

SELECT * FROM Person;
SELECT * from Address;

SELECT 
    p.firstName, 
    p.lastName, 
    a.city, 
    a.state
FROM 
    Person p
LEFT JOIN 
    Address a
ON 
    p.personId = a.personId;


