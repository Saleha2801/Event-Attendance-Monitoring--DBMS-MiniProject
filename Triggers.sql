-- Contains triggers for automatic actions
USE Event_Attendance;

DELIMITER $$
CREATE TRIGGER after_event_approval
AFTER UPDATE ON Event
FOR EACH ROW
BEGIN
    IF NEW.Approval_Status = 'Approved' THEN
        INSERT INTO Attendance (Curr_Status, Event_Name)
        VALUES ('Not Marked', NEW.Event_Name);
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER prevent_duplicate_registration
BEFORE INSERT ON Student_Participants_Event
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Student_Participants_Event
        WHERE PRN = NEW.PRN AND Event_Name = NEW.Event_Name
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student already registered!';
    END IF;
END$$
DELIMITER ;