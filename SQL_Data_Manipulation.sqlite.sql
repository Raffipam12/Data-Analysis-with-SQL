##################################### DATA MANIPULATION #######################################

# Relational Database
# Syntax Example:
SELECT row FROM table_name;
# We can also uset the "*"(wildcard) after SELECT.

# Creating a table
# To create a able we'll enter between parentheses the column name followed by the data type.
# Syntax Example:
CREATE TABLE table_name (
id INTEGER,
name TEXT,
age INTEGER);

# Inserting a new row into a table
# Syntax Example:
INSERT INTO my_table (id, name, age) 
VALUES (1, 'John Doe', 24);

# Adding a new column to a table
# Syntax Example:
ALTER TABLE my_table 
ADD COLUMN email TEXT;  

# Updating a row
# We usually update a row when we want to change existing records.
# Syntax Example:
UPDATE my_table
SET email = '@johndoe.com'
WHERE id = 1;

# Deleting a row from a table
# Syntax Example:
DELETE FROM my_table
WHERE email IS NULL;

# Constraints specify the unique data type that a table will accept.
# Syntax Example:
CREATE TABLE my_table (
id INTEGER PRIMARY KEY,
employee TEXT NOT NULL,
email TEXT DEFAULT '@ourcompany.com');

# I hope this was helpful.
# Thank you very much.