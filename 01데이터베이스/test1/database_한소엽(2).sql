Use world;
DROP TABLE IF EXISTS exchange_rate;

CREATE TABLE exchange_rate (
    Code2 CHAR(3) PRIMARY KEY,
    country_name VARCHAR(40) NOT NULL,
    Currency_name VARCHAR(40) NOT NULL,
    Exchange_Rate FLOAT DEFAULT NULL,
    Cash_Buying FLOAT DEFAULT NULL,
    Cash_Selling FLOAT DEFAULT NULL,
    Remit_Sending FLOAT DEFAULT NULL,
    Remit_Receiving FLOAT DEFAULT NULL,
    USD_Conv_Rate FLOAT DEFAULT NULL,
    Date DATETIME NOT NULL
);

INSERT INTO exchange_rate 
(Code2, country_name, Currency_name, Exchange_Rate, Cash_Buying, Cash_Selling, Remit_Sending, Remit_Receiving, USD_Conv_Rate, Date)
VALUES
('USA',  '미국','USD', 1377.00, 1401.09, 1352.91, 1390.40, 1363.60, 1, '2024-07-13'),
("EU", '유럽연합', "EUR", 1501.55, 1531.43, 1471.67, 1516.56, 1486.54, 1.091 ,'2024-07-13'),
('JPN','일본','JPN(100엔)', 872.07, 887.33, 856.81, 880.61, 863.53, 0.633, '2024-07-13'),
("CHN",  "중국","CNY", 189.37, 198.83, 179.91, 191.26, 187.48, 0.138, '2024-07-13'),
('GBR',  '영국','GBR', 1799.10, 1823.32, 1752.88, 1805.98, 1770.22, 1.299, '2024-07-13');


Select* From exchange_rate;
commit;
