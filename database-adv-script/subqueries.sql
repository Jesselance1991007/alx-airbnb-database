-- ================================
-- Task 1: Practice Subqueries
-- ================================

-- 1. Non-Correlated Subquery
-- Objective: Find all properties where the average rating is greater than 4.0

SELECT p.property_id, p.name, p.location
FROM Properties p
WHERE (
    SELECT AVG(r.rating)
    FROM Reviews r
    WHERE r.property_id = p.property_id
) > 4.0;


-- 2. Correlated Subquery
-- Objective: Find users who have made more than 3 bookings

SELECT u.user_id, u.name, u.email
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.user_id
) > 3;
