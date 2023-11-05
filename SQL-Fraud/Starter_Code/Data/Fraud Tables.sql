DROP TABLE IF EXISTS merchant_category CASCADE; 
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

CREATE TABLE merchant_category(
  merchant_category_id SERIAL,
  category VARCHAR(30) NOT NULL,
  PRIMARY KEY (merchant_category_id)
);

CREATE TABLE merchant (
    merchant_id SERIAL,
    merchant VARCHAR(30) NOT NULL,
    category_id INTEGER REFERENCES merchant_category(merchant_category_id),
    PRIMARY KEY (merchant_id)
);

CREATE TABLE card_holder(
	card_holder_id SERIAL,
	customer_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (card_holder_id)
);

CREATE TABLE credit_card (
    card_number VARCHAR(20),
    card_holder_id INTEGER REFERENCES card_holder(card_holder_id),
    PRIMARY KEY (card_number)
);

CREATE TABLE transaction (
    transaction_id SERIAL,
    transaction_date TIMESTAMP,
    amount NUMERIC,
    card_number VARCHAR(20)REFERENCES credit_card(card_number),
    merchant_id INTEGER REFERENCES merchant(merchant_id),
    PRIMARY KEY (transaction_id)
);


