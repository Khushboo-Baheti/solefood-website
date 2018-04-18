# Create and use database
CREATE DATABASE dbproject;
USE dbproject;

# User table
CREATE TABLE user (
email_id VARCHAR(64),
password VARCHAR(32),
CONSTRAINT pk_user PRIMARY KEY (email_id)
);

# User table data
INSERT INTO user VALUES ('johnsmith@test.com', '');
INSERT INTO user VALUES ('susiejones@example.com', '');
INSERT INTO user VALUES ('jennyjackson@random.com', '');
INSERT INTO user VALUES ('pedrocasillas@abc.com', '');
INSERT INTO user VALUES ('tomharris@def.com', '');
INSERT INTO user VALUES ('gregthomas@gmail.com', '');
INSERT INTO user VALUES ('georgelewis@yahoo.com', '');
INSERT INTO user VALUES ('ivandrago@hotmail.com', '');
INSERT INTO user VALUES ('tredhollman@gmail.com', '');
INSERT INTO user VALUES ('bennaidu@outlook.com', '');
INSERT INTO user VALUES ('sarahbrick@abcdef.com', '');


# Customer table
CREATE TABLE customer (
customer_id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(64) NOT NULL,
last_name VARCHAR(64) NOT NULL,
email_id VARCHAR(64),
phone BIGINT,
address VARCHAR(256),
CONSTRAINT ck_phone CHECK(phone >= 10000000000 AND phone <= 9999999999),
CONSTRAINT pk_customer PRIMARY KEY (customer_id),
CONSTRAINT fk_email_id FOREIGN KEY (email_id) REFERENCES user(email_id) ON UPDATE CASCADE
)
AUTO_INCREMENT = 1001;

# Customer table triggers
DELIMITER $$
CREATE TRIGGER `customer_phone_insert` 
BEFORE INSERT
ON customer FOR EACH ROW
BEGIN
    IF (New.phone < 1000000000 OR New.phone > 9999999999) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number should be of 10 digit';
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `customer_phone_update` 
BEFORE UPDATE
ON customer FOR EACH ROW
BEGIN
    IF (New.phone < 1000000000 OR New.phone > 9999999999) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number should be of 10 digit';
    END IF;
END $$
DELIMITER ;

# Customer table data
INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES ('John', 'Smith',  'johnsmith@test.com',  '4198341902', '1001, 1st St, Redmond, WA');
INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES ('Susie', 'Jones', 'susiejones@example.com', '4112341909', '2001, 2nd St, San Francisco, CA');
INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES ('Jenny', 'Jackson',  'jennyjackson@random.com', '4198356714', '3001, 3rd St, Seattle, WA');
INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES ('Pedro', 'Casillas', 'pedrocasillas@abc.com', '5028341902', '4001, 4th St, Tacoma, WA');
INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES ('Tom', 'Harris', 'tomharris@def.com', '2058341912', '5001, 5th Ave, Portland, OR');
INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES ('Greg', 'Thomas', 'gregthomas@gmail.com', '4258341935', '6001, 6th Ave, Hilsboro, OR');
INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES ('George', 'Lewis', 'georgelewis@yahoo.com', '6198343792', '7001, 7th St, Renton, WA');
INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES ('Ivan', 'Drago', 'ivandrago@hotmail.com', '7028313913', '8001, 8th Ave, Los Angeles, CA');
INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES ('Tred', 'Hollman', 'tredhollman@gmail.com', '8088341108', '9001, 9th St, Las Vegas, CA');
INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES ('Ben', 'Naidu', 'bennaidu@outlook.com', '2058347861', '10001, 10th St, Indianapolis, IN');
INSERT INTO customer(first_name, last_name, email_id, phone, address) VALUES ('Sarah', 'Brick', 'sarahbrick@abcdef.com', '2908341189', '11001, 11th Ave, Atlanta, GA');



# Vendor table
CREATE TABLE vendor (
vendor_id INT NOT NULL AUTO_INCREMENT,
vendor_name VARCHAR(128) NOT NULL,
phone BIGINT,
CONSTRAINT vendor_phone CHECK(phone >= 10000000000 AND phone <= 9999999999),
CONSTRAINT pk_vendor PRIMARY KEY (vendor_id)
);

