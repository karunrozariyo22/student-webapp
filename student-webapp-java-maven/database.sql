CREATE DATABASE IF NOT EXISTS studentdb;
USE studentdb;

CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    course VARCHAR(100) NOT NULL
);

INSERT INTO students (name, email, course) VALUES
('Arun Kumar', 'arun@example.com', 'MSc Software Systems'),
('Priya Devi', 'priya@example.com', 'Computer Science');
