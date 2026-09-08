-- Employee Attrition & Retention Analysis — SQL Analysis


-- Overall workforce metrics
-- What it does: Summarizes workforce size, attrition, average age/experience, and bench rate.

SELECT
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    SUM(CASE WHEN LeaveOrNot = 0 THEN 1 ELSE 0 END) AS EmployeesStayed,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS AttritionRate,
    ROUND(AVG(Age), 2) AS AverageAge,
    ROUND(AVG(ExperienceInCurrentDomain), 2) AS AverageExperience,
    ROUND(AVG(EverBenched) * 100, 2) AS BenchRate
FROM employee_clean;

-- Attrition by city
-- What it does: Compares attrition across locations.

SELECT
    City,
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    COUNT(*) - SUM(LeaveOrNot) AS EmployeesStayed,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employee_clean
GROUP BY City
ORDER BY AttritionRate DESC;

-- Attrition by payment tier
-- What it does: Identifies which payment tier has the highest attrition.

SELECT
    PaymentTierLabel,
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    COUNT(*) - SUM(LeaveOrNot) AS EmployeesStayed,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employee_clean
GROUP BY PaymentTierLabel
ORDER BY AttritionRate DESC;

-- Attrition by education
-- What it does: Compares attrition across education levels.

SELECT
    Education,
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    COUNT(*) - SUM(LeaveOrNot) AS EmployeesStayed,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employee_clean
GROUP BY Education
ORDER BY AttritionRate DESC;

-- Attrition by gender
-- What it does: Compares observed attrition rates by gender.

SELECT
    Gender,
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    COUNT(*) - SUM(LeaveOrNot) AS EmployeesStayed,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employee_clean
GROUP BY Gender
ORDER BY AttritionRate DESC;

-- Attrition by bench status
-- What it does: Compares attrition for employees who were and were not benched.

SELECT
    EverBenched,
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    COUNT(*) - SUM(LeaveOrNot) AS EmployeesStayed,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employee_clean
GROUP BY EverBenched
ORDER BY AttritionRate DESC;

-- Attrition by experience group
-- What it does: Shows how attrition varies across experience levels.

SELECT
    ExperienceGroup,
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    COUNT(*) - SUM(LeaveOrNot) AS EmployeesStayed,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employee_clean
GROUP BY ExperienceGroup
ORDER BY
    CASE ExperienceGroup
        WHEN '0 Years' THEN 1
        WHEN '1-2 Years' THEN 2
        WHEN '3-4 Years' THEN 3
        WHEN '5+ Years' THEN 4
    END;

-- Attrition by age group
-- What it does: Compares attrition across age segments.

SELECT
    AgeGroup,
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    COUNT(*) - SUM(LeaveOrNot) AS EmployeesStayed,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employee_clean
GROUP BY AgeGroup
ORDER BY
    CASE AgeGroup
        WHEN 'Under 25' THEN 1
        WHEN '25-34' THEN 2
        WHEN '35-44' THEN 3
    END;

-- Attrition by joining year
-- What it does: Compares attrition across employee joining-year cohorts.

SELECT
    JoiningYear,
    COUNT(*) AS TotalEmployees,
    SUM(LeaveOrNot) AS EmployeesLeft,
    COUNT(*) - SUM(LeaveOrNot) AS EmployeesStayed,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employee_clean
GROUP BY JoiningYear
ORDER BY JoiningYear;

