USE mt_bootcamp_assignment_3_uy_seng;

DROP TABLE IF EXISTS RoomStays, Rooms, RoomStatuses, SupplySales, Sales, Supplies, Levels, Classes, Guests, GuestStatuses, BasementRats, Taverns, Locations, Users, Roles;

CREATE TABLE Roles(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(MAX)
)

INSERT INTO Roles(id, name, description) VALUES
(1, 'Admin', 'Administrator');

CREATE TABLE Users(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(250),
    role_id INT NOT NULL
)

ALTER TABLE Users ADD FOREIGN KEY(role_id) REFERENCES Roles(id);
INSERT INTO Users(name, role_id) VALUES
('John', 1),
('Jane', 1),
('Jack', 1),
('Jill', 1),
('Joe', 1),
('Jenny', 1),
('Jeb', 1);


CREATE TABLE Locations(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100)
)

INSERT INTO Locations( name) VALUES
('The Swamp'),
('The Desert'),
('The Forest'),
('The Castle'),
('The Dungeon'),
('The Graveyard'),
('The Beach');

CREATE TABLE Taverns(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(250),
    location_id INT,
    owner_id INT,
)

ALTER TABLE Taverns ADD FOREIGN KEY(location_id) REFERENCES Locations(id);
ALTER TABLE Taverns ADD FOREIGN KEY(owner_id) REFERENCES Users(id);

INSERT INTO Taverns(name, location_id, owner_id) VALUES
('Swamp Tavern', 1, 1),
('Fantasy Tavern', 2, 2),
('Forest Tavern', 3, 3),
('Castle Tavern', 4, 4),
('Dungoen Tavern', 5, 5),
('Graveyard Tavern', 6, 6),
('Beach Tavern', 7, 7);


CREATE TABLE BasementRats(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100)
)

DROP TABLE BasementRats;

CREATE TABLE GuestStatuses(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50)
)

INSERT INTO GuestStatuses(name) VALUES
('Regular'),
('VIP'),
('New');

CREATE TABLE Guests(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(250),
    notes VARCHAR(MAX),
    birth_date DATE,
    cake_day DATE,
    status_id INT,
    
    FOREIGN KEY(status_id) REFERENCES GuestStatuses(id)
)

INSERT INTO 
Guests(name, notes, birth_date, cake_day, status_id) 
VALUES
('Ben', 'Special', '1980-01-01', '1980-01-01', 1),
('Bruce', '', '1970-01-01', '1980-01-01', 1),
('Brandy', '', '2000-01-01', '1980-01-01', 1),
('Brock', '', '2022-01-01', '1980-01-01', 1),
('Bay', '', '1960-01-01', '1980-01-01', 1),
('Ben', '', '1970-01-01', '1980-01-01', 1);


CREATE TABLE Classes(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50)
)

INSERT INTO Classes(name) VALUES
('Warrior'),
('Mage'),
('Rogue'),
('Cleric'),
('Ranger'),
('Paladin'),
('Monk');

CREATE TABLE Levels(
    guest_id INT,
    class_id INT,
    value INT

    FOREIGN KEY(guest_id) REFERENCES Guests(id),
    FOREIGN KEY(class_id) REFERENCES Classes(id)
)

INSERT INTO Levels(guest_id, class_id, value) VALUES
(1, 1, 1),
(2, 2, 10),
(3, 3, 20),
(4, 4, 30),
(5, 5, 40),
(6, 6, 15);

CREATE TABLE Supplies(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(250),
)

INSERT INTO Supplies(name) VALUES
('Beer'),
('Wine'),
('Whiskey');

CREATE TABLE Sales(
    id INT IDENTITY(1,1) PRIMARY KEY,
    tavern_id INT,
    amount_received INT,
    date DATE

    FOREIGN KEY(tavern_id) REFERENCES Taverns(id)
)

INSERT INTO Sales(tavern_id, amount_received, date) VALUES
(1, 100, '2020-01-01'),
(2, 200, '2020-01-01'),
(3, 300, '2020-01-01'),
(4, 400, '2020-01-01');

CREATE TABLE SupplySales(
    supply_id INT,
    sale_id INT,

    FOREIGN KEY(supply_id) REFERENCES Supplies(id),
    FOREIGN KEY(sale_id) REFERENCES Sales(id)
)

INSERT INTO SupplySales(supply_id, sale_id) VALUES
(1, 1),
(2, 2),
(3, 3);

