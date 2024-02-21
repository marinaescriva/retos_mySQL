CREATE DATABASE Reto_0;
USE Reto_0;

CREATE TABLE roles(

	id INT PRIMARY KEY,
	name_role VARCHAR (50) NOT NULL
);

CREATE TABLE users(

	id INT AUTO_INCREMENT PRIMARY KEY,
	role_id INT,
	FOREIGN KEY (role_id) references roles(id),
	username VARCHAR (50) NOT NULL,
	email VARCHAR (100) NOT NULL UNIQUE,
	password VARCHAR (255) NOT NULL
);

CREATE TABLE authors(
	
    id INT PRIMARY KEY,
    name VARCHAR (100) NOT NULL,
    nationality VARCHAR (100)
);

CREATE TABLE books(
	
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(50),
    author_id INT,
    FOREIGN KEY (author_id) references authors(id)
);

CREATE TABLE book_favorite(

	id INT PRIMARY KEY,
    user_id INT,
    book_id INT,
    FOREIGN KEY (user_id) references users(id),
    FOREIGN KEY (book_id) references books(id)
);

CREATE TABLE loans(

	id INT,
    user_id INT,
    book_id INT,
    FOREIGN KEY (user_id) references users(id),
    FOREIGN KEY (book_id) references books(id),
    loan_date DATETIME NOT NULL,
    due_date DATETIME NOT NULL,
    return_date DATETIME
);

