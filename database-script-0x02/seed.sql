-- Insert sample users
INSERT INTO Users (user_id, name, email, password_hash, phone, created_at)
VALUES
(1, 'Alice Johnson', 'alice@example.com', 'hashed_pw1', '08012345678', NOW()),
(2, 'Bob Smith', 'bob@example.com', 'hashed_pw2', '08087654321', NOW());

-- Insert sample properties
INSERT INTO Properties (property_id, user_id, title, description, location, price_per_night, created_at)
VALUES
(1, 1, 'Cozy Apartment', '2 bedroom apartment in Lagos', 'Lagos, Nigeria', 20000.00, NOW()),
(2, 2, 'Beachfront Villa', 'Luxury villa near the beach', 'Accra, Ghana', 80000.00, NOW());

-- Insert sample bookings
INSERT INTO Bookings (booking_id, user_id, property_id, start_date, end_date, status)
VALUES
(1, 2, 1, '2025-09-01', '2025-09-05', 'confirmed'),
(2, 1, 2, '2025-10-10', '2025-10-15', 'pending');

-- Insert sample payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_date, method, status)
VALUES
(1, 1, 80000.00, NOW(), 'credit_card', 'completed'),
(2, 2, 400000.00, NOW(), 'bank_transfer', 'pending');
