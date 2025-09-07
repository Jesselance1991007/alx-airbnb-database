-- Task 2: Aggregations & Window Functions

-- 1. Total Bookings per User (Aggregation)
SELECT user_id, COUNT(*) AS total_bookings
FROM Bookings
GROUP BY user_id;

-- 2. Rank Properties by Total Bookings (Window Function)
SELECT property_id,
       COUNT(*) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS property_rank
FROM Bookings
GROUP BY property_id;
