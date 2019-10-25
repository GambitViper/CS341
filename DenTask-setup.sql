DROP TABLE IF EXISTS [User];

DROP TABLE IF EXISTS [Appointment];

DROP TABLE IF EXISTS [Availability];

DROP TABLE IF EXISTS [RequestOff];

PRAGMA foreign_keys = ON;
/******************************************************
    Create Tables
*******************************************************/

CREATE TABLE [User]    (
  [UserID] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [UserType] INTEGER NOT NULL,
  [Email] NVARCHAR(60) NOT NULL,
  [Password] NVARCHAR(24) NOT NULL,
  [Prefix] NVARCHAR(10) ,
  [FirstName] NVARCHAR(24) NOT NULL,
  [LastName] NVARCHAR(24) NOT NULL,
  [PhoneNumber] NVARCHAR(24) NOT NULL,
  [CreateDate] DATETIME NOT NULL,
  [DeleteDate] DATETIME
);

CREATE TABLE [Appointment]    (
    [PatientID] INTEGER NOT NULL,
    [EmployeeID] INTEGER NOT NULL,
    [AppointmentType] NVARCHAR(60) NOT NULL,
    [AppointmentDetails] BLOB,
    [Date] DATETIME NOT NULL,
 
    FOREIGN KEY ([PatientID]) REFERENCES [User] ([UserID])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([EmployeeID]) REFERENCES [User] ([UserID])
        ON DELETE NO ACTION ON UPDATE NO ACTION,                          
    CONSTRAINT [PK_Appointment]  PRIMARY KEY ([PatientID], [EmployeeID], [Date])
);

CREATE TABLE [Availability]    (
    [UserID] INTEGER NOT NULL,
    [DayOfWeek] NVARCHAR(10) NOT NULL,
    [TimeStart] DATETIME,
    [TimeEnd] DATETIME,
    [BreakStart] DATETIME,
    [BreakEnd] DATETIME,
    
    FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [PK_Availability] PRIMARY KEY ([UserID], [DayOfWeek])
);

