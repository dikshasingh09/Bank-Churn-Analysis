CREATE DATABASE Bank_Churn_Prediction;

SELECT *
FROM `bank customer churn prediction`
LIMIT 5;

-- Finding the total number of customers
SELECT COUNT(customer_id) AS total_customers
FROM `bank customer churn prediction`;

-- Finding the total number of lost customers
SELECT COUNT(customer_id) AS total_lost_customers
FROM `bank customer churn prediction`
WHERE ChurnStatus = 'Churned';

-- Finding the churn rate
SELECT 
    (COUNT(CASE WHEN ChurnStatus = 'Churned' THEN 1 END) / COUNT(*)) * 100 AS churn_rate
FROM `bank customer churn prediction`;

-- Total customers by gender
SELECT 
    gender,
    COUNT(customer_id) AS total_customers
FROM 
    `bank customer churn prediction`
GROUP BY 
    gender;
    
    -- Total lost customers by gender
SELECT 
    gender,
    COUNT(customer_id) AS total_lost_customers
FROM 
    `bank customer churn prediction`
WHERE 
    churn = 1
GROUP BY 
    gender;

-- Total customers by activity status
SELECT 
    active_member AS Active_member_status,
    COUNT(customer_id) AS total_customers
FROM 
    `bank customer churn prediction`
GROUP BY 
    active_member;

-- Total lost customers by activity status
SELECT active_member, COUNT(*) AS Total_Lost_Customers
FROM `bank customer churn prediction`
WHERE ChurnStatus = 'Churned'
GROUP BY active_member;

-- Total customers by credit card
SELECT credit_card, COUNT(*) AS Total_Customers
FROM `bank customer churn prediction`
GROUP BY credit_card;

-- Total lost customers by credit card
SELECT credit_card, COUNT(customer_id) AS Total_Lost_Customers
FROM `bank customer churn prediction`
WHERE ChurnStatus = 'Churned'
GROUP BY credit_card;

-- Total customers by products
SELECT
    products_number,
    COUNT(customer_id) AS total_customers
FROM
    `bank customer churn prediction`
GROUP BY
    products_number;

-- Total lost customers by products
SELECT
    products_number,
    COUNT(customer_id) AS total_lost_customers
FROM
    `bank customer churn prediction`
WHERE
    ChurnStatus = 'Churned'
GROUP BY
    products_number;

-- Total customers by grouped age
SELECT 
    CASE
        WHEN age < 20 THEN '<20'
        WHEN age BETWEEN 21 AND 30 THEN '21-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        WHEN age BETWEEN 51 AND 60 THEN '51-60'
        WHEN age BETWEEN 61 AND 70 THEN '61-70'
        ELSE '>70'
    END AS age_group,
    COUNT(customer_id) AS total_customers
FROM 
   `bank customer churn prediction`
GROUP BY 
    age_group;

-- Total lost customers by grouped age
SELECT 
    CASE
        WHEN age < 20 THEN '<20'
        WHEN age BETWEEN 21 AND 30 THEN '21-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        WHEN age BETWEEN 51 AND 60 THEN '51-60'
        WHEN age BETWEEN 61 AND 70 THEN '61-70'
        ELSE '>70'
    END AS age_group,
    COUNT(customer_id) AS lost_customers
FROM 
     `bank customer churn prediction`
WHERE 
    ChurnStatus = 'Churned'
GROUP BY 
    age_group;

-- Total customers by grouped balance
SELECT
    CASE
        WHEN balance < 1000 THEN '<1k'
        WHEN balance >= 1000 AND balance < 10000 THEN '1k-10k'
        WHEN balance >= 10000 AND balance < 100000 THEN '10k-100k'
        WHEN balance >= 100000 AND balance < 200000 THEN '100k-200k'
        ELSE '>200k'
    END AS balance_group,
    COUNT(customer_id) AS total_customers
FROM
    `bank customer churn prediction`
GROUP BY
    balance_group;

