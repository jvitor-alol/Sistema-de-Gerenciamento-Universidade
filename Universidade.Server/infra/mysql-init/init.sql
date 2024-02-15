-- Criação do banco de dados da universidade
CREATE DATABASE IF NOT EXISTS universidade;

USE universidade;

CREATE TABLE IF NOT EXISTS users_test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO users_test (username, email) VALUES
('user1', 'user1@example.com'),
('user2', 'user2@example.com');
