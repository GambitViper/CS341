/*************************************************
    DenTask Sample Queries
*************************************************/

/*See availability of a given employee (only the days that they work)*/
SELECT UserID, DayOfWeek AS Day, TimeStart AS Start, TimeEnd AS End
    FROM User NATURAL JOIN Availability
    WHERE UserID = 5 AND Start NOT NULL;

/*See all appointments scheduled for a given patient up to one year from now*/
SELECT PatientID, Prefix, FirstName AS DoctorFirst, LastName AS DoctorLast, Date, AppointmentType, AppointmentDetails
    FROM Appointment JOIN User
    WHERE EmployeeID = UserID AND PatientID = 4 AND Date BETWEEN datetime('now') AND datetime('now', '+1 year');
    
/*See all apointments for a given doctor from now and one year from now*/
SELECT EmployeeID, FirstName AS First, LastName AS Last, Date, AppointmentType, AppointmentDetails
    FROM Appointment JOIN User
    WHERE PatientID = UserID AND EmployeeID = 5 AND Date BETWEEN datetime('now') AND datetime('now', '+1 year');
    
/*Scheduling an appointment*/
INSERT INTO [Appointment] ([PatientID], [EmployeeID], [AppointmentType], [AppointmentDetails], [Date]) VALUES (4, 5, 'Surgery', "Removal of one tooth.", "2019-10-31 10:00");