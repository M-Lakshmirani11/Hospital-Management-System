DROP DATABASE IF EXISTS hospital_management;
CREATE DATABASE hospital_management;
USE hospital_management;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK (age > 0),
    gender VARCHAR(10) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other'))
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    `date` DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    diagnosis VARCHAR(100) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL CHECK (cost >= 0),
    treatment_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO Patients (name, age, gender) VALUES
('Ananya Sharma', 28, 'Female'),
('Rahul Verma', 35, 'Male'),
('Priya Nair', 42, 'Female'),
('Karthik Reddy', 50, 'Male'),
('Meera Iyer', 31, 'Female'),
('Arjun Singh', 24, 'Male'),
('Sneha Patel', 39, 'Female'),
('Vikram Rao', 46, 'Male'),
('Divya Menon', 29, 'Female'),
('Suresh Kumar', 58, 'Male');

select * from Patients;

INSERT INTO Doctors (name, specialization) VALUES
('Dr. Amit Khanna', 'Cardiology'),
('Dr. Neha Gupta', 'Dermatology'),
('Dr. Ravi Narayan', 'Orthopedics'),
('Dr. Farah Ali', 'General Medicine'),
('Dr. Sandeep Bose', 'Neurology');

INSERT INTO Appointments (patient_id, doctor_id, `date`) VALUES
(1, 4, '2026-01-05'),
(2, 1, '2026-01-07'),
(3, 4, '2026-01-12'),
(4, 3, '2026-01-18'),
(5, 2, '2026-02-02'),
(6, 4, '2026-02-06'),
(7, 1, '2026-02-11'),
(8, 5, '2026-02-19'),
(9, 4, '2026-03-03'),
(10, 1, '2026-03-10'),
(1, 4, '2026-03-16'),
(2, 1, '2026-03-21'),
(3, 5, '2026-04-01'),
(5, 2, '2026-04-08'),
(7, 4, '2026-04-15'),
(8, 5, '2026-04-19'),
(10, 3, '2026-04-22');

-- Hospital Management & Patient Analytics System
-- SQL Course-End Project
-- Database: MySQL

DROP DATABASE IF EXISTS hospital_management;
CREATE DATABASE hospital_management;
USE hospital_management;

-- 1. Database Tables

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK (age > 0),
    gender VARCHAR(10) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other'))
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    `date` DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    diagnosis VARCHAR(100) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL CHECK (cost >= 0),
    treatment_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- 2. Sample Data

INSERT INTO Patients (name, age, gender) VALUES
('Ananya Sharma', 28, 'Female'),
('Rahul Verma', 35, 'Male'),
('Priya Nair', 42, 'Female'),
('Karthik Reddy', 50, 'Male'),
('Meera Iyer', 31, 'Female'),
('Arjun Singh', 24, 'Male'),
('Sneha Patel', 39, 'Female'),
('Vikram Rao', 46, 'Male'),
('Divya Menon', 29, 'Female'),
('Suresh Kumar', 58, 'Male');

INSERT INTO Doctors (name, specialization) VALUES
('Dr. Amit Khanna', 'Cardiology'),
('Dr. Neha Gupta', 'Dermatology'),
('Dr. Ravi Narayan', 'Orthopedics'),
('Dr. Farah Ali', 'General Medicine'),
('Dr. Sandeep Bose', 'Neurology');

INSERT INTO Appointments (patient_id, doctor_id, `date`) VALUES
(1, 4, '2026-01-05'),
(2, 1, '2026-01-07'),
(3, 4, '2026-01-12'),
(4, 3, '2026-01-18'),
(5, 2, '2026-02-02'),
(6, 4, '2026-02-06'),
(7, 1, '2026-02-11'),
(8, 5, '2026-02-19'),
(9, 4, '2026-03-03'),
(10, 1, '2026-03-10'),
(1, 4, '2026-03-16'),
(2, 1, '2026-03-21'),
(3, 5, '2026-04-01'),
(5, 2, '2026-04-08'),
(7, 4, '2026-04-15'),
(8, 5, '2026-04-19'),
(10, 3, '2026-04-22');

