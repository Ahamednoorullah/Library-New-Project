CREATE TABLE `order` (
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `book_id` int NOT NULL,
  `qty` int NOT NULL,
  `total` int NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id_idx` (`customer_id`),
  KEY `book_id_idx` (`book_id`),
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
