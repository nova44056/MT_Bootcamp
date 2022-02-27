DROP TABLE IF EXISTS SupplyReceivedRecords;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS ServiceStatuses;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS Statuses;
DROP TABLE IF EXISTS BasementRats;
DROP TABLE IF EXISTS Inventories;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS Taverns;
DROP TABLE IF EXISTS UserRoles;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Locations;


-- CREATE TABLE Locations(
--     id INT IDENTITY(1,1),
--     name VARCHAR(250)

--     PRIMARY KEY(id)
-- );

-- CREATE TABLE Users(
--     id INT IDENTITY(1,1),
--     name VARCHAR(250),

--     PRIMARY KEY(id)
-- );

-- CREATE TABLE Roles(
--     id INT IDENTITY(1,1),
--     name VARCHAR(250),
--     description VARCHAR(250)

--     PRIMARY KEY(id)
-- );

-- CREATE TABLE UserRoles(
--     user_id INT NOT NULL,
--     role_id INT NOT NULL,

--     FOREIGN KEY(user_id) REFERENCES Users(id),
--     FOREIGN KEY(role_id) REFERENCES Roles(id)
-- );

-- CREATE TABLE Taverns(
--     id INT IDENTITY(1,1),
--     name VARCHAR(250),
--     num_of_floor INT,
--     location_id INT NOT NULL,
--     owner_id INT NOT NULL,


--     PRIMARY KEY(id),
--     FOREIGN KEY(location_id) REFERENCES Locations(id),
--     FOREIGN KEY(owner_id) REFERENCES Users(id)
-- );

-- CREATE TABLE Supplies(
--     id INT IDENTITY(1,1),
--     name VARCHAR(250),
--     unit VARCHAR(250)

--     PRIMARY KEY(id)
-- );

-- CREATE TABLE Inventories(
--     id INT IDENTITY(1,1),
--     supply_id INT NOT NULL,
--     tavern_id INT NOT NULL,
--     updated_at DATE,
--     supply_count INT

--     PRIMARY KEY(id)
--     FOREIGN KEY(supply_id) REFERENCES Supplies(id),
--     FOREIGN KEY(tavern_id) REFERENCES Taverns(id)
-- );

-- CREATE TABLE BasementRats(
--     id INT IDENTITY(1,1),
--     tavern_id INT NOT NULL,
--     name VARCHAR(250),

--     PRIMARY KEY(id),
--     FOREIGN KEY(tavern_id) REFERENCES Taverns(id)
-- );


-- CREATE TABLE Services(
--     id INT IDENTITY(1,1),
--     tavern_id INT NOT NULL,
--     name VARCHAR(250),

--     PRIMARY KEY(id),
--     FOREIGN KEY(tavern_id) REFERENCES Taverns(id)
-- );

-- CREATE TABLE Statuses(
--     id INT IDENTITY(1,1),
--     name VARCHAR(250)

--     PRIMARY KEY(id)
-- );

-- CREATE TABLE ServiceStatuses(
--     service_id INT NOT NULL,
--     status_id INT NOT NULL,

--     FOREIGN KEY(service_id) REFERENCES Services(id),
--     FOREIGN KEY(status_id) REFERENCES Statuses(id)
-- );

-- CREATE TABLE SupplyReceivedRecords(
--     id INT IDENTITY(1,1),
--     supply_id INT NOT NULL,
--     tavern_id INT NOT NULL,
--     amount_received INT,
--     date_received DATE,

--     PRIMARY KEY(id),
--     FOREIGN KEY(supply_id) REFERENCES Supplies(id),
--     FOREIGN KEY(tavern_id) REFERENCES Taverns(id)
-- );

-- CREATE TABLE Sales(
--     id INT IDENTITY(1,1),
--     service_id INT NOT NULL,
--     guest_id INT NOT NULL,
--     tavern_id INT NOT NULL,
--     price INT,
--     date_purchased DATE,
--     amount_purchased INT

--     PRIMARY KEY(id),
--     FOREIGN KEY(service_id) REFERENCES Services(id),
--     FOREIGN KEY(guest_id) REFERENCES Users(id),
--     FOREIGN KEY(tavern_id) REFERENCES Taverns(id)
-- );

