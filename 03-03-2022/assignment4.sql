USE mt_bootcamp_assignment_3_uy_seng;

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
    ('Available'),
    ('Occupied'),
    ('Reserved');

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
    (3, 3),
    (1, 4),
    (2, 2),
    (3, 1),
    (1, 5),
    (2, 2),
    (3, 7);

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
    ('2019-01-01', 200, 2, 2, 2),
    ('2022-01-01', 50, 3, 3, 3);

-- write a query to return all users with the role of admin
SELECT
    Users.id,
    Users.name,
    Users.role_id,
    Roles.role_name
FROM
    Users
    INNER JOIN (
        SELECT
            id,
            name AS role_name
        FROM
            Roles
    ) Roles ON Users.role_id = Roles.id
WHERE
    Roles.role_name = 'Admin' -- write a query to return all users with the role of admin and information about their taverns
SELECT
    Users.id,
    Users.name,
    Users.role_name,
    Taverns.name as tavern_name,
    TavernLocations.name as tavern_location
FROM
    (
        SELECT
            Users.id,
            Users.name,
            Users.role_id,
            Roles.role_name
        FROM
            Users
            LEFT JOIN (
                SELECT
                    id,
                    name AS role_name
                FROM
                    Roles
            ) Roles ON Users.role_id = Roles.id
        WHERE
            Roles.role_name = 'Admin'
    ) Users
    LEFT JOIN (
        SELECT
            name,
            owner_id,
            location_id
        FROM
            Taverns
    ) Taverns ON Taverns.owner_id = Users.id
    LEFT JOIN (
        SELECT
            id,
            name
        FROM
            Locations
    ) TavernLocations ON TavernLocations.id = Taverns.location_id -- write a query that return all guests ordered by name and their classes and corresponding levels
SELECT
    Guests.id,
    Guests.name,
    Guests.notes,
    Guests.cake_day,
    Guests.birth_date,
    Guests.status_id,
    Levels.[value] as level,
    Classes.name
FROM
    Guests
    LEFT JOIN (
        SELECT
            *
        FROM
            Levels
    ) Levels ON Guests.id = Levels.guest_id
    LEFT JOIN (
        SELECT
            *
        FROM
            Classes
    ) Classes ON Levels.class_id = Classes.id
ORDER BY
    Guests.name ASC -- write a query that returns the top 10 sales in terms of sales price and what the services were
SELECT
    TOP 10 Sales.id,
    Sales.[date],
    Sales.amount_received,
    Taverns.name as tavern_name,
    Supplies.name as supply_name
FROM
    Sales
    LEFT JOIN SupplySales ON Sales.id = SupplySales.sale_id
    LEFT JOIN Supplies ON SupplySales.supply_id = Supplies.id
    LEFT JOIN Taverns ON Taverns.id = Sales.tavern_id
ORDER BY
    Sales.amount_received DESC -- write a query that return guest that have more than 2 classes
SELECT
    Guests.id,
    Guests.name,
    Guests.notes,
    Guests.status_id,
    Guests.birth_date,
    Guests.cake_day,
    Levels.class_id as class_id,
    Levels.[value] as level
FROM
    Guests
    LEFT JOIN Levels ON Guests.id = Levels.guest_id
WHERE
    Guests.id IN (
        SELECT
            guest_id
        FROM
            Levels
        GROUP BY
            guest_id
        HAVING
            COUNT(guest_id) > 1
    ) -- Write a query that returns guests with 2 or more classes with levels higher than 5
SELECT
    Guests.id,
    Guests.name,
    Guests.notes,
    Guests.status_id,
    Guests.birth_date,
    Guests.cake_day,
    Levels.class_id as class_id,
    Levels.[value] as level
FROM
    Guests
    LEFT JOIN Levels ON Guests.id = Levels.guest_id
WHERE
    Guests.id IN (
        SELECT
            a.guest_id
        FROM
            (
                (
                    SELECT
                        guest_id
                    FROM
                        Levels
                    GROUP BY
                        guest_id
                    HAVING
                        COUNT(guest_id) > 1
                ) a
                INNER JOIN (
                    SELECT
                        *
                    FROM
                        Levels
                ) b ON a.guest_id = b.guest_id
            )
        WHERE
            value > 5
    ) -- Write a query that returns guests with ONLY their highest level class
SELECT
    b.*,
    a.[level],
    Levels.class_id
FROM
    (
        (
            SELECT
                a.id,
                MAX(a.level) as level
            FROM
                (
                    SELECT
                        Guests.id,
                        Guests.name,
                        Guests.notes,
                        Guests.status_id,
                        Guests.birth_date,
                        Guests.cake_day,
                        Levels.class_id as class_id,
                        Levels.[value] as level
                    FROM
                        Guests
                        LEFT JOIN Levels ON Guests.id = Levels.guest_id
                    WHERE
                        Guests.id IN (
                            SELECT
                                a.guest_id
                            FROM
                                (
                                    (
                                        SELECT
                                            guest_id
                                        FROM
                                            Levels
                                        GROUP BY
                                            guest_id
                                        HAVING
                                            COUNT(guest_id) > 1
                                    ) a
                                    INNER JOIN (
                                        SELECT
                                            *
                                        FROM
                                            Levels
                                    ) b ON a.guest_id = b.guest_id
                                )
                            WHERE
                                value > 5
                        )
                ) a
            GROUP BY
                a.id
        ) a
        INNER JOIN (
            SELECT
                *
            FROM
                Guests
        ) b ON a.id = b.id
        LEFT JOIN (
            SELECT
                *
            FROM
                Levels
        ) Levels ON a.id = Levels.guest_id
        AND Levels.[value] = a.[level]
    ) -- Write a query that returns guests that stay within a date range. Please remember that guests can stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)
