-- =====================================================
-- HOTEL MANAGEMENT SYSTEM
-- SQL QUERIES
-- PostgreSQL
-- =====================================================


-- =====================================================
-- 1. DISPLAY ALL ROOMS WHICH ARE BOOKED
-- =====================================================

SELECT *
FROM room
WHERE status = 'BOOKED';


-- =====================================================
-- 2. COUNT NUMBER OF ROOMS WHICH ARE AVAILABLE
-- =====================================================

SELECT COUNT(*)
FROM room
WHERE status = 'AVAILABLE';


-- =====================================================
-- 3. DISPLAY ALL CONFIRMED BOOKINGS
--    IN DESCENDING ORDER OF BOOKING DATE
-- =====================================================

SELECT *
FROM booking
WHERE status = 'CONFIRMED'
ORDER BY booking_date DESC;


-- =====================================================
-- 4. DISPLAY CUSTOMER ID AND NUMBER OF TIMES THEY BOOKED
-- =====================================================

SELECT customer_id, COUNT(*)
FROM booking
GROUP BY customer_id;


-- =====================================================
-- 5. DISPLAY CUSTOMER NAME AND BOOKING DATE USING JOIN
-- =====================================================

SELECT
    c.customer_name,
    b.booking_date
FROM customer AS c
JOIN booking AS b
    ON c.customer_id = b.customer_id;


-- =====================================================
-- 6. DISPLAY CUSTOMER NAME AND ROOM NUMBER
--    USING CUSTOMER, BOOKING AND ROOM
-- =====================================================

SELECT
    c.customer_name,
    r.room_number
FROM customer AS c
JOIN booking AS b
    ON c.customer_id = b.customer_id
JOIN room AS r
    ON b.room_id = r.room_id;


-- =====================================================
-- 7. DISPLAY CUSTOMER NAME, ROOM NUMBER AND ROOM TYPE
-- =====================================================

SELECT
    c.customer_name,
    r.room_number,
    r.room_type
FROM customer AS c
JOIN booking AS b
    ON c.customer_id = b.customer_id
JOIN room AS r
    ON b.room_id = r.room_id;


-- =====================================================
-- 8. SELECT CUSTOMERS WHO BOOKED AT LEAST ONCE
-- =====================================================

SELECT customer_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM booking
);


-- =====================================================
-- 9. UPDATE BOOKING STATUS TO COMPLETED
--    AND CHECK ROOM STATUS USING TRIGGER
-- =====================================================

UPDATE booking
SET status = 'COMPLETED'
WHERE customer_id = 5;


-- Check updated booking

SELECT *
FROM booking;


-- Check room status changed by trigger

SELECT *
FROM room;


-- =====================================================
-- 10. DISPLAY ROOM WITH HIGHEST AVERAGE RATING
-- =====================================================

SELECT
    r.room_number,
    AVG(f.rating) AS avg_rating
FROM room AS r
JOIN booking AS b
    ON r.room_id = b.room_id
JOIN feedback AS f
    ON f.booking_id = b.booking_id
GROUP BY r.room_number
ORDER BY avg_rating DESC;


-- =====================================================
-- 11. DISPLAY ROOMS WHOSE PRICE PER NIGHT
--     IS GREATER THAN OR EQUAL TO THE AVERAGE ROOM PRICE
-- =====================================================

SELECT
    room_id,
    room_number,
    room_type,
    price_per_night
FROM room
WHERE price_per_night >= (
    SELECT AVG(price_per_night)
    FROM room
);


-- =====================================================
-- 12. DISPLAY PAYMENT METHODS FOR PAYMENTS
--     WHERE AMOUNT IS AT LEAST 10000
-- =====================================================

SELECT
    payment_method,
    COUNT(*)
FROM payment
WHERE amount >= 10000
GROUP BY payment_method;


-- =====================================================
-- 13. DISPLAY PAYMENT METHODS WHERE
--     MAXIMUM PAYMENT AMOUNT IS GREATER THAN 15000
-- =====================================================

SELECT payment_method
FROM payment
GROUP BY payment_method
HAVING MAX(amount) > 15000;