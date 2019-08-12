##################################### CALCULATING CHURN #######################################

# Churn is the percentage of cancelations, usually within a month
# Calvulating basic Churn
# Syntax Example:
SELECT "number of cancelations". / "total customers"  # or SELECT 500. / 2000

# Calculating Churn for a single month
# SELECT 1.0 * 
(
  SELECT COUNT(*)
  FROM subscriptions
  WHERE subscription_start < '2018-01-01'
  AND (
    subscription_end
    BETWEEN '2018-01-01'
    AND '2018-01-31'
  )
) / (
  SELECT COUNT(*) 
  FROM subscriptions 
  WHERE subscription_start < '2018-01-01'
  AND (
    (subscription_end >= '2018-01-01')
    OR (subscription_end IS NULL)
  )
) 
AS result;

# Calculating Churn for a single month, 2nd method
# WITH enrollments AS 
(SELECT *
FROM subscriptions
WHERE subscription_start < '2018-01-01'
AND (
  (subscription_end >= '2018-01-01')
  OR (subscription_end IS NULL)
)),
status AS 
(SELECT 
CASE
  WHEN (subscription_end > '2018-01-31')
    OR (subscription_end IS NULL) THEN 0
  ELSE 1
  END as is_canceled,
CASE
  WHEN (subscription_start < '2018-01-01')
    AND (
      (subscription_end >= '2018-01-01')
        OR (subscription_end IS NULL)
    ) THEN 1
    ELSE 0
  END as is_active
FROM enrollments
)
SELECT 1.0 * SUM(is_canceled)/SUM(is_active) FROM status;

# Create a temporary table to calculate multiple months
# Syntax Example:
WITH months as
(SELECT
  '2018-01-01' as first_day,
  '2018-01-31' as last_day
UNION
SELECT
  '2018-02-01' as first_day,
  '2018-02-28' as last_day
UNION
SELECT
  '2018-03-01' as first_day,
  '2018-03-31' as last_day
)
SELECT *
FROM months;

# Multiple Cross Join
# Syntax Example:
WITH months AS
(SELECT
  '2018-01-01' as first_day,
  '2018-01-31' as last_day
UNION
SELECT
  '2018-02-01' as first_day,
  '2018-02-28' as last_day
UNION
SELECT
  '2018-03-01' as first_day,
  '2018-03-31' as last_day
),
cross_join AS
(SELECT *
FROM subscriptions
CROSS JOIN months)
SELECT *
FROM cross_join
LIMIT 100;

# Determine active status of a subscription
# Syntax Example:
WITH months AS
(SELECT
  '2018-01-01' as first_day,
  '2018-01-31' as last_day
UNION
SELECT
  '2018-02-01' as first_day,
  '2018-02-28' as last_day
UNION
SELECT
  '2018-03-01' as first_day,
  '2018-03-31' as last_day
),
cross_join AS
(SELECT *
FROM subscriptions
CROSS JOIN months),
status AS
(SELECT id, first_day as month,
CASE
  WHEN (subscription_start < first_day)
    AND (
      subscription_end > first_day
      OR subscription_end IS NULL
    ) THEN 1
  ELSE 0
END as is_active
FROM cross_join)
SELECT *
FROM status
LIMIT 100;

# Determine cancelation status
# Syntax Example:
WITH months AS
(SELECT
  '2018-01-01' as first_day,
  '2018-01-31' as last_day
UNION
SELECT
  '2018-02-01' as first_day,
  '2018-02-28' as last_day
UNION
SELECT
  '2018-03-01' as first_day,
  '2018-03-31' as last_day
),
cross_join AS
(SELECT *
FROM subscriptions
CROSS JOIN months),
status AS
(SELECT id, first_day as month,
CASE
  WHEN (subscription_start < first_day)
    AND (
      subscription_end > first_day
      OR subscription_end IS NULL
    ) THEN 1
  ELSE 0
END as is_active,
CASE 
  WHEN subscription_end BETWEEN first_day AND last_day THEN 1
  ELSE 0
END as is_canceled
FROM cross_join)
SELECT *
FROM status
LIMIT 100;

# Calculating active and canceled users
# Syntax Example:
WITH months AS
(SELECT
  '2018-01-01' as first_day,
  '2018-01-31' as last_day
UNION
SELECT
  '2018-02-01' as first_day,
  '2018-02-28' as last_day
UNION
SELECT
  '2018-03-01' as first_day,
  '2018-03-31' as last_day
),
cross_join AS
(SELECT *
FROM subscriptions
CROSS JOIN months),
status AS
(SELECT id, first_day as month,
CASE
  WHEN (subscription_start < first_day)
    AND (
      subscription_end > first_day
      OR subscription_end IS NULL
    ) THEN 1
  ELSE 0
END as is_active,
CASE 
  WHEN subscription_end BETWEEN first_day AND last_day THEN 1
  ELSE 0
END as is_canceled
FROM cross_join),
status_aggregate AS
(SELECT
  month,
  SUM(is_active) as active,
  SUM(is_canceled) as canceled
FROM status
GROUP BY month)
SELECT *
FROM status_aggregate;

# Churn Rate Calculation. This is the last step of the whole proccess.
# Syntax Example:
WITH months AS
(SELECT
  '2018-01-01' as first_day,
  '2018-01-31' as last_day
UNION
SELECT
  '2018-02-01' as first_day,
  '2018-02-28' as last_day
UNION
SELECT
  '2018-03-01' as first_day,
  '2018-03-31' as last_day
),
cross_join AS
(SELECT *
FROM subscriptions
CROSS JOIN months),
status AS
(SELECT id, first_day as month,
CASE
  WHEN (subscription_start < first_day)
    AND (
      subscription_end > first_day
      OR subscription_end IS NULL
    ) THEN 1
  ELSE 0
END as is_active,
CASE 
  WHEN subscription_end BETWEEN first_day AND last_day THEN 1
  ELSE 0
END as is_canceled
FROM cross_join),
status_aggregate AS
(SELECT
  month,
  SUM(is_active) as active,
  SUM(is_canceled) as canceled
FROM status
GROUP BY month)
SELECT
  month,
  1.0 * canceled/active AS churn_rate
FROM status_aggregate;

# I hope this was helpful.
# Thank you very much.