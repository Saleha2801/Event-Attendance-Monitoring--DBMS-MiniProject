-- Defines database structure (tables and relationships)
CREATE DATABASE IF NOT EXISTS Event_Attendance;
USE Event_Attendance;

CREATE TABLE Student(
    PRN VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(25),
    Year ENUM('1st','2nd','3rd','4th'),
    Division VARCHAR(5),
    Role ENUM('Organizing Team','Participant')
);

CREATE TABLE Event_Coordinator(
    Name VARCHAR(50) PRIMARY KEY,
    Email VARCHAR(30) UNIQUE NOT NULL,
    Department VARCHAR(25) NOT NULL
);

CREATE TABLE Faculty(
    Name VARCHAR(50) PRIMARY KEY,
    Email VARCHAR(30) UNIQUE NOT NULL,
    Department VARCHAR(25) NOT NULL
);

CREATE TABLE Event(
    Event_Name VARCHAR(30) PRIMARY KEY,
    Event_Date DATE NOT NULL,
    Duration INT,
    Venue VARCHAR(30),
    Event_Coordinator_Name VARCHAR(50),
    FOREIGN KEY (Event_Coordinator_Name) REFERENCES Event_Coordinator(Name)
);

CREATE TABLE Attendance(
    Curr_Status ENUM('Marked','Not Marked'),
    Event_Name VARCHAR(30),
    Faculty_Name VARCHAR(50),
    FOREIGN KEY (Event_Name) REFERENCES Event(Event_Name),
    FOREIGN KEY (Faculty_Name) REFERENCES Faculty(Name)
);

CREATE TABLE Student_Participants_Event(
    PRN VARCHAR(10),
    Event_Name VARCHAR(30),
    PRIMARY KEY (PRN, Event_Name),
    FOREIGN KEY (PRN) REFERENCES Student(PRN),
    FOREIGN KEY (Event_Name) REFERENCES Event(Event_Name)
);

CREATE TABLE Student_Organises_Event(
    PRN VARCHAR(10),
    Event_Name VARCHAR(30),
    PRIMARY KEY (PRN, Event_Name),
    FOREIGN KEY (PRN) REFERENCES Student(PRN),
    FOREIGN KEY (Event_Name) REFERENCES Event(Event_Name)
);