 
  
  -- Create Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName NVARCHAR(100),
    Email NVARCHAR(100)
);

-- Create Roles Table
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,
    RoleName NVARCHAR(100)
);

-- Create AccountStatuses Table
CREATE TABLE AccountStatuses (
    AccountStatusID INT PRIMARY KEY,
    StatusName NVARCHAR(100)
);

-- Create UserAccounts Table
CREATE TABLE UserAccounts (
    AccountID INT PRIMARY KEY,
    UserID INT,
    RoleID INT,
    AccountStatusID INT,
    AccountName NVARCHAR(100),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID),
    FOREIGN KEY (AccountStatusID) REFERENCES AccountStatuses(AccountStatusID)
);
 
  
  -- Insert data into Users Table
INSERT INTO Users (UserID, UserName, Email)
VALUES (1, 'John Doe', 'john.doe@example.com'), 
       (2, 'Jane Smith', 'jane.smith@example.com');

-- Insert data into Roles Table
INSERT INTO Roles (RoleID, RoleName)
VALUES (1, 'Admin'), 
       (2, 'User');

-- Insert data into AccountStatuses Table
INSERT INTO AccountStatuses (AccountStatusID, StatusName)
VALUES (1, 'Active'), 
       (2, 'Inactive');

-- Insert data into UserAccounts Table
INSERT INTO UserAccounts (AccountID, UserID, RoleID, AccountStatusID, AccountName)
VALUES (1, 1, 1, 1, 'JohnAdminAccount'), 
       (2, 2, 2, 2, 'JaneUserAccount');
 
  
  -- Delete data from UserAccounts Table
DELETE FROM UserAccounts;

-- Delete data from Users Table
DELETE FROM Users;

-- Delete data from Roles Table
DELETE FROM Roles;

-- Delete data from AccountStatuses Table
DELETE FROM AccountStatuses;
