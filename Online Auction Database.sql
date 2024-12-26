-- Database Setup-----------------
DROP DATABASE IF EXISTS ONLINE_AUCTION; -- DROP Online Auction database
CREATE SCHEMA IF NOT EXISTS ONLINE_AUCTION; -- Create Online Auction database 
USE ONLINE_AUCTION; -- Select Online Auction database

CREATE TABLE USER (
	UserID VARCHAR(10) NOT NULL,
    Username VARCHAR(15) NOT NULL,
    Account VARCHAR(30) NOT NULL,
    Full_name VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (UserID, Username) #composite primary key
);

-- Create tables
CREATE TABLE SELLER (
	UserID VARCHAR(10) NOT NULL,
    Username VARCHAR(15) NOT NULL,
	Shipping_address VARCHAR(50),
    
    PRIMARY KEY (UserID, Username),
    FOREIGN KEY (UserID, Username) REFERENCES USER (UserID, Username)
);

CREATE TABLE BUYER (
	UserID VARCHAR(10) NOT NULL,
    Username VARCHAR(15) NOT NULL,
    Mailing_address VARCHAR(50) NOT NULL,
    Billing_address VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (UserID, Username),
    FOREIGN KEY (UserID, Username) REFERENCES USER (UserID, Username)
);

CREATE TABLE AUCTION (
	AuctionID VARCHAR(10) NOT NULL, 
	`Date` DATE NOT NULL,
    Time_frame TIME NOT NULL,
    `Status` VARCHAR (10) NOT NULL,
    
    PRIMARY KEY(AuctionID)
);

CREATE TABLE ITEM (
	AuctionID VARCHAR(10) NOT NULL,
    ItemID VARCHAR(10) NOT NULL,
    Item_name VARCHAR(15) NOT NULL,
    `Description` VARCHAR(50),
    Quantity INT NOT NULL,
    
    PRIMARY KEY (ItemID),
    FOREIGN KEY (AuctionID) REFERENCES AUCTION (AuctionID)
);

CREATE TABLE BID (
	AuctionID VARCHAR(10) NOT NULL,
    BidID VARCHAR(10) NOT NULL,
    Price DECIMAL (10, 2) NOT NULL, #10 digits in total, 2 digits after the decimal point
    
    PRIMARY KEY (BidID),
    FOREIGN KEY (AuctionID) REFERENCES AUCTION (AuctionID)
);

CREATE TABLE PAYMENT (
	UserID VARCHAR(10) NOT NULL,
    ItemID VARCHAR(10) NOT NULL,
    BidID VARCHAR(10) NOT NULL,
    PaymentID VARCHAR(15) NOT NULL,
    Total DECIMAL (10, 2) NOT NULL,
    
    PRIMARY KEY (PaymentID),
    FOREIGN KEY (UserID) REFERENCES USER (UserID),
    FOREIGN KEY (ItemID) REFERENCES ITEM (ItemID),
    FOREIGN KEY (BidID) REFERENCES BID (BidID)
);

CREATE TABLE PAYMENT_METHOD (
	PaymentID VARCHAR(15) NOT NULL,
    Payment_Type VARCHAR(15) NOT NULL,
    
    PRIMARY KEY (PaymentID),
    FOREIGN KEY (PaymentID) REFERENCES PAYMENT (PaymentID)
);

-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Insert data into USER
-- total of 8 users, including sellers and buyers
INSERT INTO USER (UserID, Username, `Account`, Full_name) VALUES
#sellers
('220465207', 'carriey53', 'carriey53@gmail.com', 'Carrie Yu'),
('010320246', 'maryy04', 'maryam04@gmail.com', 'Maryam Liu'),
#buyers
('200330913', 'coconut', 'coconut34@gmail.com', 'Coco Amber'),
('432568182', 'ophelian', 'opheliaNun@gmail.com', 'Ophelia Nun');

INSERT INTO SELLER (UserID, Username, Shipping_address) VALUES
('220465207', 'carriey53', '789 Court Street, Manhattan, NY 11223'),
('010320246', 'maryy04', '1230 Brown Street, Queens, NY 21356');

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO BUYER (UserID, Username, Mailing_address, Billing_address) VALUES
('200330913', 'coconut', '2026 Grad Street, Brooklyn, NY 43574', '2026 Grad Street Brooklyn, NY 43574'),
('432568182', 'ophelian', '20 Cooper Square, Manhattan, NY 10003', '20 Cooper Square Manhattan, NY 10003');

INSERT INTO AUCTION (AuctionId, Date, Time_frame, Status) VALUES
(87, '2024-03-10', '03:30:06', 'Active'),
(467, '2002-11-18', '12:25:48', 'Active'),
(324, '2012-09-23', '11:45:13', 'Inactive');

INSERT INTO ITEM (AuctionID, ItemID, Item_name, Description, Quantity) VALUES
(87, 102, 'Cake', 'Very fluffy and delicious', 1),
(467, 29, 'Iphone 16', 'The most recent Iphone from Apple as of Dec 2024', 1),
(324, 24, 'Smiski', 'Glows in the data and perfect for decor', 1);

INSERT INTO BID (AuctionID, BidID, Price) VALUES
(87, 98, 10.99),
(467, 11, 1123.43),
(324, 09, 1.00);

INSERT INTO PAYMENT (UserID, ItemID, BidID, PaymentID, Total) VALUES
('220465207', 102, 98, 'cake0', 10.99),
('200330913', 29, 11, 'iphone1', 1123.43),
('432568182', 24, 09, 'smiski99', 12.00);

INSERT INTO PAYMENT_METHOD (PaymentID, Payment_Type) VALUES
('cake0', 'Card'),
('iphone1', 'Digital Wallet'),
('smiski99', 'Bank');