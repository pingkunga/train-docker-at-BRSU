CREATE TABLE IF NOT EXISTS TAX_DEDUCTIONCONFIG (
  id SERIAL PRIMARY KEY,
  deduction_type VARCHAR(30) NOT NULL,
  deduction_amount DECIMAL(10,2) NOT NULL,
  deduction_min DECIMAL(10,2) NOT NULL,
  deduction_max DECIMAL(10,2) NOT NULL
);

INSERT INTO TAX_DEDUCTIONCONFIG (deduction_type, deduction_amount, deduction_min, deduction_max) VALUES
 ('personal', 60000, 10000, 100000),
 ('donation', 0, 0, 100000),
 ('k-receipt', 50000, 0, 100000);