-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: udemy_dev
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book_items`
--

DROP TABLE IF EXISTS `book_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `transaction_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqyn1nbnxgcpoiy05rshw5vgmn` (`course_id`),
  KEY `FKj7xupl3se0r2r49ewwqhm3rpx` (`transaction_id`),
  CONSTRAINT `FKj7xupl3se0r2r49ewwqhm3rpx` FOREIGN KEY (`transaction_id`) REFERENCES `sale` (`transaction_id`) ON DELETE CASCADE,
  CONSTRAINT `FKqyn1nbnxgcpoiy05rshw5vgmn` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_items`
--

LOCK TABLES `book_items` WRITE;
/*!40000 ALTER TABLE `book_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `course_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1pvbbq921pknnn6rl5hjbedq4` (`user_id`,`course_id`),
  KEY `FK1vllsie342rrqn6niy90pufd5` (`course_id`),
  CONSTRAINT `FK1vllsie342rrqn6niy90pufd5` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKg5uhi8vpsuy0lgloxk2h4w5o6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (3,'2024-01-04 09:18:32.000000',0.00,27,2),(4,'2024-01-04 09:18:43.000000',1000.00,10,2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_objectives`
--

DROP TABLE IF EXISTS `course_objectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_objectives` (
  `id` int NOT NULL AUTO_INCREMENT,
  `objective` varchar(255) DEFAULT NULL,
  `course_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe14b2c5dqha8fmbx7vwlebss7` (`course_id`),
  KEY `FKewyd971c0ppwq8qtw29t3ga35` (`user_id`),
  CONSTRAINT `FKe14b2c5dqha8fmbx7vwlebss7` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKewyd971c0ppwq8qtw29t3ga35` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_objectives`
--

LOCK TABLES `course_objectives` WRITE;
/*!40000 ALTER TABLE `course_objectives` DISABLE KEYS */;
INSERT INTO `course_objectives` VALUES (1,'Rèn luyện tư duy lập trình và tư duy giải quyết vấn đề trong thực tế',8,1),(2,'Nền tảng vững chắc về lập trình Java cơ bản',8,1),(3,'Nắm vững các kỹ thuật thao tác với Array và String trong thực tế',8,1),(4,'Nắm vững triệt để tinh thần của lập trình hướng đối tượng',8,1),(5,'Giá trị đầu tiên chính là chương trình được thiết kế khoa học từ cơ bản đến nâng cao. Các bạn sẽ được tiếp cận kiến thức theo dự án thực tế.',9,1),(6,'Cụ thể, quá trình sẽ kéo dài từ khi nhận dự án cho đến khi hoàn thành sản phẩm (ứng dụng web), đóng gói và bàn giao sản phẩm. Mỗi giai đoạn sẽ là có các kỹ năng, kiến thức trọng tâm để sinh viên phát huy năng lực và tối ưu thời gian học tập',9,1),(7,'Cùng với đó, sinh viên cũng được trang bị đầy đủ kỹ năng để quản lý thành thạo dự án.',9,1),(8,'Đây cũng là nền tảng để sinh viên trau dồi kiến thức, kỹ năng để phụ trách 2 mảng Front end và Backend (Full-Stack) của một dự án.',9,1),(9,'Thành thạo Photoshop để thiết kế Banner Ecommerce, Social, Poster sản phẩm, cắt ghép Manipulation, chỉnh sửa ảnh, cùng nhiều ứng dụng khác liên quan đến Photoshop.',10,1),(10,'Có được một nền tảng vững chắc để tiếp tục phát triển trong lĩnh vực khác như Thiết Kế Đồ Hoạ, Thiết Kế UI/UX, Thiết Kế Video, Digital Painting, Đồ Họa 3D ...',10,1),(11,'Có thể làm được banner quảng cáo \"độc\" và \"lạ\"',10,1),(12,'Có thể tạo ra những bức ảnh động',10,1),(13,'Nắm vững kiến thức về cấu trúc, thông số của video.',11,1),(14,'Làm chủ phần mềm dựng phim Premiere cùng các hiệu ứng, plug-in phổ dụng khi dựng phim.',11,1),(15,'Tự mình biên tập, cắt ghép những đoạn phim rời rạc thành một video hoàn chỉnh có nội dung có tiết tấu, như Video Promotion, Travel, Vlog, Phóng Sự...',11,1),(16,'Có một nền tảng vững chắc về video để phát triển xa hơn. ',11,1),(17,'Có cái nhìn tổng quan về tài chính, tài chính doanh nghiệp;',12,1),(18,'Biết cách tổ chức & quản lý công tác quản trị tài chính doanh nghiệp;',12,1),(19,'Hoạch định tài chính doanh nghiệp;',12,1),(20,'Phân tích tình hình tài chính của doanh nghiệp;',12,1),(21,'Hành trình 6 tháng, với 5 học phần và ~30 bài giảng. Tôi sẽ dẫn dắt các anh chị đi từ những người hoàn toàn chưa biết gì đến khi có thể tự tin đầu tư.',13,1),(22,'Đây sẽ là nơi các anh chị gặp gỡ và giao lưu với những học viên khác có cùng những tương quan về phong cách sống và đầu tư',13,1),(23,'Định kỳ, cộng đồng học viên sẽ có những hoạt động gặp gỡ và giao lưu. Từ đó có thể kết nối và hỗ trợ nhau trong nhiều lĩnh vực khác của cuộc sống bên cạnh hoạt động đầu tư.',13,1),(24,'Khi tham gia khoá học, ngoài việc theo dõi các bài giảng trong khu vực lớp học. Các anh chị cũng sẽ được mời vào một kênh podcast dành riêng cho học viên.',13,1),(33,'Các kiến thức về ghép nối vào ra, mô-đun chức năng tích hợp.',17,1),(34,'Các kiến thức về lập trình C cho vi điều khiển.',17,1),(35,'Phương pháp xây dựng giải thuật điều khiển cho các ứng dụng.',17,1),(36,'Lập trình giao tiếp, điều khiển và thu thập dữ liệu từ các thiết bị ngoại vi',17,1),(53,'Học viên tốt nghiệp có được kỹ năng xử lý công việc tương đương với người đã đi làm 06 tháng tới 1 năm.',22,1),(54,'Được cấp chứng nhận đào tạo VinaTrain – chứng nhận uy tín nhất trong ngành.',22,1),(55,'Bên cạnh thời gian trên lớp, bộ phận hỗ trợ luôn luôn lắng nghe và giải đáp thắc mắc, điều này rất quan trọng khi bạn đã tốt nghiệp.',22,1),(56,'Giảng viên tại VinaTrain hầu hết là những chuyên gia nắm giữ vị trí quan trọng trong doanh nghiệp hay trường đại học.',22,1),(57,'Học viên hoàn thành tốt khóa học được trở thành Trợ giảng tại CodeStar với mức lương và cơ hội thăng tiến siêu hấp dẫn.',23,1),(58,'Được giới thiệu cơ hội nghề nghiệp tại doanh nghiệp IT',23,1),(59,'Được tham gia vào group chia sẻ kiến thức về AWS cùng các giảng viên, chuyên gia và các Học viên cũ tại CodeStar.',23,1),(60,'Được hướng dẫn các kỹ năng mềm, phục vụ công việc.',23,1),(73,'khóa học cung cấp kỹ năng về lập trình',27,1),(74,'Khóa học cung cấp kỹ năng về lập trình ngắn hạn',27,1),(75,'Khóa học cung cấp kỹ năng về lập trình dài hạn',27,1),(76,'Khóa học cung cấp kỹ năng về quản lý source code\n\n',27,1);
/*!40000 ALTER TABLE `course_objectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `is_featured` bit(1) NOT NULL DEFAULT b'0',
  `price` decimal(6,2) NOT NULL,
  `rating` decimal(6,2) NOT NULL DEFAULT '0.00',
  `subtitle` varchar(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CATEGORY` (`category`),
  KEY `FK51k53m6m5gi9n91fnlxkxgpmv` (`user_id`),
  CONSTRAINT `FK51k53m6m5gi9n91fnlxkxgpmv` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (8,'Lập trình',_binary '\0',500.00,5.00,'Sau khi hoàn tất khóa học học viên sẽ được trang bị kiến thức vững chắc về ngôn ngữ lập trình JAVA.','http://res.cloudinary.com/dfmuw2nsr/image/upload/v1704132624/n6jf8qreag0ailt1n3ng.jpg','Lập trình JAVA',1),(9,'Lập trình',_binary '\0',3500.00,0.00,'nắm vững kiến thức, kỹ năng xây dựng và phát triển dịch vụ, đa dịch vụ trong python','http://res.cloudinary.com/dfmuw2nsr/image/upload/v1703928975/xpitexqdurtorvmnexhx.jpg','Lập trình python ',1),(10,'Đồ họa',_binary '\0',1000.00,0.00,'Khóa học Photoshop Basic sẽ mang đến cho bạn kiến thức thiết kế từ cơ bản đến cấp trung.','http://res.cloudinary.com/dfmuw2nsr/image/upload/v1703929359/u6we68ijwoagwjoudsow.png','KHÓA HỌC PHOTOSHOP CƠ BẢN',1),(11,'Đồ họa',_binary '\0',3700.00,4.00,' khóa học cung cấp kiến thức từ cơ bản đến thành thạo phần mềm dựng phim Premiere.','http://res.cloudinary.com/dfmuw2nsr/image/upload/v1703929808/hjb00ihdj5n2k5gainqz.png','Khóa học Dựng Phim Premiere',1),(12,'Tài chính',_binary '\0',5000.00,0.00,'Chương trình này không giúp bạn trở thành chuyên gia tài chính, mà chỉ giúp bạn nghiên cứu tài chính dưới góc độ của một nhà quản lý không chuyên về tài chính kế toán.','http://res.cloudinary.com/dfmuw2nsr/image/upload/v1703930183/nfgbpdyvu1cfiecpihix.webp','TÀI CHÍNH DÀNH CHO LÃNH ĐẠO',1),(13,'Đầu tư',_binary '\0',5000.00,0.00,'ĐẦU TƯ CHỨNG KHOÁN CHO NGƯỜI MỚI BẮT ĐẦU','http://res.cloudinary.com/dfmuw2nsr/image/upload/v1703930389/jdi4s7zxvj4czws9pws5.png','KHÓA HỌC ĐẦU TƯ 2023',1),(17,'Kỹ thuật',_binary '\0',1000.00,0.00,'Khóa học giúp học viên tiếp cận, nắm bắt vững chắc những kiến thức vi điều khiển nhanh nhất, mới nhất, thực tế nhất về PIC. ','http://res.cloudinary.com/dfmuw2nsr/image/upload/v1703931706/utifzevdtigdzxjn8wbg.jpg','Vi Điều khiển PIC',1),(22,'Kỹ thuật',_binary '\0',1500.00,0.00,'VinaTrain là hệ thống đào tạo nghiệp vụ thực tế hàng đầu, chuyên về đào tạo chất lượng cao.','http://res.cloudinary.com/dfmuw2nsr/image/upload/v1703945938/sxuw7rq1xzn61cbhkkev.png','Khóa Học Tin Học Văn Phòng VinaPro Từ Cơ Bản Đến Nâng Cao',1),(23,'Kỹ thuật',_binary '\0',1500.00,0.00,'nhu cầu tuyển dụng các vị trí Dev, DevOps,  TechLeader yêu cầu hiểu biết về AWS đang ngày càng gia tăng với mức lương siêu khủng hàng tháng giao động từ $1000 – $2000','http://res.cloudinary.com/dfmuw2nsr/image/upload/v1703946059/x8pe0gtz6ontpf9w1rqp.jpg','Khóa học AWS cơ bản',1),(27,'Lập trình',_binary '\0',0.00,0.00,'Khóa học cung cấp kĩ năng lập trình C','http://res.cloudinary.com/dfmuw2nsr/image/upload/v1704339901/nkxjn8bajl1vhpncrskk.png','Khóa học kĩ thuật lập trình C',1);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll_progress`
--

DROP TABLE IF EXISTS `enroll_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll_progress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enrollment_id` int NOT NULL,
  `lesson_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK32umfdeyled2xd6k7bn3tfb0w` (`enrollment_id`,`lesson_id`),
  KEY `FKhdmxj9myosisgvjkioragxejy` (`lesson_id`),
  CONSTRAINT `FK55yx3pbldbupu7yuithq26w2q` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKhdmxj9myosisgvjkioragxejy` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll_progress`
--

LOCK TABLES `enroll_progress` WRITE;
/*!40000 ALTER TABLE `enroll_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `enroll_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `is_completed` bit(1) NOT NULL DEFAULT b'0',
  `next_position` int DEFAULT '1',
  `progress` decimal(6,2) NOT NULL DEFAULT '0.00',
  `updated_at` datetime(6) DEFAULT NULL,
  `course_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKg1muiskd02x66lpy6fqcj6b9q` (`user_id`,`course_id`),
  KEY `FKho8mcicp4196ebpltdn9wl6co` (`course_id`),
  CONSTRAINT `FK3hjx6rcnbmfw368sxigrpfpx0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKho8mcicp4196ebpltdn9wl6co` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,'2024-01-03 13:37:05.320532',_binary '\0',3,2.00,'2024-01-05 09:18:01.494739',11,2),(2,'2024-01-03 13:38:42.884806',_binary '\0',1,0.00,'2024-01-03 13:38:42.884806',12,2),(3,'2024-01-03 17:05:58.878447',_binary '\0',3,2.00,'2024-01-05 10:17:28.320344',8,2),(4,'2024-01-04 09:17:54.450568',_binary '\0',1,0.00,'2024-01-04 09:17:54.450568',9,2),(5,'2024-01-06 11:02:31.108146',_binary '\0',1,0.00,'2024-01-06 11:02:31.108146',13,2),(6,'2024-01-06 11:02:31.107134',_binary '\0',1,0.00,'2024-01-06 11:02:31.107134',22,2);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forgot_password_request`
--

DROP TABLE IF EXISTS `forgot_password_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forgot_password_request` (
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forgot_password_request`
--

LOCK TABLES `forgot_password_request` WRITE;
/*!40000 ALTER TABLE `forgot_password_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `forgot_password_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `length_seconds` int DEFAULT '0',
  `lesson_name` varchar(255) NOT NULL,
  `position` int NOT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `course_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK5rc5ey050uiufedyhwrxgsiws` (`course_id`,`position`),
  KEY `FKl7f7d2sg5hj9ltfbyrhf1l3ou` (`user_id`),
  CONSTRAINT `FK17ucc7gjfjddsyi0gvstkqeat` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKl7f7d2sg5hj9ltfbyrhf1l3ou` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (2,NULL,'Video asiad ',5,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704038123/f7d7qmpiovfpwq0tgeu3.mp4',11,1),(3,NULL,'Cấu trúc video trong video dài phần 1',2,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704038362/mmve9h9zy83almn7twla.mp4',11,1),(21,NULL,'Làm quen với Adobe Premiere',4,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704042957/wrbtvlfwi8bcgryichm2.mp4',11,1),(25,NULL,'Bài giảng nhập môn xử lý video',1,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704127562/z8sol6dalswm2i4kqtp6.mp4',11,1),(26,NULL,'Lớp trong java',2,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704133436/oymsmwhlsbvibvyj4vq8.mp4',8,1),(28,NULL,'Vòng lặp trong Java',6,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704158239/eqnj0jaq7r9hq67sgjtp.mp4',8,1),(29,NULL,'ArrayList trong java',11,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704155819/xytzhfaw4jibrm3pbkjr.mp4',8,1),(30,NULL,'Throw và Throws - Khác biệt như nào ?',4,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704156660/b7fbnmo8so0ikbbo3xgs.mp4',8,1),(32,NULL,'Nghệ thuật xử lý Exception',5,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704156924/vc8yisggw2yyr1pjlodh.mp4',8,1),(33,NULL,'Java là gì ?',1,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704158709/c3ui8mfvs1riwuhskqgz.mp4',8,1),(34,NULL,'Vòng lặp For trong Java ',7,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704158748/a2qpyo6dcafymglzekij.mp4',8,1),(35,NULL,'OOP trong java (Cơ bản nhất)',9,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704158972/dlqw0jremwlr73i0dkq8.mp4',8,1),(37,NULL,'Câu lệnh rẽ nhánh có điều kiện (If-else)',8,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704159047/ff8acf2pfkedvz1badh4.mp4',8,1),(38,NULL,'Enum trong java',10,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704159303/i7wvwzxdba2imjaa1npl.mp4',8,1),(39,NULL,'Bí mật về hàm main. Khá thú vị đấy !',3,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704159344/ryeounciftunf9ltaytm.mp4',8,1),(40,NULL,'Cách sử dụng This/That trong java',12,'http://res.cloudinary.com/dfmuw2nsr/video/upload/v1704340274/v1vvu7xxpcphfujumpoh.mp4',8,1);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons_seq`
--

DROP TABLE IF EXISTS `lessons_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons_seq`
--

LOCK TABLES `lessons_seq` WRITE;
/*!40000 ALTER TABLE `lessons_seq` DISABLE KEYS */;
INSERT INTO `lessons_seq` VALUES (51);
/*!40000 ALTER TABLE `lessons_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `transaction_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKy4aiomvn1gl62yjreckpt6lv` (`course_id`),
  KEY `FKceser0bpu7s99jinnuax1ys5u` (`transaction_id`),
  CONSTRAINT `FKceser0bpu7s99jinnuax1ys5u` FOREIGN KEY (`transaction_id`) REFERENCES `sales` (`transaction_id`) ON DELETE CASCADE,
  CONSTRAINT `FKy4aiomvn1gl62yjreckpt6lv` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `rating` int NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `course_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKgvg1ect42p0nkk171cbuwho8o` (`user_id`,`course_id`),
  KEY `FKccbfc9u1qimejr5ll7yuxbtqs` (`course_id`),
  CONSTRAINT `FKccbfc9u1qimejr5ll7yuxbtqs` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKcgy7qjc1r99dp117y9en6lxye` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'','2024-01-06 04:47:53.327170',5,'2024-01-06 04:47:53.327170',8,2),(2,'Khóa học tuyệt vời quá đi mất nhưng thích cho 3.5 sao vì thích đã bảo là thích rồi =))))\n','2024-01-06 04:51:53.681999',4,'2024-01-06 05:27:00.159942',11,2);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `transaction_id` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `number_of_items` int NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `total_paid` decimal(6,2) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `FKa2s1ujlsxsr9sffgbrqst4bgk` (`user_id`),
  CONSTRAINT `FKa2s1ujlsxsr9sffgbrqst4bgk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (_binary '~\�l��M���<�Mt','2024-01-01 02:17:43.082287',1,'MOMO',100.00,2);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `transaction_id` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `total_paid` decimal(6,2) NOT NULL,
  `user_id` int NOT NULL,
  `number_of_items` int NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `FK5bgaw8g0rrbqdvafq36g58smk` (`user_id`),
  CONSTRAINT `FK5bgaw8g0rrbqdvafq36g58smk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auth_provider` enum('LOCAL','GOOGLE') NOT NULL DEFAULT 'LOCAL',
  `created_at` datetime(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_role` enum('ROLE_STUDENT','ROLE_ADMIN','ROLE_TEACHER') NOT NULL DEFAULT 'ROLE_STUDENT',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'LOCAL','2023-12-30 06:32:35.520140','nguyenminhtam01632.fetel@gmail.com','Nguyễn Minh Tâm','$2a$12$JW0RKPoz.Db5jnL7IBCqcOr3W2/jAMh3LPSkrSDQK9NVecds9xXgW','ROLE_TEACHER'),(2,'LOCAL','2024-01-01 01:30:27.476649','tamlom2002@gmail.com','Nguyễn Tâm','$2a$12$y1YvY6l9hlT/iIc8.kKwzOmjE56yJyO4CBHjGgz3ORhfoqSOQw5D2','ROLE_STUDENT'),(3,'LOCAL','2024-01-01 14:23:33.508464','abcd@gmail.com','Minh Tâm vip pro','$2a$12$fWDnQCb8Wss3uf.lmtQXD.BqLHXvZwLxUfxihIe2hSsv1Wr5hqhwa','ROLE_STUDENT');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `course_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkboogsaq79fml6t4a7rjhphg7` (`user_id`,`course_id`),
  KEY `FK3oou0jaquu0ulln4n7xs3ltao` (`course_id`),
  CONSTRAINT `FK3oou0jaquu0ulln4n7xs3ltao` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKtrd6335blsefl2gxpb8lr0gr7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,'2024-01-03 10:47:27.000000',8,2),(52,'2024-01-03 16:10:38.000000',10,2),(59,'2024-01-03 16:31:21.000000',9,2),(66,'2024-01-03 17:12:10.000000',11,2),(68,'2024-01-04 12:56:24.000000',27,2),(69,'2024-01-04 13:03:44.000000',22,2),(70,'2024-01-04 13:05:02.000000',13,2);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-06 19:46:34
