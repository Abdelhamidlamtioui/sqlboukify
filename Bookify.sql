CREATE DATABASE bookify;
CREATE TABLE salles (
    Id SERIAL PRIMARY KEY,
    Nom TEXT NOT NULL,
    Capacite INT NOT NULL
);
CREATE INDEX idx_nom_salle ON Salles(Nom);

CREATE TABLE employes (
    Id SERIAL PRIMARY KEY,
    Nom TEXT NOT NULL,
    Email TEXT UNIQUE NOT NULL,
    Departement TEXT,
    Poste TEXT
);
CREATE INDEX idx_email_employe ON Employes(Email);

CREATE TABLE reservations (
    Id SERIAL PRIMARY KEY,
    Salle_ID INT,
    Employe_ID INT,
    Date_Debut DATETIME NOT NULL,
    Date_Fin DATETIME NOT NULL,
    FOREIGN KEY (Salle_ID) REFERENCES Salles(Id),
    FOREIGN KEY (Employe_ID) REFERENCES Employes(Id)
);
CREATE INDEX idx_dates_reservation ON Reservations(Date_Debut, Date_Fin);
CREATE INDEX idx_salle_id_reservation ON Reservations(Salle_ID);
CREATE INDEX idx_employe_id_reservation ON Reservations(Employe_ID);

CREATE TABLE Equipements (
    Id SERIAL PRIMARY KEY,
    Nom TEXT NOT NULL
);
CREATE INDEX idx_nom_equipement ON Equipements(Nom);

CREATE TABLE Salle_Equipements (
    Salle_ID INT,
    Equipement_ID INT,
    PRIMARY KEY (Salle_ID, Equipement_ID),
    FOREIGN KEY (Salle_ID) REFERENCES Salles(Id),
    FOREIGN KEY (Equipement_ID) REFERENCES Equipements(Id)
);
CREATE INDEX idx_salle_id_salle_equipements ON Salle_Equipements(Salle_ID);
CREATE INDEX idx_equipement_id_salle_equipements ON Salle_Equipements(Equipement_ID);

INSERT INTO Employes (Nom, Email, Departement, Poste)
VALUES 
('SALMA', 'SALMA12ont@hi.com', 'Media buyer', 'Manager'),
('AMINE sami', 'AMINE56tin@huh.com', 'IT', 'Developeur'),
('LAYLA amalo', 'claire.lefebvre@example.com', 'Management', 'Sales Representative');

INSERT INTO Salles (nom,capacite) VALUES ('Salle A', 40),('Salle B',10),('Salle C', 35),('Salle D',30),('Salle E',30),('Salle F', 35);


INSERT INTO Reservations (Salle_ID, Employe_ID, Date_Debut, Date_Fin)
VALUES 
(1, 1, '2023-11-20 09:00:00', '2023-11-20 12:00:00'),
(2, 2, '2023-11-21 13:00:00', '2023-11-21 15:00:00'),
(3, 3, '2023-11-22 10:00:00', '2023-11-22 11:00:00');
INSERT INTO Equipements (Nom)
VALUES 
('Projecteur'),
('Tableau blanc'),
('Système audio');

INSERT INTO Salle_Equipements (Salle_ID, Equipement_ID)
VALUES 
(1, 1),
(1, 2),
(2, 3);

SELECT employes.nom, employes.email, reservations.date_debut, reservations.date_fin FROM employes
INNER JOIN reservations ON employes.id = reservations.employe_id;