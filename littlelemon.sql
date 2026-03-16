CREATE DATABASE LittleLemonDB;
USE LittleLemonDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    ContactNumber VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    TableNumber INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    Quantity INT,
    TotalCost DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) FROM Orders;
END //

CREATE PROCEDURE AddBooking(
    IN booking_id INT,
    IN booking_date DATE,
    IN table_number INT,
    IN customer_id INT
)
BEGIN
    INSERT INTO Bookings VALUES (booking_id, booking_date, table_number, customer_id);
END //

DELIMITER ;
