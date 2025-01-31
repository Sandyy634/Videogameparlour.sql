-- Create the database
CREATE DATABASE video_game_sandesh;


-- Table: Session_Type
USE video_game_sandesh;
CREATE TABLE Session_Type (
    Session_type_id INT PRIMARY KEY,
    Session_Type_Name VARCHAR(50)
);
INSERT INTO Session_Type VALUES
(1, 'Free'),
(2, 'Special');
select * from Session_Type;

-- Table: Sessions_and_Fees
USE video_game_sandesh;
CREATE TABLE Sessions_and_Fees (
    Session_Number INT PRIMARY KEY,
    Session_Day VARCHAR(50),
    Session_Start_Time VARCHAR(10),
    Session_End_Time VARCHAR(10),
    Session_type_id INT,
    Floor INT,
    Price VARCHAR(20),
    FOREIGN KEY (Session_type_id) REFERENCES Session_Type(Session_type_id)
);
INSERT INTO Sessions_and_Fees VALUES
(1, 'Sunday', '9am', '9pm', 1, 1, 'Rs 1500'),
(2, 'Sunday', '9am', '9pm', 1, 2, 'Rs 1000'),
(3, 'Saturday', '9am', '9pm', 1, 1, 'Rs 1500'),
(4, 'Friday', '6pm', '10pm', 2, 2, 'Rs 1000');
select * from Sessions_and_Fees;

-- Table: Staff
USE video_game_sandesh;
CREATE TABLE Staff (
    Staff_id VARCHAR(10) PRIMARY KEY,
    Staff_First_Name VARCHAR(50),
    Staff_Last_Name VARCHAR(50),
    Role VARCHAR(50)
);
INSERT INTO Staff VALUES
('S1', 'Sagar', 'Aryal', 'Cafe'),
('S2', 'Bikesh', 'Khagdi', 'Maintenance'),
('S3', 'Saroj', 'Sapkota', 'Counter'),
('S4', 'Jonathon', 'Shrestha', 'Counter'),
('S5', 'Rohan', 'Chaudhari', 'Maintenance'),
('S6', 'Rajeev', 'Karmacharya', 'Cafe');
select * from Staff;

-- Table: Session_Staff
USE video_game_sandesh;
CREATE TABLE Session_Staff (
    Staff_id VARCHAR(10),
    Session_Number INT,
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id),
    FOREIGN KEY (Session_Number) REFERENCES Sessions_and_Fees(Session_Number)
);
INSERT INTO Session_Staff VALUES
('S1', 1),
('S2', 1),
('S3', 1),
('S4', 2),
('S5', 2),
('S6', 2);
select * from Session_Staff;

-- Table: Consoles
USE video_game_sandesh;
CREATE TABLE Consoles (
    Console_id INT PRIMARY KEY,
    Console VARCHAR(50),
    Console_Qty INT
);
INSERT INTO Consoles VALUES
(1, 'Xbox 360', 3),
(2, 'PS3', 2),
(3, 'PS2', 3),
(4, 'Nintendo 64', 2),
(5, 'Nintendo Switch', 4);
select * from Consoles; 

-- Table: Games
USE video_game_sandesh;
CREATE TABLE Games (
    Games_id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    PEGI VARCHAR(10),
    Console_id INT,
    FOREIGN KEY (Console_id) REFERENCES Consoles(Console_id)
);
INSERT INTO Games VALUES
('G1', 'Elden Ring: Shadow Of The Erdtree', 'PG', 1),
('G2', 'Final Fantasy VII Rebirth', 'PG', 2),
('G3', 'Destiny 2: The Final Shape', 'PG', 3),
('G4', 'Tekken 8', 'PG', 2),
('G5', 'Persona 3 Reload', 'PG', 4),
('G6', 'Cavern Of Dreams', '15', 5);
Select * from Games;
-- Table: Session_and_Console
USE video_game_sandesh;
CREATE TABLE Session_and_Console (
    Session_Number INT,
    Date DATE,
    Console_id INT,
    Qty INT,
    FOREIGN KEY (Session_Number) REFERENCES Sessions_and_Fees(Session_Number),
    FOREIGN KEY (Console_id) REFERENCES Consoles(Console_id)
);
INSERT INTO Session_and_Console VALUES
(1, '2024-07-22', 3, 2),
(2, '2024-07-22', 2, 2);
Select * from Session_and_Console;
-- Table: City
USE video_game_sandesh;
CREATE TABLE City (
    City_id INT PRIMARY KEY,
    City VARCHAR(50)
);
INSERT INTO City VALUES
(1, 'Kathmandu');
Select * from City;

-- Table: Address
USE video_game_sandesh;
CREATE TABLE Address (
    Address_id VARCHAR(10) PRIMARY KEY,
    Address VARCHAR(100),
    City_id INT,
    FOREIGN KEY (City_id) REFERENCES City(City_id)
);
INSERT INTO Address VALUES
('A1', 'Baneshwor', 1),
('A2', 'Maitidevi', 1),
('A3', 'Putalisadak', 1),
('A4', 'Kapan', 1),
('A5', 'Kalkani', 1),
('A6', 'Balkhu', 1);
Select * from Address;

