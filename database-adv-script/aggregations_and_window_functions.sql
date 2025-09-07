-- Query 1: Total bookings per user
SELECT u.id AS user_id, u.name, COUNT(b.id) AS total_bookings
FROM Users u
JOIN Bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;

-- Query 2: Rank properties by total bookings
SELECT p.id AS property_id, p.name,
       COUNT(b.id) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM Properties p
LEFT JOIN Bookings b ON p.id = b.property_id
GROUP BY p.id, p.name;
