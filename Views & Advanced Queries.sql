-- Insert into RECEIPT Table
INSERT INTO RECEIPT (RECEIPTID, TOTALAMOUNT, TRANSACTIONDATE,
POINTSEARNED) VALUES (1001, 29.99, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 299.9);
INSERT INTO RECEIPT (RECEIPTID, TOTALAMOUNT, TRANSACTIONDATE,
POINTSEARNED) VALUES (1002, 15.49, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 154.9);
INSERT INTO RECEIPT (RECEIPTID, TOTALAMOUNT, TRANSACTIONDATE,
POINTSEARNED) VALUES (1003, 45.00, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 450);
INSERT INTO RECEIPT (RECEIPTID, TOTALAMOUNT, TRANSACTIONDATE,
POINTSEARNED) VALUES (1004, 89.99, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 899.9);
INSERT INTO RECEIPT (RECEIPTID, TOTALAMOUNT, TRANSACTIONDATE,
POINTSEARNED) VALUES (1005, 25.00, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 250);
INSERT INTO RECEIPT (RECEIPTID, TOTALAMOUNT, TRANSACTIONDATE,
POINTSEARNED) VALUES (1006, 55.50, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 555);
INSERT INTO RECEIPT (RECEIPTID, TOTALAMOUNT, TRANSACTIONDATE,
POINTSEARNED) VALUES (1007, 75.00, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 750);
INSERT INTO RECEIPT (RECEIPTID, TOTALAMOUNT, TRANSACTIONDATE,
POINTSEARNED) VALUES (1008, 60.25, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 602.5);
INSERT INTO RECEIPT (RECEIPTID, TOTALAMOUNT, TRANSACTIONDATE,
POINTSEARNED) VALUES (1009, 30.75, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 307.5);
INSERT INTO RECEIPT (RECEIPTID, TOTALAMOUNT, TRANSACTIONDATE,
POINTSEARNED) VALUES (1010, 22.50, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 225);
-- Select all from INVENTORY
SELECT * FROM INVENTORY;
-- Select inventory items with stock quantity less than 300
SELECT INVENTORYITEMS, STOCKQUANTITY
FROM INVENTORY
WHERE STOCKQUANTITY < 300;
-- Insert new item into INVENTORY
INSERT INTO INVENTORY (INVENTORYITEMS, STOCKQUANTITY) VALUES
('Moisturizer', 180);
-- Update stock quantity for a specific item
UPDATE INVENTORY
SET STOCKQUANTITY = STOCKQUANTITY + 20
WHERE INVENTORYITEMS = 'Pain Reliever';
-- Delete an item from INVENTORY
DELETE FROM INVENTORY
WHERE INVENTORYITEMS = 'Vitamins';
-- Use CASE to categorize stock levels
SELECT INVENTORYITEMS,
CASE
WHEN STOCKQUANTITY > 150 THEN 'In Stock'
WHEN STOCKQUANTITY BETWEEN 50 AND 150 THEN 'Low Stock'
ELSE 'Out of Stock'
END
FROM INVENTORY;
-- Delete a specific item from ITEM table
DELETE FROM ITEM
WHERE ITEMID = 10000005;
-- Sort items by price in descending order
SELECT ITEMNAME, ITEMPRICE
FROM ITEM
ORDER BY ITEMPRICE DESC;
-- Select customers with a specific address
SELECT CUSTOMERNAME, CUSTOMEREMAIL
FROM CUSTOMER
WHERE CUSTOMERADDRESS = '123 Main St, London';
-- Insert new customer record
INSERT INTO CUSTOMER (CUSTOMERNAME, CUSTOMEREMAIL,
CUSTOMERADDRESS, PCID) VALUES ('Ivy Turner', 'ivyt@example.com', '258 Oak St,
Cambridge', 1011);
-- Update customer address
UPDATE CUSTOMER
SET CUSTOMERADDRESS = '369 Pine Rd, Oxford'
WHERE CUSTOMERNAME = 'Alice Johnson';
-- Delete customer by email
DELETE FROM CUSTOMER
WHERE CUSTOMEREMAIL = 'bobbrown@example.com';
-- Select customers with a PCID greater than 1005
SELECT CUSTOMERNAME, PCID
FROM CUSTOMER
WHERE PCID > 1005;
-- Select all from PCOPTIMUMMEMBERSHIP
SELECT * FROM PCOPTIMUMMEMBERSHIP;
-- Select PCID and points greater than 100
SELECT PCID, POINTS
FROM PCOPTIMUMMEMBERSHIP
WHERE POINTS > 100;
-- Insert new record into PCOPTIMUMMEMBERSHIP
INSERT INTO PCOPTIMUMMEMBERSHIP (PCID, POINTS) VALUES (1011, 95);
-- Update points for a specific PCID
UPDATE PCOPTIMUMMEMBERSHIP
SET POINTS = POINTS + 50
WHERE PCID = 1003;
-- Delete from PCOPTIMUMMEMBERSHIP where PCID = 1010
DELETE FROM PCOPTIMUMMEMBERSHIP
WHERE PCID = 1010;
-- Select points between 80 and 150
SELECT PCID, POINTS
FROM PCOPTIMUMMEMBERSHIP
WHERE POINTS BETWEEN 80 AND 150;
-- Sort PCOPTIMUMMEMBERSHIP by points in descending order
SELECT PCID, POINTS
FROM PCOPTIMUMMEMBERSHIP
ORDER BY POINTS DESC;
-- Select transactions with payment type Credit Card
SELECT TRANSACTIONID, PAYMENTTYPE
FROM TRANSACTION
WHERE PAYMENTTYPE = 'Credit Card';
-- Insert new transaction
INSERT INTO TRANSACTION (TRANSACTIONID, PAYMENTTYPE) VALUES (1011,
'Online Payment');
-- Update payment type for a transaction
UPDATE TRANSACTION
SET PAYMENTTYPE = 'Cash'
WHERE TRANSACTIONID = 1002;
-- Delete a specific transaction
DELETE FROM TRANSACTION
WHERE TRANSACTIONID = 1010;
-- Select transactions that are not 'Cash'
SELECT TRANSACTIONID, PAYMENTTYPE
FROM TRANSACTION
WHERE PAYMENTTYPE != 'Cash';
-- Count total transactions
SELECT COUNT(*) AS TotalTransactions
FROM TRANSACTION;
-- Group transactions by payment type and count occurrences
SELECT PAYMENTTYPE, COUNT(*) AS Frequency
FROM TRANSACTION
GROUP BY PAYMENTTYPE;
-- Select transactions between specific IDs
SELECT TRANSACTIONID, PAYMENTTYPE
FROM TRANSACTION
WHERE TRANSACTIONID BETWEEN 1005 AND 1010;
-- Join TRANSACTION and RECEIPT on TRANSACTIONID and RECEIPTID
SELECT t.TRANSACTIONID, t.PAYMENTTYPE, r.RECEIPTID, r.TOTALAMOUNT
FROM TRANSACTION t
JOIN RECEIPT r ON t.TRANSACTIONID = r.RECEIPTID;
-- Select all from DISCOUNT
SELECT * FROM DISCOUNT;
-- Select seasonal discounts
SELECT DISCOUNTPERECENT, DISCOUNTTYPE, DISCOUNTDATE
FROM DISCOUNT
WHERE DISCOUNTTYPE = 'Seasonal Discount';
-- Insert a new discount
INSERT INTO DISCOUNT (DISCOUNTPERECENT, DISCOUNTTYPE, DISCOUNTDATE)
VALUES (20, 'Spring Sale', TO_DATE('2024-04-01', 'YYYY-MM-DD'));
-- Update discount percentage for a holiday sale
UPDATE DISCOUNT
SET DISCOUNTPERECENT = 12
WHERE DISCOUNTTYPE = 'Holiday Sale';
-- Delete an old discount
DELETE FROM DISCOUNT
WHERE DISCOUNTTYPE = 'Old Discount';
-- Select discounts in October 2024
SELECT DISCOUNTTYPE, DISCOUNTPERECENT
FROM DISCOUNT
WHERE EXTRACT(MONTH FROM DISCOUNTDATE) = 10 AND EXTRACT(YEAR
FROM DISCOUNTDATE) = 2024;
-- Count total discounts
SELECT COUNT(*) AS TotalDiscounts
FROM DISCOUNT;
-- Select discounts with percentage between 5 and 15
SELECT DISCOUNTTYPE, DISCOUNTPERECENT
FROM DISCOUNT
WHERE DISCOUNTPERECENT BETWEEN 5 AND 15;
-- Group discounts by type and count how many times each type was applied
SELECT DISCOUNTTYPE, COUNT(*) AS ApplicationCount
FROM DISCOUNT
GROUP BY DISCOUNTTYPE;
-- Select all from RECEIPT
SELECT * FROM RECEIPT;
-- Select receipts with a total amount greater than 50
SELECT RECEIPTID, TOTALAMOUNT, POINTSEARNED
FROM RECEIPT
WHERE TOTALAMOUNT > 50;
-- Insert a new receipt
INSERT INTO RECEIPT (RECEIPTID, TOTALAMOUNT, TRANSACTIONDATE,
POINTSEARNED)
VALUES (1011, 35.75, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 4);
-- Update total amount for a specific receipt
UPDATE RECEIPT
SET TOTALAMOUNT = 45.00
WHERE RECEIPTID = 1003;
-- Delete a specific receipt
DELETE FROM RECEIPT
WHERE RECEIPTID = 1010;
-- Select receipts for a specific transaction date
SELECT RECEIPTID, TOTALAMOUNT, POINTSEARNED
FROM RECEIPT
WHERE TRANSACTIONDATE = TO_DATE('2024-09-30', 'YYYY-MM-DD');
-- Count total receipts
SELECT COUNT(*) AS TotalReceipts
FROM RECEIPT;
-- Select receipts with points earned greater than 10
SELECT RECEIPTID, TOTALAMOUNT, POINTSEARNED
FROM RECEIPT
WHERE POINTSEARNED > 10;
-- DISTINCT query: Select distinct payment types from TRANSACTION
SELECT DISTINCT PAYMENTTYPE
FROM TRANSACTION;
-- GROUP BY query: Group transactions by payment type and count occurrences
SELECT PAYMENTTYPE, COUNT(*) AS PaymentFrequency
FROM TRANSACTION
GROUP BY PAYMENTTYPE;
DROP VIEW CustomerPointsView;
-- CREATE VIEW query: Create a view for customer details with PC Optimum membership
points
CREATE VIEW CustomerPointsView AS
SELECT c.CUSTOMERNAME, c.CUSTOMEREMAIL, p.POINTS
FROM CUSTOMER c
JOIN PCOPTIMUMMEMBERSHIP p ON c.PCID = p.PCID;
DROP VIEW INVENTORY_VIEW;
-- Create VIEW for inventory items with stock quantity
CREATE VIEW INVENTORY_VIEW AS
SELECT INVENTORYITEMS, STOCKQUANTITY
FROM INVENTORY;
