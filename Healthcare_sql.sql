CREATE DATABASE healthcare;
USE healthcare;


SELECT * FROM healthcare LIMIT 5;
-- Should show first 5 rows of your data

SELECT COUNT(*) AS total_rows FROM healthcare;

USE healthcare;

-- Total Patients
SELECT COUNT(*) AS total_patients 
FROM healthcare;

--  Patients by Medical Condition
SELECT medical_condition, 
       COUNT(*) AS total_patients
FROM healthcare
GROUP BY medical_condition
ORDER BY total_patients DESC;

--  Average Billing by Medical Condition
SELECT medical_condition,
       ROUND(AVG(billing_amount), 2) AS avg_billing,
       ROUND(MAX(billing_amount), 2) AS max_billing,
       ROUND(MIN(billing_amount), 2) AS min_billing
FROM healthcare
GROUP BY medical_condition
ORDER BY avg_billing DESC;

-- Patients by Admission Type
SELECT admission_type,
       COUNT(*) AS total_patients,
       ROUND(AVG(billing_amount), 2) AS avg_billing
FROM healthcare
GROUP BY admission_type
ORDER BY total_patients DESC;

--  Gender wise Analysis
SELECT gender,
       COUNT(*) AS total_patients,
       ROUND(AVG(billing_amount), 2) AS avg_billing,
       ROUND(AVG(length_of_stay), 2) AS avg_stay_days
FROM healthcare
GROUP BY gender;

--  Top 5 Insurance Providers
SELECT insurance_provider,
       COUNT(*) AS total_patients,
       ROUND(AVG(billing_amount), 2) AS avg_billing,
       ROUND(SUM(billing_amount), 2) AS total_billing
FROM healthcare
GROUP BY insurance_provider
ORDER BY total_patients DESC
LIMIT 5;

--  Monthly Admission Trend
SELECT admission_month,
       admission_year,
       COUNT(*) AS total_admissions
FROM healthcare
GROUP BY admission_year, admission_month
ORDER BY admission_year, total_admissions DESC;

-- Average Length of Stay by Condition
SELECT medical_condition,
       ROUND(AVG(length_of_stay), 1) AS avg_stay_days,
       MAX(length_of_stay) AS max_stay_days,
       MIN(length_of_stay) AS min_stay_days
FROM healthcare
GROUP BY medical_condition
ORDER BY avg_stay_days DESC;

--  Test Results by Medical Condition
SELECT medical_condition,
       test_results,
       COUNT(*) AS total_patients
FROM healthcare
GROUP BY medical_condition, test_results
ORDER BY medical_condition, total_patients DESC;

-- Age Category Analysis
SELECT age_category,
       COUNT(*) AS total_patients,
       ROUND(AVG(billing_amount), 2) AS avg_billing,
       ROUND(AVG(length_of_stay), 1) AS avg_stay
FROM healthcare
GROUP BY age_category
ORDER BY avg_billing DESC;

-- High Billing Patients (top 10)
SELECT name, age, medical_condition,
       billing_amount, length_of_stay, admission_type
FROM healthcare
WHERE billing_amount > (SELECT AVG(billing_amount) FROM healthcare)
ORDER BY billing_amount DESC
LIMIT 10;

--  Blood Type Distribution
SELECT blood_type,
       COUNT(*) AS total_patients,
       ROUND(AVG(billing_amount), 2) AS avg_billing
FROM healthcare
GROUP BY blood_type
ORDER BY total_patients DESC;






















