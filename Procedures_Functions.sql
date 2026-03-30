-- Contains stored procedures and functions
USE Event_Attendance;

DELIMITER $$
CREATE PROCEDURE Register_Student_Event(
    IN p_PRN VARCHAR(10),
    IN p_Event_Name VARCHAR(30)
)
BEGIN
    INSERT INTO Student_Participants_Event(PRN, Event_Name)
    VALUES(p_PRN, p_Event_Name);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Approve_Event(
    IN p_Event_Name VARCHAR(30)
)
BEGIN
    UPDATE Event
    SET Approval_Status = 'Approved'
    WHERE Event_Name = p_Event_Name;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Mark_Attendance(
    IN p_Event_Name VARCHAR(30),
    IN p_Faculty_Name VARCHAR(50)
)
BEGIN
    UPDATE Attendance
    SET Curr_Status = 'Marked',
        Faculty_Name = p_Faculty_Name
    WHERE Event_Name = p_Event_Name;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Approve_Student(
    IN p_PRN VARCHAR(10),
    IN p_Event_Name VARCHAR(30)
)
BEGIN
    UPDATE Student_Participants_Event
    SET Status = 'Approved'
    WHERE PRN = p_PRN AND Event_Name = p_Event_Name;

    INSERT INTO Attendance(PRN, Event_Name, Curr_Status)
    VALUES(p_PRN, p_Event_Name, 'Not Marked');
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Reject_Student(
    IN p_PRN VARCHAR(10),
    IN p_Event_Name VARCHAR(30)
)
BEGIN
    UPDATE Student_Participants_Event
    SET Status = 'Rejected'
    WHERE PRN = p_PRN AND Event_Name = p_Event_Name;
END$$
DELIMITER ;