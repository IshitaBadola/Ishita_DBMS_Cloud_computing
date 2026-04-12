
CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Name VARCHAR(50)
);

CREATE TABLE Products (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(50)
);

CREATE TABLE Order_Items (
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

INSERT INTO Orders (Customer_Name) VALUES ('Kiran');
INSERT INTO Orders (Customer_Name) VALUES ('Meena');

INSERT INTO Products (Product_Name) VALUES ('Pen');
INSERT INTO Products (Product_Name) VALUES ('Pencil');
INSERT INTO Products (Product_Name) VALUES ('Eraser');
INSERT INTO Products (Product_Name) VALUES ('Notebook');

INSERT INTO Order_Items VALUES (1,1,2);
INSERT INTO Order_Items VALUES (1,2,3);
INSERT INTO Order_Items VALUES (1,3,1);
INSERT INTO Order_Items VALUES (2,4,5);
INSERT INTO Order_Items VALUES (2,1,1);