-- Table: Member_Type
USE video_game_sandesh;
CREATE TABLE Member_Type (
    Member_type_id INT PRIMARY KEY,
    Member_Type VARCHAR(50),
    Membership_Fee VARCHAR(20)
);
INSERT INTO Member_Type VALUES
(1, 'Standard', 'Rs 1500'),
(2, 'Premium', 'Rs 20000');
Select * from Member_type;

-- Table: Customers
USE video_game_sandesh;
CREATE TABLE Customers (
    Cus_id VARCHAR(10) PRIMARY KEY,
    First_Name VARCHAR(50),
    Surname VARCHAR(50),
    Join_Date DATE,
    Date_of_Birth DATE,
    Member_type_id INT,
    Address_id VARCHAR(10),
    FOREIGN KEY (Member_type_id) REFERENCES Member_Type(Member_type_id),
    FOREIGN KEY (Address_id) REFERENCES Address(Address_id)
);
INSERT INTO Customers VALUES
('C1', 'Saanvi', 'Bhatta', '2024-01-01', '2015-05-01', 1, 'A1'),
('C2', 'Bill', 'Gates', '2024-07-06', '2012-07-01', 2, 'A2'),
('C3', 'Elon', 'Musk', '2024-03-28', '2003-10-20', 2, 'A3'),
('C4', 'Jack', 'MA', '2024-04-22', '1999-04-18', 1, 'A5'),
('C5', 'Kamala', 'Harris', '2024-01-05', '1973-03-01', 1, 'A4'),
('C6', 'Rishi', 'Sunak', '2024-02-01', '2000-11-27', 2, 'A6');
Select * from Customers; 

-- Table: Booking_List
USE video_game_sandesh;
CREATE TABLE Booking_List (
    Booking_id VARCHAR(10) PRIMARY KEY,
    Session_Number INT,
    Customer_id VARCHAR(10),
    Date DATE,
    Member_YN CHAR(1),
    Fee VARCHAR(20),
    Pre_paid_YN CHAR(1),
    FOREIGN KEY (Session_Number) REFERENCES Sessions_and_Fees(Session_Number),
    FOREIGN KEY (Customer_id) REFERENCES Customers(Cus_id)
);
INSERT INTO Booking_List VALUES
('B1', 1, 'C1', '2024-07-22', 'Y', 'N/A', '-'),
('B2', 1, 'C2', '2024-07-22', 'N', 'Rs 1500', 'N'),
('B3', 1, 'C3', '2024-07-22', 'Y', 'Rs 1000', 'Y'),
('B4', 1, 'C4', '2024-08-25', 'N', 'Rs 1500', 'N'),
('B5', 2, 'C5', '2024-07-22', 'Y', 'Rs 1000', 'N'),
('B6', 4, 'C6', '2024-07-05', 'Y', 'Rs 1000', 'Y');
Select * from Booking_List;

-- Table: Arcade_Machine_Information
USE video_game_sandesh;
CREATE TABLE Arcade_Machine_Information (
    Machine_id VARCHAR(10) PRIMARY KEY,
    Machine_number INT,
    Game VARCHAR(50),
    Year INT,
    Floor INT
);
INSERT INTO Arcade_Machine_Information VALUES
('M1', 23, 'COC', 2010, 1),
('M2', 123, 'GTA', 2013, 1),
('M3', 45, 'Spiderman', 2016, 2),
('M4', 1234, 'PUBG', 2004, 1);
Select * from Arcade_Machine_Information;

-- ------------------------------ QUESTIONS ------------------------------------ --
use video_game_sandesh;
SELECT Customers.Cus_id, Customers.First_Name, Customers.Surname
FROM Booking_list
JOIN Customers ON Booking_List.Customer_id = Customers.Cus_id
WHERE Booking_List.Session_Number = 1 AND Booking_List.`Pre_paid_YN` = 'N';



use video_game_sandesh;
SELECT Machine_id, Machine_number, Game, Year, Floor
FROM Arcade_machine_information
WHERE Floor = 1
ORDER BY Machine_number DESC;

use video_game_sandesh;
SELECT COUNT(*) AS PS3_Game_Count
FROM Games
JOIN Consoles ON Games.Console_id = Consoles.Console_id
WHERE Consoles.Console = 'PS3';


use video_game_sandesh;
SELECT Staff.Staff_id, Staff.Staff_First_Name, Staff.Staff_Last_Name
FROM Session_staff
JOIN Staff ON Session_staff.Staff_id = Staff.Staff_id
WHERE Session_staff.Session_Number = 1 AND Staff.Role = 'Maintenance';


use video_game_sandesh;
UPDATE Arcade_machine_information
SET Floor = 2
WHERE Game = 'PUBG';
select * from Arcade_machine_information;

use video_game_sandesh;
DELETE FROM Arcade_machine_information
WHERE Game = 'GTA';
Select * from Arcade_machine_information;

