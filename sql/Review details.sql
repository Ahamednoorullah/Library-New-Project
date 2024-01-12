CREATE TABLE `review` (
  `customer_id` int NOT NULL,
  `book_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `review_id` int NOT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
