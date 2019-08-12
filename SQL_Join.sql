##################################### JOIN #######################################

# Combining tables
# This is called an Inner Join, which mean it only joins matching rows.
# Rows that do not match will be lost.
# Syntax Example:
SELECT *
FROM table1
JOIN table2
  ON table1.colum_name = table2.column_name;

# LEFT JOIN
# This will combine two table and keep some of the un-matched rows from the first table.
# Syntax Example:
SELECT *
FROM table1
LEFT JOIN table2
  ON table1.a3 = table2.a3;

# CROSS JOIN
# A cross join is usefull when you want to combine all rows from two or more tables together.
# SYntax Example:
SELECT shirts.shirt_color,
   pants.pants_color
FROM shirts
CROSS JOIN pants;

# UNION
# If we want to stack data on top of data we use UNION.
# Syntax Example:
SELECT *
FROM table1
UNION
SELECT *
FROM table2;

# WITH 
# WITH allows us to perform a separate query, and then use the alias we gave to this temporary
# new table to perform another query.
# Syntax Example:
WITH previous_query AS (
   SELECT customer_id,
      COUNT(subscription_id) AS 'subscriptions'
   FROM orders
   GROUP BY customer_id
)
SELECT customers.customer_name, 
   previous_query.subscriptions
FROM previous_query
JOIN customers
  ON previous_query.customer_id = customers.customer_id;


# I hope this was helpful.
# Thank you very much.