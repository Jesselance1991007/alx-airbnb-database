# Performance Monitoring

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.  
This ensures the database can handle large-scale queries efficiently.

---

## Monitoring Queries
We focused on frequently used queries that are critical to the application:

```sql
-- Fetch bookings by user
EXPLAIN ANALYZE
SELECT b.id, b.start_date, b.end_date, p.title
FROM Booking b
JOIN Property p ON b.property_id = p.id
WHERE b.user_id = 101;

-- Fetch payments by date
EXPLAIN ANALYZE
SELECT pay.id, pay.amount, pay.payment_date
FROM Payment pay
WHERE pay.payment_date BETWEEN '2023-01-01' AND '2023-12-31';

-- Fetch booking and payment details together
EXPLAIN ANALYZE
SELECT b.id, u.name, p.title, pay.amount
FROM Booking b
JOIN Users u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
JOIN Payment pay ON b.id = pay.booking_id
WHERE b.start_date >= '2023-01-01';
