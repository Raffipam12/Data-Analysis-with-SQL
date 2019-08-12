##################################### USAGE FUNNELS #######################################

# Bulding a funnel from a single table.
# Syntax Example:
SELECT question_text,
COUNT(DISTINCT user_id)
FROM survey_responses
GROUP BY 1;

# A/B Test with Funnels
# Syntax Example:
SELECT modal_text,
  COUNT(DISTINCT CASE
    WHEN ab_group = 'control' THEN user_id
    END) AS 'control_clicks',
    COUNT(DISTINCT CASE
         WHEN ab_group = 'variant' THEN user_id
         END) AS 'variant'
FROM onboarding_modals
GROUP BY 1
ORDER BY 1;

# Funnel with multiple tables, x 2 tables
# Syntax Example:
SELECT DISTINCT b.browse_date,
   b.user_id,
   c.user_id IS NOT NULL AS 'is_checkout',
   p.user_id IS NOT NULL AS 'is_purchase'
FROM browse AS 'b'
LEFT JOIN checkout 'c'
  ON c.user_id = b.user_id
LEFT JOIN purchase 'p'
  ON p.user_id = c.user_id
LIMIT 60;

# Funnel with multiple tables, x 3 tables
# Syntax Example:
WITH funnels AS (
  SELECT DISTINCT b.browse_date,
     b.user_id,
     c.user_id IS NOT NULL AS 'is_checkout',
     p.user_id IS NOT NULL AS 'is_purchase'
  FROM browse AS 'b'
  LEFT JOIN checkout AS 'c'
    ON c.user_id = b.user_id
  LEFT JOIN purchase AS 'p'
    ON p.user_id = c.user_id)
    SELECT COUNT(*) AS 'num_browse', 
    SUM(is_checkout) AS 'num_checkout',
    SUM(is_purchase) AS 'num_purchase',
   1.0 * SUM(is_checkout) / COUNT(user_id),
1.0 * SUM(is_purchase) / SUM(is_checkout) 
FROM funnels;

# Funnel with multiple tables, x 4 tables
# Syntax Example:
WITH funnels AS (
  SELECT DISTINCT b.browse_date,
    b.user_id,
    c.user_id IS NOT NULL AS 'is_checkout',
    p.user_id IS NOT NULL AS 'is_purchase'
  FROM browse AS 'b'
  LEFT JOIN checkout AS 'c'
    ON c.user_id = b.user_id
  LEFT JOIN purchase AS 'p'
    ON p.user_id = c.user_id)
SELECT COUNT(*) AS 'num_browse',
   SUM(is_checkout) AS 'num_checkout',
   SUM(is_purchase) AS 'num_purchase',
   1.0 * SUM(is_checkout) / COUNT(user_id) AS 'browse_to_checkout',
   1.0 * SUM(is_purchase) / SUM(is_checkout) AS 'checkout_to_purchase'
FROM funnels;

# I hope this was helpful.
# Thank you very much.