use master
GO

CREATE DATABASE MaskDB
GO

USE MaskDB
GO


-- schema to contain user tables
CREATE SCHEMA Data;
GO

-- table with masked columns
CREATE TABLE Data.Membership(
    MemberID        INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    FirstName       VARCHAR(100) MASKED WITH (FUNCTION = 'partial(1, "xxxxx", 1)') NULL,
    LastName        VARCHAR(100) NOT NULL,
    Phone           VARCHAR(12) MASKED WITH (FUNCTION = 'default()') NULL,
    Email           VARCHAR(100) MASKED WITH (FUNCTION = 'email()') NOT NULL,
    DiscountCode    SMALLINT MASKED WITH (FUNCTION = 'random(1, 100)') NULL
    );

-- inserting sample data
INSERT INTO Data.Membership (FirstName, LastName, Phone, Email, DiscountCode)
VALUES   
('Roberto', 'Tamburello', '555.123.4567', 'RTamburello@contoso.com', 10),  
('Janice', 'Galvin', '555.123.4568', 'JGalvin@contoso.com.co', 5),  
('Shakti', 'Menon', '555.123.4570', 'SMenon@contoso.net', 50),  
('Zheng', 'Mu', '555.123.4569', 'ZMu@contoso.net', 40);


CREATE USER MaskingTestUser WITHOUT LOGIN;  

GRANT SELECT ON SCHEMA::Data TO MaskingTestUser;  
  
  -- impersonate for testing:
EXECUTE AS USER = 'MaskingTestUser';  

SELECT * FROM Data.Membership;  

REVERT;

ALTER TABLE Data.Membership  
ALTER COLUMN LastName ADD MASKED WITH (FUNCTION = 'partial(2,"xxxx",0)');


ALTER TABLE Data.Membership  
ALTER COLUMN LastName varchar(100) MASKED WITH (FUNCTION = 'default()');


GRANT UNMASK TO MaskingTestUser;  

EXECUTE AS USER = 'MaskingTestUser';  

SELECT * FROM Data.Membership;  

REVERT;    
  
-- Removing the UNMASK permission  
REVOKE UNMASK TO MaskingTestUser;


ALTER TABLE Data.Membership   
ALTER COLUMN LastName DROP MASKED;
