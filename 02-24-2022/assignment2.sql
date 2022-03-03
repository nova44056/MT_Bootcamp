IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'mt_bootcamp_assignment_2_uy_seng')
    BEGIN
        CREATE DATABASE mt_bootcamp_assignment_2_uy_seng;
    END;    
USE mt_bootcamp_assignment_2_uy_seng;

-- will cause foreign key constraint
-- DROP TABLE Roles;

DROP TABLE IF EXISTS SupplySales, Sales, Supplies, Levels, Classes, Guests, GuestStatuses, BasementRats, Taverns, Locations, Users, Roles;

CREATE TABLE Roles(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(MAX)
)
~

CREATE TABLE Users(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(250),
    role_id INT NOT NULL
)

ALTER TABLE Users ADD FOREIGN KEY(role_id) REFERENCES Roles(id);

CREATE TABLE Locations(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100)
)

CREATE TABLE Taverns(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(250),
    location_id INT,
    owner_id INT,
)

ALTER TABLE Taverns ADD FOREIGN KEY(location_id) REFERENCES Locations(id);
ALTER TABLE Taverns ADD FOREIGN KEY(owner_id) REFERENCES Users(id);

CREATE TABLE BasementRats(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100)
)

DROP TABLE BasementRats;

CREATE TABLE GuestStatuses(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50)
)

CREATE TABLE Guests(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(250),
    notes VARCHAR(MAX),
    birth_date DATE,
    cake_day DATE,
    status_id INT,
    
    FOREIGN KEY(status_id) REFERENCES GuestStatuses(id)
)

CREATE TABLE Classes(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50)

)

CREATE TABLE Levels(
    guest_id INT,
    class_id INT,
    date DATE

    FOREIGN KEY(guest_id) REFERENCES Guests(id),
    FOREIGN KEY(class_id) REFERENCES Classes(id)
)

CREATE TABLE Supplies(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(250),
)

CREATE TABLE Sales(
    id INT IDENTITY(1,1) PRIMARY KEY,
    tavern_id INT,
    amount_received INT,
    date DATE

    FOREIGN KEY(tavern_id) REFERENCES Taverns(id)
)

CREATE TABLE SupplySales(
    supply_id INT,
    sale_id INT,

    FOREIGN KEY(supply_id) REFERENCES Supplies(id),
    FOREIGN KEY(sale_id) REFERENCES Sales(id)
)