USE fraud_project;

CREATE TABLE transactions (
  transaction_id     BIGINT,
  merchant_id        BIGINT,
  user_id            BIGINT,
  card_number        VARCHAR(30),
  transaction_date   DATETIME,
  transaction_amount DECIMAL(10,2),
  device_id          VARCHAR(30),
  has_cbk            VARCHAR(5)
);

-- Check row count (should be 3199)
SELECT COUNT(*) FROM transactions;

-- Preview first 5 rows
SELECT * FROM transactions LIMIT 5;

