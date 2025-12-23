# 🚗 Vehicle Rental System – Database Design & SQL Queries

## 🎯 Overview & Objectives

This project focuses on designing a relational database for a vehicle rental system and writing SQL queries to manage users, vehicles, and bookings. These SQL queries are written to understand table relationships using primary and foreign keys and to retrieve meaningful data using SQL queries such as JOIN, WHERE, EXISTS, GROUP BY, and HAVING. It provides a basic introduction to real-world database design and query concepts.

By completing this assignment, the following concepts are practiced:

- Relational database design
- Primary Key and Foreign Key usage
- One-to-Many relationships
- Entity Relationship Diagram (ERD)
- Writing SQL queries using:
  - JOIN
  - WHERE
  - EXISTS
  - GROUP BY
  - HAVING


## 🗄️ Database Schema Overview

The database contains **three main tables**:

### Users Table
This table stores all the users information.

**Fields include:**
- User ID (Primary Key)
- Name
- Email (Unique)
- Phone number
- Role (Customer / Admin)


### Vehicles Table
This table stores all the rental vehicles information.

**Fields include:**
- Vehicle ID (Primary Key)
- Vehicle name
- Type (car, bike, truck)
- Model
- Registration number (Unique)
- Rental price
- Availability status


### Bookings Table
This table stores all booking information and connects users to vehicles.

**Fields include:**
- Booking ID (Primary Key)
- User ID (Foreign Key)
- Vehicle ID (Foreign Key)
- Start date
- End date
- Booking status
- Total cost


## 🔍 SQL Queries Explanation

#### Query 1: JOIN
Booking details including user and vehicle information are retrieved via JOIN.

**Concepts used:**  
`INNER JOIN`


#### Query 2: NOT EXISTS
NOT EXISTS finds vehicles that have never been booked.

**Concepts used:**  
Subquery, `NOT EXISTS`


#### Query 3: WHERE
WHERE is used to filter the vehicle data available in the table.

**Concepts used:**  
Filtering data using `WHERE`


#### Query 4: GROUP BY and HAVING
Vehicles that have been booked more than twice have been found using GROUP BY and HAVING.

**Concepts used:**  
Aggregation, `GROUP BY`, `HAVING`

