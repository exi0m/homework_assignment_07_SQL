---Transaction isolation per credit card user---
CREATE VIEW credit_card_transactions AS 
SELECT ch.name, cc.card, t.date, t.amount
FROM card_holder AS ch
INNER JOIN credit_card AS cc ON cc.card_holder = ch.id
INNER JOIN transaction AS t ON t.card = cc.card
ORDER BY ch.name;

---100 highest transactions between 7 AM - 9 AM---
CREATE VIEW early_transactions AS
SELECT amount, date
FROM transaction
WHERE CAST(date as time) > cast('7:00' as time) 
    AND CAST(date as time) < cast ('9:00' as time)
ORDER BY amount DESC
LIMIT 100;

---Fradulent count of transactions < 2.00---
CREATE VIEW fraud_count AS
SELECT ch.name, COUNT(amount)
FROM transaction AS t
INNER JOIN credit_card AS cc ON cc.card = t.card
INNER JOIN card_holder AS ch ON ch.id = cc.card_holder
WHERE amount < 2.00
GROUP BY ch.name;

--Select the top 5 companies with transactions less than $2.00
CREATE VIEW top_5_frauded_merchants AS
SELECT COUNT(amount), m.name
FROM transaction AS t
INNER JOIN merchant AS m ON m.ID = t.id_merchant
WHERE amount < 2.00
GROUP BY m.name
ORDER BY count DESC
LIMIT 5;
