# Partitioning Performance Report

## Objective
The `Booking` table had grown very large, causing slow queries when filtering by `start_date`.  
We implemented **table partitioning** on the `Booking` table using **RANGE partitioning by start_date**.

## Method
- The main `Booking` table was recreated as a **partitioned table**.
- Partitions were created per year (`Booking_2023`, `Booking_2024`, etc.).
- Queries filtering on `start_date` were tested before and after partitioning.

## Observed Improvements
- **Before partitioning**: Queries like  
  ```sql
  SELECT * FROM Booking WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
