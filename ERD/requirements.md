# Entity-Relationship (ER) Diagram for a Booking database system
This ERD models the core entities, their attributes, and the relationship between them. 

---

## Entities and Attributes 

### 1. User 
- **user_id** (Primary Key )
- name
- email 
- phone
- role  (guest/host)

### 2. Property 
- **property_id** (Primary key)
- host_id (Foreign Key → User.user_id)
- title
- location
- description
- price

### 3. Booking 
- **booking_id** (Primary Key)
- user_id (Foreign key → User.user_id)
- property_id (Foreign Key → Property.property_id)
- start_date 
- end_date
- status

### 4. Review 
- **review_id** (Primary Key)
- booking_id (Foreign Key → Booking.booking_id)
- rating 
- comment 

### 5. Payment
- **payment_id** (Primary Key)
- booking_id (Foreign Key → Booking.booking_id)
- amount 
- payment_date
- payment_status

---

## Relatioships
- A **User** can make many **Bookings** → 'User (1) : Booking (N)'
- A **User** (as host) own many **Properties** → 'User (1) : Property (N)'
- A **Property** can have many **Bookings** → 'Property (1) : Booking (N)' 
- A **Booking** can have one **Review** → 'Booking (1) : Review(1)'
- A **Booking** can have one **Payment** → 'Booking (1) : Payment (1)'


---
 
## ER Diagram 
The ER diagram visually represents the above entities and relatioships.
(To be drawn using **Draw.io**, **Lucidchart**, **dbdiagram.io)


---

## Notes 
- Primary keys (PK) uniquely identifies each record. 
- Foreign keys (FK) link related entities.
- This structure allows us to track users, properties, reservations, payments, and reviews in 
the Booking platform

