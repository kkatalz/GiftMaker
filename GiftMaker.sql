-- create table Category
CREATE TABLE Category (
    id_category INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    category_name VARCHAR(50) NOT NULL
);

-- create table Item
CREATE TABLE Item (
    id_item INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    id_category INTEGER NOT NULL,
    item_name VARCHAR(50) NOT NULL,
    item_price DECIMAL(13,2) NOT NULL,
    description VARCHAR(100) NOT NULL,
    amount INTEGER NOT NULL,
    age INTEGER NOT NULL,
    FOREIGN KEY (id_category) REFERENCES Category(id_category)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- to store images for each item
CREATE TABLE Item_Image (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    id_item INTEGER NOT NULL,
    image BLOB NOT NULL,
    FOREIGN KEY (id_item) REFERENCES Item(id_item)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- create table Possible_Item
CREATE TABLE Possible_Item (
    possible_item_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    item_name VARCHAR(50) NOT NULL,
    item_price DECIMAL(13,2) NOT NULL,
    description VARCHAR(100) NOT NULL,
    age INTEGER NOT NULL,
    image BLOB NOT NULL
);

CREATE TABLE Possible_Item_Image (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  possible_item_id INTEGER NOT NULL,
  image BLOB NOT NULL,
  FOREIGN KEY (possible_item_id) REFERENCES Possible_Item(possible_item_id)
                                 ON DELETE CASCADE
                                 ON UPDATE CASCADE

);

-- create table User
CREATE TABLE User (
    id_user INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    date_birth DATE,
    role VARCHAR(20) NOT NULL,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(200) NOT NULL
);

-- create table Item_In_Cart
CREATE TABLE Item_In_Cart (
    id_user INTEGER NOT NULL,
    id_item INTEGER NOT NULL,
    item_amount INTEGER NOT NULL,
    PRIMARY KEY (id_user, id_item),
    FOREIGN KEY (id_user) REFERENCES User(id_user)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_item) REFERENCES Item(id_item)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- create table Liked_Item
CREATE TABLE Liked_Item (
    id_user INTEGER NOT NULL,
    id_item INTEGER NOT NULL,
    PRIMARY KEY (id_user, id_item),
    FOREIGN KEY (id_user) REFERENCES User(id_user)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_item) REFERENCES Item(id_item)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Category (category_name) VALUES ('Books');
INSERT INTO Category (category_name) VALUES ('Clothing');
INSERT INTO Category (category_name) VALUES ('Home & Kitchen');
