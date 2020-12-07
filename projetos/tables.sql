USE benmk1;

DROP TABLE IF EXISTS order_line;
DROP TABLE IF EXISTS order_register;
DROP TABLE IF EXISTS item_quantity;
DROP TABLE IF EXISTS shopping_session;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS hibernate_sequence;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS author;

CREATE TABLE author (
  id bigint NOT NULL,
  fullName varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);
INSERT INTO author(id, fullName) VALUES (1, 'Patrick Rothfuss');
INSERT INTO author(id, fullName) VALUES (2, 'George R. R. Martin');
INSERT INTO author(id, fullName) VALUES (3, 'J. R. R. Tolkien');
INSERT INTO author(id, fullName) VALUES (4, 'John Green');
INSERT INTO author(id, fullName) VALUES (5, 'Stephen King');

CREATE TABLE country (
  id bigint NOT NULL,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);
INSERT INTO country(id, name) VALUES (1, 'Brazil');

CREATE TABLE address (
  id bigint NOT NULL,
  city varchar(255) DEFAULT NULL,
  state varchar(255) DEFAULT NULL,
  street varchar(255) DEFAULT NULL,
  countryId bigint DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FK40q2llu8chafk0wq48s39mhch (countryId),
  CONSTRAINT FK40q2llu8chafk0wq48s39mhch FOREIGN KEY (countryId) REFERENCES benmk1.country (id)
);
INSERT INTO address(id, street, city, state, countryId) VALUES (1, 'Rua Carneiro Lobo', 'Curitiba', 'Parana', 1);

CREATE TABLE customer (
  id bigint NOT NULL AUTO_INCREMENT,
  birthDate datetime(6) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  fullName varchar(255) DEFAULT NULL,
  password varchar(255) NOT NULL,
  phoneNumber varchar(255) DEFAULT NULL,
  username varchar(255) DEFAULT NULL,
  addressId bigint DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FKhiifv8j63g3hfvxaynxtev9ms (addressId),
  CONSTRAINT FKhiifv8j63g3hfvxaynxtev9ms FOREIGN KEY (addressId) REFERENCES address (id)
);
INSERT INTO customer(id, birthDate, email, fullName, password, phoneNumber, username, addressId) VALUES (1000, NULL, NULL, 'Terumi Isobe', 'password', NULL, 'terumiisobe', 1);
INSERT INTO customer(id, birthDate, email, fullName, password, phoneNumber, username, addressId) VALUES (1001, NULL, NULL, 'João Grams', 'password', NULL, 'joaograms', 1);

CREATE TABLE item (
  id bigint NOT NULL,
  availability int NOT NULL,
  cost decimal(19,2) NOT NULL,
  publicationDate datetime(6) DEFAULT NULL,
  publisher varchar(255) DEFAULT NULL,
  subject varchar(255) DEFAULT NULL,
  title varchar(255) DEFAULT NULL,
  version int DEFAULT NULL,
  authorId bigint DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FKfapu0tqjo1j0ks0dk0ekbbl0e (authorId),
  CONSTRAINT FKfapu0tqjo1j0ks0dk0ekbbl0e FOREIGN KEY (authorId) REFERENCES author (id)
);
INSERT INTO item (id, title, authorId, subject, publisher, publicationDate, cost, availability, version) VALUES 
(1, 'The Name of the Wind', 1,'SCIENCE FICTION', NULL, CURRENT_TIMESTAMP, 80, 15000, 0),
(2, 'The Game of Thrones', 2,'SCIENCE FICTION', NULL, CURRENT_TIMESTAMP, 90, 10000, 0),
(3, 'Lord of the Rings', 3,'SCIENCE FICTION', NULL, CURRENT_TIMESTAMP, 80, 50000, 0),
(4, 'The Fault in our Stars', 4, 'ROMANCE', NULL, CURRENT_TIMESTAMP, 50, 20000, 0),
(5, 'Paper Towns', 4, 'ROMANCE', NULL, CURRENT_TIMESTAMP, 30, 300000, 0),
(6, 'It', 5, 'HORROR', NULL, CURRENT_TIMESTAMP, 70, 100000, 0);

CREATE TABLE shopping_session (
  id bigint NOT NULL AUTO_INCREMENT,
  customerId bigint NOT NULL,
  loginTime datetime(6) NOT NULL,
  totalPrice decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE item_quantity (
  id bigint NOT NULL AUTO_INCREMENT,
  itemId bigint NOT NULL,
  quantity int NOT NULL,
  cartId bigint DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FKk27o449e3tj5x56psw1b6o00o (cartId),
  CONSTRAINT FKk27o449e3tj5x56psw1b6o00o FOREIGN KEY (cartId) REFERENCES shopping_session (id)
);

CREATE TABLE order_register (
  id bigint NOT NULL AUTO_INCREMENT,
  date datetime(6) DEFAULT NULL,
  status int DEFAULT NULL,
  totalPrice decimal(19,2) NOT NULL,
  customerId bigint NOT NULL,
  PRIMARY KEY (id),
  KEY FK5ix8365bxvpx0u34akw4e0o8r (customerId),
  CONSTRAINT FK5ix8365bxvpx0u34akw4e0o8r FOREIGN KEY (customerId) REFERENCES customer (id)
);

CREATE TABLE order_line (
  id bigint NOT NULL AUTO_INCREMENT,
  quantity int NOT NULL,
  itemId bigint NOT NULL,
  orderId bigint NOT NULL,
  PRIMARY KEY (id),
  KEY FKfy23monngyjy4cl06ujfd053v (itemId),
  KEY FKofl480wotvrd8y5lf861mwlj2 (orderId),
  CONSTRAINT FKfy23monngyjy4cl06ujfd053v FOREIGN KEY (itemId) REFERENCES item (id),
  CONSTRAINT FKofl480wotvrd8y5lf861mwlj2 FOREIGN KEY (orderId) REFERENCES order_register (id)
);






