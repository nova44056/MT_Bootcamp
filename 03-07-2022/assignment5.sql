USE mt_bootcamp_assignment_5_uy_seng;

DROP TABLE IF EXISTS RoomStays,
Rooms,
RoomStatuses,
SupplySales,
Sales,
Supplies,
Levels,
Classes,
Guests,
GuestStatuses,
BasementRats,
Taverns,
Locations,
Users,
Roles;

CREATE TABLE Roles(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(MAX)
)
INSERT INTO
    Roles(id, name, description)
VALUES
    (1, 'Admin', 'Administrator'),
    (2, 'Staff', 'Regular Employee') CREATE TABLE Users(
        id INT IDENTITY(1, 1) PRIMARY KEY,
        name VARCHAR(250),
        role_id INT NOT NULL
    )
ALTER TABLE
    Users
ADD
    FOREIGN KEY(role_id) REFERENCES Roles(id);

INSERT INTO
    Users(name, role_id)
VALUES
    ('John', 1),
    ('Jane', 1),
    ('Jack', 1),
    ('Jill', 1),
    ('Joe', 1),
    ('Jenny', 1),
    ('Jeb', 1),
    ('Jenny', 2),
    ('Jeff', 2);

CREATE TABLE Locations(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(100)
)
INSERT INTO
    Locations(name)
VALUES
    ('The Swamp'),
    ('The Desert'),
    ('The Forest'),
    ('The Castle'),
    ('The Dungeon'),
    ('The Graveyard'),
    ('The Beach');

CREATE TABLE Taverns(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(250),
    location_id INT,
    owner_id INT,
)
ALTER TABLE
    Taverns
ADD
    FOREIGN KEY(location_id) REFERENCES Locations(id);

ALTER TABLE
    Taverns
ADD
    FOREIGN KEY(owner_id) REFERENCES Users(id);

INSERT INTO
    Taverns(name, location_id, owner_id)
VALUES
    ('Swamp Tavern', 1, 1),
    ('Fantasy Tavern', 2, 2),
    ('Forest Tavern', 3, 3),
    ('Castle Tavern', 4, 4),
    ('Dungoen Tavern', 5, 5),
    ('Graveyard Tavern', 6, 6),
    ('Beach Tavern', 7, 7);

CREATE TABLE BasementRats(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(100)
) DROP TABLE BasementRats;

CREATE TABLE GuestStatuses(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(50)
)
INSERT INTO
    GuestStatuses(name)
VALUES
    ('Regular'),
    ('VIP'),
    ('New');

CREATE TABLE Guests(
    id INT IDENTITY(1, 1) PRIMARY KEY,
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
    id INT IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(50)
)
INSERT INTO
    Classes(name)
VALUES
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
    value INT FOREIGN KEY(guest_id) REFERENCES Guests(id),
    FOREIGN KEY(class_id) REFERENCES Classes(id)
)
INSERT INTO
    Levels(guest_id, class_id, value)
VALUES
    (1, 1, 1),
    (1, 2, 2),
    (2, 2, 10),
    (2, 3, 50),
    (2, 4, 100),
    (2, 5, 100),
    (3, 3, 20),
    (3, 1, 80),
    (4, 4, 30),
    (5, 5, 40),
    (6, 6, 15);

CREATE TABLE Supplies(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(250),
)
INSERT INTO
    Supplies(name)
VALUES
    ('Beer'),
    ('Wine'),
    ('Whiskey');

CREATE TABLE Sales(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    tavern_id INT,
    amount_received INT,
    date DATE FOREIGN KEY(tavern_id) REFERENCES Taverns(id)
)
INSERT INTO
    Sales(tavern_id, amount_received, date)
VALUES
    (1, 100, '2020-01-01'),
    (2, 200, '2020-01-01'),
    (3, 300, '2020-01-01'),
    (4, 400, '2020-01-01'),
    (1, 500, '2020-01-01'),
    (2, 400, '2020-01-01'),
    (3, 460, '2020-01-01'),
    (3, 1200, '2020-01-01'),
    (4, 100, '2020-01-01'),
    (1, 42200, '2020-01-01'),
    (1, 10, '2020-01-01');

