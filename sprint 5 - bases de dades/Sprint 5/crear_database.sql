create database optica;
use optica;

CREATE TABLE proveidor ( 
    id INT NOT NULL,
    nom CHAR(255) NOT NULL,      
    adreça CHAR(255) NOT NULL,  
    telefon INT NOT NULL,
    fax INT NOT NULL,
    nif INT NOT NULL,
    PRIMARY KEY (id)
);
/*informacio de la taula proveidor*/
INSERT INTO proveidor (id, nom, adreça, telefon, fax, nif) VALUES
(1, 'Provider A', '1234 Main St', 123456789, 123456789, 1000001),
(2, 'Provider B', '5678 Side Ave', 234567890, 234567890, 1000002),
(3, 'Provider C', '91011 Third Blvd', 345678901, 34567890, 1000003),
(4, 'Provider D', '121314 Fourth Dr', 456789012, 456789014, 1000004),
(5, 'Provider E', '151617 Fifth Rd', 567890123, 567890123, 1000005),
(6, 'Provider F', '181920 Sixth Ln', 678901234, 678901236, 1000006),
(7, 'Provider G', '212223 Seventh St', 789012345, 789012347, 1000007),
(8, 'Provider H', '242526 Eighth Ave', 890123457, 890123458, 1000008),
(9, 'Provider I', '272829 Ninth Blvd', 901234567, 901234569, 1000009),
(10, 'Provider J', '303132 Tenth Dr', 012345679, 012345670, 1000010);
CREATE TABLE ulleres (
    id INT NOT NULL,
    marca INT NOT NULL,
    graduacio FLOAT,
    montura FLOAT,
    color_montura CHAR(50),
    color_vidres CHAR(50),
    preu FLOAT,
    PRIMARY KEY (id),
    FOREIGN KEY (marca) REFERENCES proveidor(id)
);
--informacio de la taula ulleres
INSERT INTO ulleres (id, marca, graduacio, montura, color_montura, color_vidres, preu) VALUES
(1, 1, 2.5, 1.2, 'Black', 'Clear', 120.50),
(2, 2, 1.5, 1.0, 'Blue', 'Blue', 150.00),
(3, 3, 0.5, 1.5, 'Red', 'Clear', 135.75),
(4, 4, 3.0, 0.8, 'Green', 'Green', 160.25),
(5, 5, 2.0, 1.3, 'Yellow', 'Blue', 125.00),
(6, 6, 1.0, 1.1, 'Black', 'Clear', 130.00),
(7, 7, 0.75, 1.4, 'Purple', 'Clear', 140.50),
(8, 8, 1.25, 1.6, 'Orange', 'Green', 155.00),
(9, 9, 1.75, 0.9, 'Grey', 'Blue', 145.25),
(10, 10, 3.5, 1.0, 'White', 'Clear', 175.50);
CREATE TABLE client (
    id INT NOT NULL,
    nom CHAR(100) NOT NULL,
    adreça CHAR(255) NOT NULL,
    telefon INT NOT NULL,
    email CHAR(100) NOT NULL,
    registre DATE NOT NULL,
    recomenacio INT,
    PRIMARY KEY (id),
    FOREIGN KEY (recomenacio) REFERENCES client(id)
);
INSERT INTO client (id, nom, adreça, telefon, email, registre, recomenacio) VALUES
(1, 'John Doe', '123 Maple Street', 123456780, 'johndoe@example.com', '2022-01-01', NULL),
(2, 'Jane Smith', '456 Elm Street', 234567890, 'janesmith@example.com', '2022-02-01', 1),
(3, 'Alice Johnson', '789 Oak Street', 345678901, 'alicej@example.com', '2022-03-01', 1),
(4, 'Bob Brown', '101 Pine Lane', 456789013, 'bobb@example.com', '2022-04-01', 2),
(5, 'Charlie Davis', '202 Spruce Ave', 567890123, 'charlied@example.com', '2022-05-01', 3),
(6, 'Debbie Harris', '303 Birch Road', 678901234, 'debbieh@example.com', '2022-06-01', 2),
(7, 'Evan Turner', '404 Cedar Blvd', 789012346, 'evant@example.com', '2022-07-01', 5),
(8, 'Fiona Garcia', '505 Redwood Circle', 890123456, 'fionag@example.com', '2022-08-01', 7),
(9, 'George White', '606 Walnut Street', 901234568, 'georgew@example.com', '2022-09-01', 5),
(10, 'Hannah Lee', '707 Ash Street', 012345679, 'hannahL@example.com', '2022-10-01', 8);
CREATE TABLE empleats (
    id INT NOT NULL,
    nom CHAR(100) NOT NULL,
    PRIMARY KEY (id)
    
);
INSERT INTO empleats (id, nom) VALUES
(1, 'Employee A'),
(2, 'Employee B'),
(3, 'Employee C'),
(4, 'Employee D'),
(5, 'Employee E'),
(6, 'Employee F'),
(7, 'Employee G'),
(8, 'Employee H'),
(9, 'Employee I'),
(10, 'Employee J');
CREATE TABLE venta (
	id int not null,
    empleat_id int not null,
    client_id int not null,
    ulleres_id int not null,
    primary key (id),
    FOREIGN KEY (empleat_id) REFERENCES empleats(id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (ulleres_id) REFERENCES ulleres(id)
);
INSERT INTO venta (id, empleat_id, client_id, ulleres_id) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 7, 7),
(8, 8, 8, 8),
(9, 9, 9, 9),
(10, 10, 10, 10);