# Vendor table triggers
DELIMITER $$
CREATE TRIGGER `vendor_phone_insert` 
BEFORE INSERT
ON vendor FOR EACH ROW
BEGIN
    IF (New.phone < 1000000000 OR New.phone > 9999999999) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number should be of 10 digit';
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `vendor_phone_udpate` 
BEFORE UPDATE
ON vendor FOR EACH ROW
BEGIN
    IF (New.phone < 1000000000 OR New.phone > 9999999999) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number should be of 10 digit';
    END IF;
END $$
DELIMITER ;

# Vendor table data
INSERT INTO vendor(vendor_name, phone) VALUES ('Larry Cass', '2057891564');
INSERT INTO vendor(vendor_name, phone) VALUES ('Deni Cordrell', '7913891564');
INSERT INTO vendor(vendor_name, phone) VALUES ('Kate Benson', '2057891098');
INSERT INTO vendor(vendor_name, phone) VALUES ('Karen Matthew', '2018297564');
INSERT INTO vendor(vendor_name, phone) VALUES ('Nick Dean', '8067891564');
INSERT INTO vendor(vendor_name, phone) VALUES ('Taylor Walts', '9057791564');
INSERT INTO vendor(vendor_name, phone) VALUES ('Peter Lee', '3017810564');
INSERT INTO vendor(vendor_name, phone) VALUES ('Jonathan Edwards', '4257891017');
INSERT INTO vendor(vendor_name, phone) VALUES ('David Letty', '5057891702');
INSERT INTO vendor(vendor_name, phone) VALUES ('Joe Kim', '6082891168');
INSERT INTO vendor(vendor_name, phone) VALUES ('John Parker', '2357891780');



# Items table
CREATE TABLE items (
item_id INT NOT NULL AUTO_INCREMENT,
item_name VARCHAR(128) NOT NULL,
brand VARCHAR(64),
vendor_id INT,
price DECIMAL(10, 2) not null,
image_url VARCHAR(128),
CONSTRAINT pk_items PRIMARY KEY (item_id),
CONSTRAINT ck_price CHECK(price > 0.00),
CONSTRAINT fk_items FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id) ON UPDATE CASCADE ON DELETE SET NULL
);

# Items table triggers
DELIMITER $$
CREATE TRIGGER `items_price_insert` 
BEFORE INSERT
ON items FOR EACH ROW
BEGIN
    IF (New.price < 0.00) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Item price should be greater than 0.00';
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `items_price_update` 
BEFORE UPDATE
ON items FOR EACH ROW
BEGIN
    IF (New.price < 0.00) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Item price should be greater than 0.00';
    END IF;
END $$
DELIMITER ;

# Items table data
INSERT INTO items(item_name, brand, vendor_id, price, image_url) VALUES ('LEON PUMP', 'SHOE REPUBLIC LA', '1', '25.00', '');
INSERT INTO items(item_name, brand, vendor_id, price, image_url) VALUES ('CHEER OXFORD', 'DR. SCHOLLS', '2', '55.00', '');
INSERT INTO items(item_name, brand, vendor_id, price, image_url) VALUES ('LEISA OXFORD', 'INDIGO RD', '3', '29.99', '');
INSERT INTO items(item_name, brand, vendor_id, price, image_url) VALUES ('CINZANO OXFORD', 'SPRING STEP', '4', '129.00', '');
INSERT INTO items(item_name, brand, vendor_id, price, image_url) VALUES ('JOUSTON OXFORD', 'TOMMY HILFIGER', '5', '59.99', '');
INSERT INTO items(item_name, brand, vendor_id, price, image_url) VALUES ('BAILEE OXFORD', 'MARC FISHER', '6', '39.98', '');
INSERT INTO items(item_name, brand, vendor_id, price, image_url) VALUES ('ELEYA SANDAL', 'JESSICA SIMPSON', '7', '69.99', '');
INSERT INTO items(item_name, brand, vendor_id, price, image_url) VALUES ('BOAT MOCCASIN', 'MINNETONKA', '8', '55.99', '');
INSERT INTO items(item_name, brand, vendor_id, price, image_url) VALUES ('FS LITE RUN 2 LIGHTWEIGHT', 'NIKE', '9', '78.89', '');
INSERT INTO items(item_name, brand, vendor_id, price, image_url) VALUES ('NADIA SANDLE', 'KELLY & KATIE', '10', '78.88', '');
INSERT INTO items(item_name, brand, vendor_id, price, image_url) VALUES ('JR. TRAPPER MOCCASIN SLIPPER', 'MINNETONKA', '11', '30.00', '');


