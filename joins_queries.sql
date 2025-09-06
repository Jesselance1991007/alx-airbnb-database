

-- 1. INNER JOIN: bookings with users
SELECT b.id AS booking_id,
       b.start_date,
       b.end_date,
       b.total_amount,
       u.id AS user_id,
       u.name AS user_name,
       u.email AS user_email
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- 2. LEFT JOIN: properties with reviews
-- (include properties without reviews)
SELECT p.id AS property_id,
       p.title,
       p.city,
       r.id AS review_id,
       r.rating,
       r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id
ORDER BY p.id;

-- 3. FULL OUTER JOIN in MySQL (simulated with UNION)
-- This returns all users and all bookings
SELECT u.id AS user_id,
       u.name AS user_name,
       b.id AS booking_id,
       b.start_date,
       b.end_date
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id

UNION

SELECT u.id AS user_id,
       u.name AS user_name,
       b.id AS booking_id,
       b.start_date,
       b.end_date
FROM bookings b
LEFT JOIN users u ON b.user_id = u.id;