INSERT INTO Treatments (patient_id, diagnosis, cost, treatment_date) VALUES
(1, 'Fever', 1200.00, '2026-01-05'),
(2, 'Hypertension', 3500.00, '2026-01-07'),
(3, 'Fever', 1000.00, '2026-01-12'),
(4, 'Fracture', 8500.00, '2026-01-18'),
(5, 'Skin Allergy', 2200.00, '2026-02-02'),
(6, 'Viral Infection', 1500.00, '2026-02-06'),
(7, 'Hypertension', 3200.00, '2026-02-11'),
(8, 'Migraine', 4000.00, '2026-02-19'),
(9, 'Fever', 1100.00, '2026-03-03'),
(10, 'Diabetes', 5000.00, '2026-03-10'),
(1, 'Viral Infection', 1800.00, '2026-03-16'),
(2, 'Hypertension', 3000.00, '2026-03-21'),
(3, 'Migraine', 4200.00, '2026-04-01'),
(5, 'Skin Allergy', 2100.00, '2026-04-08'),
(7, 'Fever', 1300.00, '2026-04-15'),
(8, 'Migraine', 3900.00, '2026-04-19'),
(10, 'Fracture', 7800.00, '2026-04-22');

-- A. Find most consulted doctors
SELECT
    d.doctor_id,
    d.name AS doctor_name,
    d.specialization,
    COUNT(a.appointment_id) AS total_consultations
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.name, d.specialization
ORDER BY total_consultations DESC;


-- B. Calculate total revenue per month
SELECT
    DATE_FORMAT(treatment_date, '%Y-%m') AS revenue_month,
    SUM(cost) AS total_revenue
FROM Treatments
GROUP BY DATE_FORMAT(treatment_date, '%Y-%m')
ORDER BY revenue_month;

-- C. Identify most common diseases
SELECT
    diagnosis,
    COUNT(*) AS number_of_cases
FROM Treatments
GROUP BY diagnosis
ORDER BY number_of_cases DESC;

-- D. Track patient visit frequency
SELECT
    p.patient_id,
    p.name AS patient_name,
    COUNT(a.appointment_id) AS total_visits
FROM Patients p
LEFT JOIN Appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.name
ORDER BY total_visits DESC, p.name;

-- E. Analyze doctor performance
-- This query combines consultations and treatment revenue linked through
-- patients who visited each doctor.
SELECT
    d.doctor_id,
    d.name AS doctor_name,
    d.specialization,
    COUNT(DISTINCT a.appointment_id) AS total_consultations,
    COUNT(DISTINCT a.patient_id) AS unique_patients,
    COALESCE(SUM(t.cost), 0) AS generated_revenue
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
LEFT JOIN Treatments t
    ON a.patient_id = t.patient_id
    AND a.`date` = t.treatment_date
GROUP BY d.doctor_id, d.name, d.specialization
ORDER BY total_consultations DESC, generated_revenue DESC;

-- 4. Extra Useful Queries

-- Patients with high treatment cost
SELECT
    p.name AS patient_name,
    SUM(t.cost) AS total_treatment_cost
FROM Patients p
JOIN Treatments t ON p.patient_id = t.patient_id
GROUP BY p.patient_id, p.name
HAVING SUM(t.cost) > 5000
ORDER BY total_treatment_cost DESC;

-- Monthly appointment count
SELECT
    DATE_FORMAT(`date`, '%Y-%m') AS appointment_month,
    COUNT(*) AS total_appointments
FROM Appointments
GROUP BY DATE_FORMAT(`date`, '%Y-%m')
ORDER BY appointment_month;

-- Disease-wise revenue
SELECT
    diagnosis,
    COUNT(*) AS cases,
    SUM(cost) AS total_revenue,
    ROUND(AVG(cost), 2) AS average_treatment_cost
FROM Treatments
GROUP BY diagnosis
ORDER BY total_revenue DESC;

select * from Treatments;