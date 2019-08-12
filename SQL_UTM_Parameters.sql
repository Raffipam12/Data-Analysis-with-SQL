##################################### UTM PARAMETERS FIRST AND LAST ATTRIBUTION #######################################

# First Touch
# SYntax Example:
WITH last_touch AS (
  SELECT user_id,
    MAX(timestamp) as last_touch_at
  FROM page_visits
  GROUP BY user_id)
SELECT lt.user_id,
  lt.last_touch_at,
  pv.utm_source
FROM last_touch lt
JOIN page_visits pv
  ON lt.user_id = pv.user_id
  AND lt.last_touch_at = pv.timestamp
WHERE lt.user_id = 120;

# Last Touch
# Syntax Example:
WITH last_touch AS (
  SELECT user_id,
    MAX(timestamp) as last_touch_at
  FROM page_visits
  GROUP BY user_id)
SELECT lt.user_id,
  lt.last_touch_at,
  pv.utm_source
FROM last_touch lt
JOIN page_visits pv
  ON lt.user_id = pv.user_id
  AND lt.last_touch_at = pv.timestamp
WHERE lt.user_id = 120;

# First vs Last
# Syntax Example
WITH last_touch AS (
  SELECT user_id,
    MAX(timestamp) as last_touch_at
  FROM page_visits
  GROUP BY user_id)
SELECT lt.user_id,
  lt.last_touch_at,
  pv.utm_source
FROM last_touch lt
JOIN page_visits pv
  ON lt.user_id = pv.user_id
  AND lt.last_touch_at = pv.timestamp
WHERE lt.user_id = 120;