-- Total lost customers by grouped balance
SELECT
    CASE
        WHEN balance < 1000 THEN '<1k'
        WHEN balance >= 1000 AND balance < 10000 THEN '1k-10k'
        WHEN balance >= 10000 AND balance < 100000 THEN '10k-100k'
        WHEN balance >= 100000 AND balance < 200000 THEN '100k-200k'
        ELSE '>200k'
    END AS balance_group,
    COUNT(customer_id) AS lost_customers
FROM
    `bank customer churn prediction`
WHERE
    ChurnStatus = 'Churned'
GROUP BY
    balance_group;
    
    -- Total customers by grouped credit card score
    SELECT
    CASE
        WHEN credit_score <= 400 THEN '<=400'
        WHEN credit_score > 400 AND credit_score <= 500 THEN '401-500'
        WHEN credit_score > 500 AND credit_score <= 600 THEN '501-600'
        WHEN credit_score > 600 AND credit_score <= 700 THEN '601-700'
        WHEN credit_score > 700 AND credit_score <= 800 THEN '701-800'
        ELSE '>800'
    END AS score_group,
    COUNT(customer_id) AS total_customers
FROM
   `bank customer churn prediction`
GROUP BY
    score_group;

-- Total lost customers by grouped credit card score
SELECT
    CASE
        WHEN credit_score <= 400 THEN '<=400'
        WHEN credit_score > 400 AND credit_score <= 500 THEN '401-500'
        WHEN credit_score > 500 AND credit_score <= 600 THEN '501-600'
        WHEN credit_score > 600 AND credit_score <= 700 THEN '601-700'
        WHEN credit_score > 700 AND credit_score <= 800 THEN '701-800'
        ELSE '>800'
    END AS score_group,
    COUNT(customer_id) AS lost_customers
FROM
    `bank customer churn prediction`
WHERE
    ChurnStatus = 'Churned'
GROUP BY
    score_group;

-- Churn rate by grouped credit card score
SELECT
    CASE
        WHEN credit_score <= 400 THEN '<=400'
        WHEN credit_score > 400 AND credit_score <= 500 THEN '401-500'
        WHEN credit_score > 500 AND credit_score <= 600 THEN '501-600'
        WHEN credit_score > 600 AND credit_score <= 700 THEN '601-700'
        WHEN credit_score > 700 AND credit_score <= 800 THEN '701-800'
        ELSE '>800'
    END AS score_group,
    SUM(churn) / COUNT(customer_id) * 100 AS churn_rate
FROM
    `bank customer churn prediction`
GROUP BY
    score_group;

-- Churn rate by grouped age
SELECT
    CASE
        WHEN age < 20 THEN '<20'
        WHEN age >= 20 AND age <= 30 THEN '21-30'
        WHEN age > 30 AND age <= 40 THEN '31-40'
        WHEN age > 40 AND age <= 50 THEN '41-50'
        WHEN age > 50 AND age <= 60 THEN '51-60'
        WHEN age > 60 AND age <= 70 THEN '61-70'
        ELSE '>70'
    END AS age_group,
    SUM(churn) / COUNT(customer_id) * 100 AS churn_rate
FROM
    `bank customer churn prediction`
GROUP BY
    age_group;

-- Churn rate by grouped account balance 
SELECT
    CASE
        WHEN balance < 1000 THEN '<1k'
        WHEN balance >= 1000 AND balance < 10000 THEN '1k-10k'
        WHEN balance >= 10000 AND balance < 100000 THEN '10k-100k'
        WHEN balance >= 100000 AND balance < 200000 THEN '100k-200k'
        ELSE '>200k'
    END AS balance_group,
    SUM(churn) / COUNT(customer_id) * 100 AS churn_rate
FROM
    `bank customer churn prediction`
GROUP BY
    balance_group;

-- Churn rate by tenure
SELECT
    tenure,
    SUM(churn) / COUNT(customer_id) * 100 AS churn_rate
FROM
    `bank customer churn prediction`
GROUP BY
    tenure;

