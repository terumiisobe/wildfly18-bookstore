USE benmk1;

DELETE FROM order_line;
DELETE FROM order_register;
DELETE FROM shopping_session;
DELETE FROM customer;
INSERT INTO customer(id, birthDate, email, fullName, password, phoneNumber, username, addressId) VALUES (1000, NULL, NULL, 'Terumi Isobe', 'password', NULL, 'terumiisobe', 1);
INSERT INTO customer(id, birthDate, email, fullName, password, phoneNumber, username, addressId) VALUES (1001, NULL, NULL, 'João Grams', 'password', NULL, 'joaograms', 1);