CREATE TABLE [RequestOff]    (
    [UserID] INTEGER NOT NULL,
    [OffDate] DATETIME NOT NULL,
    [DayOfWeek] NVARCHAR(10) NOT NULL, 
    CONSTRAINT [PK_RequestOff] PRIMARY KEY ([OffDate], [UserID]),
    FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*************************************************
    Create Foreign Key Indexes
*************************************************
CREATE INDEX [IFK_AppointmentPatientID] ON [Appointment] ([PatientID]);
CREATE INDEX [IFK_AppointmentEmployeeID] ON [Appointment] ([EmployeeID]);
CREATE INDEX [IFK_AvailabilityUserID] ON [Availability] ([UserID]);
CREATE INDEX [IFK_RequestOffUserID] ON [RequestOff] ([UserID]);
**************************************************/

/*************************************************
    Insert Sample Data
**************************************************/

/**************************************************
Template: User
UserType => 0 - Admin, 1 - Doctor, 2 - Hygienist, 3 - Patient
INSERT INTO [User] ([UserType], [Email], [Password], [FirstName], [LastName], [PhoneNumber], [CreateDate], [DeleteDate]) VALUES ( , '', '', '', '', '', "", NULL);
**************************************************/

INSERT INTO [User] ([UserType], [Email], [Password], [FirstName], [LastName], [PhoneNumber], [CreateDate], [DeleteDate]) VALUES (0 , 'admin.andy@gmail.com', 'admin', 'Andy', 'Boy', '18000001234', "2005-03-02 00:00", NULL);
INSERT INTO [User] ([UserType], [Email], [Password], [FirstName], [LastName], [PhoneNumber], [CreateDate], [DeleteDate]) VALUES (3, 'gwashington@gmail.com', '12aef94fa', 'George', 'Washington', '205008497652', "1776-07-04 12:00", "1797-03-04 12:00");
INSERT INTO [User] ([UserType], [Email], [Password], [FirstName], [LastName], [PhoneNumber], [CreateDate], [DeleteDate]) VALUES (3, 'jensen.thom@uwlax.edu', 'h@ll0w33n', 'Tom', 'Jensen', '6083864793', "2017-09-07 18:00", NULL);
INSERT INTO [User] ([UserType], [Email], [Password], [FirstName], [LastName], [PhoneNumber], [CreateDate], [DeleteDate]) VALUES (3 , 'doe.jane@yahoo.com', 'c00lbe@ns', 'Jane', 'Doe', '6081352468', "2019-10-24 19:00", NULL);
INSERT INTO [User] ([UserType], [Email], [Password], [Prefix], [FirstName], [LastName], [PhoneNumber], [CreateDate], [DeleteDate]) VALUES (1 , 'johnson.dan@yahoo.com', 'i@m@d0ct0r', 'Dr.', 'Dan', 'Johnson', '8795462135', "2015-06-25 13:00", NULL);
INSERT INTO [User] ([UserType], [Email], [Password], [Prefix], [FirstName], [LastName], [PhoneNumber], [CreateDate], [DeleteDate]) VALUES (1 , 'jahnsen.don@yahoo.com', 'sup3rdup3rd0ct0r', 'Dr.', 'Donald', 'Jahnsen', '7894561230', "2016-01-01 00:01", NULL);

/*************************************************
Template: Appointment
INSERT INTO [Appointment] ([PatientID], [EmployeeID], [AppointmentType], [Date]) VALUES (, , '', "");
*************************************************/

INSERT INTO [Appointment] ([PatientID], [EmployeeID], [AppointmentType], [Date]) VALUES (2, 5, 'Blood Letting', "Literally just going to let him bleed for a little bit...", "1780-03-01 16:00");
INSERT INTO [Appointment] ([PatientID], [EmployeeID], [AppointmentType], [Date]) VALUES (3, 5, 'Cleaning', "2019-11-01 14:00");
INSERT INTO [Appointment] ([PatientID], [EmployeeID], [AppointmentType], [AppointmentDetails], [Date]) VALUES (3, 6, 'Surgery', "Removal of four wisdom teeth", "2019-11-02 14:00");
/*INSERT INTO [Appointment] ([PatientID], [EmployeeID], [AppointmentType], [AppointmentDetails], [Date]) VALUES (4, 5, 'Surgery', "Removal of one tooth.", "2019-10-31 10:00");*/

/*************************************************
Template: Availiability
INSERT INTO [Availability] ([EmployeeID], [DayOfWeek], [TimeStart], [TimeEnd]) VALUES (, '', ":", ":");
*************************************************/

INSERT INTO [Availability] ([UserID], [DayOfWeek], [TimeStart], [TimeEnd], [BreakStart], [BreakEnd]) VALUES (5, 'Monday', "08:00", "17:00", "12:00", "13:00");
INSERT INTO [Availability] ([UserID], [DayOfWeek], [TimeStart], [TimeEnd], [BreakStart], [BreakEnd]) VALUES (5, 'Tuesday', "08:00", "17:00", "12:00", "13:00");
INSERT INTO [Availability] ([UserID], [DayOfWeek], [TimeStart], [TimeEnd], [BreakStart], [BreakEnd]) VALUES (5, 'Wednesday', "08:00", "17:00", "12:00", "13:00");
INSERT INTO [Availability] ([UserID], [DayOfWeek], [TimeStart], [TimeEnd], [BreakStart], [BreakEnd]) VALUES (5, 'Thursday', "08:00", "17:00", "12:00", "13:00");
INSERT INTO [Availability] ([UserID], [DayOfWeek], [TimeStart], [TimeEnd], [BreakStart], [BreakEnd]) VALUES (5, 'Friday', "08:00", "17:00", "12:00", "13:00");
INSERT INTO [Availability] ([UserID], [DayOfWeek], [TimeStart], [TimeEnd]) VALUES (5, 'Saturday', NULL, NULL);
INSERT INTO [Availability] ([UserID], [DayOfWeek], [TimeStart], [TimeEnd]) VALUES (5, 'Sunday', NULL, NULL);
INSERT INTO [Availability] ([UserID], [DayOfWeek], [TimeStart], [TimeEnd]) VALUES (6, 'Monday', "12:00", "15:00");

/*************************************************
Template: RequestOff
INSERT INTO [RequestOff] ([UserID], [OffDate], [DayOfWeek]) VALUES (, "--", '');
*************************************************/

