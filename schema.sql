DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;


CREATE TABLE card_holder(
	ID INT PRIMARY KEY NOT NULL,
	name VARCHAR(100)
);
CREATE TABLE credit_card(
	card VARCHAR(20) PRIMARY KEY NOT NULL,
	card_holder INT,
	FOREIGN KEY (card_holder) REFERENCES card_holder(ID)
);

CREATE TABLE merchant_category(
	ID int PRIMARY KEY NOT NULL,
	name VARCHAR(50)
);

CREATE TABLE merchant(
	ID int PRIMARY KEY NOT NULL,
	name VARCHAR(50),
	id_merchant_category INT,
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(ID)
);

CREATE TABLE transaction(
	ID int PRIMARY KEY NOT NULL,
	date VARCHAR(50),
	amount FLOAT(50),
	card VARCHAR(50),
	FOREIGN KEY (card) REFERENCES credit_card(card),
	id_merchant INT,
	FOREIGN KEY (id_merchant) REFERENCES merchant(ID)
);
