# Index Performance Report

## Users Table
- Added index on `email` for faster lookups.
- Tested query: `SELECT * FROM Users WHERE email = 'example@mail.com';`
- Execution plan changed from `Full Table Scan` → `Index Lookup`.

## Property Table
- Added indexes on `location` and `host_id`.
- Tested query: `SELECT * FROM Property WHERE location = 'Lagos';`
- Execution time reduced significantly.

## Booking Table
- Added indexes on `user_id`, `property_id`, and `start_date`.
- Tested query: `SELECT * FROM Booking WHERE user_id = 101;`
- Execution plan switched from table scan → index lookup.

# Index Performance Analysis

This document measures query performance **before and after adding indexes** using `EXPLAIN` (MySQL/Postgres) and `EXPLAIN ANALYZE` (Postgres).

---

## 1. Query: Fetch bookings by user_id
```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 101;


## Conclusion
Indexes improved query speed for filtering, joining, and date range searches.
