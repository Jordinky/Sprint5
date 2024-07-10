--taula de proveidor

CREATE TABLE proveidor (
    id INT NOT NULL,
    nom CHAR(255) NOT NULL,      
    adreça CHAR(255) NOT NULL,  
    telefon INT NOT NULL,
    fax INT NOT NULL,
    nif INT NOT NULL,
    PRIMARY KEY (id)
);
--informacio de la taula proveidor
INSERT INTO proveidor (id, nom, adreça, telefon, fax, nif) VALUES
(1, 'Provider A', '1234 Main St', 1234567890, 1234567891, 1000001),
(2, 'Provider B', '5678 Side Ave', 2345678901, 2345678902, 1000002),
(3, 'Provider C', '91011 Third Blvd', 3456789012, 3456789013, 1000003),
(4, 'Provider D', '121314 Fourth Dr', 4567890123, 4567890124, 1000004),
(5, 'Provider E', '151617 Fifth Rd', 5678901234, 5678901235, 1000005),
(6, 'Provider F', '181920 Sixth Ln', 6789012345, 6789012346, 1000006),
(7, 'Provider G', '212223 Seventh St', 7890123456, 7890123457, 1000007),
(8, 'Provider H', '242526 Eighth Ave', 8901234567, 8901234568, 1000008),
(9, 'Provider I', '272829 Ninth Blvd', 9012345678, 9012345679, 1000009),
(10, 'Provider J', '303132 Tenth Dr', 0123456789, 0123456790, 1000010);
--taula de ulleres
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
--taula de client
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
--taula de empleats
CREATE TABLE empleats (
    id INT NOT NULL,
    nom CHAR(100) NOT NULL,
    PRIMARY KEY (id)
);
--informacio taula empleats
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
--informacio de taula client
INSERT INTO client (id, nom, adreça, telefon, email, registre, recomenacio) VALUES
(1, 'John Doe', '123 Maple Street', 1234567890, 'johndoe@example.com', '2022-01-01', NULL),
(2, 'Jane Smith', '456 Elm Street', 2345678901, 'janesmith@example.com', '2022-02-01', 1),
(3, 'Alice Johnson', '789 Oak Street', 3456789012, 'alicej@example.com', '2022-03-01', 1),
(4, 'Bob Brown', '101 Pine Lane', 4567890123, 'bobb@example.com', '2022-04-01', 2),
(5, 'Charlie Davis', '202 Spruce Ave', 5678901234, 'charlied@example.com', '2022-05-01', 3),
(6, 'Debbie Harris', '303 Birch Road', 6789012345, 'debbieh@example.com', '2022-06-01', 2),
(7, 'Evan Turner', '404 Cedar Blvd', 7890123456, 'evant@example.com', '2022-07-01', 5),
(8, 'Fiona Garcia', '505 Redwood Circle', 8901234567, 'fionag@example.com', '2022-08-01', 7),
(9, 'George White', '606 Walnut Street', 9012345678, 'georgew@example.com', '2022-09-01', 5),
(10, 'Hannah Lee', '707 Ash Street', 0123456789, 'hannahL@example.com', '2022-10-01', 8);
--taula de ventes
INSERT INTO venta (id, empleat_id, client_id, id_ulleres) VALUES
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
