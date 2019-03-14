CREATE TABLE Address (
AddressID int IDENTITY(100,1) NOT NULL,
HouseNum varchar(30) NOT NULL,
Street varchar(30) NOT NULL,
City varchar(30) NOT NULL,
State varchar(30) NOT NULL,
Country varchar(50) NOT NULL,
Zip varchar(10) NOT NULL,
CONSTRAINT PK_Address PRIMARY KEY (AddressID));

CREATE TABLE Login (
AccountID int IDENTITY(2000,1) NOT NULL,
Email varchar(50) NOT NULL,
Password varchar(30) NOT NULL,
CONSTRAINT PK_Login PRIMARY KEY (AccountID));

CREATE TABLE School (
SchoolID int IDENTITY(1000,1) NOT NULL,
SchoolName varchar(50) NOT NULL,
AddressID int NOT NULL,
CONSTRAINT PK_School PRIMARY KEY (SchoolID),
CONSTRAINT FK_School FOREIGN KEY (AddressID) REFERENCES Address);

CREATE TABLE Parent (
ParentID int IDENTITY(300,1) NOT NULL,
FName varchar(30) NOT NULL,
LName varchar(30) NOT NULL,
PhoneNumber varchar(10) NOT NULL,
DOB date NOT NULL,
AccountID int NOT NULL,
AddressID int NOT NULL,
CONSTRAINT PK_Parent PRIMARY KEY (ParentID),
CONSTRAINT FK_Parent1 FOREIGN KEY (AddressID) references Address,
CONSTRAINT FK_Parent2 FOREIGN KEY (AccountID) references Login);

CREATE TABLE Teacher (
TeacherID int IDENTITY(400,1) NOT NULL,
FName varchar(30) NOT NULL,
LName varchar(30) NOT NULL,
PhoneNumber varchar(10) NOT NULL,
AccountID int NOT NULL,
AddressID int NOT NULL,
CONSTRAINT PK_Teacher PRIMARY KEY (TeacherID),
CONSTRAINT FK_Teacher1 FOREIGN KEY (AddressID) references Address,
CONSTRAINT FK_Teacher2 FOREIGN KEY (AccountID) references Login);

CREATE TABLE SchoolAdmin (
EmpID int IDENTITY(500,1) NOT NULL,
FName varchar(30) NOT NULL,
LName varchar(30) NOT NULL,
PhoneNumber varchar(10) NOT NULL,
AccountID int NOT NULL,
SchoolEmployer varchar(50) NOT NULL,
AddressID int NOT NULL,
SchoolID int NOT NULL,
CONSTRAINT PK_SchoolAdmin PRIMARY KEY (EmpID),
CONSTRAINT FK_SchoolAdmin1 FOREIGN KEY (AddressID) REFERENCES Address,
CONSTRAINT FK_SchoolAdmin2 FOREIGN KEY (SchoolID) REFERENCES School,
CONSTRAINT FK_SchoolAdmin3 FOREIGN KEY (AccountID) references Login);

CREATE TABLE Student (
StudentID int IDENTITY(200,1) NOT NULL,
FName varchar(30) NOT NULL,
LName varchar(30) NOT NULL,
MName varchar(30),
PhoneNumber varchar(10) NOT NULL,
Dob date NOT NULL,
YearInSchool varchar(20) NOT NULL,
Age int,
SchoolAttending varchar(50) NOT NULL,
AccountID int NOT NULL,
ParentID int NOT NULL,
TeacherID int NOT NULL,
EmpID int NOT NULL,
AddressID int NOT NULL,
CONSTRAINT PK_Student PRIMARY KEY (StudentID),
CONSTRAINT FK_Student1 FOREIGN KEY (AddressID) REFERENCES Address,
CONSTRAINT FK_Student2 FOREIGN KEY (ParentID) REFERENCES Parent,
CONSTRAINT FK_Student3 FOREIGN KEY (TeacherID) REFERENCES Teacher,
CONSTRAINT FK_Student4 FOREIGN KEY (EmpID) REFERENCES SchoolAdmin,
CONSTRAINT FK_Student5 FOREIGN KEY (AccountID) REFERENCES Login);

CREATE TABLE NonProfit (
OrgID int IDENTITY(600,1) NOT NULL,
OrgName varchar(50) NOT NULL,
PhoneNumber varchar(10) NOT NULL,
Field varchar(30) NOT NULL,
Liaison varchar(30) NOT NULL,
AccountID int NOT NULL,
AddressID int NOT NULL,
CONSTRAINT PK_NonProfit PRIMARY KEY (OrgID),
CONSTRAINT FK_NonProfit1 FOREIGN KEY (AddressID) REFERENCES Address,
CONSTRAINT FK_NonProfit2 FOREIGN KEY (AccountID) references Login);

CREATE TABLE Position (
PositionNumber int IDENTITY(7000,1) NOT NULL,
PositionTitle varchar(50),
Description varchar(80),
RequiredMaterials varchar(80),
OrgID int NOT NULL,
CONSTRAINT PK_Position PRIMARY KEY (PositionNumber),
CONSTRAINT FK_Position FOREIGN KEY (OrgID) REFERENCES NonProfit);

CREATE TABLE AdminPositionApproval (
EmpID int NOT NULL,
PositionNumber int NOT NULL,
ApprovalStatus varchar(1) NOT NULL, 
ApprovalDeadline date NOT NULL,
CONSTRAINT PK_AdminPositionApproval1 PRIMARY KEY (EmpID, PositionNumber),
CONSTRAINT FK_AdminPositionApproval1 FOREIGN KEY (EmpID) REFERENCES SchoolAdmin,
CONSTRAINT FK_AdminPositionApproval2 FOREIGN KEY (PositionNumber) REFERENCES Position);

CREATE TABLE Application (
StudentID int NOT NULL,
PositionNumber int NOT NULL,
ApplicationDeadline date NOT NULL,
CONSTRAINT PK_Application1 PRIMARY KEY (StudentID, PositionNumber),
CONSTRAINT FK_Application1 FOREIGN KEY (StudentID) REFERENCES Student,
CONSTRAINT FK_Application2 FOREIGN KEY (PositionNumber) REFERENCES Position);

insert into Address values (123, 'House St', 'Harrisonburg', 'VA', 'United States', '22801');
insert into Login values ('student@dukes.edu', 'Password');
insert into Login values ('parent@dukes.edu', 'Password');
insert into Login values ('teacher@dukes.edu', 'Password');
insert into Login values ('admin@dukes.edu', 'Password');
Insert into School values ('Smithland High School', 100); 
Insert into Parent values ('John', 'Smith', '1234567890', '1974-01-20', 2001, 100); 
Insert into Teacher values ('Mary', 'Jones', '1212121212', 2002, 100); 
insert into NonProfit values ('United NonProfit', '7033331111', 'Social Advocacy', 'Sherry', 2003, 100);
insert into Position values ('Intern', 'Assist description', 'Resume', 600);
Insert into SchoolAdmin values('Cheryl', 'Adams', '2345678901', 2003, 'Smithland High School', 100, 1000); 
Insert into Student values('Bailey', 'Jones', 'Marie', '3456789012', '1999-04-12','Junior', 16, 'Smithland High School', 2000, 300, 400, 500, 100);
insert into AdminPositionApproval values (500 , 7002, 'Y', '2019-02-01');
insert into Application values (200, 7002,'2019-02-02');



