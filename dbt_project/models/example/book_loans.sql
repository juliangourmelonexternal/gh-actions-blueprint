
{{ config(materialized='table') }}

WITH book_loans AS (
    SELECT 1 AS book_id, 101 AS user_id, '2024-01-01' AS borrow_date
    UNION ALL
    SELECT 2, 102, '2024-01-05'
    UNION ALL
    SELECT 3, 103, '2024-02-02'
    UNION ALL
    SELECT 4, 104, '2024-02-15'
    UNION ALL
    SELECT 5, 105, '2024-03-01'
),
recent_loans AS (
    SELECT *
    FROM book_loans
    WHERE borrow_date > '2024-01-31'
)
SELECT *
FROM recent_loans
