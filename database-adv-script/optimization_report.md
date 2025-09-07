# Optimization Report

## EXPLAIN Analysis of Initial Query
When the initial query was executed with `EXPLAIN`, the plan showed:
- Sequential scans on the `Users`, `Booking`, `Property`, and `Payment` tables
- No indexes used on join columns (`user_id`, `property_id`, `booking_id`)
- Too many columns being selected, which increased I/O load

### Inefficiencies Identified
- Lack of indexes on foreign key columns
- Full table scans instead of index scans
- Selecting unnecessary columns, adding overhead

## Refactored Query
To improve execution time, the query was optimized as follows:
- Added indexes on `Booking.user_id`, `Booking.property_id`, and `Payment.booking_id`
- Selected only the required columns
- Removed redundant selections to reduce data transfer

```sql
SELECT b.id AS booking_id, b.start_date, b.end_date,
       u.name AS user_name, u.email,
       p.title, p.location,
       pay.amount, pay.payment_date
FROM Booking b
JOIN Users u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
JOIN Payment pay ON b.id = pay.booking_id;
