
-- Problem link : https://leetcode.com/problems/patients-with-a-condition/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(255),
    conditions VARCHAR(255)
);

INSERT INTO Patients (patient_id, patient_name, conditions)
VALUES 
(1, 'Daniel', 'YFEV COUGH'),
(2, 'Alice', ''),
(3, 'Bob', 'DIAB100 MYOP'),
(4, 'George', 'ACNE DIAB100'),
(5, 'Alain', 'DIAB201');

SELECT * FROM Patients;

-- main query
-- Approach - 1
SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%'

-- Approach - 2
SELECT *
FROM Patients
WHERE
    conditions LIKE('DIAB1%')
    OR conditions LIKE('% DIAB1%')

