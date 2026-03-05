USE calc_data;

DROP TABLE IF EXISTS calc_results;

CREATE TABLE calc_results (
  id INT AUTO_INCREMENT PRIMARY KEY,
  number1 DOUBLE NOT NULL,
  number2 DOUBLE NOT NULL,
  sum_result DOUBLE NOT NULL,
  product_result DOUBLE NOT NULL,
  subtract_result DOUBLE NOT NULL,
  division_result DOUBLE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);