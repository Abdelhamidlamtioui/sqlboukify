# Bookify Room Reservation System Database

## Overview
This repository contains the SQL database implementation for the Bookify Room Reservation System. It is designed to manage the booking of meeting rooms, handling details about rooms, employees, reservations, and equipment.

## Database Design
The database consists of several interconnected tables designed to store and manage data efficiently:

- **`salles`**: Contains information about the meeting rooms.
- **`employes`**: Holds employee details.
- **`reservations`**: Manages the reservations made by employees.
- **`equipements`**: Lists available equipment.
- **`salle_equipements`**: A junction table to manage equipment assigned to rooms.

## Technologies Used
- **Database**: PostgreSQL
- **Query Language**: SQL

## Getting Started

### Prerequisites
- PostgreSQL installed on your system.
- Basic knowledge of SQL.

### Setting Up the Database
1. **Create the Database**:
   Open your PostgreSQL command line tool and execute the following command:
   ```sql
   CREATE DATABASE bookify;```
3. **Create Tables and Indexes**:
   In the bookify database, execute the following commands to create the necessary tables:
   ```sql
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
   ```
5. **Insert Sample Data**:
   ```sql
   INSERT INTO Employes (Nom, Email, Departement, Poste)
   VALUES ('SALMA', 'SALMA12ont@hi.com', 'Media buyer', 'Manager'),
   ('AMINE sami', 'AMINE56tin@huh.com', 'IT', 'Developeur'),
   ('LAYLA amalo', 'claire.lefebvre@example.com', 'Management', 'Sales Representative');
   ```
## Usage
After setting up the database, you can run various SQL queries to interact with the data. This might include queries for creating reservations, updating employee details, or generating reports on room utilization.

## Database Schema
A detailed schema of the database is provided to help you understand the structure and relationships of the tables. This includes an explanation of the columns, data types, and indexes used.

## Authors
- Abdelhamid - Initial work
## JIRA
- Link:https://aymane-bisdaoune.atlassian.net/jira/software/projects/S4/boards/1
