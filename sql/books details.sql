CREATE TABLE `books` (
  `book_id` int NOT NULL,
  `isbn` int DEFAULT NULL,
  `title` varchar(45) NOT NULL,
  `authord_id` int NOT NULL,
  `category_id` int NOT NULL,
  `price` int NOT NULL,
  `qty_instock` int NOT NULL,
  `published_year` int DEFAULT NULL,
  `language` varchar(45) NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `authod_id_idx` (`authord_id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `authod_id` FOREIGN KEY (`authord_id`) REFERENCES `author` (`author_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `book_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
