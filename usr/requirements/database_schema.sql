-- Database Schema for Placement Management System

CREATE DATABASE IF NOT EXISTS placement_system;
USE placement_system;

-- 1. Users Table (Base table for authentication)
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('student', 'recruiter', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Students Profile
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100) NOT NULL,
    enrollment_no VARCHAR(50) UNIQUE NOT NULL,
    department VARCHAR(100),
    cgpa DECIMAL(4, 2),
    resume_link VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 3. Recruiters/Companies
CREATE TABLE IF NOT EXISTS recruiters (
    recruiter_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    company_name VARCHAR(100) NOT NULL,
    website VARCHAR(255),
    contact_person VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 4. Job Postings
CREATE TABLE IF NOT EXISTS jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    recruiter_id INT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    requirements TEXT,
    location VARCHAR(100),
    salary_range VARCHAR(50),
    posted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deadline DATE,
    FOREIGN KEY (recruiter_id) REFERENCES recruiters(recruiter_id) ON DELETE CASCADE
);

-- 5. Applications
CREATE TABLE IF NOT EXISTS applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    student_id INT,
    status ENUM('applied', 'shortlisted', 'interview', 'selected', 'rejected') DEFAULT 'applied',
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);