CREATE TABLE SupplySales(
    supply_id INT,
    sale_id INT,
    FOREIGN KEY(supply_id) REFERENCES Supplies(id),
    FOREIGN KEY(sale_id) REFERENCES Sales(id)
)
INSERT INTO
    SupplySales(supply_id, sale_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (2, 4),
    (1, 5),
    (2, 6),
    (3, 7),
    (2, 8),
    (1, 9),
    (2, 10),
    (3, 11) CREATE TABLE RoomStatuses(
        id INT IDENTITY(1, 1) PRIMARY KEY,
        name VARCHAR(50)
    )
INSERT INTO
    RoomStatuses(name)
VALUES
    ('Regular'),
    ('VIP');

CREATE TABLE Rooms(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    status_id INT NOT NULL,
    tavern_id INT NOT NULL,
    FOREIGN KEY(status_id) REFERENCES RoomStatuses(id),
    FOREIGN KEY(tavern_id) REFERENCES Taverns(id)
)
INSERT INTO
    Rooms(status_id, tavern_id)
VALUES
    (1, 1),
    (2, 2),
    (1, 3),
    (1, 4),
    (2, 2),
    (1, 1),
    (1, 5),
    (2, 2),
    (1, 7);

CREATE TABLE RoomStays(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    date DATE,
    price_rate INT,
    room_id INT NOT NULL,
    guest_id INT NOT NULL,
    sale_id INT NOT NULL FOREIGN KEY(room_id) REFERENCES Rooms(id),
    FOREIGN KEY(guest_id) REFERENCES Guests(id),
    FOREIGN KEY(sale_id) REFERENCES Sales(id)
)
INSERT INTO
    RoomStays(date, price_rate, room_id, guest_id, sale_id)
VALUES
    ('2020-01-01', 100, 1, 1, 1),
    ('2019-01-03', 250, 2, 2, 2),
    ('2022-01-02', 50, 3, 3, 3);

-- Write a function to return a “report” of all users and their roles
-- in the system.
IF OBJECT_ID (N'dbo.getUsersReport', N'IF') IS NOT NULL DROP FUNCTION dbo.getUsersReport;
GO
    CREATE FUNCTION dbo.getUsersReport() RETURNS TABLE AS RETURN
        SELECT Users.*, Roles.name as role FROM Users
        LEFT JOIN
        (SELECT id, name FROM Roles)Roles
        ON Users.role_id = Roles.id
GO
SELECT id, name, role FROM dbo.getUsersReport()

-- Write a function to return all classes and the count of guests that hold those classes
IF OBJECT_ID(N'dbo.getClassesWithGuestCount', N'IF') IS NOT NULL DROP FUNCTION dbo.getClassesWithGuestCount;
GO
    CREATE FUNCTION dbo.getClassesWithGuestCount() RETURNS TABLE AS RETURN (
        SELECT Classes.*, (SELECT COUNT(Levels.class_id) FROM Levels WHERE Classes.id = Levels.class_id) as guest_count FROM Classes
    )
GO

SELECT * FROM dbo.getClassesWithGuestCount()

-- Write a function that returns all guests ordered by name (ascending) and their classes and corresponding levels. 
-- Add a column that labels them beginner (lvl 1-5), 
-- intermediate (5-10) and expert (10+) for their classes (Don’t alter the table for this)
IF OBJECT_ID(N'dbo.getGuestsWithLevelLabel', N'IF') IS NOT NULL DROP FUNCTION dbo.getGuestsWithLevelLabel;
GO
    CREATE FUNCTION dbo.getGuestsWithLevelLabel() RETURNS TABLE RETURN
    (
        SELECT * FROM (
            SELECT Guests.*, Levels.[value] as level, (
                CASE
                    WHEN Levels.[value] >= 1 AND Levels.[value] <= 5 THEN 'beginner'
                    WHEN Levels.[value] > 5 AND Levels.[value] < 10 THEN 'intermediate'
                    ELSE 'expert'
                END
            ) as level_type FROM Guests
            INNER JOIN Levels
            ON Guests.id = Levels.guest_id
        )q
        ORDER BY q.name ASC OFFSET 0 ROWS
    )
GO
SELECT * FROM dbo.getGuestsWithLevelLabel()


-- Write a function that takes a level and returns a “grouping” from question 3 (e.g. 1-5, 5-10, 10+, etc)
IF OBJECT_ID(N'dbo.getGuestsWithLevelRange', N'IF') IS NOT NULL DROP FUNCTION dbo.[getGuestsWithLevelRange];
GO
    CREATE FUNCTION dbo.getGuestsWithLevelRange(@level_range INT) RETURNS TABLE RETURN 
    (
        SELECT Guests.name, Levels.[value] as level, Classes.name as Class, (
            CAST((Levels.[value] / @level_range * @level_range - 1) + 1  AS VARCHAR(10)) + ' to ' + CAST((Levels.[value] / @level_range * @level_range) + @level_range AS VARCHAR(10))
        ) as level_group FROM Guests
        LEFT JOIN Levels
        ON Guests.id = Levels.guest_id
        LEFT JOIN Classes
        ON Classes.id = Levels.class_id
    )
GO
SELECT * FROM dbo.getGuestsWithLevelRange(5)

-- Write a function that returns a report of all open rooms (not used) on a particular day (input) 
-- and which tavern they belong to 
IF OBJECT_ID(N'dbo.getAvailableRoomsByDate', N'IF') IS NOT NULL DROP FUNCTION dbo.getAvailableRoomsByDate
GO
CREATE FUNCTION dbo.getAvailableRoomsByDate(@date DATE) RETURNS TABLE RETURN (
    SELECT * FROM (
        SELECT q.*, Taverns.name as tavern_name, Locations.name as tavern_location FROM (
            SELECT Rooms.*, RoomStatuses.name as status FROM Rooms
            INNER JOIN RoomStatuses
            ON Rooms.status_id = RoomStatuses.id
        )q 
        INNER JOIN Taverns
        ON q.tavern_id = Taverns.id
        INNER JOIN Locations
        ON Taverns.location_id = Locations.id
    )q
    WHERE q.id NOT IN (
        SELECT room_id FROM RoomStays WHERE RoomStays.[date] = @date
    )
)
GO
SELECT * FROM dbo.getAvailableRoomsByDate('2022-01-01')

-- Modify the same function from 5 
-- to instead return a report of prices in a range (min and max prices)
IF OBJECT_ID(N'dbo.getRoomsByPriceRange', N'IF') IS NOT NULL DROP FUNCTION dbo.getRoomsByPriceRange
GO
CREATE FUNCTION dbo.getRoomsByPriceRange(@min INT, @max INT) RETURNS TABLE RETURN (
    SELECT * FROM (
        SELECT q.*, Taverns.name as tavern_name, Locations.name as tavern_location FROM (
            SELECT Rooms.*, RoomStatuses.name as status FROM Rooms
            INNER JOIN RoomStatuses
            ON Rooms.status_id = RoomStatuses.id
        )q 
        INNER JOIN Taverns
        ON q.tavern_id = Taverns.id
        INNER JOIN Locations
        ON Taverns.location_id = Locations.id
    )q
    WHERE q.id IN (
        SELECT room_id FROM RoomStays WHERE RoomStays.[price_rate] >= @min AND RoomStays.price_rate <= @max
    )
)
GO
SELECT * FROM dbo.getRoomsByPriceRange(0, 100)

-- Write a stored procedure that uses the result from 6 to 
-- Create a Room in another tavern that undercuts (is less than) the cheapest room by a penny 
-- - thereby making the new room the cheapest one