-- -- seeding data
-- -- insert locations
-- INSERT INTO Locations(name) VALUES('Main Street');
-- INSERT INTO Locations(name) VALUES('Melton Street');
-- INSERT INTO Locations(name) VALUES('Park Street');
-- INSERT INTO Locations(name) VALUES('Church Street');
-- INSERT INTO Locations(name) VALUES('Church Street'); 

-- -- insert users
-- INSERT INTO Users(name) VALUES('John');
-- INSERT INTO Users(name) VALUES('Jane');
-- INSERT INTO Users(name) VALUES('Jack');
-- INSERT INTO Users(name) VALUES('Jill');
-- INSERT INTO Users(name) VALUES('Jenny');
-- INSERT INTO Users(name) VALUES('Jeremy');
-- INSERT INTO Users(name) VALUES('Josh');
-- INSERT INTO Users(name) VALUES('Jasmin');
-- INSERT INTO Users(name) VALUES('Jane');
-- INSERT INTO Users(name) VALUES('Jack');


-- -- insert roles
-- INSERT INTO Roles(name, description) VALUES('admin', 'admin');
-- INSERT INTO Roles(name, description) VALUES('guest', 'guest');

-- -- insert user roles
-- INSERT INTO UserRoles(user_id, role_id) VALUES(1, 1);
-- INSERT INTO UserRoles(user_id, role_id) VALUES(2, 1);
-- INSERT INTO UserRoles(user_id, role_id) VALUES(3, 1);
-- INSERT INTO UserRoles(user_id, role_id) VALUES(4, 1);
-- INSERT INTO UserRoles(user_id, role_id) VALUES(5, 1);
-- INSERT INTO UserRoles(user_id, role_id) VALUES(6, 2);
-- INSERT INTO UserRoles(user_id, role_id) VALUES(7, 2);
-- INSERT INTO UserRoles(user_id, role_id) VALUES(8, 2);
-- INSERT INTO UserRoles(user_id, role_id) VALUES(9, 2);
-- INSERT INTO UserRoles(user_id, role_id) VALUES(10, 2);


-- -- insert taverns
-- INSERT INTO Taverns(name, num_of_floor, location_id, owner_id) VALUES('Tavern 1', 1, 1, 1);
-- INSERT INTO Taverns(name, num_of_floor, location_id, owner_id) VALUES('Tavern 2', 2, 2, 2);
-- INSERT INTO Taverns(name, num_of_floor, location_id, owner_id) VALUES('Tavern 3', 3, 3, 3);
-- INSERT INTO Taverns(name, num_of_floor, location_id, owner_id) VALUES('Tavern 4', 4, 4, 4);
-- INSERT INTO Taverns(name, num_of_floor, location_id, owner_id) VALUES('Tavern 5', 5, 5, 5);

-- -- insert supplies
-- INSERT INTO Supplies(name, unit) VALUES('Beer', 'bottles');
-- INSERT INTO Supplies(name, unit) VALUES('Wine', 'bottles');
-- INSERT INTO Supplies(name, unit) VALUES('Whiskey', 'bottles');
-- INSERT INTO Supplies(name, unit) VALUES('Rum', 'bottles');
-- INSERT INTO Supplies(name, unit) VALUES('Vodka', 'bottles');
-- INSERT INTO Supplies(name, unit) VALUES('Beer', 'bottles');

