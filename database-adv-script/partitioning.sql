-- Step 1: Rename the original table (keep as backup)
ALTER TABLE Booking RENAME TO Booking_old;

-- Step 2: Create a new partitioned Booking table
CREATE TABLE Booking (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES Users(id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES Property(id)
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (example by year)
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_future PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO (MAXVALUE);

-- Step 4: Move old data into partitions (if needed)
INSERT INTO Booking SELECT * FROM Booking_old;

-- Step 5: Drop backup table after migration (optional)
-- DROP TABLE Booking_old;
