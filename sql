CREATE database jlr;
USE jlr ;
CREATE TABLE admin_login(
Email_id NVARCHAR(255),
Password NVARCHAR(255));


INSERT INTO admin_login (Email_id,Password) values('Jainab@ex.com','1111');

CREATE TABLE REGISTER (
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(255),
EMAIL NVARCHAR(255) UNIQUE,
PASSWORD NVARCHAR(255) NOT NULL ,
SALT NVARCHAR(255));

truncate  TABLE REGISTER
select * from REGISTER

CREATE TABLE EMPLOYEE(
EMP_ID INT PRIMARY KEY IDENTITY(1,1),
EMP_NAME NVARCHAR(50),
EMP_EMAILID NVARCHAR(50),
GENDER NVARCHAR(50),
MOBILE NVARCHAR(15),
DEPARTMENT NVARCHAR(20),
DESIGNATION NVARCHAR(50),
LOCATION NVARCHAR(255),
REGION NVARCHAR(255),
COUNTRY NVARCHAR(50));

CREATE TABLE Templates (
    TemplateID INT IDENTITY(1,1) PRIMARY KEY,

    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    ModifyDate DATETIME NOT NULL DEFAULT '11-02-2002',
    LayoutName NVARCHAR(255) NOT NULL,
    EmailTitle NVARCHAR(255) NOT NULL,
    HTMLHeader NVARCHAR(MAX),
    ContentHTML NVARCHAR(MAX),
    ContentText NVARCHAR(MAX)
   
);



TemplateID, CreatedDate, ModifyDate, LayoutName, EmailTitle, HTMLHeader, ContentHTML, ContentText



select * from Templates