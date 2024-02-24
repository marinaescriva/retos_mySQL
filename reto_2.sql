
-- Diseña un sistema para gestionar reservas en restaurantes. Los usuarios pueden buscar
-- restaurantes, hacer reservas para ciertas fechas y horas, dejar reseñas sobre sus
-- experiencias y acumular puntos de fidelidad. ¿Cuáles serían las entidades clave?

CREATE DATABASE reto_2;
USE reto_2;

CREATE TABLE restaurantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    points INT
);

CREATE TABLE reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    id_restaurante INT,
    day DATE,
    hour TIME,
    people INT,
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_restaurante) REFERENCES restaurantes(id)
);


CREATE TABLE experiences (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservation INT,
    calificacion INT,
    review TEXT,
    FOREIGN KEY (reservation) REFERENCES reservations(id)
);

SELECT * FROM reto_2.users;

-- insert first values in tables.

INSERT INTO users (name, email, password, points) 
VALUE ("jose", "jose@mail.com" , "1111", 23 ),("paula", "paula@mail.com" , "1221", 45),("hector", "hector@mail.com" , "1133", 11),("raul", "raul@mail.com" , "3183", 39),("raquel", "raquel@mail.com" , "8888", 5),("monica", "monica@mail.com" , "3248", 62);

INSERT INTO restaurantes (name , address)
VALUE ("casa pepe", "av.naranjo"),("casa conchin", "av.pera"),("casa rosita", "av.manzana"),("casa juan", "av.coco");

SELECT * FROM restaurantes; -- trying the preview of reaturantes and users.
SELECT * FROM users; 