UPDATE items SET image_url = "https://raw.githubusercontent.com/siri-sadashiva/DBProject/master/images/1.jpeg" WHERE item_id = 1;
UPDATE items SET image_url = "https://raw.githubusercontent.com/siri-sadashiva/DBProject/master/images/2.jpeg" WHERE item_id = 2;
UPDATE items SET image_url = "https://raw.githubusercontent.com/siri-sadashiva/DBProject/master/images/3.jpeg" WHERE item_id = 3;
UPDATE items SET image_url = "https://raw.githubusercontent.com/siri-sadashiva/DBProject/master/images/4.jpeg" WHERE item_id = 4;
UPDATE items SET image_url = "https://raw.githubusercontent.com/siri-sadashiva/DBProject/master/images/5.jpeg" WHERE item_id = 5;
UPDATE items SET image_url = "https://raw.githubusercontent.com/siri-sadashiva/DBProject/master/images/6.jpeg" WHERE item_id = 6;
UPDATE items SET image_url = "https://raw.githubusercontent.com/siri-sadashiva/DBProject/master/images/7.jpeg" WHERE item_id = 7;
UPDATE items SET image_url = "https://raw.githubusercontent.com/siri-sadashiva/DBProject/master/images/8.jpeg" WHERE item_id = 8;
UPDATE items SET image_url = "https://raw.githubusercontent.com/siri-sadashiva/DBProject/master/images/9.jpeg" WHERE item_id = 9;
UPDATE items SET image_url = "https://raw.githubusercontent.com/siri-sadashiva/DBProject/master/images/10.jpeg" WHERE item_id = 10;
UPDATE items SET image_url = "https://raw.githubusercontent.com/siri-sadashiva/DBProject/master/images/11.jpeg" WHERE item_id = 11;


# Stock table
CREATE TABLE stock (
item_id INT NOT NULL,
size INT NOT NULL,
stock  int(11) unsigned DEFAULT NULL,
CONSTRAINT pk_stock PRIMARY KEY (item_id, size),
CONSTRAINT fk_stock FOREIGN KEY (item_id) REFERENCES items(item_id) ON UPDATE CASCADE,
CONSTRAINT ck_size CHECK(size >= 4 AND size <= 12)
);


# Stock table triggers
DELIMITER $$
CREATE TRIGGER `stock_size_insert` 
BEFORE INSERT
ON stock FOR EACH ROW
BEGIN
    IF (New.size < 4 OR New.size > 12) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Size should be between 4 and 12';
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `stock_size_update` 
BEFORE UPDATE
ON stock FOR EACH ROW
BEGIN
    IF (New.size < 4 OR New.size > 12) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Size should be between 4 and 12';
    END IF;
	
	IF (New.stock <= 0) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You cannot purchase this item as it is out of stock';
    END IF;
END $$
DELIMITER ;


# Stock table data
INSERT INTO stock(item_id, size, stock) VALUES('1', '4', '2');
INSERT INTO stock(item_id, size, stock) VALUES('1', '9', '5');
INSERT INTO stock(item_id, size, stock) VALUES('2', '10', '7');
INSERT INTO stock(item_id, size, stock) VALUES('3', '12', '12');
INSERT INTO stock(item_id, size, stock) VALUES('4', '11', '23');
INSERT INTO stock(item_id, size, stock) VALUES('5', '5', '21');
INSERT INTO stock(item_id, size, stock) VALUES('5', '8', '2');
INSERT INTO stock(item_id, size, stock) VALUES('5', '10', '1');
INSERT INTO stock(item_id, size, stock) VALUES('5', '11', '3');
INSERT INTO stock(item_id, size, stock) VALUES('6', '12', '4');
INSERT INTO stock(item_id, size, stock) VALUES('7', '10', '18');
INSERT INTO stock(item_id, size, stock) VALUES('8', '7', '11');
INSERT INTO stock(item_id, size, stock) VALUES('9', '6', '20');
INSERT INTO stock(item_id, size, stock) VALUES('10', '5', '22');
INSERT INTO stock(item_id, size, stock) VALUES('11', '10', '19');
INSERT INTO stock(item_id, size, stock) VALUES('11', '11', '1');



