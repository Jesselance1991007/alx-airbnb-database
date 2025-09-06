# Task 0: Complex Queries with Joins

This task focuses on practicing SQL join operations in **MySQL** using the Airbnb database.  
We explored how to retrieve combined data across related tables using different join techniques.

---

## What Was Done

1. **INNER JOIN**
   - Combined the `bookings` table with the `users` table.  
   - Retrieved only the rows where a booking has a valid user.  
   - Purpose: To see which user made each booking.

2. **LEFT JOIN**
   - Combined the `properties` table with the `reviews` table.  
   - Returned all properties, including those without reviews.  
   - Purpose: To ensure we capture properties with and without feedback.

3. **FULL OUTER JOIN (Simulated with UNION)**
   - MySQL does not directly support `FULL OUTER JOIN`.  
   - We simulated it by combining two `LEFT JOIN` queries with a `UNION`.  
   - This returned:
     - All users with or without bookings.  
     - All bookings with or without linked users.  
   - Purpose: To capture every possible relationship, even if some data is missing.

---

## How It Works

- **INNER JOIN** → Keeps only matching rows from both tables.  
- **LEFT JOIN** → Keeps all rows from the left table, with `NULL` values where no match exists.  
- **FULL OUTER JOIN (via UNION)** → Combines unmatched rows from both sides, giving a complete dataset.

---

## How to Run

1. Write the queries in a file called `joins_queries.sql`.  
2. Save the file inside your `task_0/` folder.  
3. Run the file against your MySQL database:
   ```bash
   mysql -u root -p alx_airbnb < task_0/joins_queries.sql
