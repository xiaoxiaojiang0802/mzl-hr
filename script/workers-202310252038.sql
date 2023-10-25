-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: workers
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `approve`
--

DROP TABLE IF EXISTS `approve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approve` (
  `approved_id` bigint NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审批类型',
  `applicant` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请人',
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `approved_user` bigint DEFAULT NULL COMMENT '当前审批人',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approve`
--

LOCK TABLES `approve` WRITE;
/*!40000 ALTER TABLE `approve` DISABLE KEYS */;
/*!40000 ALTER TABLE `approve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_record`
--

DROP TABLE IF EXISTS `attendance_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_record` (
  `id` bigint NOT NULL,
  `employee_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工号',
  `employee_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '员工姓名',
  `date` date DEFAULT NULL COMMENT '打卡日期',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_record`
--

LOCK TABLES `attendance_record` WRITE;
/*!40000 ALTER TABLE `attendance_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_record`
--

DROP TABLE IF EXISTS `leave_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_record` (
  `id` bigint NOT NULL,
  `employee_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '员工姓名',
  `start_date` date DEFAULT NULL COMMENT '请假开始日期',
  `end_date` date DEFAULT NULL COMMENT '请假结束日期',
  `leave_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请假类型，如事假、病假、婚假等',
  `reason` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请假理由',
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请假状态，如已申请、已批准、已驳回等',
  `employee_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '员工id',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='请假记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_record`
--

LOCK TABLES `leave_record` WRITE;
/*!40000 ALTER TABLE `leave_record` DISABLE KEYS */;
INSERT INTO `leave_record` VALUES (1716801385855291393,NULL,'2023-10-24','2023-10-24','1','身体不舒服，请假在家休息','','1','admin','2023-10-24 20:58:42','admin','2023-10-24 20:58:42');
/*!40000 ALTER TABLE `leave_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_record`
--

DROP TABLE IF EXISTS `performance_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_record` (
  `id` bigint NOT NULL,
  `period` date DEFAULT NULL COMMENT '绩效周期',
  `score` bigint DEFAULT NULL COMMENT '绩效评分',
  `comment` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '绩效评语',
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '绩效状态',
  `employee_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '员工ID',
  `expound` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工作阐述',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='绩效记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_record`
--

LOCK TABLES `performance_record` WRITE;
/*!40000 ALTER TABLE `performance_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_punishment_record`
--

DROP TABLE IF EXISTS `reward_punishment_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward_punishment_record` (
  `id` bigint NOT NULL,
  `employee_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '员工姓名',
  `department` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '奖惩类型',
  `reason` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '奖惩原因',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '奖惩金额',
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '奖惩状态',
  `record_date` date DEFAULT NULL COMMENT '奖惩日期',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `employee_name` (`employee_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='奖惩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_punishment_record`
--

LOCK TABLES `reward_punishment_record` WRITE;
/*!40000 ALTER TABLE `reward_punishment_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward_punishment_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL,
  `config_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2023-01-08 11:19:55','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-01-08 11:19:55','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2023-01-08 11:19:55','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','false','Y','admin','2023-01-08 11:19:55','小江','2023-03-01 20:56:46','是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2023-01-08 11:19:55','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(11,'OSS预览列表资源开关','sys.oss.previewListResource','true','Y','admin','2023-01-08 11:19:55','',NULL,'true:开启, false:关闭');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `ancestors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_num` int DEFAULT NULL,
  `leader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,'0','职工管理系统',0,'管理员','15888888888','','0','0','admin','2023-01-08 11:19:42','admin','2023-10-24 20:31:36'),(101,1,'0,1','财务部',1,'财务部总经理','15888888888','cwbzjl@qq.com','0','0','admin','2023-01-08 11:19:42','admin','2023-01-20 23:06:00');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL,
  `dict_sort` int DEFAULT NULL,
  `dict_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dict_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `css_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `list_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-01-08 11:19:53','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2023-01-08 11:19:54','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2023-01-08 11:19:54','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-01-08 11:19:54','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-01-08 11:19:54','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-01-08 11:19:54','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-01-08 11:19:54','',NULL,'停用状态'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-01-08 11:19:54','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-01-08 11:19:54','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-01-08 11:19:54','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-01-08 11:19:54','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-01-08 11:19:54','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-01-08 11:19:54','',NULL,'关闭状态'),(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-01-08 11:19:54','',NULL,'新增操作'),(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-01-08 11:19:54','',NULL,'修改操作'),(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-01-08 11:19:54','',NULL,'删除操作'),(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-01-08 11:19:54','',NULL,'授权操作'),(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-01-08 11:19:54','',NULL,'导出操作'),(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-01-08 11:19:54','',NULL,'导入操作'),(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-01-08 11:19:54','',NULL,'强退操作'),(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-01-08 11:19:54','',NULL,'生成操作'),(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-01-08 11:19:54','',NULL,'清空操作'),(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-01-08 11:19:55','',NULL,'正常状态'),(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-01-08 11:19:55','',NULL,'停用状态'),(29,99,'其他','0','sys_oper_type','','info','N','0','admin','2023-01-08 11:19:54','',NULL,'其他操作'),(33,1,'事假','1','leave_type','','','Y','0','admin','2023-10-24 10:46:36','',NULL,''),(34,2,'病假','2','leave_type','','','N','0','admin','2023-10-24 10:46:36','',NULL,''),(35,3,'调休','3','leave_type','','','N','0','admin','2023-10-24 10:46:36','',NULL,''),(36,4,'年假','4','leave_type','','','Y','0','admin','2023-10-24 10:46:36','',NULL,''),(37,1,'奖励','1','reward_state','','','Y','0','admin','2023-10-25 20:09:05','',NULL,''),(38,2,'惩罚','2','reward_state','','','N','0','admin','2023-10-25 20:09:05','',NULL,'');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL,
  `dict_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dict_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2023-01-08 11:19:53','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2023-01-08 11:19:53','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2023-01-08 11:19:53','',NULL,'系统开关列表'),(6,'系统是否','sys_yes_no','0','admin','2023-01-08 11:19:53','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2023-01-08 11:19:53','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2023-01-08 11:19:53','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2023-01-08 11:19:53','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2023-01-08 11:19:53','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file` (
  `file_id` bigint NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_suffix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `service` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ipaddr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `order_num` int DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_frame` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_cache` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menu_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `visible` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `perms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system','','','1','0','M','0','0','','system','admin','2023-01-08 11:19:45',NULL,'2023-01-17 20:51:42','系统管理目录'),(100,'职工管理',0,1,'system/user','system/user/index','','1','0','C','0','0','system:user:list','user','admin','2023-01-08 11:19:45','admin','2023-10-24 19:39:58','用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','1','0','C','0','0','system:role:list','peoples','admin','2023-01-08 11:19:45','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','1','0','C','0','0','system:menu:list','tree-table','admin','2023-01-08 11:19:45','',NULL,'菜单管理菜单'),(103,'部门管理',0,4,'dept','system/dept/index','','1','0','C','0','0','system:dept:list','tree','admin','2023-01-08 11:19:45','admin','2023-10-24 19:37:43','部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','1','0','C','0','0','system:post:list','post','admin','2023-01-08 11:19:45','',NULL,'岗位管理菜单'),(107,'通知公告',0,2,'notice','system/notice/index','','1','0','C','0','0','system:notice:list','message','admin','2023-01-08 11:19:45','admin','2023-10-24 20:33:06','通知公告菜单'),(1001,'用户查询',100,1,'','','','1','0','F','0','0','system:user:query','#','admin','2023-01-08 11:19:46','',NULL,''),(1002,'用户新增',100,2,'','','','1','0','F','0','0','system:user:add','#','admin','2023-01-08 11:19:46','',NULL,''),(1003,'用户修改',100,3,'','','','1','0','F','0','0','system:user:edit','#','admin','2023-01-08 11:19:46','',NULL,''),(1004,'用户删除',100,4,'','','','1','0','F','0','0','system:user:remove','#','admin','2023-01-08 11:19:46','',NULL,''),(1005,'用户导出',100,5,'','','','1','0','F','0','0','system:user:export','#','admin','2023-01-08 11:19:46','',NULL,''),(1006,'用户导入',100,6,'','','','1','0','F','0','0','system:user:import','#','admin','2023-01-08 11:19:46','',NULL,''),(1007,'重置密码',100,7,'','','','1','0','F','0','0','system:user:resetPwd','#','admin','2023-01-08 11:19:46','',NULL,''),(1008,'角色查询',101,1,'','','','1','0','F','0','0','system:role:query','#','admin','2023-01-08 11:19:46','',NULL,''),(1009,'角色新增',101,2,'','','','1','0','F','0','0','system:role:add','#','admin','2023-01-08 11:19:46','',NULL,''),(1010,'角色修改',101,3,'','','','1','0','F','0','0','system:role:edit','#','admin','2023-01-08 11:19:46','',NULL,''),(1011,'角色删除',101,4,'','','','1','0','F','0','0','system:role:remove','#','admin','2023-01-08 11:19:46','',NULL,''),(1012,'角色导出',101,5,'','','','1','0','F','0','0','system:role:export','#','admin','2023-01-08 11:19:46','',NULL,''),(1013,'菜单查询',102,1,'','','','1','0','F','0','0','system:menu:query','#','admin','2023-01-08 11:19:46','',NULL,''),(1014,'菜单新增',102,2,'','','','1','0','F','0','0','system:menu:add','#','admin','2023-01-08 11:19:46','',NULL,''),(1015,'菜单修改',102,3,'','','','1','0','F','0','0','system:menu:edit','#','admin','2023-01-08 11:19:46','',NULL,''),(1016,'菜单删除',102,4,'','','','1','0','F','0','0','system:menu:remove','#','admin','2023-01-08 11:19:46','',NULL,''),(1017,'部门查询',103,1,'','','','1','0','F','0','0','system:dept:query','#','admin','2023-01-08 11:19:46','',NULL,''),(1018,'部门新增',103,2,'','','','1','0','F','0','0','system:dept:add','#','admin','2023-01-08 11:19:46','',NULL,''),(1019,'部门修改',103,3,'','','','1','0','F','0','0','system:dept:edit','#','admin','2023-01-08 11:19:46','',NULL,''),(1020,'部门删除',103,4,'','','','1','0','F','0','0','system:dept:remove','#','admin','2023-01-08 11:19:46','',NULL,''),(1021,'岗位查询',104,1,'','','','1','0','F','0','0','system:post:query','#','admin','2023-01-08 11:19:46','',NULL,''),(1022,'岗位新增',104,2,'','','','1','0','F','0','0','system:post:add','#','admin','2023-01-08 11:19:46','',NULL,''),(1023,'岗位修改',104,3,'','','','1','0','F','0','0','system:post:edit','#','admin','2023-01-08 11:19:46','',NULL,''),(1024,'岗位删除',104,4,'','','','1','0','F','0','0','system:post:remove','#','admin','2023-01-08 11:19:46','',NULL,''),(1025,'岗位导出',104,5,'','','','1','0','F','0','0','system:post:export','#','admin','2023-01-08 11:19:46','',NULL,''),(1036,'公告查询',107,1,'#','','','1','0','F','0','0','system:notice:query','#','admin','2023-01-08 11:19:47','',NULL,''),(1037,'公告新增',107,2,'#','','','1','0','F','0','0','system:notice:add','#','admin','2023-01-08 11:19:47','',NULL,''),(1038,'公告修改',107,3,'#','','','1','0','F','0','0','system:notice:edit','#','admin','2023-01-08 11:19:47','',NULL,''),(1039,'公告删除',107,4,'#','','','1','0','F','0','0','system:notice:remove','#','admin','2023-01-08 11:19:47','',NULL,''),(1716781916776914945,'考勤管理',0,5,'workers',NULL,NULL,'1','0','M','0','0',NULL,'excel','admin','2023-10-24 19:41:20','admin','2023-10-24 20:32:59',NULL),(1716784265322942464,'请假记录',1716781916776914945,1,'leave','workers/leave/index',NULL,'1','0','C','0','0','workers:leave:list','build','admin','2023-10-24 11:55:24','admin','2023-10-24 19:58:06','请假记录菜单'),(1716784265322942465,'请假记录查询',1716784265322942464,1,'#','',NULL,'1','0','F','0','0','workers:leave:query','#','admin','2023-10-24 11:55:24','admin','2023-10-24 19:58:23',''),(1716784265322942466,'请假记录新增',1716784265322942464,2,'#','',NULL,'1','0','F','0','0','workers:leave:add','#','admin','2023-10-24 11:55:24','admin','2023-10-24 19:58:31',''),(1716784265322942467,'请假记录修改',1716784265322942464,3,'#','',NULL,'1','0','F','0','0','workers:leave:edit','#','admin','2023-10-24 11:55:24','',NULL,''),(1716784265322942468,'请假记录删除',1716784265322942464,4,'#','',NULL,'1','0','F','0','0','workers:leave:remove','#','admin','2023-10-24 11:55:24','',NULL,''),(1716784265322942469,'请假记录导出',1716784265322942464,5,'#','',NULL,'1','0','F','0','0','workers:leave:export','#','admin','2023-10-24 11:55:24','',NULL,''),(1716784420222783488,'打卡记录',1716781916776914945,1,'attendance','workers/attendance/index',NULL,'1','0','C','0','0','workers:attendance:list','component','admin','2023-10-24 11:55:24','admin','2023-10-24 19:59:54','打卡记录菜单'),(1716784420222783489,'打卡记录查询',1716784420222783488,1,'#','',NULL,'1','0','F','0','0','workers:attendance:query','#','admin','2023-10-24 11:55:24','',NULL,''),(1716784420222783490,'打卡记录新增',1716784420222783488,2,'#','',NULL,'1','0','F','0','0','workers:attendance:add','#','admin','2023-10-24 11:55:24','',NULL,''),(1716784420222783491,'打卡记录修改',1716784420222783488,3,'#','',NULL,'1','0','F','0','0','workers:attendance:edit','#','admin','2023-10-24 11:55:24','',NULL,''),(1716784420222783492,'打卡记录删除',1716784420222783488,4,'#','',NULL,'1','0','F','0','0','workers:attendance:remove','#','admin','2023-10-24 11:55:24','',NULL,''),(1716784420222783493,'打卡记录导出',1716784420222783488,5,'#','',NULL,'1','0','F','0','0','workers:attendance:export','#','admin','2023-10-24 11:55:24','',NULL,''),(1716795590388338688,'奖惩记录',0,1,'reward','workers/reward/index',NULL,'1','0','C','0','0','workers:reward:list','money','admin','2023-10-24 12:41:18','admin','2023-10-24 20:42:22','奖惩菜单'),(1716795590388338689,'奖惩查询',1716795590388338688,1,'#','',NULL,'1','0','F','0','0','workers:reward:query','#','admin','2023-10-24 12:41:18','admin','2023-10-24 20:42:27',''),(1716795590388338690,'奖惩新增',1716795590388338688,2,'#','',NULL,'1','0','F','0','0','workers:reward:add','#','admin','2023-10-24 12:41:18','admin','2023-10-24 20:42:31',''),(1716795590388338691,'奖惩修改',1716795590388338688,3,'#','',NULL,'1','0','F','0','0','workers:reward:edit','#','admin','2023-10-24 12:41:18','admin','2023-10-24 20:42:35',''),(1716795590388338692,'奖惩删除',1716795590388338688,4,'#','',NULL,'1','0','F','0','0','workers:reward:remove','#','admin','2023-10-24 12:41:18','admin','2023-10-24 20:42:38',''),(1716795590388338693,'奖惩导出',1716795590388338688,5,'#','',NULL,'1','0','F','0','0','workers:reward:export','#','admin','2023-10-24 12:41:18','admin','2023-10-24 20:42:41','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` bigint NOT NULL,
  `notice_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notice_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notice_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1716800615558778882,'系统公告','2','<p>欢迎大家使用职工管理系统</p>','0','admin','2023-10-24 20:55:38','admin','2023-10-24 20:55:38',NULL);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `business_type` int DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `request_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `operator_type` int DEFAULT NULL,
  `oper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oper_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `json_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `error_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oper_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL,
  `post_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `post_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `post_sort` int DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'boss','BOSS',1,'0','admin','2023-01-08 11:19:44','admin','2023-02-18 20:10:36',''),(3,'cleaning','保洁',3,'0','admin','2023-01-08 11:19:44','admin','2023-02-18 20:11:31',''),(4,'securityGuard','保安',4,'0','admin','2023-01-08 11:19:44','admin','2023-02-18 20:11:55','');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_sort` int DEFAULT NULL,
  `data_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menu_check_strictly` bit(1) DEFAULT NULL,
  `dept_check_strictly` bit(1) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',_binary '',_binary '','0','0','admin','2023-01-08 11:19:44','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',_binary '',_binary '','0','0','admin','2023-01-08 11:19:44','admin','2023-01-20 22:03:33','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL,
  `dept_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL,
  `dept_id` bigint DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_date` date DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `superior_id` bigint DEFAULT NULL,
  `employee_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工号',
  `entry` date DEFAULT NULL,
  `due` date DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,1,'admin','admin','sys_user','123456@163.com','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-10-25','admin','2023-01-08 11:19:43','admin','2023-10-25 20:04:04','管理员',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hr'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-25 20:38:26