CREATE TABLE RoomStatuses(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50)
)

INSERT INTO RoomStatuses( name) VALUES
('Available'),
('Occupied'),
('Reserved');

CREATE TABLE Rooms(
    id INT IDENTITY(1,1) PRIMARY KEY,
    status_id INT NOT NULL,
    tavern_id INT NOT NULL,

    FOREIGN KEY(status_id) REFERENCES RoomStatuses(id),
    FOREIGN KEY(tavern_id) REFERENCES Taverns(id)
)

INSERT INTO Rooms(status_id, tavern_id) VALUES
( 1, 1),
( 2, 2),
( 3, 3),
( 1, 4),
( 2, 2),
( 3, 1),
( 1, 5),
( 2, 2),
( 3, 7);

CREATE TABLE RoomStays(
    id INT IDENTITY(1,1) PRIMARY KEY,
    date DATE,
    price_rate INT,
    room_id INT NOT NULL,
    guest_id INT NOT NULL,
    sale_id INT NOT NULL

    FOREIGN KEY(room_id) REFERENCES Rooms(id),
    FOREIGN KEY(guest_id) REFERENCES Guests(id),
    FOREIGN KEY(sale_id) REFERENCES Sales(id)
)

INSERT INTO RoomStays(date, price_rate, room_id, guest_id, sale_id) VALUES
('2020-01-01', 100, 1, 1, 1),
('2020-01-01', 200, 2, 2, 2),
('2020-01-01', 50, 3, 3, 3);

-- Write a query that returns guests with a birthday before 2000. 
SELECT * FROM Guests WHERE birth_date < '2000-01-01';

-- Write a query to return rooms that cost more than 100 a night
SELECT * FROM Rooms WHERE id IN 
    (SELECT room_id FROM RoomStays WHERE price_rate > 100);

-- Write a query that returns UNIQUE guest names. 
SELECT DISTINCT name FROM Guests;

-- Write a query that returns all guests ordered by name (ascending) Use ASC or DESC after your ORDER BY [col]
SELECT * FROM Guests ORDER BY name ASC;

-- Write a query that returns the top 10 highest price sales
SELECT TOP 10 * FROM Sales ORDER BY amount_received DESC;

-- Write a query to return all the values stored in all Lookup Tables - Lookup tables are the tables we reference typically with just an ID and a name. This should be a dynamic combining of all of the tables
-- SELECT id,name FROM Locations
-- WHERE 1 = 1
-- UNION
-- SELECT id,name FROM Supplies
-- WHERE 1 = 1
-- UNION
-- SELECT id,name FROM Locations
-- WHERE 1 = 1
-- UNION
-- SELECT id,name FROM Classes
-- WHERE 1 = 1
-- UNION
-- SELECT id,name FROM GuestStatuses
-- WHERE 1 = 1
-- UNION
-- SELECT id,name FROM RoomStatuses;

SELECT id, name FROM Locations
UNION ALL SELECT id, name FROM Supplies
UNION ALL SELECT id, name FROM Classes
UNION ALL SELECT id, name FROM GuestStatuses
UNION ALL SELECT id, name FROM RoomStatuses;


-- Write a query that returns Guest Classes with Levels and Generate a new column with a label for their level grouping (lvl 1-10, 10-20, etc)
DECLARE @LevelRangeStep INT = 10;
SELECT Guests.name, Levels.[value] as level, Classes.name as Class, (
    'Level ' + CAST((Levels.[value] / @LevelRangeStep * @LevelRangeStep) + 1  AS VARCHAR(10)) + ' to ' + CAST((Levels.[value] / @LevelRangeStep * @LevelRangeStep) + @LevelRangeStep AS VARCHAR(10))
) as level_group FROM Guests
LEFT JOIN Levels
ON Guests.id = Levels.guest_id
LEFT JOIN Classes
ON Classes.id = Levels.class_id

SELECT COMMAND FROM (
SELECT (
    'CREATE TABLE ' + INFORMATION_SCHEMA.TABLES.TABLE_NAME + ' ('
) as COMMAND, TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES
UNION
SELECT (INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME + ' ' + INFORMATION_SCHEMA.COLUMNS.DATA_TYPE + ',') as COMMAND, TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = TABLE_NAME
UNION
SELECT ')' as COMMAND, TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = TABLE_NAME
) query ORDER BY TABLE_NAME