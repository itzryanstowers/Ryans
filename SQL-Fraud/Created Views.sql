CREATE VIEW card_holder_25_jan_to_june as SELECT a.card_holder_id,
    a.customer_name,
    b.card_number,
    c.transaction_id,
    c.transaction_date,
    c.amount,
    c.merchant_id
   FROM card_holder a
     LEFT JOIN credit_card b ON a.card_holder_id = b.card_holder_id
     LEFT JOIN transaction c ON b.card_number::text = c.card_number::text
  WHERE a.card_holder_id = 25 AND c.transaction_date >= '2018-01-01 00:00:00'::timestamp without time zone AND c.transaction_date <= '2018-06-30 00:00:00'::timestamp without time zone;


CREATE VIEW cardholder_view as SELECT a.card_holder_id,
    a.customer_name,
    b.card_number,
    c.transaction_id,
    c.transaction_date,
    c.amount,
    c.merchant_id
   FROM card_holder a
     LEFT JOIN credit_card b ON a.card_holder_id = b.card_holder_id
     LEFT JOIN transaction c ON b.card_number::text = c.card_number::text
  WHERE a.card_holder_id = 2 OR a.card_holder_id = 18;
  
  
CREATE VIEW top_100_transactions as SELECT a.card_holder_id,
    a.customer_name,
    b.card_number,
    c.transaction_id,
    c.transaction_date,
    c.amount,
    c.merchant_id
   FROM card_holder a
     LEFT JOIN credit_card b ON a.card_holder_id = b.card_holder_id
     LEFT JOIN transaction c ON b.card_number::text = c.card_number::text
  WHERE (a.card_holder_id = 2 OR a.card_holder_id = 18) AND EXTRACT(hour FROM c.transaction_date) >= 7::numeric AND EXTRACT(hour FROM c.transaction_date) <= 9::numeric
  ORDER BY c.amount DESC
 LIMIT 100;
 
 
CREATE VIEW top_merchants as SELECT a.merchant_id,
    b.merchant,
    c.category,
    count(*) AS small_transaction_count
   FROM transaction a
     JOIN merchant b ON a.merchant_id = b.merchant_id
     LEFT JOIN merchant_category c ON b.category_id = c.merchant_category_id
  WHERE a.amount < 2.00
  GROUP BY a.merchant_id, b.merchant, c.category
  ORDER BY (count(*)) DESC
 LIMIT 5;
 
 
CREATE VIEW transactions_under_$2 as SELECT a.card_holder_id,
    a.customer_name,
    b.card_number,
    c.transaction_date,
    c.amount,
    c.merchant_id
   FROM card_holder a
     LEFT JOIN credit_card b ON a.card_holder_id = b.card_holder_id
     LEFT JOIN transaction c ON b.card_number::text = c.card_number::text
  WHERE (a.card_holder_id = 2 OR a.card_holder_id = 18) AND c.amount < 2.00;