-- -- insert inventories
-- INSERT INTO Inventories(supply_id, tavern_id, updated_at, supply_count) VALUES(1, 1, '2019-01-01', 10);
-- INSERT INTO Inventories(supply_id, tavern_id, updated_at, supply_count) VALUES(2, 1, '2019-01-01', 10);
-- INSERT INTO Inventories(supply_id, tavern_id, updated_at, supply_count) VALUES(3, 1, '2019-01-01', 10);
-- INSERT INTO Inventories(supply_id, tavern_id, updated_at, supply_count) VALUES(4, 1, '2019-01-01', 10);
-- INSERT INTO Inventories(supply_id, tavern_id, updated_at, supply_count) VALUES(5, 1, '2019-01-01', 10);

-- -- insert basement rats
-- INSERT INTO BasementRats(tavern_id, name) VALUES(1, 'Basement Rat 1');
-- INSERT INTO BasementRats(tavern_id, name) VALUES(2, 'Basement Rat 2');
-- INSERT INTO BasementRats(tavern_id, name) VALUES(3, 'Basement Rat 3');
-- INSERT INTO BasementRats(tavern_id, name) VALUES(4, 'Basement Rat 4');
-- INSERT INTO BasementRats(tavern_id, name) VALUES(5, 'Basement Rat 5');

-- -- insert statuses
-- INSERT INTO Statuses(name) VALUES('Available');
-- INSERT INTO Statuses(name) VALUES('Unavailable');
-- INSERT INTO Statuses(name) VALUES('Out of Stock');
-- INSERT INTO Statuses(name) VALUES('In Stock')

-- -- insert services
-- INSERT INTO Services(name, tavern_id) VALUES('Karaoke', 1);
-- INSERT INTO Services(name, tavern_id) VALUES('Massage', 1);
-- INSERT INTO Services(name, tavern_id) VALUES('Bar', 1);
-- INSERT INTO Services(name, tavern_id) VALUES('Weapon', 1);
-- INSERT INTO Services(name, tavern_id) VALUES('Food', 1);


-- -- insert service statuses
-- INSERT INTO ServiceStatuses(service_id, status_id) VALUES(1, 1);
-- INSERT INTO ServiceStatuses(service_id, status_id) VALUES(2, 1);
-- INSERT INTO ServiceStatuses(service_id, status_id) VALUES(3, 2);
-- INSERT INTO ServiceStatuses(service_id, status_id) VALUES(4, 3);
-- INSERT INTO ServiceStatuses(service_id, status_id) VALUES(5, 4);

-- -- insert supply received records
-- INSERT INTO SupplyReceivedRecords(supply_id, tavern_id, amount_received, date_received) VALUES(1, 1, 10, '2019-01-01');
-- INSERT INTO SupplyReceivedRecords(supply_id, tavern_id, amount_received, date_received) VALUES(2, 1, 10, '2019-01-01');
-- INSERT INTO SupplyReceivedRecords(supply_id, tavern_id, amount_received, date_received) VALUES(3, 1, 10, '2019-01-01');
-- INSERT INTO SupplyReceivedRecords(supply_id, tavern_id, amount_received, date_received) VALUES(4, 1, 10, '2019-01-01');
-- INSERT INTO SupplyReceivedRecords(supply_id, tavern_id, amount_received, date_received) VALUES(5, 1, 10, '2019-01-01');

-- -- insert sales
-- INSERT INTO Sales(service_id, tavern_id, guest_id, price, amount_purchased, date_purchased) VALUES(1, 1, 6, 10, 10, '2019-01-01');
-- INSERT INTO Sales(service_id, tavern_id, guest_id, price, amount_purchased, date_purchased) VALUES(2, 1, 7, 20, 10, '2019-01-01');
-- INSERT INTO Sales(service_id, tavern_id, guest_id, price, amount_purchased, date_purchased) VALUES(1, 1, 8, 30, 10, '2019-01-01');
-- INSERT INTO Sales(service_id, tavern_id, guest_id, price, amount_purchased, date_purchased) VALUES(4, 1, 9, 40, 10, '2019-01-01');
-- INSERT INTO Sales(service_id, tavern_id, guest_id, price, amount_purchased, date_purchased) VALUES(5, 1, 10, 50, 10, '2019-01-01');
