##################################### QUERY A TABLE #######################################

# Alias
# We use "AS" to rename our selected element and give an alias to it.
# Syntax Example:
SELECT movie_rating AS 'rating'
FROM movies;

# DISTINCT allows us to filter the results by unique values.
# Syntax Example:
SELECT DISTINCT year
FROM movies;

# Using WHERE to obtain only th infomation we want.
# SYntax Example:
SELECT *                   # We can use any logical operator: < > <= >= == !=.                
FROM movies                    
WHERE year > 2018; 

# Using LIKE to find a similar value.
# Syntax Exampe: 
SELECT *
FROM movies
WHERE name LIKE 'Goon_es';   # The "_" means we can replace any character.

# LIKE with "%" wildcard
# Syntax Example:
SELECT *
FROM movies
WHERE name LIKE 'The %';  # This will inds all the movies starting with 'The'.
# If the percentage sign is at the beginning then it will find all the movies ending with '%man'.

# IS NULL and IS NOT NULL
# IS NULL means a missing value and IS NOT NULL means there is no missing value.
# Syntax Example:
SELECT name
FROM movies
WHERE movie_rating IS NULL;

# Using BETWEEN to filter results in a certain range.
# SYntax Example:
SELECT *
FROM movies
WHERE year BETWEEN 2010 AND 2019;

# Combining multiple conditions with AND
# Syntax Example:
SELECT *
FROM movies
WHERE year < 2014
AND genre = 'action';

# Combining multiple comditions with OR
# The differece betwen AND and OR is that AND will display the query if all the conditions are true,
# and OR will display the query if any of the conditions is true.
# Syntax Example:
SELECT *
FROM movies
WHERE genre = 'action'
OR genre = 'adventure';

# Sorting the results with ORDER BY
# Syntax Example:
SELECT name, year, rating
FROM movies
ORDER BY movie_rating DESC;

# Limit limits your search by however many rows you want to be displaied.
# Syntax Example:
SELECT *
FROM movies
ORDER BY movie_rating DESC
LIMIT 10;

# CASE statements in SQL are the same as IF statements in python
# Syntax Example:
SELECT name,
 CASE                                    
  WHEN movie_rating > 8 THEN 'Great'           # If the rating is greater than 8, then it is Great.
  WHEN movie_rating > 6 THEN 'Not that good'   # If the rating is greater than 6, then it is Not that good.
  ELSE 'Poor rating'                           # Else, poor rating.
 END      # Always used END at the end of CASE statement.
FROM movies;

# ASC and DESC
# ASC sort data by ascendong order (A-Z), and DESC by descending (Z-A).
# Syntax Example:
SELECT *
FROM movies
ORDER BY movie_rating DESC;
# Or
SELECT *
FROM movies
ORDER BY movie_rating ASC;

# I hope this was helpful.
# Thank you very much.