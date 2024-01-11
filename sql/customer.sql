CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `email_idx` (`email`),
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `user_details` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
