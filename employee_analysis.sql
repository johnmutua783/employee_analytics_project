-- Check for Missing Values:
SELECT
    COUNT(*) AS TotalRecords,
    SUM(CASE WHEN Education IS NULL THEN 1 ELSE 0 END) AS MissingEducation,
    SUM(CASE WHEN JoiningYear IS NULL THEN 1 ELSE 0 END) AS MissingJoiningYear,
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS MissingCity,
    SUM(CASE WHEN PaymentTier IS NULL THEN 1 ELSE 0 END) AS MissingPaymentTier,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS MissingAge,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS MissingGender,
    SUM(CASE WHEN EverBenched IS NULL THEN 1 ELSE 0 END) AS MissingEverBenched,
    SUM(CASE WHEN ExperienceInCurrentDomain IS NULL THEN 1 ELSE 0 END) AS MissingExperienceInCurrentDomain,
    SUM(CASE WHEN LeaveOrNot IS NULL THEN 1 ELSE 0 END) AS MissingLeaveOrNot
FROM employee;

-- Converting 'Everbenched' to binary values
UPDATE employee
SET Everbenched = 1 WHERE Everbenched = 'Yes';
UPDATE employee
SET Everbenched = 0 WHERE Everbenched = 'No';

SELECT * FROM employee;

-- Turnover Rate based on 'LeaveOrNot' Column
SELECT (SUM(LeaveOrNot) / COUNT(*)) * 100 AS TurnoverRate
FROM employee;

-- Age Distribution
SELECT 
	CASE
		WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 35 THEN '25-35'
        WHEN Age BETWEEN 36 AND 46 THEN '36-46'
        ELSE 'Over 45'
        END AS age_group,
        COUNT(*) AS Total
FROM employee
GROUP BY age_group
ORDER BY age_group;

-- Hiring Trends Over Time
SELECT JoiningYear,COUNT(*) AS Total
FROM employee
GROUP BY JoiningYear
ORDER BY JoiningYear;

-- percentage of employees who were ever benched
SELECT ROUND((SUM(Everbenched) / COUNT(*)) * 100,2) AS PercentBenched
FROM employee;

--  Education Level Distribution
SELECT EDUCATION, COUNT(*) AS Count
FROM employee
GROUP BY EDUCATION
ORDER BY Count DESC;

-- Turnover Rate by Education Level
SELECT 
    Education,
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    (SUM(LeaveOrNot) / COUNT(*)) * 100 AS TurnoverRate
FROM employee
GROUP BY Education
ORDER BY TurnoverRate DESC;

-- Average Experience by Education Level
SELECT 
    Education,
    AVG(ExperienceInCurrentDomain) AS AvgExperience
FROM employee
GROUP BY Education
ORDER BY AvgExperience DESC;

-- Education Level vs. Payment Tier
SELECT 
    Education,
    PaymentTier,
    COUNT(*) AS Count
FROM employee
GROUP BY Education, PaymentTier
ORDER BY Education, PaymentTier;

-- Hiring Trends by Education Level
SELECT 
    JoiningYear,
    Education,
    COUNT(*) AS Count
FROM employee
GROUP BY JoiningYear, Education
ORDER BY JoiningYear, Education;

-- Bench Status by Education Level
SELECT 
    Education,
    ROUND(AVG(EverBenched) * 100,2) AS PercentBenched
FROM employee
GROUP BY Education
ORDER BY PercentBenched DESC;

-- Turnover Rate by City
SELECT 
    City,
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    (SUM(LeaveOrNot) / COUNT(*)) * 100 AS TurnoverRate
FROM employee
GROUP BY City
ORDER BY TurnoverRate DESC;

-- Hiring Trends by City
SELECT 
    JoiningYear,
    City,
    COUNT(*) AS Hires
FROM employee
GROUP BY JoiningYear, City
ORDER BY JoiningYear, City;

-- Bench Status by City
SELECT 
    City,
    round(AVG(EverBenched) * 100,2) AS PercentBenched
FROM employee
GROUP BY City
ORDER BY PercentBenched DESC;

-- Payment Tier Distribution by City
SELECT 
    City,
    PaymentTier,
    COUNT(*) AS Count
FROM employee
GROUP BY City, PaymentTier
ORDER BY City, PaymentTier;

-- Turnover Rate by Gender
SELECT 
    Gender,
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    (SUM(LeaveOrNot) / COUNT(*)) * 100 AS TurnoverRate
FROM employee
GROUP BY Gender
ORDER BY TurnoverRate DESC;

-- Experience Level by Gender
SELECT 
    Gender,
    AVG(ExperienceInCurrentDomain) AS AvgExperience
FROM employee
GROUP BY Gender;

-- Bench Status by Gender
SELECT 
    Gender,
    ROUND(AVG(EverBenched) * 100,2) AS PercentBenched
FROM employee
GROUP BY Gender;

-- Payment Tier Distribution by Gender
SELECT 
    Gender,
    PaymentTier,
    COUNT(*) AS Count
FROM employee
GROUP BY Gender, PaymentTier;









    
