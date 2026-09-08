-- ProApp business-analysis queries
-- Oracle SQL
--
-- A fixed analysis date is used so that results remain reproducible.
-- Change ANALYSIS_DATE to evaluate another reporting period.


-- ============================================================
-- 1. Customers with no task activity in the previous 30 days
-- ============================================================

WITH PARAMETERS AS (
    SELECT DATE '2024-10-20' AS ANALYSIS_DATE
    FROM DUAL
)
SELECT
    C.CUSTOMERID,
    C.NAME,
    C.EMAIL,
    C.MEMBERSHIP_TYPE,
    MAX(T.TASK_DATE) AS LAST_TASK_DATE
FROM CUSTOMER C
LEFT JOIN TASK T
    ON C.CUSTOMERID = T.CUSTOMERID
CROSS JOIN PARAMETERS P
GROUP BY
    C.CUSTOMERID,
    C.NAME,
    C.EMAIL,
    C.MEMBERSHIP_TYPE,
    P.ANALYSIS_DATE
HAVING
    MAX(T.TASK_DATE) IS NULL
    OR MAX(T.TASK_DATE) < P.ANALYSIS_DATE - 30
ORDER BY LAST_TASK_DATE NULLS FIRST;


-- ============================================================
-- 2. Tradespeople with no bid activity in the previous 30 days
-- ============================================================

WITH PARAMETERS AS (
    SELECT DATE '2024-10-20' AS ANALYSIS_DATE
    FROM DUAL
)
SELECT
    T.TRADESPERSONID,
    T.NAME,
    T.EMAIL,
    T.SKILL_LEVEL,
    MAX(B.BID_DATE) AS LAST_BID_DATE
FROM TRADESPERSON T
LEFT JOIN BID B
    ON T.TRADESPERSONID = B.TRADESPERSONID
CROSS JOIN PARAMETERS P
GROUP BY
    T.TRADESPERSONID,
    T.NAME,
    T.EMAIL,
    T.SKILL_LEVEL,
    P.ANALYSIS_DATE
HAVING
    MAX(B.BID_DATE) IS NULL
    OR MAX(B.BID_DATE) < P.ANALYSIS_DATE - 30
ORDER BY LAST_BID_DATE NULLS FIRST;


-- ============================================================
-- 3. Days from task posting to payment, alongside rating
-- ============================================================
-- The original project treated this interval as completion time.
-- Because no separate completion-date field exists, payment date
-- is used only as a proxy and should not be interpreted as proof
-- of the actual completion date.

SELECT
    T.TASKID,
    T.TASK_TYPE,
    T.TASK_DATE,
    PT.TRANSACTION_DATE,
    PT.TRANSACTION_DATE - T.TASK_DATE
        AS DAYS_FROM_POSTING_TO_PAYMENT,
    R.RATING
FROM TASK T
JOIN PAYMENT_TRANSACTION PT
    ON T.TASKID = PT.TASKID
JOIN RATING R
    ON T.TASKID = R.TASKID
ORDER BY DAYS_FROM_POSTING_TO_PAYMENT;


-- ============================================================
-- 4. Payment-method usage
-- ============================================================

SELECT
    PAYMENT_METHOD,
    COUNT(*) AS PAYMENT_COUNT,
    ROUND(
        100 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS PAYMENT_PERCENTAGE
FROM PAYMENT_TRANSACTION
GROUP BY PAYMENT_METHOD
ORDER BY PAYMENT_COUNT DESC;


-- ============================================================
-- 5. Monthly task-posting patterns
-- ============================================================

SELECT
    TO_CHAR(TRUNC(TASK_DATE, 'MM'), 'YYYY-MM') AS TASK_MONTH,
    COUNT(*) AS TASK_COUNT,
    ROUND(AVG(BUDGET), 2) AS AVERAGE_BUDGET
FROM TASK
GROUP BY TRUNC(TASK_DATE, 'MM')
ORDER BY TRUNC(TASK_DATE, 'MM');
