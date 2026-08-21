-- =====================================================
-- Hotel Management System
-- PostgreSQL Schema
-- =====================================================

-- Create Database
-- Run this separately if the database does not exist.
-- CREATE DATABASE hotel_management;

-- Connect to the database before executing this file.
-- \c hotel_management

-- =====================================================
-- CUSTOMER TABLE
-- =====================================================

CREATE TABLE CUSTOMER (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(40) NOT NULL,
    EMAIL VARCHAR(40) UNIQUE,
    PHONE VARCHAR(15) UNIQUE,
    ADDRESS VARCHAR(200),
    ID_PROOF VARCHAR(50) NOT NULL,
    REGISTRATION_DATE DATE
);

-- =====================================================
-- ROOM TABLE
-- =====================================================

CREATE TABLE ROOM (
    ROOM_ID INT PRIMARY KEY,
    ROOM_NUMBER VARCHAR(5) UNIQUE,
    ROOM_TYPE VARCHAR(20) NOT NULL,
    PRICE_PER_NIGHT DECIMAL(10,2) NOT NULL,
    STATUS VARCHAR(20) NOT NULL,
    CAPACITY INT NOT NULL
);

-- =====================================================
-- EMPLOYEE TABLE
-- =====================================================

CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID INT PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR(40) NOT NULL,
    EMPLOYEE_ROLE VARCHAR(40) NOT NULL,
    PHONE VARCHAR(15) UNIQUE,
    SALARY DECIMAL(10,2),
    SHIFT VARCHAR(20)
);

-- =====================================================
-- BOOKING TABLE
-- =====================================================

CREATE TABLE BOOKING (
    BOOKING_ID INT PRIMARY KEY,
    CUSTOMER_ID INT NOT NULL,
    ROOM_ID INT NOT NULL,
    EMPLOYEE_ID INT NOT NULL,
    CHECK_IN_DATE DATE NOT NULL,
    CHECK_OUT_DATE DATE NOT NULL,
        BOOKING_DATE DATE NOT NULL,
    STATUS VARCHAR(20),
    TOTAL_AMOUNT DECIMAL(10,2),

    CONSTRAINT FK_BOOKING_CUSTOMER
        FOREIGN KEY (CUSTOMER_ID)
        REFERENCES CUSTOMER(CUSTOMER_ID),

    CONSTRAINT FK_BOOKING_ROOM
        FOREIGN KEY (ROOM_ID)
        REFERENCES ROOM(ROOM_ID),

    CONSTRAINT FK_BOOKING_EMPLOYEE
        FOREIGN KEY (EMPLOYEE_ID)
        REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

-- =====================================================
-- SERVICE TABLE
-- =====================================================

CREATE TABLE SERVICE (
    SERVICE_ID INT PRIMARY KEY,
    SERVICE_NAME VARCHAR(40) NOT NULL,
    PRICE DECIMAL(10,2) NOT NULL,
    DESCRIPTION VARCHAR(255)
);

-- =====================================================
-- BOOKING_SERVICE TABLE
-- =====================================================

CREATE TABLE BOOKING_SERVICE (
    BOOKING_SERVICE_ID INT PRIMARY KEY,
    BOOKING_ID INT NOT NULL,
    SERVICE_ID INT NOT NULL,
    QUANTITY INT NOT NULL,
    SERVICE_DATE DATE NOT NULL,
    TOTAL_COST DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_BOOKINGSERVICE_BOOKING
        FOREIGN KEY (BOOKING_ID)
        REFERENCES BOOKING(BOOKING_ID),

    CONSTRAINT FK_BOOKINGSERVICE_SERVICE
        FOREIGN KEY (SERVICE_ID)
        REFERENCES SERVICE(SERVICE_ID)
);

-- =====================================================
-- PAYMENT TABLE
-- =====================================================

CREATE TABLE PAYMENT (
    PAYMENT_ID INT PRIMARY KEY,
    BOOKING_ID INT NOT NULL,
    PAYMENT_DATE DATE NOT NULL,
    AMOUNT DECIMAL(10,2) NOT NULL,
    PAYMENT_METHOD VARCHAR(20) NOT NULL,
    PAYMENT_STATUS VARCHAR(20) NOT NULL,

    CONSTRAINT FK_PAYMENT_BOOKING
        FOREIGN KEY (BOOKING_ID)
        REFERENCES BOOKING(BOOKING_ID)
);
-- =====================================================
-- FEEDBACK TABLE
-- =====================================================

CREATE TABLE FEEDBACK (
    FEEDBACK_ID INT PRIMARY KEY,
    BOOKING_ID INT NOT NULL,
    CUSTOMER_ID INT NOT NULL,

    RATING INT CHECK (RATING BETWEEN 1 AND 5),

    FEEDBACK_DATE DATE NOT NULL,
    COMMENTS VARCHAR(200),

    CONSTRAINT FK_FEEDBACK_BOOKING
        FOREIGN KEY (BOOKING_ID)
        REFERENCES BOOKING(BOOKING_ID),

    CONSTRAINT FK_FEEDBACK_CUSTOMER
        FOREIGN KEY (CUSTOMER_ID)
        REFERENCES CUSTOMER(CUSTOMER_ID)
);