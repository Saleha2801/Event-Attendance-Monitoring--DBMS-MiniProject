-- Contains queries to retrieve and analyze data
USE Event_Attendance;

CALL Register_Student_Event('101','Hackathon');

SELECT * FROM Student_Participants_Event;

CALL Approve_Student('101','Hackathon');

SELECT * FROM Student_Participants_Event;
SELECT * FROM Attendance;

CALL Reject_Student('101','Hackathon');
SELECT * FROM Student_Participants_Event;

CALL Mark_Attendance('Hackathon','Dr. Mehta');
SELECT * FROM Attendance;