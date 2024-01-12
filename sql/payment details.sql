CREATE TABLE `payment_billing` (
  `billing_id` int NOT NULL,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `amount` int NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `payment_status` varchar(45) NOT NULL,
  PRIMARY KEY (`billing_id`),
  KEY `order_id_idx` (`order_id`),
  KEY `customer_id_idx` (`customer_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
