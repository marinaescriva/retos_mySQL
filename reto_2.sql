
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

INSERT INTO users (name, email, password, points) 
VALUE ("jose", "jose@mail.com" , "1111", 23 ),("paula", "paula@mail.com" , "1221", 45),("hector", "hector@mail.com" , "1133", 11),("raul", "raul@mail.com" , "3183", 39),("raquel", "raquel@mail.com" , "8888", 5),("monica", "monica@mail.com" , "3248", 62);

INSERT INTO restaurantes (name , address)
VALUE ("casa pepe", "av.naranjo"),("casa conchin", "av.pera"),("casa rosita", "av.manzana"),("casa juan", "av.coco");

SELECT * FROM restaurantes;
SELECT * FROM users; 
SELECT * FROM reto_2.reservations; -- MUESTRA LA TABLA RESERVATIONS DE LA BBDD RETO_2 --

INSERT INTO reservations (day, hour, people) VALUES ('2024-03-03 12:00:00', '2024-05-01 18:00:00', 4),('2024-11-12 15:00:00', '2024-06-23 11:10:00', 6),('2024-06-20 19:30:00', '2024-07-27 15:40:00', 2),('2024-08-06 18:30:00', '2024-02-15 21:10:00', 6);
DELETE FROM reservations WHERE id=7; -- Elimina la reserva de id=7 de la tabla de reservations--
DELETE FROM reservations WHERE id=11; -- Elimina la reserva de id=11 de la tabla de reservations--

ALTER TABLE reservations
ADD COLUMN pruebaALTER BOOLEAN DEFAULT TRUE;

SELECT * FROM reservations;

ALTER TABLE reservations
DROP COLUMN pruebaALTER;

SELECT * FROM experiences; 
INSERT INTO experiences (calificaion, review)
VALUE (4, "lo peor que probé"),(7, "perfecto"),(2, "no habia sitio"),(8, "muy recomendable");

UPDATE reservations
JOIN restaurantes ON reservations.id_restaurante = restaurantes.id
SET reservations.id_restaurante = restaurantes.name;

SELECT reservations.id, reservations.id_restaurante as restaurante, reservations.day, reservations.hour, reservations.people
FROM reservations
JOIN restaurantes ON reservations.id_restaurante = restaurantes.name;