SELECT
    Guests.*
FROM
    Guests
    INNER JOIN (
        SELECT
            *
        FROM
            RoomStays
    ) RoomStays ON Guests.id = RoomStays.guest_id
WHERE
    RoomStays.[date] BETWEEN '2020-01-01'
    AND '2020-12-31' -- extra 1 + extra 2
SELECT
    COMMAND
FROM
    (
        SELECT
            (
                'CREATE TABLE ' + INFORMATION_SCHEMA.TABLES.TABLE_NAME + ' ('
            ) as COMMAND,
            TABLE_NAME,
            NULL AS ORDINAL_POSITION
        FROM
            INFORMATION_SCHEMA.TABLES
        UNION
        SELECT
            (
                INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME + ' ' + INFORMATION_SCHEMA.COLUMNS.DATA_TYPE + CASE
                    WHEN (
                        SELECT
                            a.is_identity
                        FROM
                            (
                                SELECT
                                    sysObj.name AS sysObj_name,
                                    sysCol.name AS sysCol_name,
                                    is_identity
                                FROM
                                    sys.objects sysObj
                                    INNER JOIN sys.columns sysCol ON sysObj.object_id = sysCol.object_id
                                WHERE
                                    type_desc = 'USER_TABLE'
                            ) a
                        WHERE
                            a.sysObj_name = TABLE_NAME
                            AND a.sysCol_name = COLUMN_NAME
                    ) = 1 THEN ' IDENTITY(1,1)'
                    ELSE ''
                END + CASE
                    WHEN (
                        SELECT
                            1
                        FROM
                            INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                        WHERE
                            COLUMN_NAME = INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME
                            AND TABLE_NAME = INFORMATION_SCHEMA.COLUMNS.TABLE_NAME
                    ) = 1 THEN CASE
                        WHEN (
                            SELECT
                                CONSTRAINT_NAME
                            FROM
                                INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                            WHERE
                                COLUMN_NAME = INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME
                                AND TABLE_NAME = INFORMATION_SCHEMA.COLUMNS.TABLE_NAME
                        ) LIKE '%PK%' THEN ' PRIMARY KEY,'
                        WHEN (
                            SELECT
                                CONSTRAINT_NAME
                            FROM
                                INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                            WHERE
                                COLUMN_NAME = INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME
                                AND TABLE_NAME = INFORMATION_SCHEMA.COLUMNS.TABLE_NAME
                        ) LIKE '%FK%' THEN ' FOREIGN KEY(' + COLUMN_NAME + ')' + ' REFERENCES ' + (
                            SELECT
                                UNIQUE_CONSTRAINT_TABLE_NAME
                            FROM
                                (
                                    (
                                        SELECT
                                            CONSTRAINT_NAME,
                                            TABLE_NAME,
                                            COLUMN_NAME
                                        FROM
                                            INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                                    ) a
                                    LEFT JOIN (
                                        SELECT
                                            UNIQUE_CONSTRAINT_NAME,
                                            CONSTRAINT_NAME
                                        FROM
                                            INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
                                    ) b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
                                    LEFT JOIN (
                                        SELECT
                                            TABLE_NAME AS UNIQUE_CONSTRAINT_TABLE_NAME,
                                            CONSTRAINT_NAME
                                        FROM
                                            INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                                    ) c ON c.CONSTRAINT_NAME = b.UNIQUE_CONSTRAINT_NAME
                                )
                            WHERE
                                a.COLUMN_NAME = INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME
                                AND a.TABLE_NAME = INFORMATION_SCHEMA.COLUMNS.TABLE_NAME
                        ) + '(' + (
                            SELECT
                                UNIQUE_CONSTRAINT_COLUMN_NAME
                            FROM
                                (
                                    (
                                        SELECT
                                            CONSTRAINT_NAME,
                                            TABLE_NAME,
                                            COLUMN_NAME
                                        FROM
                                            INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                                    ) a
                                    LEFT JOIN (
                                        SELECT
                                            UNIQUE_CONSTRAINT_NAME,
                                            CONSTRAINT_NAME
                                        FROM
                                            INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
                                    ) b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
                                    LEFT JOIN (
                                        SELECT
                                            TABLE_NAME AS UNIQUE_CONSTRAINT_TABLE_NAME,
                                            CONSTRAINT_NAME
                                        FROM
                                            INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                                    ) c ON c.CONSTRAINT_NAME = b.UNIQUE_CONSTRAINT_NAME
                                    LEFT JOIN (
                                        SELECT
                                            COLUMN_NAME AS UNIQUE_CONSTRAINT_COLUMN_NAME,
                                            CONSTRAINT_NAME
                                        FROM
                                            INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                                    ) d ON d.CONSTRAINT_NAME = b.UNIQUE_CONSTRAINT_NAME
                                )
                            WHERE
                                a.COLUMN_NAME = INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME
                                AND a.TABLE_NAME = INFORMATION_SCHEMA.COLUMNS.TABLE_NAME
                        ) + ')'
                    END
                    ELSE ','
                END
            ) as COMMAND,
            TABLE_NAME,
            ORDINAL_POSITION
        FROM
            INFORMATION_SCHEMA.COLUMNS
        UNION
        SELECT
            ')' AS COMMAND,
            TABLE_NAME,
            9999 AS ORDINAL_POSITION
        FROM
            INFORMATION_SCHEMA.COLUMNS
    ) query
ORDER BY
    TABLE_NAME,
    ORDINAL_POSITION