# Airbnb Database Design (ERD + Normalization)

## Objective
Design an ER diagram and schema for an Airbnb-like system.  
Ensure the database is normalized up to **Third Normal Form (3NF)**.

---

## Entities and Attributes

### 1. User Table
| Column   | Type    | Key          | Description                  |
|----------|---------|--------------|------------------------------|
| user_id  | INT     | Primary Key  | Unique ID for each user      |
| name     | VARCHAR |              | Full name of the user        |
| email    | VARCHAR |              | Email address (unique)       |
| phone    | VARCHAR |              | Phone number                 |
| role     | ENUM    |              | Role of user (guest/host)    |

---

### 2. Location Table
| Column      | Type    | Key          | Description                   |
|-------------|---------|--------------|-------------------------------|
| location_id | INT     | Primary Key  | Unique ID for each location   |
| street      | VARCHAR |              | Street address                |
| city        | VARCHAR |              | City                          |
| state       | VARCHAR |              | State/Province                |
| country     | VARCHAR |              | Country                       |

---

### 3. Property Table
| Column      | Type    | Key                       | Description                          |
|-------------|---------|---------------------------|--------------------------------------|
| property_id | INT     | Primary Key               | Unique ID for each property          |
| host_id     | INT     | Foreign Key → User.user_id| References the host (User)           |
| location_id | INT     | Foreign Key → Location.location_id | Property’s location        |
| title       | VARCHAR |                           | Title of the property                |
| description | TEXT    |                           | Description of the property          |
| price       | DECIMAL |                           | Price per night                      |

---

### 4. Booking Table
| Column      | Type    | Key                       | Description                            |
|-------------|---------|---------------------------|----------------------------------------|
| booking_id  | INT     | Primary Key               | Unique ID for each booking             |
| user_id     | INT     | Foreign Key → User.user_id| Guest making the booking               |
| property_id | INT     | Foreign Key → Property.property_id | Property being booked       |
| start_date  | DATE    |                           | Start date of the booking              |
| end_date    | DATE    |                           | End date of the booking                |
| status      | ENUM    |                           | Booking status (confirmed/cancelled)   |

---

### 5. Review Table
| Column     | Type    | Key                       | Description                      |
|------------|---------|---------------------------|----------------------------------|
| review_id  | INT     | Primary Key               | Unique ID for each review        |
| booking_id | INT     | Foreign Key → Booking.booking_id | Booking being reviewed    |
| rating     | INT     |                           | Numeric rating (e.g., 1–5)       |
| comment    | TEXT    |                           | Review text                      |

---

### 6. Payment Table
| Column        | Type    | Key                       | Description                              |
|---------------|---------|---------------------------|------------------------------------------|
| payment_id    | INT     | Primary Key               | Unique ID for each payment               |
| booking_id    | INT     | Foreign Key → Booking.booking_id | Booking being paid for          |
| amount        | DECIMAL |                           | Payment amount                           |
| payment_date  | DATE    |                           | Date of payment                          |
| payment_status| ENUM    |                           | Status (paid, pending, failed, etc.)     |

---

## Relationships
- A **User** can make many **Bookings** → `User (1) : Booking (N)`
- A **User** (as host) can own many **Properties** → `User (1) : Property (N)`
- A **Property** belongs to one **Location** → `Location (1) : Property (N)`
- A **Property** can have many **Bookings** → `Property (1) : Booking (N)`
- A **Booking** can have one **Review** → `Booking (1) : Review (1)`
- A **Booking** can have one **Payment** → `Booking (1) : Payment (1)`

---

## Normalization Steps

### Step 1: First Normal Form (1NF)
- Each column contains atomic values (no repeating groups).
- Example: `Location` table stores `city`, `state`, `country` separately, not all in one field.  
✅ Achieved.

---

### Step 2: Second Normal Form (2NF)
- Database is already in 1NF.
- All non-key attributes fully depend on the entire primary key.
- Example: In `Booking`, `start_date`, `end_date`, and `status` depend only on `booking_id`.  
✅ Achieved.

---

### Step 3: Third Normal Form (3NF)
- Database is in 2NF.
- No transitive dependencies (non-key attributes do not depend on other non-key attributes).
- Example: `Property.price` depends only on `property_id`, not indirectly via `location`.  
✅ Achieved.

---

## Conclusion
The Airbnb database schema is fully normalized up to **3NF**.  
It reduces redundancy (e.g., `Location` data stored separately) and ensures data integrity.
