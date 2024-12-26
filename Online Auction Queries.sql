-- testing tuples of each table within the Online Auction database

SELECT *
FROM USER;

/*
SELECT *
FROM SELLER;

SELECT *
FROM BUYER;

SELECT *
FROM AUCTION;

SELECT *
FROM ITEM;

SELECT *
FROM BID;

SELECT *
FROM PAYMENT;

SELECT *
FROM PAYMENT_METHOD;
*/

-- Testing Join betweenn Payment and Payment_Method tables
/*
SELECT PAYMENT.UserID, PAYMENT.PaymentID, PAYMENT.Total, PAYMENT_METHOD.Payment_Type
FROM PAYMENT
INNER JOIN PAYMENT_METHOD ON PAYMENT.PaymentID = PAYMENT_METHOD.PaymentID;
*/