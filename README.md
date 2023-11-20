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
   ```sql
   CREATE DATABASE bookify;```
2. **Create Tables and Indexes**:
   ```sql
   CREATE TABLE salles (
   Id SERIAL PRIMARY KEY,
   Nom TEXT NOT NULL,
   Capacite INT NOT NULL
   );```
4. **Insert Sample Data**:
   ```sql
   INSERT INTO Employes (Nom, Email, Departement, Poste)
   VALUES ('SALMA', 'SALMA12ont@hi.com', 'Media buyer', 'Manager'),
   ('AMINE sami', 'AMINE56tin@huh.com', 'IT', 'Developeur'),
   ('LAYLA amalo', 'claire.lefebvre@example.com', 'Management', 'Sales Representative');
   ```
Running Queries
You can run various SQL queries against this database to fetch or manipulate reservation data.

Database Schema
A detailed explanation of the database schema is provided. This includes table structures, relationships, and indexes.

Contributing
Contributions to this database are welcome. Please read the contributing guidelines before making a pull request.

Versioning
We use simple versioning for managing changes. For the versions available, see the tags on this repository.

Authors
Abdelhamid