# Purchase table
CREATE TABLE purchase (
purchase_id INT NOT NULL AUTO_INCREMENT,
customer_id INT,
item_id INT,
size int,
purchase_date DATE,
quantity INT NOT NULL,
price DECIMAL(10, 2) ,
tax decimal(10,2) default 10.00,
total DECIMAL(10, 2) ,
CONSTRAINT pk_purchase PRIMARY KEY (purchase_id),
CONSTRAINT fk_purchase FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON UPDATE CASCADE,
CONSTRAINT fk2_purchase FOREIGN KEY (item_id) REFERENCES items(item_id) ON UPDATE CASCADE
);


# Purchase table triggers
DELIMITER $$
CREATE TRIGGER `purchase_update` 
BEFORE UPDATE
ON purchase FOR EACH ROW
BEGIN 
	# Check for shoe size
    IF (New.size < 4 OR New.size > 12) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Size should be between 4 and 12';
    END IF;

	# Set total price in purchase table
	set new.total = (new.quantity * new.price) + (((new.quantity * new.price) * new.tax) / 100.00);

	# Update stock in stock table
    Update stock 
	set stock = (stock -  new.quantity)
	where item_id = new.item_id and size = new.size;
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `purchase_insert` 
before INSERT
ON purchase FOR EACH ROW
BEGIN 
			# set purchase date as today when purchasing an item
			set new.purchase_date = now();

			# set total price in purchase table
            set new.total = (new.quantity * new.price) + (((new.quantity * new.price) * new.tax) / 100.00);

			# Check for shoe size
            IF (New.size < 4 OR New.size > 12) THEN
          SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Size should be between 4 and 12';
    END IF;

	# Update stock in stock table
    Update stock 
	set stock = (stock -  new.quantity)
	where item_id = new.item_id and size = new.size;
END $$
DELIMITER ;


# Purchase table data
INSERT INTO purchase(customer_id,item_id,size,quantity,price) VALUES('1001', '1', '4','1','55.00');
INSERT INTO purchase(customer_id,item_id,size,quantity,price) VALUES('1001', '1', '4','1' ,'55.00');
INSERT INTO purchase(customer_id,item_id,size,quantity,price) VALUES('1002', '4', '11','2','25.00');
INSERT INTO purchase(customer_id,item_id,size,quantity,price) VALUES('1002', '4', '11','1','75.00');
INSERT INTO purchase(customer_id,item_id,size,quantity,price) VALUES('1003', '4', '11','1','35.00');
INSERT INTO purchase(customer_id,item_id,size,quantity,price) VALUES('1003', '5', '5','1','45.00');
INSERT INTO purchase(customer_id,item_id,size,quantity,price) VALUES('1004', '5', '10','1','45.00');
INSERT INTO purchase(customer_id,item_id,size,quantity,price) VALUES('1005', '5', '11','1','45.00');
INSERT INTO purchase(customer_id,item_id,size,quantity,price) VALUES('1006', '9', '6','1','45.00');
INSERT INTO purchase(customer_id,item_id,size,quantity,price) VALUES('1007', '4', '11','1','45.00');


# View to analyze daily purchases

# Total items purchased per day
CREATE VIEW day_purchase  AS SELECT count(purchase_id) AS 'Total items sold today' 
FROM purchase
WHERE purchase_date = curdate();

# Daily total sales and count of items per item
CREATE VIEW day_purchase_item AS SELECT item_name, sum(total) AS total_price, sum(quantity) AS total_quantity
FROM purchase,items 
WHERE purchase_date = curdate() AND purchase.item_id = items.item_id
GROUP BY purchase.item_id;


# Procedure to get the total quantity purchased for a given item
DROP PROCEDURE IF EXISTS quantity_purchased;
DELIMITER $$
 CREATE PROCEDURE quantity_purchased (IN itemid int, OUT amount INT)
 BEGIN
 SELECT sum(quantity) INTO amount  FROM purchase where item_id= itemid;
  END $$
 DELIMITER ;
 
 #CALL quantity_purchased(4, @purchase_amount);
 #SELECT @purchase_amount;
