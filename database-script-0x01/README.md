# Airbnb Database Schema (DDL)

## 📌 Objective
This schema defines the database structure for an **Airbnb-like system**, including users, properties, bookings, reviews, and payments.

## 📂 Files
- `schema.sql` → SQL script containing all table definitions and indexes.
- `README.md` → Documentation of the database schema.

## 🛠️ Tables
1. **Users** → Guests & Hosts.
2. **Properties** → Listings owned by hosts.
3. **Bookings** → Reservations made by guests.
4. **Reviews** → Ratings & comments linked to bookings.
5. **Payments** → Transactions linked to bookings.

## ⚡ Constraints & Features
- Primary keys (`user_id`, `property_id`, `booking_id`, `review_id`, `payment_id`).
- Foreign keys with `ON DELETE CASCADE`.
- `CHECK` constraint for review ratings (1–5).
- `ENUM` for roles, booking status, and payment status.
- Indexes for performance (`email`, `location`, `status`).

## ▶️ How to Run
1. Open MySQL or PostgreSQL terminal.  
2. Run the script:
   ```sql
   source schema.sql;
