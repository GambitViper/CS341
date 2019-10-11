DROP TABLE IF EXISTS [User];

DROP TABLE IF EXISTS [Appointment];

DROP TABLE IF EXISTS [Availability];

DROP TABLE IF EXISTS [RequestOff];

/******************************************************/

CREATE TABLE [User]    (
  [UserID] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
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
 
    CONSTRAINT [PK_Appointment]  PRIMARY KEY ([PatientID], [EmployeeID], [Date]),
    FOREIGN KEY ([PatientID]) REFERENCES [User] ([UserID])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([EmployeeID]) REFERENCES [User] ([UserID])
        ON DELETE NO ACTION ON UPDATE NO ACTION                    
        
);

CREATE TABLE [Availability]    (
    [EmployeeID] INTEGER NOT NULL,
    [DayOfWeek] NVARCHAR(10) NOT NULL,
    [TimeStart] DATETIME NOT NULL,
    [TimeEnd] DATETIME NOT NULL,
    [BreakStart] DATETIME,
    [BreakEnd] DATETIME,
    
    CONSTRAINT [PK_Availability] PRIMARY KEY ([EmployeeID], [DayOfWeek]),
    FOREIGN KEY ([EmployeeID]) REFERENCES [User] ([UserID])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [RequestOff]    (
    [UserID] INTEGER NOT NULL,
    [OffDate] DATETIME NOT NULL,
    CONSTRAINT [PK_RequestOff] PRIMARY KEY ([OffDate], [UserID]),
    FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*************************************************/

