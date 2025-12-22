-- Vehicle Rental System - SQL Queries
-- Database Schema Table

CREATE TABLE users (
   id SERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   email VARCHAR(60) UNIQUE NOT NULL,
   phone VARCHAR(15) NOT NULL,
   role VARCHAR(50) NOT NULL
);

CREATE TABLE vehicles (
   id SERIAL PRIMARY KEY,
   vehicle_name VARCHAR(100) NOT NULL,
   type VARCHAR(50) NOT NULL,
   model VARCHAR(50) NOT NULL,
   registration_number VARCHAR(50) UNIQUE NOT NULL,
   rental_price DECIMAL(10, 2) NOT NULL,
   availability_status VARCHAR(50) NOT NULL
);

CREATE TABLE bookings (
   id SERIAL PRIMARY KEY,
   user_id INT REFERENCES users(id) NOT NULL,
   vehicle_id INT REFERENCES vehicles(id) NOT NULL,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   booking_status VARCHAR(50) NOT NULL,
   total_cost DECIMAL(10, 2) NOT NULL
);

-- Data Insertion
INSERT INTO users VALUES
(1, 'Alice', 'alice@example.com', '1234567890', 'Customer'),
(2, 'Bob', 'bob@example.com', '0987654321', 'Admin'),
(3, 'Charlie', 'charlie@example.com', '1122334455', 'Customer');

INSERT INTO vehicles VALUES
(1, 'Toyota Corolla', 'car', '2022', 'ABC-123', 50, 'available'),
(2, 'Honda Civic', 'car', '2021', 'DEF-456', 60, 'rented'),
(3, 'Yamaha R15', 'bike', '2023', 'GHI-789', 30, 'available'),
(4, 'Ford F-150', 'truck', '2020', 'JKL-012', 100, 'maintenance');

INSERT INTO bookings VALUES
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(2, 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);


-- Query 1: JOIN
SELECT 
   bookings.id AS booking_id,
   users.name AS customer_name,
   vehicles.vehicle_name,
   bookings.start_date,
   bookings.end_date,
   bookings.booking_status
FROM bookings
INNER JOIN users ON bookings.user_id = users.id
INNER JOIN vehicles ON bookings.vehicle_id = vehicles.id
ORDER BY bookings.id;


-- Query 2: EXISTS
SELECT 
   vehicles.id,
   vehicles.vehicle_name,
   vehicles.type,
   vehicles.model,
   vehicles.registration_number,
   vehicles.rental_price,
   vehicles.availability_status
FROM vehicles
WHERE NOT EXISTS (
   SELECT 1
   FROM bookings
   WHERE bookings.vehicle_id = vehicles.id
)
ORDER BY vehicles.id;


-- Query 3: WHERE
SELECT 
   vehicles.id,
   vehicles.vehicle_name,
   vehicles.type,
   vehicles.model,
   vehicles.registration_number,
   vehicles.rental_price,
   vehicles.availability_status
FROM vehicles
WHERE vehicles.availability_status = 'available'
AND vehicles.type = 'car'
ORDER BY vehicles.id;

-- Query 4: GROUP BY and HAVING
SELECT 
   vehicles.vehicle_name,
   COUNT(bookings.id) AS total_bookings
FROM vehicles
INNER JOIN bookings ON vehicles.id = bookings.vehicle_id
GROUP BY vehicles.id, vehicles.vehicle_name
HAVING COUNT(bookings.id) > 2
ORDER BY total_bookings DESC;

