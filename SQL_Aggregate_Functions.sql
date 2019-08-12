##################################### AGGREGATE FUNCTIONS #######################################

# COUNT() to count how many rows are in a table, or a column as a parameter
# to count the values in that column.
# Syntax Example:
SELECT COUNT(*)
FROM table_name;

# SUM() adds the values of a clomun, using that column as a paremeter.
# Syntax Example:
SELECT SUM(shirts)
FROM shirt_shop;

# MAX()/MIN(), MAX() returnsa the largest value in a column,
# where MIN() does the opposite, it returns the smallest value.
# Syntax Example:
SELECT MAX(price)
FROM shirt_shop;
# Or
SELECT MIN(price)
FROM shirt_shop;

# AVG() calculates the average of a specific column.
# SYntax Example:
SELECT AVG(price)
FROM shirt_shop;

# ROUND() rounds the value in a clomun. ROUND() takes two arguments, the column name,
# and an INTEGER that means the number of decimal places.
# Syntax Example:
SELECT name, ROUND(price, 0)
FROM shirt_shop;

# GROUP BY is used with SELECT statement to arrange identical data groups.
# GROUP BY comes after WHERE but before ORDER BY or LIMIT.
# Syntax Example:
SELECT style,
   AVG(shirt_type)
FROM shirt_shop
GROUP BY color
ORDER BY color;

# To GROUP BY a calculation in a column effectively.
# Instead of typing every column name we can just type the number of the culumn
# Syntax Example:
SELECT category, 
   price,
   AVG(shirts)
FROM shirt_shop
GROUP BY 1, 2;

# HAVING instea of WHERE
# We use HAVING when we want to filter groups.
# Syntax Example:
SELECT style,
   genre,
   COUNT(color)
FROM shirt_shop
GROUP BY 1, 2
HAVING COUNT(color) > 10;

# I hope this was helpful.
# Thank you very much.