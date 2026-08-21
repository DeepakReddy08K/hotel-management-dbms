-- HOTEL MANAGEMENT SYSTEM
-- Sample Data


-- 1. CUSTOMER DATA
INSERT INTO customer
(customer_id, customer_name, email, phone, address, id_proof, registration_date)
VALUES
(1, 'RAM', 'ram123@gmail.com', '9876543210', 'Hyderabad', 'PAN', '2026-01-02'),
(2, 'DEEPAK', 'deepak@gmail.com', '9898989898', 'NagarKurnool', 'AADHAR', '2026-01-01'),
(3, 'SHAM', 'sham456@gmail.com', '9123456789', 'Warangal', 'PASSPORT', '2026-01-03'),
(4, 'MOHAN', 'mohan789@gmail.com', '9988776655', 'Karimnagar', 'AADHAR', '2026-01-04'),
(5, 'RAJU', 'raju321@gmail.com', '9012345678', 'Nizamabad', 'PAN', '2026-01-05'),
(6, 'SITA', 'sita654@gmail.com', '9090909090', 'Khammam', 'PASSPORT', '2026-01-06'),
(7, 'GEETA', 'geeta987@gmail.com', '9191919191', 'Mahbubnagar', 'AADHAR', '2026-01-07'),
(8, 'ARUN', 'arun111@gmail.com', '9222222222', 'Adilabad', 'PAN', '2026-01-08'),
(9, 'VARUN', 'varun222@gmail.com', '9333333333', 'Hanamkonda', 'PASSPORT', '2026-01-09'),
(10, 'KIRAN', 'kiran333@gmail.com', '9444444444', 'Secunderabad', 'AADHAR', '2026-01-10');


-- 2. ROOM DATA
INSERT INTO room
(room_id, room_number, room_type, price_per_night, status, capacity)
VALUES
(1, '101', 'Single', 1500.00, 'AVAILABLE', 1),
(2, '102', 'Single', 1500.00, 'AVAILABLE', 1),
(3, '201', '2BHK', 3000.00, 'AVAILABLE', 4),
(4, '202', '2BHK', 3200.00, 'AVAILABLE', 4),
(5, '301', '3BHK', 4500.00, 'AVAILABLE', 6),
(6, '302', '3BHK', 4700.00, 'MAINTENANCE', 6),
(7, '401', 'Suite', 6000.00, 'AVAILABLE', 4),
(8, '402', 'Suite', 6200.00, 'AVAILABLE', 4),
(9, '501', 'Deluxe', 5000.00, 'MAINTENANCE', 3),
(10, '502', 'Deluxe', 5200.00, 'AVAILABLE', 3);


-- 3. EMPLOYEE DATA
INSERT INTO employee
(employee_id, employee_name, employee_role, phone, salary, shift)
VALUES
(1, 'RITHVIK', 'Manager', '9000000001', 50000.00, 'DAY'),
(2, 'SURESH', 'Receptionist', '9000000002', 25000.00, 'DAY'),
(3, 'MAHESH', 'Service Provider', '9000000003', 22000.00, 'NIGHT'),
(4, 'RAJESH', 'Housekeeping', '9000000004', 18000.00, 'DAY'),
(5, 'KAMLESH', 'Chef', '9000000005', 35000.00, 'DAY'),
(6, 'ANIL', 'Waiter', '9000000006', 15000.00, 'NIGHT'),
(7, 'SUNIL', 'Security', '9000000007', 20000.00, 'NIGHT'),
(8, 'VINOD', 'Service Provider', '9000000008', 22000.00, 'DAY'),
(9, 'PRAVEEN', 'Receptionist', '9000000009', 25000.00, 'NIGHT'),
(10, 'KIRAN', 'Manager', '9000000010', 48000.00, 'DAY');


-- 4. BOOKING DATA
INSERT INTO booking
(booking_id, customer_id, room_id, employee_id,
 check_in_date, check_out_date, booking_date,
 status, total_amount)
VALUES
(1, 1, 1, 2, '2026-02-01', '2026-02-03', '2026-01-30',
 'CONFIRMED', 1500.00 * 2),

(2, 2, 3, 1, '2026-02-05', '2026-02-07', '2026-02-02',
 'CONFIRMED', 3000.00 * 2),

(3, 3, 4, 9, '2026-02-10', '2026-02-12', '2026-02-08',
 'CONFIRMED', 3200.00 * 2),

