CREATE DATABASE Reto_0;
USE libreria;

CREATE TABLE roles(

	id INT  AUTO_INCREMENT PRIMARY KEY,
	name_role VARCHAR (50) NOT NULL
);


CREATE TABLE users(

	id INT AUTO_INCREMENT PRIMARY KEY,
	role_id INT NOT NULL,
	FOREIGN KEY (role_id) references roles(id),
	username VARCHAR (50) NOT NULL,
	email VARCHAR (100) NOT NULL UNIQUE,
	password VARCHAR (255) NOT NULL
);

CREATE TABLE authors(
	
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (100) NOT NULL,
    nationality VARCHAR (100) NOT NULL
);

CREATE TABLE books(
	
    id INT  AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) references authors(id)
);

CREATE TABLE book_favorite(

	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (user_id) references users(id),
    FOREIGN KEY (book_id) references books(id)
);

CREATE TABLE loans(

	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (user_id) references users(id),
    FOREIGN KEY (book_id) references books(id),
    loan_date DATETIME NOT NULL,
    due_date DATETIME NOT NULL,
    return_date DATETIME
);



INSERT INTO books (title, genre, author_id) VALUE ("patata ", "terror" , 4), ("pera" , "fantasia" , 3);
SELECT * FROM book_favorite;

SELECT book_favorite.user_id as user
FROM book_favorite
JOIN users ON user_id = users.id;

SELECT book_favorite.user_id as user
FROM book_favorite
JOIN users ON user_id = users;



SELECT * FROM libreria.books;

SELECT books.* , authors.*
FROM books
JOIN authors ON books.author_id = authors.id
WHERE books.id= 2;

SELECT * FROM libreria.book_favorite;

SELECT users.*, book_favorite.*
FROM book_favorite
JOIN users ON book_favorite.user_id= users.id
WHERE users.id =1;

SELECT * FROM libreria.authors;