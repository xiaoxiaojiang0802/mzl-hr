-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: jiangjin-hotel
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `hot_cost`
--

DROP TABLE IF EXISTS `hot_cost`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_cost`
(
    `cost_id`     bigint NOT NULL,
    `money`       decimal(10, 2)                          DEFAULT NULL,
    `remark`      varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `create_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    `category`    char(2) COLLATE utf8mb4_general_ci      DEFAULT NULL,
    `date`        datetime                                DEFAULT NULL,
    PRIMARY KEY (`cost_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='成本';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_cost`
--

LOCK TABLES `hot_cost` WRITE;
/*!40000 ALTER TABLE `hot_cost`
    DISABLE KEYS */;
INSERT INTO `hot_cost`
VALUES (1639835103301328898, 55.00, NULL, 'admin', '2023-03-26 11:42:10', 'admin', '2023-03-26 11:49:30', '2',
        '2023-03-26 02:03:02');
/*!40000 ALTER TABLE `hot_cost`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_daily_paper`
--

DROP TABLE IF EXISTS `hot_daily_paper`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_daily_paper`
(
    `daily_paper_id`   bigint NOT NULL,
    `data_sale`        date                                    DEFAULT NULL,
    `sales`            decimal(10, 2)                          DEFAULT NULL,
    `hour_room_amount` decimal(10, 2)                          DEFAULT NULL,
    `check_in`         int                                     DEFAULT NULL,
    `hour_room`        bigint                                  DEFAULT NULL,
    `duty`             varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值班人员',
    `business_json`    json                                    DEFAULT NULL COMMENT '经营情况',
    `room_type_json`   json                                    DEFAULT NULL COMMENT '酒店类型',
    `create_by`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`      datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`      datetime                                DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`daily_paper_id`),
    UNIQUE KEY `actable_uni_data_sale` (`data_sale`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_daily_paper`
--

LOCK TABLES `hot_daily_paper` WRITE;
/*!40000 ALTER TABLE `hot_daily_paper`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `hot_daily_paper`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_guest`
--

DROP TABLE IF EXISTS `hot_guest`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_guest`
(
    `guest_id`       bigint NOT NULL,
    `room_record_id` bigint                                  DEFAULT NULL,
    `guest_name`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客人名称',
    `phone_number`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
    `card_id`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证件号',
    `address`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '居住地址',
    `create_by`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`    datetime                                DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`guest_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_guest`
--

LOCK TABLES `hot_guest` WRITE;
/*!40000 ALTER TABLE `hot_guest`
    DISABLE KEYS */;
INSERT INTO `hot_guest`
VALUES (1639816591174340608, NULL, '李四', NULL, NULL, NULL, 'admin', '2023-03-26 10:28:36', 'admin',
        '2023-03-26 10:28:36');
/*!40000 ALTER TABLE `hot_guest`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_guest_guest_order`
--

DROP TABLE IF EXISTS `hot_guest_guest_order`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_guest_guest_order`
(
    `guest_id`       bigint NOT NULL,
    `guest_order_id` bigint NOT NULL,
    PRIMARY KEY (`guest_id`, `guest_order_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_guest_guest_order`
--

LOCK TABLES `hot_guest_guest_order` WRITE;
/*!40000 ALTER TABLE `hot_guest_guest_order`
    DISABLE KEYS */;
INSERT INTO `hot_guest_guest_order`
VALUES (1639816591098843137, 1639816591098843136),
       (1639816591174340608, 1639816591098843136);
/*!40000 ALTER TABLE `hot_guest_guest_order`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_guest_order`
--

DROP TABLE IF EXISTS `hot_guest_order`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_guest_order`
(
    `guest_order_id`     bigint                             NOT NULL,
    `start_date`         date                                    DEFAULT NULL COMMENT '开房日期',
    `end_date`           date                                    DEFAULT NULL COMMENT '离店日期',
    `order_amount`       decimal(10, 2)                     NOT NULL COMMENT '订单金额',
    `order_state`        char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'hot_order_state',
    `check_out`          char(1) COLLATE utf8mb4_general_ci      DEFAULT NULL,
    `pay_method`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `order_platform`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `create_by`          varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`        datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`          varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`        datetime                                DEFAULT NULL COMMENT '更新时间',
    `room_id`            bigint                                  DEFAULT NULL,
    `guest_name`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `timeout_price`      decimal(10, 2)                          DEFAULT NULL,
    `timeout`            varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `timeout_pay_method` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `remark`             varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `live_type`          varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `room_number`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_guest_order`
--

LOCK TABLES `hot_guest_order` WRITE;
/*!40000 ALTER TABLE `hot_guest_order`
    DISABLE KEYS */;
INSERT INTO `hot_guest_order`
VALUES (1639816591098843136, '2023-03-26', '2023-03-27', 44.00, '3', '0', '1', '4', 'admin', '2023-03-26 10:28:36',
        'admin', '2023-03-26 10:28:36', 1635265884148543491, '李四', NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `hot_guest_order`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_infrastructure`
--

DROP TABLE IF EXISTS `hot_infrastructure`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_infrastructure`
(
    `infrastructure_id`   bigint NOT NULL,
    `room_type_id`        bigint NOT NULL,
    `infrastructure_name` varchar(4) COLLATE utf8mb4_general_ci   DEFAULT NULL,
    `description`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `order_num`           int                                     DEFAULT NULL,
    `create_by`           varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`         datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`           varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`         datetime                                DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='房间基础设施';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_infrastructure`
--

LOCK TABLES `hot_infrastructure` WRITE;
/*!40000 ALTER TABLE `hot_infrastructure`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `hot_infrastructure`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_infrastructure_temp`
--

DROP TABLE IF EXISTS `hot_infrastructure_temp`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_infrastructure_temp`
(
    `infrastructure_temp_id` bigint NOT NULL,
    `infrastructure_name`    varchar(4) COLLATE utf8mb4_general_ci   DEFAULT NULL,
    `description`            varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `order_num`              int                                     DEFAULT NULL,
    `create_by`              varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`            datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`              varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`            datetime                                DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`infrastructure_temp_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='房间基础设施模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_infrastructure_temp`
--

LOCK TABLES `hot_infrastructure_temp` WRITE;
/*!40000 ALTER TABLE `hot_infrastructure_temp`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `hot_infrastructure_temp`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_material`
--

DROP TABLE IF EXISTS `hot_material`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_material`
(
    `material_id`       bigint NOT NULL,
    `consumable_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '耗材编号',
    `material_name`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '耗材名称',
    `inventory`         bigint                                  DEFAULT NULL COMMENT '库存',
    `alarms_number`     bigint                                  DEFAULT NULL COMMENT '报警数量',
    `create_by`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`       datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`       datetime                                DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`material_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_material`
--

LOCK TABLES `hot_material` WRITE;
/*!40000 ALTER TABLE `hot_material`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `hot_material`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_room`
--

DROP TABLE IF EXISTS `hot_room`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_room`
(
    `room_id`        bigint NOT NULL,
    `room_type_id`   bigint                                  DEFAULT NULL,
    `floor`          varchar(255) COLLATE utf8mb4_general_ci DEFAULT '0',
    `room_type_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '房型名称',
    `price`          decimal(10, 2)                          DEFAULT NULL,
    `room_number`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '房间编号',
    `room_state`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'hot_room_state 房间状态',
    `create_by`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`    datetime                                DEFAULT NULL COMMENT '更新时间',
    `guest_order_id` bigint                                  DEFAULT NULL,
    PRIMARY KEY (`room_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_room`
--

LOCK TABLES `hot_room` WRITE;
/*!40000 ALTER TABLE `hot_room`
    DISABLE KEYS */;
INSERT INTO `hot_room`
VALUES (1635265884148543490, 1635265267212562432, '3', '温馨特惠房', 55.00, '213', '1', 'admin', '2023-03-13 21:05:43',
        'admin', '2023-03-20 20:23:49', NULL),
       (1635265884148543491, 1635265267212562432, '3', '温馨特惠房', NULL, '215', '1', 'admin', '2023-03-13 21:05:43',
        'admin', '2023-03-26 10:28:36', NULL),
       (1635265884148543492, 1635265267212562432, '3', '温馨特惠房', NULL, '216', '1', 'admin', '2023-03-13 21:05:43',
        'admin', '2023-03-24 18:56:23', NULL),
       (1635265884148543493, 1635265267212562432, '3', '温馨特惠房', NULL, '218', '1', 'admin', '2023-03-13 21:05:43',
        'admin', '2023-03-24 18:55:29', NULL),
       (1635265884148543494, 1635265267212562432, '2', '温馨特惠房', NULL, '312', '1', 'admin', '2023-03-13 21:05:43',
        'admin', '2023-03-24 22:41:17', NULL),
       (1635266292673753089, 1635265267212562432, '2', '温馨特惠房', NULL, '315', '1', 'admin', '2023-03-13 21:07:21',
        'admin', '2023-03-24 22:38:38', NULL),
       (1635266292673753090, 1635265267212562432, '2', '温馨特惠房', NULL, '316', '1', 'admin', '2023-03-13 21:07:21',
        'admin', '2023-03-13 21:07:37', NULL),
       (1635266292673753091, 1635265267212562432, '2', '温馨特惠房', NULL, '317', '1', 'admin', '2023-03-13 21:07:21',
        'admin', '2023-03-13 21:07:40', NULL),
       (1635266603752697857, 1635265358207987712, '2', '美好时光大床房', NULL, '207', '1', 'admin',
        '2023-03-13 21:08:35', 'admin', '2023-03-13 21:08:39', NULL),
       (1635266603752697858, 1635265358207987712, '2', '美好时光大床房', NULL, '208', '1', 'admin',
        '2023-03-13 21:08:35', 'admin', '2023-03-13 21:08:42', NULL),
       (1635266603752697859, 1635265358207987712, '2', '美好时光大床房', NULL, '209', '1', 'admin',
        '2023-03-13 21:08:35', 'admin', '2023-03-13 21:08:46', NULL),
       (1635266603752697860, 1635265358207987712, '2', '美好时光大床房', NULL, '212', '1', 'admin',
        '2023-03-13 21:08:35', 'admin', '2023-03-24 22:32:41', NULL),
       (1635266603752697861, 1635265358207987712, '2', '美好时光大床房', NULL, '217', '1', 'admin',
        '2023-03-13 21:08:35', 'admin', '2023-03-13 21:08:51', NULL),
       (1635266938147778561, 1635265358207987712, '2', '美好时光大床房', NULL, '307', '1', 'admin',
        '2023-03-13 21:09:55', 'admin', '2023-03-13 21:09:55', NULL),
       (1635266938214887426, 1635265358207987712, '2', '美好时光大床房', NULL, '308', '1', 'admin',
        '2023-03-13 21:09:55', 'admin', '2023-03-13 21:09:55', NULL),
       (1635266938214887427, 1635265358207987712, '2', '美好时光大床房', NULL, '309', '1', 'admin',
        '2023-03-13 21:09:55', 'admin', '2023-03-13 21:09:55', NULL),
       (1635266938214887428, 1635265358207987712, '2', '美好时光大床房', NULL, '313', '1', 'admin',
        '2023-03-13 21:09:55', 'admin', '2023-03-24 19:08:09', NULL),
       (1635266938214887429, 1635265358207987712, '2', '美好时光大床房', NULL, '318', '1', 'admin',
        '2023-03-13 21:09:55', 'admin', '2023-03-13 21:09:55', NULL),
       (1635267193413120001, 1635265433508327424, '2', '时尚特色主题房', NULL, '201', '1', 'admin',
        '2023-03-13 21:10:55', 'admin', '2023-03-13 21:10:55', NULL),
       (1635267193413120002, 1635265433508327424, '2', '时尚特色主题房', NULL, '301', '1', 'admin',
        '2023-03-13 21:10:55', 'admin', '2023-03-13 21:10:55', NULL),
       (1635267193413120003, 1635265506241753088, '2', '温情特色主题房', NULL, '206', '1', 'admin',
        '2023-03-13 21:10:55', 'admin', '2023-03-13 21:10:55', NULL),
       (1635267193413120004, 1635265506241753088, '2', '温情特色主题房', NULL, '305', '1', 'admin',
        '2023-03-13 21:10:55', 'admin', '2023-03-13 21:10:55', NULL),
       (1635267193413120005, 1635265506241753088, '2', '温情特色主题房', NULL, '306', '1', 'admin',
        '2023-03-13 21:10:55', 'admin', '2023-03-13 21:10:55', NULL),
       (1635267459831115777, 1635265604703039488, '2', '浪漫轻奢投影房', NULL, '202', '1', 'admin',
        '2023-03-13 21:11:59', 'admin', '2023-03-13 21:11:59', NULL),
       (1635267459831115778, 1635265604703039488, '2', '浪漫轻奢投影房', NULL, '203', '1', 'admin',
        '2023-03-13 21:11:59', 'admin', '2023-03-13 21:11:59', NULL),
       (1635267459831115779, 1635265604703039488, '2', '浪漫轻奢投影房', NULL, '205', '1', 'admin',
        '2023-03-13 21:11:59', 'admin', '2023-03-13 21:11:59', NULL),
       (1635267459831115780, 1635265604703039488, '2', '浪漫轻奢投影房', NULL, '210', '1', 'admin',
        '2023-03-13 21:11:59', 'admin', '2023-03-13 21:11:59', NULL),
       (1635267459831115781, 1635265604703039488, '2', '浪漫轻奢投影房', NULL, '211', '1', 'admin',
        '2023-03-13 21:11:59', 'admin', '2023-03-13 21:11:59', NULL),
       (1635267459831115782, 1635265604703039488, '2', '浪漫轻奢投影房', NULL, '302', '1', 'admin',
        '2023-03-13 21:11:59', 'admin', '2023-03-13 21:11:59', NULL),
       (1635267459831115783, 1635265604703039488, '2', '浪漫轻奢投影房', NULL, '303', '1', 'admin',
        '2023-03-13 21:11:59', 'admin', '2023-03-13 21:11:59', NULL),
       (1635267545998897153, 1635265709883600896, '2', '雅致双床房', NULL, '310', '1', 'admin', '2023-03-13 21:12:19',
        'admin', '2023-03-13 21:12:19', NULL),
       (1635267545998897154, 1635265709883600896, '2', '雅致双床房', NULL, '311', '1', 'admin', '2023-03-13 21:12:19',
        'admin', '2023-03-13 21:12:19', NULL);
/*!40000 ALTER TABLE `hot_room`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_room_record`
--

DROP TABLE IF EXISTS `hot_room_record`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_room_record`
(
    `room_record_id`     bigint NOT NULL,
    `room_id`            bigint                                  DEFAULT NULL,
    `guest_order_id`     bigint NOT NULL COMMENT '订单号',
    `room_number`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `room_type_name`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `phone_number`       varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `guest_name`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `start_date`         date                                    DEFAULT NULL COMMENT '开房日期',
    `end_date`           date                                    DEFAULT NULL COMMENT '离店日期',
    `check_in_time`      datetime                                DEFAULT NULL COMMENT '入住日期',
    `check_out_time`     datetime                                DEFAULT NULL COMMENT '离店时间',
    `check_out`          char(1) COLLATE utf8mb4_general_ci      DEFAULT NULL,
    `pay_method`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `order_platform`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `timeout_price`      decimal(10, 2)                          DEFAULT NULL,
    `timeout`            char(1) COLLATE utf8mb4_general_ci      DEFAULT NULL,
    `timeout_pay_method` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `remark`             varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `create_by`          varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`        datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`          varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`        datetime                                DEFAULT NULL COMMENT '更新时间',
    `day_amount`         decimal(10, 2)                          DEFAULT NULL COMMENT '每日金额',
    `record_state`       varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'hot_record_state 订单状态',
    PRIMARY KEY (`room_record_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_room_record`
--

LOCK TABLES `hot_room_record` WRITE;
/*!40000 ALTER TABLE `hot_room_record`
    DISABLE KEYS */;
INSERT INTO `hot_room_record`
VALUES (1635272665885118464, 1635265884148543491, 1635272665834786816, '215', '温馨特惠房', NULL, NULL, '2023-03-13',
        '2023-03-15', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-13 21:32:40', 'admin',
        '2023-03-13 21:32:40', NULL, '1'),
       (1635272665910284288, 1635265884148543491, 1635272665834786816, '215', '温馨特惠房', NULL, NULL, '2023-03-13',
        '2023-03-15', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-13 21:32:40', 'admin',
        '2023-03-13 21:32:40', NULL, '2'),
       (1635274541171077120, 1635265884148543492, 1635274541120745472, '216', '温馨特惠房', NULL, NULL, '2023-03-13',
        '2023-03-14', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-13 21:40:07', 'admin',
        '2023-03-13 21:40:07', 11.00, '3'),
       (1635274541200437248, 1635265884148543492, 1635274541120745472, '216', '温馨特惠房', NULL, NULL, '2023-03-14',
        '2023-03-15', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-13 21:40:07', 'admin',
        '2023-03-13 21:40:07', 11.00, '2'),
       (1636355498569482240, 1635265884148543491, 1636355498523344896, '215', '温馨特惠房', NULL, NULL, '2023-03-16',
        '2023-03-17', NULL, NULL, '0', '1', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-16 21:15:28', 'admin',
        '2023-03-16 21:15:28', 55.00, '1'),
       (1636374447977684992, 1635265884148543492, 1636374447927353344, '216', '温馨特惠房', NULL, NULL, '2023-03-15',
        '2023-03-16', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-16 22:30:45', 'admin',
        '2023-03-16 22:30:45', 99.00, '1'),
       (1637268522884927488, 1635265884148543492, 1637268522750709760, '216', '温馨特惠房', NULL, NULL, '2023-03-19',
        '2023-03-20', NULL, NULL, '0', '1', '4', NULL, NULL, NULL, NULL, 'admin', '2023-03-19 09:43:29', 'admin',
        '2023-03-19 09:43:29', 33.00, NULL),
       (1637292899349413888, 1635265884148543492, 1637292899303276544, '216', '温馨特惠房', NULL, NULL, '2023-03-19',
        '2023-03-20', NULL, NULL, '0', '1', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-19 11:20:21', 'admin',
        '2023-03-19 11:20:21', 33.00, NULL),
       (1637299776657403904, 1635265884148543494, 1637299776607072256, '312', '温馨特惠房', NULL, NULL, '2023-03-19',
        '2023-03-20', NULL, NULL, '0', '1', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-19 11:47:41', 'admin',
        '2023-03-19 11:47:41', 78.00, NULL),
       (1637364044052389888, 1635265884148543492, 1637364043993669632, '216', '温馨特惠房', NULL, NULL, '2023-03-19',
        '2023-03-20', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-19 16:03:04', 'admin',
        '2023-03-19 16:03:04', 99.00, NULL),
       (1637365455376973824, 1635265884148543491, 1637365455326642176, '215', '温馨特惠房', NULL, NULL, '2023-03-19',
        '2023-03-20', NULL, NULL, '0', '1', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-19 16:08:40', 'admin',
        '2023-03-19 16:08:40', 55.00, NULL),
       (1637365683299647488, 1635265884148543490, 1637365683291258880, '213', '温馨特惠房', NULL, NULL, '2023-03-21',
        '2023-03-22', NULL, NULL, '0', '1', '3', NULL, NULL, NULL, NULL, 'admin', '2023-03-19 16:09:34', 'admin',
        '2023-03-19 16:09:34', 88.00, NULL),
       (1637433371803885568, 1635265884148543490, 1637433371757748224, NULL, NULL, NULL, NULL, '2023-03-19',
        '2023-03-20', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-19 20:38:33', 'admin',
        '2023-03-19 20:38:33', 22.00, NULL),
       (1637825933823799296, 1635265884148543490, 1637825933773467648, NULL, NULL, NULL, NULL, '2023-03-20',
        '2023-03-21', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-20 22:38:27', 'admin',
        '2023-03-20 22:38:27', 22.00, NULL),
       (1637826174753009664, 1635265884148543491, 1637826174744621056, NULL, NULL, NULL, NULL, '2023-03-20',
        '2023-03-21', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-20 22:39:24', 'admin',
        '2023-03-20 22:39:24', 233.00, NULL),
       (1637826310543601664, 1635265884148543492, 1637826310539407360, NULL, NULL, NULL, NULL, '2023-03-21',
        '2023-03-22', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-20 22:39:56', 'admin',
        '2023-03-20 22:39:56', 122.00, NULL),
       (1637826568224862208, 1635265884148543492, 1637826568212279296, NULL, NULL, NULL, NULL, '2023-03-20',
        '2023-03-21', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-20 22:40:58', 'admin',
        '2023-03-20 22:40:58', 11.00, NULL),
       (1637826568245833728, 1635265884148543492, 1637826568212279296, NULL, NULL, NULL, NULL, '2023-03-21',
        '2023-03-22', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-20 22:40:58', 'admin',
        '2023-03-20 22:40:58', 11.00, NULL),
       (1637826625250619392, 1635265884148543492, 1637826625242230784, NULL, NULL, NULL, NULL, '2023-03-20',
        '2023-03-21', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-20 22:41:11', 'admin',
        '2023-03-20 22:41:11', 22.00, NULL),
       (1637826717021990912, 1635265884148543494, 1637826717013602304, NULL, NULL, NULL, NULL, '2023-03-20',
        '2023-03-21', NULL, NULL, '0', '2', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-20 22:41:33', 'admin',
        '2023-03-20 22:41:33', 23.00, NULL),
       (1638521009453461504, 1635265884148543492, 1638521009377964032, NULL, NULL, NULL, NULL, '2023-03-22',
        '2023-03-23', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-22 20:40:26', 'admin',
        '2023-03-22 20:40:26', 55.00, NULL),
       (1638521528813219840, 1635265884148543493, 1638521528767082496, NULL, NULL, NULL, NULL, '2023-03-22',
        '2023-03-23', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-22 20:42:29', 'admin',
        '2023-03-22 20:42:29', 100.00, NULL),
       (1638522117580255232, 1635265884148543492, 1638522117576060928, NULL, NULL, NULL, NULL, '2023-03-22',
        '2023-03-23', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-22 20:44:50', 'admin',
        '2023-03-22 20:44:50', 88.00, NULL),
       (1638522201046904832, 1635265884148543494, 1638522201042710528, NULL, NULL, NULL, NULL, '2023-03-22',
        '2023-03-23', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-22 20:45:10', 'admin',
        '2023-03-22 20:45:10', 22.00, NULL),
       (1638522514747289600, 1635266292673753089, 1638522514738900992, NULL, NULL, NULL, NULL, '2023-03-22',
        '2023-03-23', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-22 20:46:24', 'admin',
        '2023-03-22 20:46:24', 67.00, NULL),
       (1638880155554066432, 1635265884148543494, 1638880155507929088, NULL, NULL, NULL, NULL, '2023-03-23',
        '2023-03-24', NULL, NULL, '0', '1', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-23 20:27:33', 'admin',
        '2023-03-23 20:27:33', 22.00, NULL),
       (1638883439375396864, NULL, 1638883439325065216, NULL, NULL, NULL, NULL, '2023-03-23', '2023-03-24', NULL, NULL,
        '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-23 20:40:36', 'admin', '2023-03-23 20:40:36', 22.00,
        NULL),
       (1638883498536054784, NULL, 1638883498527666176, NULL, NULL, NULL, NULL, '2023-03-23', '2023-03-24', NULL, NULL,
        '0', '2', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-23 20:40:50', 'admin', '2023-03-23 20:40:50', 3434.00,
        NULL),
       (1638883605121708032, NULL, 1638883605113319424, NULL, NULL, NULL, NULL, '2023-03-23', '2023-03-24', NULL, NULL,
        '0', '2', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-23 20:41:15', 'admin', '2023-03-23 20:41:15', 2.00,
        NULL),
       (1639219264143228928, NULL, 1639219264092897280, NULL, NULL, NULL, NULL, '2023-03-24', '2023-03-25', NULL, NULL,
        '0', '1', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-24 18:55:02', 'admin', '2023-03-24 18:55:02', 89.00,
        NULL),
       (1639219376466690048, 1635265884148543493, 1639219376458301440, NULL, NULL, NULL, NULL, '2023-03-24',
        '2023-03-25', NULL, NULL, '0', '1', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-24 18:55:29', 'admin',
        '2023-03-24 18:55:29', 88.00, NULL),
       (1639219600744513536, 1635265884148543492, 1639219600740319232, NULL, NULL, NULL, NULL, '2023-03-24',
        '2023-03-25', NULL, NULL, '0', '2', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-24 18:56:23', 'admin',
        '2023-03-24 18:56:23', 24.75, NULL),
       (1639219600765485056, 1635265884148543492, 1639219600740319232, NULL, NULL, NULL, NULL, '2023-03-25',
        '2023-03-26', NULL, NULL, '0', '2', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-24 18:56:23', 'admin',
        '2023-03-24 18:56:23', 24.75, NULL),
       (1639219600769679360, 1635265884148543492, 1639219600740319232, NULL, NULL, NULL, NULL, '2023-03-26',
        '2023-03-27', NULL, NULL, '0', '2', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-24 18:56:23', 'admin',
        '2023-03-24 18:56:23', 24.75, NULL),
       (1639219600778067968, 1635265884148543492, 1639219600740319232, NULL, NULL, NULL, NULL, '2023-03-27',
        '2023-03-28', NULL, NULL, '0', '2', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-24 18:56:23', 'admin',
        '2023-03-24 18:56:23', 24.75, NULL),
       (1639221829429886976, 1635266292673753089, 1639221829421498368, NULL, NULL, NULL, NULL, '2023-03-30',
        '2023-03-31', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-24 19:05:14', 'admin',
        '2023-03-24 19:05:14', 22.00, NULL),
       (1639222564997668864, 1635266938214887428, 1639222564947337216, NULL, NULL, NULL, NULL, '2023-03-30',
        '2023-03-31', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-24 19:08:09', 'admin',
        '2023-03-24 19:08:09', 34.00, NULL),
       (1639223493775958016, 1635266292673753089, 1639223493767569408, NULL, NULL, NULL, NULL, '2023-03-30',
        '2023-03-31', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-24 19:11:51', 'admin',
        '2023-03-24 19:11:51', 22.00, NULL),
       (1639223963865161728, 1635266292673753089, 1639223963860967424, NULL, NULL, NULL, NULL, '2023-03-30',
        '2023-03-31', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-24 19:13:43', 'admin',
        '2023-03-24 19:13:43', 23.00, NULL),
       (1639224045796696064, 1635266603752697860, 1639224045788307456, NULL, NULL, NULL, NULL, '2023-03-30',
        '2023-03-31', NULL, NULL, '0', '2', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-24 19:14:02', 'admin',
        '2023-03-24 19:14:02', 23.00, NULL),
       (1639226512412246016, 1635266292673753089, 1639226512357720064, NULL, NULL, NULL, NULL, '2023-03-24',
        '2023-03-25', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-24 19:23:51', 'admin',
        '2023-03-24 19:23:51', 88.00, NULL),
       (1639274037366308864, 1635266603752697860, 1639274037315977216, NULL, NULL, NULL, NULL, '2023-03-24',
        '2023-03-25', NULL, NULL, '0', '2', '1', NULL, NULL, NULL, NULL, 'admin', '2023-03-24 22:32:41', 'admin',
        '2023-03-24 22:32:41', 88.00, NULL),
       (1639274674795659264, 1635266292673753089, 1639274674770493440, NULL, NULL, NULL, NULL, '2023-03-30',
        '2023-03-31', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-03-24 22:35:13', 'admin',
        '2023-03-24 22:35:13', 25.00, NULL),
       (1639816591149174784, 1635265884148543491, 1639816591098843136, NULL, NULL, NULL, NULL, '2023-03-26',
        '2023-03-27', NULL, NULL, '0', '1', '4', NULL, NULL, NULL, NULL, 'admin', '2023-03-26 10:28:36', 'admin',
        '2023-03-26 10:28:36', 44.00, NULL);
/*!40000 ALTER TABLE `hot_room_record`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_room_service`
--

DROP TABLE IF EXISTS `hot_room_service`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_room_service`
(
    `room_service_id` bigint NOT NULL,
    `service_type`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服务类型 hot_service_type',
    `service_name`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服务名称',
    `enable`          char(1) COLLATE utf8mb4_general_ci      DEFAULT NULL,
    `create_by`       varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`     datetime                                DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`room_service_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_room_service`
--

LOCK TABLES `hot_room_service` WRITE;
/*!40000 ALTER TABLE `hot_room_service`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `hot_room_service`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_room_tag`
--

DROP TABLE IF EXISTS `hot_room_tag`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_room_tag`
(
    `room_tag_id` bigint NOT NULL,
    `tag_name`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服务名称',
    `enable`      char(1) COLLATE utf8mb4_general_ci      DEFAULT NULL,
    `create_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`room_tag_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_room_tag`
--

LOCK TABLES `hot_room_tag` WRITE;
/*!40000 ALTER TABLE `hot_room_tag`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `hot_room_tag`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_room_type`
--

DROP TABLE IF EXISTS `hot_room_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_room_type`
(
    `room_type_id`   bigint NOT NULL,
    `room_type_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '房型名称',
    `person_count`   int                                     DEFAULT NULL COMMENT '居住人数',
    `amount`         decimal(10, 2)                          DEFAULT NULL COMMENT '原价',
    `create_by`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`    datetime                                DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`room_type_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_room_type`
--

LOCK TABLES `hot_room_type` WRITE;
/*!40000 ALTER TABLE `hot_room_type`
    DISABLE KEYS */;
INSERT INTO `hot_room_type`
VALUES (1635265267212562432, '温馨特惠房', NULL, 65.00, 'admin', '2023-03-13 21:03:16', 'admin', '2023-03-13 21:03:16'),
       (1635265358207987712, '美好时光大床房', NULL, 80.00, 'admin', '2023-03-13 21:03:38', 'admin',
        '2023-03-13 21:03:38'),
       (1635265433508327424, '时尚特色主题房', NULL, 90.00, 'admin', '2023-03-13 21:03:56', 'admin',
        '2023-03-13 21:03:56'),
       (1635265506241753088, '温情特色主题房', NULL, 100.00, 'admin', '2023-03-13 21:04:13', 'admin',
        '2023-03-13 21:04:13'),
       (1635265604703039488, '浪漫轻奢投影房', NULL, 110.00, 'admin', '2023-03-13 21:04:37', 'admin',
        '2023-03-13 21:04:37'),
       (1635265709883600896, '雅致双床房', NULL, 125.00, 'admin', '2023-03-13 21:05:02', 'admin',
        '2023-03-13 21:05:02');
/*!40000 ALTER TABLE `hot_room_type`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_type_tag`
--

DROP TABLE IF EXISTS `hot_type_tag`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hot_type_tag`
(
    `room_type_id` bigint NOT NULL,
    `room_tag_id`  bigint NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_type_tag`
--

LOCK TABLES `hot_type_tag` WRITE;
/*!40000 ALTER TABLE `hot_type_tag`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `hot_type_tag`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material`
(
    `material`         bigint NOT NULL,
    `material_type_id` bigint                                  DEFAULT NULL,
    `material_name`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `material_num`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `inventory`        bigint                                  DEFAULT NULL,
    `purchase_price`   decimal(10, 2)                          DEFAULT NULL,
    `del_flag`         char(1) COLLATE utf8mb4_general_ci      DEFAULT '0',
    `create_by`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`      datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`      datetime                                DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`material`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `material`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_type`
--

DROP TABLE IF EXISTS `material_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_type`
(
    `material_type_id`   bigint NOT NULL,
    `material_type_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `level`              int                                     DEFAULT NULL,
    `parent_id`          bigint                                  DEFAULT NULL,
    `del_flag`           char(1) COLLATE utf8mb4_general_ci      DEFAULT '0',
    `create_by`          varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`        datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`          varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`        datetime                                DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_type`
--

LOCK TABLES `material_type` WRITE;
/*!40000 ALTER TABLE `material_type`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `material_type`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config`
(
    `config_id`    bigint NOT NULL,
    `config_name`  varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `config_key`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `config_value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `config_type`  varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `create_by`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`  datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`  datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config`
    DISABLE KEYS */;
INSERT INTO `sys_config`
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-01-08 11:19:55', '',
        NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
       (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-01-08 11:19:55', '', NULL,
        '初始化密码 123456'),
       (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-01-08 11:19:55', '', NULL,
        '深色主题theme-dark，浅色主题theme-light'),
       (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2023-01-08 11:19:55', '小江',
        '2023-03-01 20:56:46', '是否开启验证码功能（true开启，false关闭）'),
       (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-01-08 11:19:55',
        '', NULL, '是否开启注册用户功能（true开启，false关闭）'),
       (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2023-01-08 11:19:55', '', NULL,
        'true:开启, false:关闭'),
       (1633092689383493633, '退房时间', 'out_time', '13:00', 'Y', '小江', '2023-03-07 21:10:13', '小江',
        '2023-03-07 21:10:23', '退房时间');
/*!40000 ALTER TABLE `sys_config`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint NOT NULL,
    `parent_id`   bigint                                  DEFAULT NULL,
    `ancestors`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `dept_name`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `order_num`   int                                     DEFAULT NULL,
    `leader`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `phone`       varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `email`       varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `status`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `del_flag`    char(1) COLLATE utf8mb4_general_ci      DEFAULT '0',
    `create_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept`
    DISABLE KEYS */;
INSERT INTO `sys_dept`
VALUES (1, 0, '0', '艾尚悠家酒店', 0, '管理员', '18349304247', '', '0', '0', 'admin', '2023-01-08 11:19:42', 'admin',
        '2023-03-08 21:45:32'),
       (101, 100, '0,100', '财务部', 1, '财务部总经理', '15888888888', 'cwbzjl@qq.com', '0', '2', 'admin',
        '2023-01-08 11:19:42', 'admin', '2023-01-20 23:06:00');
/*!40000 ALTER TABLE `sys_dept`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint NOT NULL,
    `dict_sort`   int                                     DEFAULT NULL,
    `dict_label`  varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `dict_value`  varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `dict_type`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `css_class`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `list_class`  varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `is_default`  varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `status`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `create_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data`
    DISABLE KEYS */;
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '性别男'),
       (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '性别女'),
       (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '性别未知'),
       (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '显示菜单'),
       (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '隐藏菜单'),
       (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '正常状态'),
       (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '停用状态'),
       (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '系统默认是'),
       (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '系统默认否'),
       (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '通知'),
       (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '公告'),
       (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '正常状态'),
       (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '关闭状态'),
       (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '新增操作'),
       (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '修改操作'),
       (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '删除操作'),
       (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '授权操作'),
       (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '导出操作'),
       (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '导入操作'),
       (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '强退操作'),
       (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '生成操作'),
       (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '清空操作'),
       (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-01-08 11:19:55', '', NULL,
        '正常状态'),
       (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:55', '', NULL,
        '停用状态'),
       (29, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL,
        '其他操作'),
       (1616418614431043586, 1, '正常', '1', 'hot_room_state', NULL, 'success', NULL, '0', 'admin',
        '2023-01-20 20:53:24', NULL, '2023-03-26 11:49:02', NULL),
       (1622942518188294146, 2, '预定', '2', 'hot_room_state', NULL, 'danger', NULL, '0', NULL, '2023-02-07 20:57:04',
        NULL, '2023-03-26 11:49:02', NULL),
       (1622942518188294147, 3, '住脏', '3', 'hot_room_state', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:57:04', NULL,
        '2023-03-26 11:49:02', NULL),
       (1622942520939757570, 1, '微信', '1', 'hot_pay_method', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:57:04', NULL,
        '2023-03-26 11:49:02', NULL),
       (1622942520939757571, 2, '支付宝', '2', 'hot_pay_method', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:57:04',
        NULL, '2023-03-26 11:49:02', NULL),
       (1622942520939757572, 3, '现金', '3', 'hot_pay_method', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:57:04', NULL,
        '2023-03-26 11:49:02', NULL),
       (1622943003653816322, 1, '美团', '1', 'hot_order_platform', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:59:00',
        NULL, '2023-03-26 11:49:03', NULL),
       (1622943003653816323, 2, '去哪儿', '2', 'hot_order_platform', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:59:00',
        NULL, '2023-03-26 11:49:03', NULL),
       (1622943003653816324, 3, '携程', '3', 'hot_order_platform', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:59:00',
        NULL, '2023-03-26 11:49:03', NULL),
       (1622943003653816325, 4, '飞猪', '4', 'hot_order_platform', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:59:00',
        NULL, '2023-03-26 11:49:03', NULL),
       (1627643580065320961, 4, '空脏', '4', 'hot_room_state', NULL, 'warning', NULL, '0', '小江',
        '2023-02-20 20:17:24', NULL, '2023-03-26 11:49:02', NULL),
       (1633085759038525442, 1, '正常', '1', 'timeout_method', NULL, NULL, NULL, '0', NULL, '2023-03-07 20:42:41', NULL,
        '2023-03-26 11:49:03', NULL),
       (1633085759038525443, 2, '超时不收费', '2', 'timeout_method', NULL, NULL, NULL, '0', NULL, '2023-03-07 20:42:41',
        NULL, '2023-03-26 11:49:03', NULL),
       (1633085759038525444, 3, '超时收费', '3', 'timeout_method', NULL, NULL, NULL, '0', NULL, '2023-03-07 20:42:41',
        NULL, '2023-03-26 11:49:03', NULL),
       (1633444530185146370, 4, '其他', '4', 'hot_pay_method', NULL, NULL, NULL, '0', NULL, '2023-03-08 20:28:19', NULL,
        '2023-03-26 11:49:03', NULL),
       (1636372047112019970, 1, '待接单', '1', 'hot_order_state', NULL, NULL, NULL, '0', NULL, '2023-03-16 22:21:13',
        NULL, '2023-03-26 11:49:03', NULL),
       (1636372047112019971, 2, '待入住', '2', 'hot_order_state', NULL, NULL, NULL, '0', NULL, '2023-03-16 22:21:13',
        NULL, '2023-03-26 11:49:03', NULL),
       (1636372047124602881, 3, '已入住', '3', 'hot_order_state', NULL, NULL, NULL, '0', NULL, '2023-03-16 22:21:13',
        NULL, '2023-03-26 11:49:03', NULL),
       (1636372047124602882, 4, '离店', '4', 'hot_order_state', NULL, NULL, NULL, '0', NULL, '2023-03-16 22:21:13',
        NULL, '2023-03-26 11:49:03', NULL),
       (1637364992074153986, 1, '日租', '1', 'hot_live_type', NULL, NULL, NULL, '0', NULL, '2023-03-19 16:06:50', NULL,
        '2023-03-26 11:49:03', NULL),
       (1637364992074153987, 2, '短租', '2', 'hot_live_type', NULL, NULL, NULL, '0', NULL, '2023-03-19 16:06:50', NULL,
        '2023-03-26 11:49:03', NULL),
       (1638519861547900930, 3, '长租', '3', 'hot_live_type', NULL, NULL, NULL, '0', NULL, '2023-03-22 20:35:52', NULL,
        '2023-03-26 11:49:04', NULL),
       (1638519861547900931, 4, '钟点房', '4', 'hot_live_type', NULL, NULL, NULL, '0', NULL, '2023-03-22 20:35:52',
        NULL, '2023-03-26 11:49:04', NULL),
       (1639253807369920513, 5, '取消', '5', 'hot_order_state', NULL, NULL, NULL, '0', NULL, '2023-03-24 21:12:18',
        NULL, '2023-03-26 11:49:03', NULL),
       (1639287669206609921, 1, '水', '1', 'hot_manage_cost', NULL, NULL, NULL, '0', NULL, '2023-03-24 23:26:51', NULL,
        '2023-03-26 10:20:58', NULL),
       (1639287669206609922, 2, '房租', '2', 'hot_manage_cost', NULL, NULL, NULL, '0', NULL, '2023-03-24 23:26:51',
        NULL, '2023-03-26 10:20:58', NULL),
       (1639287669206609923, 3, '电', '3', 'hot_manage_cost', NULL, NULL, NULL, '0', NULL, '2023-03-24 23:26:51', NULL,
        '2023-03-26 10:20:58', NULL),
       (1639287669206609924, 4, '气', '4', 'hot_manage_cost', NULL, NULL, NULL, '0', NULL, '2023-03-24 23:26:51', NULL,
        '2023-03-26 10:20:58', NULL),
       (1639287669206609925, 5, '布草', '5', 'hot_manage_cost', NULL, NULL, NULL, '0', NULL, '2023-03-24 23:26:51',
        NULL, '2023-03-26 10:20:58', NULL),
       (1639287669206609926, 6, '维修', '6', 'hot_manage_cost', NULL, NULL, NULL, '0', NULL, '2023-03-24 23:26:51',
        NULL, '2023-03-26 10:20:58', NULL),
       (1639287669206609927, 7, '房间设施', '7', 'hot_manage_cost', NULL, NULL, NULL, '0', NULL, '2023-03-24 23:26:51',
        NULL, '2023-03-26 10:20:58', NULL),
       (1639287669206609928, 8, '人力', '8', 'hot_manage_cost', NULL, NULL, NULL, '0', NULL, '2023-03-24 23:26:51',
        NULL, '2023-03-26 10:20:59', NULL),
       (1639821567514763266, 1, '水', '1', 'hot_cost_category', NULL, NULL, NULL, '0', NULL, '2023-03-26 10:48:23',
        NULL, '2023-03-26 11:49:04', NULL),
       (1639821567514763267, 2, '房租', '2', 'hot_cost_category', NULL, NULL, NULL, '0', NULL, '2023-03-26 10:48:23',
        NULL, '2023-03-26 11:49:04', NULL),
       (1639821567514763268, 3, '电', '3', 'hot_cost_category', NULL, NULL, NULL, '0', NULL, '2023-03-26 10:48:23',
        NULL, '2023-03-26 11:49:04', NULL),
       (1639821567514763269, 4, '气', '4', 'hot_cost_category', NULL, NULL, NULL, '0', NULL, '2023-03-26 10:48:23',
        NULL, '2023-03-26 11:49:04', NULL),
       (1639821567514763270, 5, '布草', '5', 'hot_cost_category', NULL, NULL, NULL, '0', NULL, '2023-03-26 10:48:23',
        NULL, '2023-03-26 11:49:04', NULL),
       (1639821567514763271, 6, '维修', '6', 'hot_cost_category', NULL, NULL, NULL, '0', NULL, '2023-03-26 10:48:23',
        NULL, '2023-03-26 11:49:04', NULL),
       (1639821567514763272, 7, '房间设施', '7', 'hot_cost_category', NULL, NULL, NULL, '0', NULL,
        '2023-03-26 10:48:23', NULL, '2023-03-26 11:49:04', NULL),
       (1639821567514763273, 8, '人力', '8', 'hot_cost_category', NULL, NULL, NULL, '0', NULL, '2023-03-26 10:48:23',
        NULL, '2023-03-26 11:49:04', NULL);
/*!40000 ALTER TABLE `sys_dict_data`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint NOT NULL,
    `dict_name`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `dict_type`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `status`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `create_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type`
    DISABLE KEYS */;
INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '用户性别列表'),
       (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '菜单状态列表'),
       (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '系统开关列表'),
       (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '系统是否列表'),
       (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '通知类型列表'),
       (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '通知状态列表'),
       (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '操作类型列表'),
       (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '登录状态列表'),
       (1616418570927722498, '房间状态', 'hot_room_state', '0', 'admin', '2023-01-20 20:53:14', NULL,
        '2023-03-26 11:49:02', NULL),
       (1622942520734236672, '支付方式', 'hot_pay_method', '0', NULL, '2023-02-07 20:57:04', NULL,
        '2023-03-26 11:49:02', NULL),
       (1622943003439906816, '下单平台', 'hot_order_platform', '0', NULL, '2023-02-07 20:59:00', NULL,
        '2023-03-26 11:49:03', NULL),
       (1633085758761701376, '超时处理方法', 'timeout_method', '0', NULL, '2023-03-07 20:42:41', NULL,
        '2023-03-26 11:49:03', NULL),
       (1636372046877138944, '订单状态', 'hot_order_state', '0', NULL, '2023-03-16 22:21:13', NULL,
        '2023-03-26 11:49:03', NULL),
       (1637364991877021696, '居住类型', 'hot_live_type', '0', NULL, '2023-03-19 16:06:49', NULL, '2023-03-26 11:49:03',
        NULL),
       (1639287668766208000, '经营成本', 'hot_manage_cost', '0', NULL, '2023-03-24 23:26:51', NULL,
        '2023-03-26 10:20:58', NULL),
       (1639821567208579072, '经营成本', 'hot_cost_category', '0', NULL, '2023-03-26 10:48:23', NULL,
        '2023-03-26 11:49:04', NULL);
/*!40000 ALTER TABLE `sys_dict_type`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor`
(
    `info_id`        bigint NOT NULL,
    `user_name`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `ipaddr`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `browser`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `os`             varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `status`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `msg`            varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `login_time`     date                                    DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor`
    DISABLE KEYS */;
INSERT INTO `sys_logininfor`
VALUES (1611938701141389314, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-01-08'),
       (1615321799988187137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-01-17'),
       (1615331099108257794, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-01-17'),
       (1615682002906587138, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-01-18'),
       (1615682131201957890, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '退出成功', '2023-01-18'),
       (1615682167348469761, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-01-18'),
       (1616417599975706625, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-01-20'),
       (1616418130412556289, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-01-20'),
       (1616431989756121089, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-01-20'),
       (1622572057658986498, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-06'),
       (1622576145096318978, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-06'),
       (1622939663352053761, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-07'),
       (1622944352676200449, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-07'),
       (1623297956830367745, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-08'),
       (1623309263130447874, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-08'),
       (1623658237498589186, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-09'),
       (1623665434693566466, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '退出成功', '2023-02-09'),
       (1623665450229268481, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-09'),
       (1625119739187388418, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-13'),
       (1625120674550734850, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-13'),
       (1625467900426801153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-14'),
       (1626204151874412545, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-16'),
       (1626559988815966210, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-17'),
       (1626560215803310081, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-17'),
       (1626914977933426689, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-18'),
       (1626931705254047746, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1',
        '验证码错误', '2023-02-18'),
       (1626931718361247746, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-18'),
       (1627109201589112833, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-19'),
       (1627141249141944322, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-19'),
       (1627141280196571137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '退出成功', '2023-02-19'),
       (1627141543519170561, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-19'),
       (1627640717444501505, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-20'),
       (1627654732090511362, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-20'),
       (1628026140524023810, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-21'),
       (1629112321462591490, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-24'),
       (1629119266793832450, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-24'),
       (1629820233403154434, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-26'),
       (1630174438345220097, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-02-27'),
       (1630914917806460929, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-01'),
       (1631265898217938945, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-02'),
       (1632702957126275073, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-06'),
       (1632726483262623745, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-06'),
       (1632726519300083714, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-06'),
       (1632733780718243841, 'admin', '127.0.0.1', '内网IP', 'Safari', 'iPhone', '0', '登录成功', '2023-03-06'),
       (1632740902826745857, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-06'),
       (1633083220784173057, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-07'),
       (1633084135268274177, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-07'),
       (1633445450230894593, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-08'),
       (1633445752573104130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-08'),
       (1634186654459379714, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-10'),
       (1634194336205615106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-10'),
       (1635260493532598273, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-13'),
       (1635261310587211778, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-13'),
       (1636350404943777794, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-16'),
       (1636350872587702274, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-16'),
       (1637268348347355138, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-19'),
       (1637292809159294978, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-19'),
       (1637363605365940225, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-19'),
       (1637430554456334337, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-19'),
       (1637772816126136321, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-20'),
       (1637774133829652481, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-20'),
       (1637806915897348097, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-20'),
       (1637822758823657473, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '退出成功', '2023-03-20'),
       (1637822766771863553, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-20'),
       (1638138345873555458, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-21'),
       (1638140691642925057, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-21'),
       (1638161789998678017, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-21'),
       (1638516117443735553, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-22'),
       (1638516343307005953, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-22'),
       (1638532506586050562, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-22'),
       (1638556667475759106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-22'),
       (1638878948752130050, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-23'),
       (1638879263522062338, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-23'),
       (1639217332448251905, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-24'),
       (1639225363504377858, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '退出成功', '2023-03-24'),
       (1639225373482627073, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-24'),
       (1639236850880872450, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-24'),
       (1639273050400419842, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-24'),
       (1639816336269709313, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0',
        '登录成功', '2023-03-26');
/*!40000 ALTER TABLE `sys_logininfor`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint NOT NULL,
    `menu_name`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `parent_id`   bigint                                  DEFAULT NULL,
    `order_num`   int                                     DEFAULT NULL,
    `path`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `component`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `query_param` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `is_frame`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `is_cache`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `menu_type`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `visible`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `status`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `perms`       varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `icon`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `create_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu`
    DISABLE KEYS */;
INSERT INTO `sys_menu`
VALUES (1, '系统管理', 0, 1, 'system', '', '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2023-01-08 11:19:45',
        NULL, '2023-01-17 20:51:42', '系统管理目录'),
       (2, '系统监控', 0, 2, 'monitor', NULL, '', '1', '0', 'M', '1', '0', '', 'monitor', 'admin',
        '2023-01-08 11:19:45', 'admin', '2023-02-18 20:06:45', '系统监控目录'),
       (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user',
        'admin', '2023-01-08 11:19:45', '', NULL, '用户管理菜单'),
       (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples',
        'admin', '2023-01-08 11:19:45', '', NULL, '角色管理菜单'),
       (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list',
        'tree-table', 'admin', '2023-01-08 11:19:45', '', NULL, '菜单管理菜单'),
       (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree',
        'admin', '2023-01-08 11:19:45', '', NULL, '部门管理菜单'),
       (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post',
        'admin', '2023-01-08 11:19:45', '', NULL, '岗位管理菜单'),
       (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict',
        'admin', '2023-01-08 11:19:45', '', NULL, '字典管理菜单'),
       (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list',
        'edit', 'admin', '2023-01-08 11:19:45', '', NULL, '参数设置菜单'),
       (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list',
        'message', 'admin', '2023-01-08 11:19:45', '', NULL, '通知公告菜单'),
       (108, '日志管理', 1, 9, 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2023-01-08 11:19:45', '',
        NULL, '日志管理菜单'),
       (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '1', '0', 'C', '1', '0', 'monitor:online:list',
        'online', 'admin', '2023-01-08 11:19:45', 'admin', '2023-02-18 20:06:38', '在线用户菜单'),
       (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list',
        'druid', 'admin', '2023-01-08 11:19:45', '', NULL, '数据监控菜单'),
       (112, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list',
        'redis-list', 'admin', '2023-01-08 11:19:45', '', NULL, '缓存列表菜单'),
       (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list',
        'redis', 'admin', '2023-01-08 11:19:45', '', NULL, '缓存监控菜单'),
       (117, 'Admin监控', 2, 5, 'Admin', 'monitor/admin/index', '', '1', '0', 'C', '0', '0', 'monitor:admin:list',
        'dashboard', 'admin', '2023-01-08 11:19:45', '', NULL, 'Admin监控菜单'),
       (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', '1', '0', 'C', '0', '0', 'system:oss:list', 'upload',
        'admin', '2023-01-08 11:19:46', '', NULL, '文件管理菜单'),
       (120, '任务调度中心', 2, 5, 'XxlJob', 'monitor/xxljob/index', '', '1', '0', 'C', '0', '0', 'monitor:xxljob:list',
        'job', 'admin', '2023-01-08 11:19:46', '', NULL, 'Xxl-Job控制台菜单'),
       (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0',
        'monitor:operlog:list', 'form', 'admin', '2023-01-08 11:19:46', '', NULL, '操作日志菜单'),
       (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0',
        'monitor:logininfor:list', 'logininfor', 'admin', '2023-01-08 11:19:46', '', NULL, '登录日志菜单'),
       (1001, '用户查询', 100, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1002, '用户新增', 100, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1003, '用户修改', 100, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1004, '用户删除', 100, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1005, '用户导出', 100, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1006, '用户导入', 100, 6, '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1007, '重置密码', 100, 7, '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1008, '角色查询', 101, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1009, '角色新增', 101, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1010, '角色修改', 101, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1011, '角色删除', 101, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1012, '角色导出', 101, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1013, '菜单查询', 102, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1014, '菜单新增', 102, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1015, '菜单修改', 102, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1016, '菜单删除', 102, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1017, '部门查询', 103, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1018, '部门新增', 103, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1019, '部门修改', 103, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1020, '部门删除', 103, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1021, '岗位查询', 104, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1022, '岗位新增', 104, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1023, '岗位修改', 104, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1024, '岗位删除', 104, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1025, '岗位导出', 104, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1026, '字典查询', 105, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1027, '字典新增', 105, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1028, '字典修改', 105, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1029, '字典删除', 105, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1030, '字典导出', 105, 5, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2023-01-08 11:19:46', '', NULL, ''),
       (1031, '参数查询', 106, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1032, '参数新增', 106, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1033, '参数修改', 106, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1034, '参数删除', 106, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1035, '参数导出', 106, 5, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1036, '公告查询', 107, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1037, '公告新增', 107, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1038, '公告修改', 107, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1039, '公告删除', 107, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1040, '操作查询', 500, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1041, '操作删除', 500, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1042, '日志导出', 500, 4, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1043, '登录查询', 501, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1044, '登录删除', 501, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1045, '日志导出', 501, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1046, '在线查询', 109, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1047, '批量强退', 109, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1048, '单条强退', 109, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1050, '账户解锁', 501, 4, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1600, '文件查询', 118, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:query', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1601, '文件上传', 118, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:upload', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1602, '文件下载', 118, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:download', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1603, '文件删除', 118, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:remove', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1604, '配置添加', 118, 5, '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:add', '#', 'admin',
        '2023-01-08 11:19:47', '', NULL, ''),
       (1611941206873186305, '酒店管理', 0, 1, 'hotel', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'icon', 'admin',
        '2023-01-08 12:21:47', 'admin', '2023-01-08 12:21:47', NULL),
       (1611945274148495362, '酒店标签', 1611941206873186305, 9, 'roomTag', 'hotel/roomTag/index', NULL, '1', '0', 'C',
        '0', '0', NULL, 'rate', 'admin', '2023-01-08 12:37:57', 'admin', '2023-01-08 12:37:57', NULL),
       (1606, '房间类型', 1611941206873186305, 2, 'roomType', 'hotel/roomType/index', '', '1', '0', 'C', '0', '0',
        'hotel:roomType:index', 'system', NULL, '2023-01-17 21:08:57', NULL, '2023-03-26 11:49:02', '系统管理目录'),
       (1607, '房间管理', 1611941206873186305, 3, 'hotRoom', 'hotel/room/index', '', '1', '0', 'C', '0', '0',
        'hotel:room:index', 'system', NULL, '2023-01-17 21:08:57', NULL, '2023-03-26 11:49:02', '房间管理目录'),
       (1608, '房间设施', 1611941206873186305, 3, 'infrastructureTemp', 'hotel/infrastructureTemp/index', '', '1', '0',
        'C', '0', '0', 'hotel:infrastructureTemp:index', 'system', NULL, '2023-01-18 20:17:35', NULL,
        '2023-03-26 11:49:02', '房间设施'),
       (1609, '工作台', 0, -1, 'work', 'hotel/work/index', '', '1', '1', 'C', '0', '0', 'hotel:work:index',
        'date-range', NULL, '2023-01-20 22:07:08', NULL, '2023-03-26 11:49:02', '工作台'),
       (1610, '居住记录', 1611941206873186305, 3, 'roomRecord', 'hotel/roomRecord/index', '', '1', '0', 'C', '0', '0',
        'hotel:roomRecord:index', 'system', NULL, '2023-02-08 21:17:14', NULL, '2023-03-26 11:49:02', '居住记录'),
       (1626941076381970433, '经营日报', 1611941206873186305, 6, 'dailyPaper', 'hotel/dailyPaper/index', NULL, '1', '0',
        'C', '0', '0', NULL, 'chart', 'admin', '2023-02-18 21:45:54', 'admin', '2023-02-18 21:45:54', NULL),
       (1630175140853391362, '客单', 0, 0, 'order', 'hotel/order/order', NULL, '1', '1', 'C', '0', '0', NULL, 'excel',
        '小江', '2023-02-27 19:56:55', 'admin', '2023-03-24 21:19:29', NULL),
       (1611, '订单信息', 1611941206873186305, 4, 'order', 'hotel/order/order', '', '1', '0', 'C', '0', '0',
        'hotel:order:order', 'system', NULL, '2023-03-16 21:05:56', NULL, '2023-03-26 11:49:02', '订单信息'),
       (1639820928608964609, '经营成本', 0, 5, 'cost', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'chart', 'admin',
        '2023-03-26 10:45:50', 'admin', '2023-03-26 10:45:50', NULL),
       (1639821152299585538, '经营成本', 1639820928608964609, 1, 'hot_cost', 'hotel/cost/index', NULL, '1', '1', 'C',
        '0', '0', NULL, 'money', 'admin', '2023-03-26 10:46:44', 'admin', '2023-03-26 10:47:16', NULL);
/*!40000 ALTER TABLE `sys_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice`
(
    `notice_id`      bigint NOT NULL,
    `notice_title`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `notice_type`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `notice_content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `status`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `create_by`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`    datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log`
(
    `oper_id`        bigint NOT NULL,
    `title`          varchar(255) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `business_type`  int                                      DEFAULT NULL,
    `method`         varchar(255) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `request_method` varchar(255) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `operator_type`  int                                      DEFAULT NULL,
    `oper_name`      varchar(255) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `dept_name`      varchar(255) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `oper_url`       varchar(255) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `oper_ip`        varchar(255) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `oper_location`  varchar(255) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `oper_param`     varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `json_result`    varchar(255) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `status`         int                                      DEFAULT NULL,
    `error_msg`      varchar(255) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `oper_time`      date                                     DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log`
    DISABLE KEYS */;
INSERT INTO `sys_oper_log`
VALUES (1611941207280033794, '菜单管理', 1, 'com.cdmzl.web.controller.system.SysMenuController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 12:21:46\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-08 12:21:46\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1611941206873186305\",\"menuName\":\"酒店管理\",\"orderNum\":1,\"path\":\"hotel\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"icon\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-08'),
       (1611945274412736513, '菜单管理', 1, 'com.cdmzl.web.controller.system.SysMenuController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 12:37:56\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-08 12:37:56\",\"params\":{},\"parentName\":null,\"parentId\":\"1611941206873186305\",\"children\":[],\"menuId\":\"1611945274148495362\",\"menuName\":\"酒店标签\",\"orderNum\":9,\"path\":\"roomTag\",\"component\":\"hotel/roomTag/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"rate\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-08'),
       (1615336185679151105, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/1605', '127.0.0.1', '内网IP', '{menuId=1605}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-17'),
       (1616418571183575042, '字典类型', 1, 'com.cdmzl.web.controller.system.SysDictTypeController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/dict/type', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-20 20:53:13\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 20:53:13\",\"params\":{},\"dictId\":\"1616418570927722498\",\"dictName\":\"房间状态\",\"dictType\":\"hot_room_state\",\"status\":\"0\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616418614699479042, '字典数据', 1, 'com.cdmzl.web.controller.system.SysDictDataController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-20 20:53:23\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 20:53:23\",\"params\":{},\"dictCode\":\"1616418614431043586\",\"dictSort\":0,\"dictLabel\":\"正常\",\"dictValue\":\"1\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616435765900595202, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/116', '127.0.0.1', '内网IP', '{menuId=116}',
        '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1616435837925183489, '角色管理', 2, 'com.cdmzl.web.controller.system.SysRoleController.dataScope()', 'PUT', 1,
        'admin', NULL, '/soft/system/role/dataScope', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 22:01:50\",\"params\":{},\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"普通角色\",\"flag\":false,\"menuIds\":null,\"deptIds\":[],\"permissions\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616435865246879745, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/116', '127.0.0.1', '内网IP', '{menuId=116}',
        '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1616435883710205953, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/5', '127.0.0.1', '内网IP', '{menuId=5}',
        '{\"code\":500,\"msg\":\"存在子菜单,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1616435916161536001, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}',
        '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1616435954208067586, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}',
        '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1616436109892243458, '角色管理', 2, 'com.cdmzl.web.controller.system.SysRoleController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 22:02:55\",\"params\":{},\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"普通角色\",\"flag\":false,\"menuIds\":[2,109,1046,1047,1048,111,113,112,3,114,115,1055,1056,1058,1057,1059,1060],\"deptIds\":null,\"permissions\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436152867082241, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/5', '127.0.0.1', '内网IP', '{menuId=5}',
        '{\"code\":500,\"msg\":\"存在子菜单,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1616436165982670850, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/116', '127.0.0.1', '内网IP', '{menuId=116}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436172970381314, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/5', '127.0.0.1', '内网IP', '{menuId=5}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436179568021505, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436213348945922, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/115', '127.0.0.1', '内网IP', '{menuId=115}',
        '{\"code\":500,\"msg\":\"存在子菜单,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1616436229098557441, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/1055', '127.0.0.1', '内网IP', '{menuId=1055}',
        '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1616436235612311553, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/1055', '127.0.0.1', '内网IP', '{menuId=1055}',
        '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1616436269787500546, '角色管理', 2, 'com.cdmzl.web.controller.system.SysRoleController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 22:03:33\",\"params\":{},\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"普通角色\",\"flag\":false,\"menuIds\":[2,109,1046,1047,1048,111,113,112],\"deptIds\":null,\"permissions\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436291803402241, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/1060', '127.0.0.1', '内网IP', '{menuId=1060}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436299210543105, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/1059', '127.0.0.1', '内网IP', '{menuId=1059}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436305971761153, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/1057', '127.0.0.1', '内网IP', '{menuId=1057}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436312460349442, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/1056', '127.0.0.1', '内网IP', '{menuId=1056}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436319674552321, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/1058', '127.0.0.1', '内网IP', '{menuId=1058}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436326729371650, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/1055', '127.0.0.1', '内网IP', '{menuId=1055}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436334027460609, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/115', '127.0.0.1', '内网IP', '{menuId=115}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436344848764929, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/114', '127.0.0.1', '内网IP', '{menuId=114}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616436352398512129, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/menu/3', '127.0.0.1', '内网IP', '{menuId=3}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616451823365599233, '部门管理', 2, 'com.cdmzl.web.controller.system.SysDeptController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dept', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:42\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 23:05:21\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"智慧酒店\",\"orderNum\":0,\"leader\":\"管理员\",\"phone\":\"18349304247\",\"email\":\"xxhcloud@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616451984565284866, '部门管理', 2, 'com.cdmzl.web.controller.system.SysDeptController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dept', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:42\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 23:05:59\",\"params\":{},\"parentName\":\"智慧酒店\",\"parentId\":100,\"children\":[],\"deptId\":101,\"deptName\":\"财务部\",\"orderNum\":1,\"leader\":\"财务部总经理\",\"phone\":\"15888888888\",\"email\":\"cwbzjl@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616452001246031874, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/109', '127.0.0.1', '内网IP', '{deptId=109}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616452008019832834, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/108', '127.0.0.1', '内网IP', '{deptId=108}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616452013824749569, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616452024750911490, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}',
        '{\"code\":500,\"msg\":\"部门存在用户,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1616452033701556225, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/104', '127.0.0.1', '内网IP', '{deptId=104}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616452041234526209, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}',
        '{\"code\":500,\"msg\":\"部门存在用户,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1616452049958678530, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/107', '127.0.0.1', '内网IP', '{deptId=107}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616452083819294722, '用户管理', 3, 'com.cdmzl.web.controller.system.SysUserController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/user/2', '127.0.0.1', '内网IP', '{userIds=2}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616452142296281090, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/106', '127.0.0.1', '内网IP', '{deptId=106}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616452150991073281, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20'),
       (1616452159174160385, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}',
        '{\"code\":500,\"msg\":\"部门存在用户,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-01-20'),
       (1623317428513378306, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-20 20:53:24\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:46:49\",\"params\":{},\"dictCode\":\"1616418614431043586\",\"dictSort\":0,\"dictLabel\":\"正常\",\"dictValue\":\"1\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"success\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-08'),
       (1623317489867657218, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:47:03\",\"params\":{},\"dictCode\":\"1622942518188294146\",\"dictSort\":2,\"dictLabel\":\"有客\",\"dictValue\":\"2\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"warning\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-08'),
       (1623323057898491905, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"userId\":null,\"deptId\":101,\"userName\":\"admin\",\"nickName\":\"2\",\"userType\":null,\"email\":\"\",\"phonenumber\":\"\",\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}',
        '{\"code\":500,\"msg\":\"新增用户\'admin\'失败，登录账号已存在\",\"data\":null,\"error\":true,\"success\":false}',
        0, NULL, '2023-02-08'),
       (1623323069634154497, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-08 22:09:14\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 22:09:14\",\"params\":{},\"userId\":\"1623323069499936769\",\"deptId\":101,\"userName\":\"admin2\",\"nickName\":\"2\",\"userType\":null,\"email\":\"\",\"phonenumber\":\"\",\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-08'),
       (1623323123157667841, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-08 22:09:27\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 22:09:27\",\"params\":{},\"userId\":\"1623323122826317825\",\"deptId\":101,\"userName\":\"232323\",\"nickName\":\"2323\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-08'),
       (1625120785758511105, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-08 21:17:14\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-13 21:12:43\",\"params\":{},\"parentName\":null,\"parentId\":\"1611941206873186305\",\"children\":[],\"menuId\":1610,\"menuName\":\"居住记录\",\"orderNum\":3,\"path\":\"roomRecord\",\"component\":\"hotel/roomRecord/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"hotel:roomRecord:index\",\"icon\":\"system\",\"remark\":\"居住记录\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-13'),
       (1625469752178475009, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:19:23\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:19:23\",\"params\":{},\"userId\":\"1625469751935205377\",\"deptId\":100,\"userName\":\"admin2232\",\"nickName\":\"撒大声地\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14'),
       (1625470809059201025, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:23:35\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:23:35\",\"params\":{},\"userId\":\"1625470808757211137\",\"deptId\":null,\"userName\":\"xiaojiang1\",\"nickName\":\"23213\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14'),
       (1625473364547956737, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:33:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:33:44\",\"params\":{},\"userId\":\"1625473364262744066\",\"deptId\":null,\"userName\":\"xiaojiang1\",\"nickName\":\"23\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14'),
       (1625473410588831745, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:33:55\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:33:55\",\"params\":{},\"userId\":\"1625473410391699457\",\"deptId\":101,\"userName\":\"xiaojiang1213213\",\"nickName\":\"213\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14'),
       (1625473733915086850, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:35:12\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:35:12\",\"params\":{},\"userId\":\"1625473733386604545\",\"deptId\":null,\"userName\":\"32432324324\",\"nickName\":\"324324\",\"userType\":null,\"email\":null,\"phonenumber\":\"\",\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14'),
       (1625474330655567873, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:37:34\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:37:34\",\"params\":{},\"userId\":\"1625474330462629889\",\"deptId\":101,\"userName\":\"xiaojiang1213213\",\"nickName\":\"213213\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14'),
       (1625489656646545410, '用户管理', 2, 'com.cdmzl.web.controller.system.SysUserController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:37:35\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 21:38:28\",\"params\":{},\"userId\":\"1625474330462629889\",\"deptId\":101,\"userName\":\"xiaojiang1213213\",\"nickName\":\"213213\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"parentName\":null,\"parentId\":100,\"children\":[],\"deptId\":101,\"deptName\":\"财务部\",\"orderNum\":1,\"leader\":\"财务部总经理\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100\"},\"roles\":[],\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14'),
       (1626916091999289346, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:45\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:06:37\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":109,\"menuName\":\"在线用户\",\"orderNum\":1,\"path\":\"online\",\"component\":\"monitor/online/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"monitor:online:list\",\"icon\":\"online\",\"remark\":\"在线用户菜单\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626916123393654785, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:45\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:06:45\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":2,\"menuName\":\"系统监控\",\"orderNum\":2,\"path\":\"monitor\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"monitor\",\"remark\":\"系统监控目录\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626917055779127297, '岗位管理', 2, 'com.cdmzl.web.controller.system.SysPostController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:10:27\",\"params\":{},\"postId\":1,\"postCode\":\"ceo\",\"postName\":\"BOSS\",\"postSort\":1,\"status\":\"0\",\"remark\":\"\",\"flag\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626917093330731010, '岗位管理', 2, 'com.cdmzl.web.controller.system.SysPostController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:10:36\",\"params\":{},\"postId\":1,\"postCode\":\"boss\",\"postName\":\"BOSS\",\"postSort\":1,\"status\":\"0\",\"remark\":\"\",\"flag\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626917238340403201, '岗位管理', 2, 'com.cdmzl.web.controller.system.SysPostController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:11:10\",\"params\":{},\"postId\":2,\"postCode\":\"front_desk\",\"postName\":\"酒店前台\",\"postSort\":2,\"status\":\"0\",\"remark\":\"\",\"flag\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626917321572171777, '岗位管理', 2, 'com.cdmzl.web.controller.system.SysPostController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:11:30\",\"params\":{},\"postId\":3,\"postCode\":\"cleaning\",\"postName\":\"保洁\",\"postSort\":3,\"status\":\"0\",\"remark\":\"\",\"flag\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626917423745417218, '岗位管理', 2, 'com.cdmzl.web.controller.system.SysPostController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:11:55\",\"params\":{},\"postId\":4,\"postCode\":\"securityGuard\",\"postName\":\"保安\",\"postSort\":4,\"status\":\"0\",\"remark\":\"\",\"flag\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626917613114048513, '岗位管理', 1, 'com.cdmzl.web.controller.system.SysPostController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 20:12:40\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:12:40\",\"params\":{},\"postId\":\"1626917612916916225\",\"postCode\":\"accountant\",\"postName\":\"会计\",\"postSort\":5,\"status\":\"0\",\"remark\":null,\"flag\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626917704063336450, '角色管理', 1, 'com.cdmzl.web.controller.system.SysRoleController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 20:13:01\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:13:01\",\"params\":{},\"roleId\":\"1626917703933313026\",\"roleName\":\"会计\",\"roleKey\":\"accountant\",\"roleSort\":0,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":[],\"deptIds\":[],\"permissions\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626919137458319361, '角色管理', 1, 'com.cdmzl.web.controller.system.SysRoleController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 20:18:43\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:18:43\",\"params\":{},\"roleId\":\"1626919136992751617\",\"roleName\":\"酒店前台\",\"roleKey\":\"front_desk\",\"roleSort\":0,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":[1609,\"1611941206873186305\",1606,1607,1608,1610,\"1611945274148495362\"],\"deptIds\":[],\"permissions\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626920000574726145, '角色管理', 1, 'com.cdmzl.web.controller.system.SysRoleController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 20:22:09\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:22:09\",\"params\":{},\"roleId\":\"1626920000394371073\",\"roleName\":\"test\",\"roleKey\":\"test\",\"roleSort\":6,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":[],\"deptIds\":[],\"permissions\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626920914769473537, '角色管理', 2, 'com.cdmzl.web.controller.system.SysRoleController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 20:18:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:25:47\",\"params\":{},\"roleId\":\"1626919136992751617\",\"roleName\":\"酒店前台\",\"roleKey\":\"front_desk\",\"roleSort\":0,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":[1609,\"1611941206873186305\",1606,1607,1608,1610,\"1611945274148495362\"],\"deptIds\":null,\"permissions\":null,\"admin\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626920933367017474, '角色管理', 3, 'com.cdmzl.web.controller.system.SysRoleController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/role/1626920000394371073', '127.0.0.1', '内网IP', '{roleIds=1626920000394371073}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626931780688605185, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/101', '127.0.0.1', '内网IP', '{deptId=101}',
        '{\"code\":500,\"msg\":\"部门存在用户,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL,
        '2023-02-18'),
       (1626931818672222209, '用户管理', 3, 'com.cdmzl.web.controller.system.SysUserController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/user/1625474330462629889', '127.0.0.1', '内网IP', '{userIds=1625474330462629889}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626931844681101314, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/dept/101', '127.0.0.1', '内网IP', '{deptId=101}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626932361234804737, '通知公告', 3, 'com.cdmzl.web.controller.system.SysNoticeController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/notice/1', '127.0.0.1', '内网IP', '{noticeIds=1}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626932368298012674, '通知公告', 3, 'com.cdmzl.web.controller.system.SysNoticeController.remove()', 'DELETE', 1,
        'admin', NULL, '/soft/system/notice/2', '127.0.0.1', '内网IP', '{noticeIds=2}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1626941076625240065, '菜单管理', 1, 'com.cdmzl.web.controller.system.SysMenuController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 21:45:54\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 21:45:54\",\"params\":{},\"parentName\":null,\"parentId\":\"1611941206873186305\",\"children\":[],\"menuId\":\"1626941076381970433\",\"menuName\":\"经营日报\",\"orderNum\":6,\"path\":\"dailyPaper\",\"component\":\"hotel/dailyPaper/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"chart\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18'),
       (1627110279604932609, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-19 08:58:15\",\"params\":{},\"dictCode\":\"1622942520939757573\",\"dictSort\":4,\"dictLabel\":\"平台支付\",\"dictValue\":\"4\",\"dictType\":\"hot_pay_method\",\"cssClass\":null,\"listClass\":null,\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-19'),
       (1627110343995887618, '字典数据', 1, 'com.cdmzl.web.controller.system.SysDictDataController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-19 08:58:30\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-19 08:58:30\",\"params\":{},\"dictCode\":\"1627110343794561025\",\"dictSort\":5,\"dictLabel\":\"移动支付\",\"dictValue\":\"5\",\"dictType\":\"hot_pay_method\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-19'),
       (1627110386886840322, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-19 08:58:41\",\"params\":{},\"dictCode\":\"1622942520939757573\",\"dictSort\":4,\"dictLabel\":\"平台支付\",\"dictValue\":\"4\",\"dictType\":\"hot_pay_method\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-19'),
       (1627110401080365057, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-19 08:58:44\",\"params\":{},\"dictCode\":\"1622942520939757573\",\"dictSort\":4,\"dictLabel\":\"平台支付\",\"dictValue\":\"4\",\"dictType\":\"hot_pay_method\",\"cssClass\":null,\"listClass\":\"primary\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-19'),
       (1627110415236141057, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-19 08:58:31\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-19 08:58:47\",\"params\":{},\"dictCode\":\"1627110343794561025\",\"dictSort\":5,\"dictLabel\":\"移动支付\",\"dictValue\":\"5\",\"dictType\":\"hot_pay_method\",\"cssClass\":null,\"listClass\":\"primary\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-19'),
       (1627642203633209346, '字典类型', 3, 'com.cdmzl.web.controller.system.SysDictDataController.remove()', 'DELETE',
        1, 'admin', NULL, '/soft/system/dict/data/1627110343794561025', '127.0.0.1', '内网IP',
        '{dictCodes=1627110343794561025}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20'),
       (1627643580585414658, '字典数据', 1, 'com.cdmzl.web.controller.system.SysDictDataController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-02-20 20:17:24\",\"updateBy\":\"小江\",\"updateTime\":\"2023-02-20 20:17:24\",\"params\":{},\"dictCode\":\"1627643580065320961\",\"dictSort\":0,\"dictLabel\":\"空脏\",\"dictValue\":\"4\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"danger\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20'),
       (1627643607219245057, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-02-20 20:17:24\",\"updateBy\":\"小江\",\"updateTime\":\"2023-02-20 20:17:30\",\"params\":{},\"dictCode\":\"1627643580065320961\",\"dictSort\":4,\"dictLabel\":\"空脏\",\"dictValue\":\"4\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"danger\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20'),
       (1627643750718967810, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"小江\",\"updateTime\":\"2023-02-20 20:18:04\",\"params\":{},\"dictCode\":\"1622942518188294146\",\"dictSort\":2,\"dictLabel\":\"有客\",\"dictValue\":\"2\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20'),
       (1627643781618405377, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"小江\",\"updateTime\":\"2023-02-20 20:18:12\",\"params\":{},\"dictCode\":\"1622942518188294146\",\"dictSort\":2,\"dictLabel\":\"有客\",\"dictValue\":\"2\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"info\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20'),
       (1627643801700732930, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-02-20 20:17:24\",\"updateBy\":\"小江\",\"updateTime\":\"2023-02-20 20:18:17\",\"params\":{},\"dictCode\":\"1627643580065320961\",\"dictSort\":4,\"dictLabel\":\"空脏\",\"dictValue\":\"4\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"warning\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20'),
       (1630175141096660993, '菜单管理', 1, 'com.cdmzl.web.controller.system.SysMenuController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-02-27 19:56:55\",\"updateBy\":\"小江\",\"updateTime\":\"2023-02-27 19:56:55\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1630175140853391362\",\"menuName\":\"测试读取\",\"orderNum\":1,\"path\":\"test\",\"component\":\"hotel/test/test\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"bug\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-27'),
       (1630914977092947969, '参数管理', 2, 'com.cdmzl.web.controller.system.SysConfigController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/config', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:55\",\"updateBy\":\"小江\",\"updateTime\":\"2023-03-01 20:56:45\",\"params\":{},\"configId\":4,\"configName\":\"账号自助-验证码开关\",\"configKey\":\"sys.account.captchaEnabled\",\"configValue\":\"false\",\"configType\":\"Y\",\"remark\":\"是否开启验证码功能（true开启，false关闭）\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-01'),
       (1632733984011964417, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"小江\",\"updateTime\":\"2023-03-06 21:24:51\",\"params\":{},\"dictCode\":\"1622942518188294146\",\"dictSort\":2,\"dictLabel\":\"有客\",\"dictValue\":\"2\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"warning\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-06'),
       (1632734004945735682, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"小江\",\"updateTime\":\"2023-03-06 21:24:56\",\"params\":{},\"dictCode\":\"1622942518188294146\",\"dictSort\":2,\"dictLabel\":\"有客\",\"dictValue\":\"2\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"danger\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-06'),
       (1632747213572390913, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-01-20 22:07:08\",\"updateBy\":\"小江\",\"updateTime\":\"2023-03-06 22:17:25\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":1609,\"menuName\":\"工作台\",\"orderNum\":0,\"path\":\"work\",\"component\":\"hotel/work/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"hotel:work:index\",\"icon\":\"date-range\",\"remark\":\"工作台\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-06'),
       (1633092689589014529, '参数管理', 1, 'com.cdmzl.web.controller.system.SysConfigController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/config', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-03-07 21:10:13\",\"updateBy\":\"小江\",\"updateTime\":\"2023-03-07 21:10:13\",\"params\":{},\"configId\":\"1633092689383493633\",\"configName\":\"退房时间\",\"configKey\":\"out_time\",\"configValue\":\"13:00\",\"configType\":\"Y\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-07'),
       (1633092729137106945, '参数管理', 2, 'com.cdmzl.web.controller.system.SysConfigController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/config', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-03-07 21:10:13\",\"updateBy\":\"小江\",\"updateTime\":\"2023-03-07 21:10:22\",\"params\":{},\"configId\":\"1633092689383493633\",\"configName\":\"退房时间\",\"configKey\":\"out_time\",\"configValue\":\"13:00\",\"configType\":\"Y\",\"remark\":\"退房时间\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-07'),
       (1633096215002185730, '个人信息', 2, 'com.cdmzl.web.controller.system.SysProfileController.updateProfile()',
        'PUT', 1, 'admin', NULL, '/soft/system/user/profile', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:43\",\"updateBy\":\"小江\",\"updateTime\":\"2023-03-07 21:24:13\",\"params\":{},\"userId\":1,\"deptId\":null,\"userName\":null,\"nickName\":\"admin\",\"userType\":\"sys_user\",\"email\":\"1296581679@163.com\",\"phonenumber\":\"15888888888\",\"sex\":\"1\",\"avatar\":null,\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"loginDate\":\"2023-03-07 00:00:00\",\"remark\":\"管理员\",\"dept\":{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"智慧酒店\",\"orderNum\":0,\"leader\":\"管理员\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0\"},\"roles\":[{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"roleId\":1,\"roleName\":\"超级管理员\",\"roleKey\":\"admin\",\"roleSort\":1,\"dataScope\":\"1\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":true}],\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":true}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-07'),
       (1633100442315292673, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"小江\",\"updateTime\":\"2023-03-07 21:41:01\",\"params\":{},\"dictCode\":\"1622942518188294147\",\"dictSort\":3,\"dictLabel\":\"住脏\",\"dictValue\":\"3\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":null,\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-07'),
       (1633108246770053121, '字典类型', 3, 'com.cdmzl.web.controller.system.SysDictDataController.remove()', 'DELETE',
        1, 'admin', NULL, '/soft/system/dict/data/1622942520939757573', '127.0.0.1', '内网IP',
        '{dictCodes=1622942520939757573}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-07'),
       (1633463962957635586, '部门管理', 2, 'com.cdmzl.web.controller.system.SysDeptController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dept', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:42\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-08 21:45:31\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"艾尚悠家酒店\",\"orderNum\":0,\"leader\":\"管理员\",\"phone\":\"18349304247\",\"email\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-08'),
       (1636353463518347266, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-03-16 21:05:56\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-16 21:07:22\",\"params\":{},\"parentName\":null,\"parentId\":\"1611941206873186305\",\"children\":[],\"menuId\":1611,\"menuName\":\"订单信息\",\"orderNum\":4,\"path\":\"order\",\"component\":\"hotel/order/order\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"hotel:order:order\",\"icon\":\"system\",\"remark\":\"订单信息\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-16'),
       (1637791717341876226, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-01-20 22:07:08\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-20 20:22:28\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":1609,\"menuName\":\"工作台\",\"orderNum\":0,\"path\":\"work\",\"component\":\"hotel/work/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"hotel:work:index\",\"icon\":\"date-range\",\"remark\":\"工作台\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-20'),
       (1637823065850904578, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-20 22:27:02\",\"params\":{},\"dictCode\":\"1622942518188294146\",\"dictSort\":2,\"dictLabel\":\"预约\",\"dictValue\":\"2\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"danger\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-20'),
       (1638164489280765953, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-01-17 21:08:57\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-21 21:03:44\",\"params\":{},\"parentName\":null,\"parentId\":\"1611941206873186305\",\"children\":[],\"menuId\":1606,\"menuName\":\"房间类型\",\"orderNum\":2,\"path\":\"roomType\",\"component\":\"hotel/roomType/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"hotel:roomType:index\",\"icon\":\"cascader\",\"remark\":\"系统管理目录\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-21'),
       (1638164570746732545, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-01-17 21:08:57\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-21 21:04:03\",\"params\":{},\"parentName\":null,\"parentId\":\"1611941206873186305\",\"children\":[],\"menuId\":1607,\"menuName\":\"房间管理\",\"orderNum\":3,\"path\":\"hotRoom\",\"component\":\"hotel/room/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"hotel:room:index\",\"icon\":\"component\",\"remark\":\"房间管理目录\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-21'),
       (1638518083771252738, '字典类型', 3, 'com.cdmzl.web.controller.system.SysDictTypeController.remove()', 'DELETE',
        1, 'admin', NULL, '/soft/system/dict/type/1637363426604703744', '127.0.0.1', '内网IP',
        '{dictIds=1637363426604703744}', NULL, 1, '居住类型已分配,不能删除', '2023-03-22'),
       (1638518107636842498, '字典类型', 3, 'com.cdmzl.web.controller.system.SysDictDataController.remove()', 'DELETE',
        1, 'admin', NULL, '/soft/system/dict/data/1637363427179323395', '127.0.0.1', '内网IP',
        '{dictCodes=1637363427179323395}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-22'),
       (1638518114146402305, '字典类型', 3, 'com.cdmzl.web.controller.system.SysDictDataController.remove()', 'DELETE',
        1, 'admin', NULL, '/soft/system/dict/data/1637363427179323394', '127.0.0.1', '内网IP',
        '{dictCodes=1637363427179323394}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-22'),
       (1638518133310177281, '字典类型', 3, 'com.cdmzl.web.controller.system.SysDictTypeController.remove()', 'DELETE',
        1, 'admin', NULL, '/soft/system/dict/type/1637363426604703744', '127.0.0.1', '内网IP',
        '{dictIds=1637363426604703744}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-22'),
       (1639236999564754945, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-02-27 19:56:55\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-24 20:05:30\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1630175140853391362\",\"menuName\":\"测试读取\",\"orderNum\":0,\"path\":\"test\",\"component\":\"hotel/test/test\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"bug\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-24'),
       (1639237197552680961, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-02-27 19:56:55\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-24 20:06:18\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1630175140853391362\",\"menuName\":\"客单\",\"orderNum\":0,\"path\":\"test\",\"component\":\"hotel/order/order\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"excel\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-24'),
       (1639255614401867778, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-02-27 19:56:55\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-24 21:19:28\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1630175140853391362\",\"menuName\":\"客单\",\"orderNum\":0,\"path\":\"order\",\"component\":\"hotel/order/order\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"excel\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-24'),
       (1639273420438695937, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-01-20 22:07:08\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-24 22:30:14\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":1609,\"menuName\":\"工作台\",\"orderNum\":0,\"path\":\"work\",\"component\":\"hotel/work/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"hotel:work:index\",\"icon\":\"date-range\",\"remark\":\"工作台\"}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-24'),
       (1639278939924647937, '字典类型', 9, 'com.cdmzl.web.controller.system.SysDictTypeController.refreshCache()',
        'DELETE', 1, 'admin', NULL, '/soft/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-24'),
       (1639820928873205762, '菜单管理', 1, 'com.cdmzl.web.controller.system.SysMenuController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-03-26 10:45:50\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-26 10:45:50\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1639820928608964609\",\"menuName\":\"经营成本\",\"orderNum\":5,\"path\":\"cost\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"chart\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-26'),
       (1639821152433803265, '菜单管理', 1, 'com.cdmzl.web.controller.system.SysMenuController.add()', 'POST', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-03-26 10:46:43\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-26 10:46:43\",\"params\":{},\"parentName\":null,\"parentId\":\"1639820928608964609\",\"children\":[],\"menuId\":\"1639821152299585538\",\"menuName\":\"经营成本\",\"orderNum\":1,\"path\":\"hot_cost\",\"component\":\"/hotel/cost/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"money\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-26'),
       (1639821289675624450, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1,
        'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP',
        '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-03-26 10:46:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-26 10:47:16\",\"params\":{},\"parentName\":null,\"parentId\":\"1639820928608964609\",\"children\":[],\"menuId\":\"1639821152299585538\",\"menuName\":\"经营成本\",\"orderNum\":1,\"path\":\"hot_cost\",\"component\":\"hotel/cost/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"money\",\"remark\":null}',
        '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-03-26');
/*!40000 ALTER TABLE `sys_oper_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss`
(
    `oss_id`        bigint NOT NULL,
    `file_name`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `original_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `file_suffix`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `url`           varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `create_by`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `update_time`   datetime                                DEFAULT NULL COMMENT '更新时间',
    `update_by`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `service`       varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='OSS对象存储表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

LOCK TABLES `sys_oss` WRITE;
/*!40000 ALTER TABLE `sys_oss`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss_config`
--

DROP TABLE IF EXISTS `sys_oss_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss_config`
(
    `oss_config_id` bigint NOT NULL,
    `config_key`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `access_key`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `secret_key`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `bucket_name`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `prefix`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `endpoint`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `domain`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `is_https`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `region`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `status`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `ext1`          varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `create_by`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`     varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`   datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='对象存储配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss_config`
--

LOCK TABLES `sys_oss_config` WRITE;
/*!40000 ALTER TABLE `sys_oss_config`
    DISABLE KEYS */;
INSERT INTO `sys_oss_config`
VALUES (1, 'minio', 'ruoyi', 'ruoyi123', 'ruoyi', '', '127.0.0.1:9000', '', 'N', '', '0', '', 'admin',
        '2023-01-08 11:19:59', 'admin', '2023-01-08 11:19:59', NULL),
       (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1',
        '', 'admin', '2023-01-08 11:19:59', 'admin', '2023-01-08 11:19:59', NULL),
       (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1',
        '', 'admin', '2023-01-08 11:19:59', 'admin', '2023-01-08 11:19:59', NULL),
       (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1250000000', '', 'cos.ap-beijing.myqcloud.com', '',
        'N', 'ap-beijing', '1', '', 'admin', '2023-01-08 11:19:59', 'admin', '2023-01-08 11:19:59', NULL),
       (5, 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '', 'admin',
        '2023-01-08 11:19:59', 'admin', '2023-01-08 11:19:59', NULL);
/*!40000 ALTER TABLE `sys_oss_config`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post`
(
    `post_id`     bigint NOT NULL,
    `post_code`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `post_name`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `post_sort`   int                                     DEFAULT NULL,
    `status`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `create_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post`
    DISABLE KEYS */;
INSERT INTO `sys_post`
VALUES (1, 'boss', 'BOSS', 1, '0', 'admin', '2023-01-08 11:19:44', 'admin', '2023-02-18 20:10:36', ''),
       (2, 'front_desk', '酒店前台', 2, '0', 'admin', '2023-01-08 11:19:44', 'admin', '2023-02-18 20:11:11', ''),
       (3, 'cleaning', '保洁', 3, '0', 'admin', '2023-01-08 11:19:44', 'admin', '2023-02-18 20:11:31', ''),
       (4, 'securityGuard', '保安', 4, '0', 'admin', '2023-01-08 11:19:44', 'admin', '2023-02-18 20:11:55', ''),
       (1626917612916916225, 'accountant', '会计', 5, '0', 'admin', '2023-02-18 20:12:40', 'admin',
        '2023-02-18 20:12:40', NULL);
/*!40000 ALTER TABLE `sys_post`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role`
(
    `role_id`             bigint NOT NULL,
    `role_name`           varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `role_key`            varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `role_sort`           int                                     DEFAULT NULL,
    `data_scope`          varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `menu_check_strictly` bit(1)                                  DEFAULT NULL,
    `dept_check_strictly` bit(1)                                  DEFAULT NULL,
    `status`              varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `del_flag`            char(1) COLLATE utf8mb4_general_ci      DEFAULT '0',
    `create_by`           varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time`         datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`           varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time`         datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`              varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role`
    DISABLE KEYS */;
INSERT INTO `sys_role`
VALUES (1, '超级管理员', 'admin', 1, '1', _binary '', _binary '', '0', '0', 'admin', '2023-01-08 11:19:44', '', NULL,
        '超级管理员'),
       (2, '普通角色', 'common', 2, '2', _binary '', _binary '', '0', '0', 'admin', '2023-01-08 11:19:44', 'admin',
        '2023-01-20 22:03:33', '普通角色'),
       (1626917703933313026, '会计', 'accountant', 3, NULL, _binary '', _binary '', '0', '0', 'admin',
        '2023-02-18 20:13:02', 'admin', '2023-02-18 20:13:02', NULL),
       (1626919136992751617, '酒店前台', 'front_desk', 4, NULL, _binary '', _binary '', '0', '0', 'admin',
        '2023-02-18 20:18:44', 'admin', '2023-02-18 20:25:47', NULL),
       (1626920000394371073, 'test', 'test', 6, NULL, _binary '', _binary '', '0', '2', 'admin',
        '2023-02-18 20:22:09', 'admin', '2023-02-18 20:22:09', NULL);
/*!40000 ALTER TABLE `sys_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept`
(
    `role_id` bigint NOT NULL,
    `dept_id` bigint NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu`
(
    `role_id` bigint NOT NULL,
    `menu_id` bigint NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu`
    DISABLE KEYS */;
INSERT INTO `sys_role_menu`
VALUES (2, 2),
       (2, 109),
       (2, 1046),
       (2, 1047),
       (2, 1048),
       (2, 111),
       (2, 113),
       (2, 112),
       (1626919136992751617, 1609),
       (1626919136992751617, 1611941206873186305),
       (1626919136992751617, 1606),
       (1626919136992751617, 1607),
       (1626919136992751617, 1608),
       (1626919136992751617, 1610),
       (1626919136992751617, 1611945274148495362);
/*!40000 ALTER TABLE `sys_role_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user`
(
    `user_id`     bigint NOT NULL,
    `dept_id`     bigint                                  DEFAULT NULL,
    `user_name`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `nick_name`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `user_type`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `email`       varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `phonenumber` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `sex`         varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `avatar`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `password`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `status`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `del_flag`    char(1) COLLATE utf8mb4_general_ci      DEFAULT '0',
    `login_ip`    varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `login_date`  date                                    DEFAULT NULL,
    `create_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user`
    DISABLE KEYS */;
INSERT INTO `sys_user`
VALUES (1, 100, 'admin', 'admin', 'sys_user', '1296581679@163.com', '15888888888', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-03-26', 'admin',
        '2023-01-08 11:19:43', 'admin', '2023-03-26 10:27:36', '管理员'),
       (1625474330462629889, 101, 'xiaojiang1213213', '213213', NULL, NULL, NULL, NULL, NULL,
        '$2a$10$mfZ1vcNnxbUL0ThQqp8sA.ZR1Y9jb7yo/fzmDYdUq418vUv2EOuBy', '0', '2', NULL, NULL, 'admin',
        '2023-02-14 20:37:35', 'admin', '2023-02-14 21:38:29', NULL);
/*!40000 ALTER TABLE `sys_user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post`
(
    `user_id` bigint NOT NULL,
    `post_id` bigint NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post`
    DISABLE KEYS */;
INSERT INTO `sys_user_post`
VALUES (1, 1);
/*!40000 ALTER TABLE `sys_user_post`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role`
(
    `user_id` bigint NOT NULL,
    `role_id` bigint NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role`
    DISABLE KEYS */;
INSERT INTO `sys_user_role`
VALUES (1, 1);
/*!40000 ALTER TABLE `sys_user_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_demo`
--

DROP TABLE IF EXISTS `test_demo`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_demo`
(
    `id`          bigint NOT NULL,
    `create_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_demo`
--

LOCK TABLES `test_demo` WRITE;
/*!40000 ALTER TABLE `test_demo`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `test_demo`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_tree`
--

DROP TABLE IF EXISTS `test_tree`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_tree`
(
    `id`          bigint NOT NULL,
    `parent_id`   bigint                                  DEFAULT NULL,
    `create_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_tree`
--

LOCK TABLES `test_tree` WRITE;
/*!40000 ALTER TABLE `test_tree`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `test_tree`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jiangjin-hotel'
--
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2023-03-26 12:01:01