(4, 4, 5, 3, '2026-02-15', '2026-02-18', '2026-02-12',
 'CONFIRMED', 4500.00 * 3),

(5, 5, 7, 2, '2026-02-20', '2026-02-22', '2026-02-18',
 'CONFIRMED', 6000.00 * 2),

(6, 6, 8, 5, '2026-02-25', '2026-02-28', '2026-02-22',
 'CONFIRMED', 6200.00 * 3),

(7, 7, 10, 4, '2026-03-01', '2026-03-03', '2026-02-27',
 'CONFIRMED', 5200.00 * 2),

(8, 8, 2, 6, '2026-03-05', '2026-03-06', '2026-03-03',
 'CONFIRMED', 1500.00 * 1),

(9, 9, 9, 7, '2026-03-10', '2026-03-12', '2026-03-08',
 'CONFIRMED', 5000.00 * 2),

(10, 10, 1, 8, '2026-03-15', '2026-03-17', '2026-03-13',
 'CONFIRMED', 1500.00 * 2);


-- 5. SERVICE DATA
INSERT INTO service
(service_id, service_name, price, description)
VALUES
(1, 'Breakfast', 300, 'Morning meal'),
(2, 'Lunch', 500, 'Afternoon meal'),
(3, 'Dinner', 600, 'Evening meal'),
(4, 'Snacks', 200, 'Light food'),
(5, 'WiFi', 100, 'Internet access'),
(6, 'Laundry', 250, 'Clothes wash'),
(7, 'Gym', 400, 'Fitness access'),
(8, 'Swimming Pool', 350, 'Pool access'),
(9, 'Parking', 150, 'Vehicle parking'),
(10, 'Room Cleaning', 300, 'Daily cleaning');


-- 6. BOOKING SERVICE DATA
INSERT INTO booking_service
(booking_service_id, booking_id, service_id,
 quantity, service_date, total_cost)
VALUES
(1, 1, 1, 2, '2026-02-01', 300 * 2),
(2, 2, 2, 1, '2026-02-05', 500 * 1),
(3, 3, 3, 2, '2026-02-10', 600 * 2),
(4, 4, 6, 1, '2026-02-15', 250 * 1),
(5, 5, 5, 3, '2026-02-20', 100 * 3),
(6, 6, 7, 1, '2026-02-25', 400 * 1),
(7, 7, 4, 2, '2026-03-01', 200 * 2),
(8, 8, 8, 1, '2026-03-05', 350 * 1),
(9, 9, 9, 1, '2026-03-10', 150 * 1),
(10, 10, 10, 1, '2026-03-15', 300 * 1);


-- 7. PAYMENT DATA
INSERT INTO payment
(payment_id, booking_id, payment_date,
 amount, payment_method, payment_status)
VALUES
(1, 1, '2026-01-30', 3000.00, 'CARD', 'PAID'),
(2, 2, '2026-02-02', 6000.00, 'CASH', 'PAID'),
(3, 3, '2026-02-08', 6400.00, 'UPI', 'PAID'),
(4, 4, '2026-02-12', 13500.00, 'CARD', 'PAID'),
(5, 5, '2026-02-18', 12000.00, 'UPI', 'PAID'),
(6, 6, '2026-02-22', 18600.00, 'CASH', 'PAID'),
(7, 7, '2026-02-27', 10400.00, 'CARD', 'PAID'),
(8, 8, '2026-03-03', 1500.00, 'UPI', 'PAID'),
(9, 9, '2026-03-08', 10000.00, 'CASH', 'PENDING'),
(10, 10, '2026-03-13', 3000.00, 'CARD', 'PAID');


-- 8. FEEDBACK DATA
INSERT INTO feedback
(feedback_id, booking_id, customer_id,
 rating, feedback_date, comments)
VALUES
(1, 1, 1, 5, '2026-02-04', 'Excellent'),
(2, 2, 2, 4, '2026-02-08', 'Good service'),
(3, 3, 3, 3, '2026-02-13', 'Average'),
(4, 4, 4, 5, '2026-02-19', 'GOOD'),
(5, 5, 5, 4, '2026-02-23', 'great'),
(6, 6, 6, 5, '2026-02-20', 'FINE'),
(7, 7, 7, 2, '2026-03-04', 'BAD'),
(8, 8, 8, 4, '2026-03-07', 'SERVICE CAN BE IMPROVED'),
(9, 9, 9, 3, '2026-03-13', 'FINE'),
(10, 10, 10, 5, '2026-03-18', 'NICE');