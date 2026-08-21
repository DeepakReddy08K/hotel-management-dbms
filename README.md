# Hotel Management System - DBMS

A Hotel Management System developed as a DBMS mini project using PostgreSQL.

## Project Description

This project manages the main operations of a hotel, including customers, rooms, employees, bookings, services, payments, and customer feedback.

PostgreSQL triggers are used to automatically update room availability when a booking is created, completed, cancelled, or deleted.

## Technologies Used

- PostgreSQL
- SQL
- Git & GitHub

## Database Tables

1. Customer
2. Room
3. Employee
4. Booking
5. Service
6. Booking_Service
7. Payment
8. Feedback

## SQL Concepts Used

- Primary Keys
- Foreign Keys
- Unique Constraints
- NOT NULL Constraints
- CHECK Constraints
- INSERT
- UPDATE
- DELETE
- JOIN
- Subqueries
- GROUP BY
- HAVING
- ORDER BY
- Aggregate Functions
- PostgreSQL Triggers

## PostgreSQL Triggers

The project contains three triggers:

- When a booking is created, the room becomes `BOOKED`.
- When a booking is completed or cancelled, the room becomes `AVAILABLE`.
- When a booking is deleted, the room becomes `AVAILABLE`.

## Project Structure

```text
hotel-management-dbms/
│
├── data/
│   └── data.sql
│
├── docs/
│
├── queries/
│   └── queries.sql
│
├── schema/
│   ├── 01_schema.sql
│   └── 02_triggers.sql
│
└── README.md