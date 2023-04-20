/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : jiangjin-hotel

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 26/02/2023 20:45:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for daily_paper
-- ----------------------------
DROP TABLE IF EXISTS `daily_paper`;
CREATE TABLE `daily_paper`  (
  `daily_paper_id` bigint NOT NULL,
  `data_sale` date NULL DEFAULT NULL,
  `sales` decimal(10, 2) NULL DEFAULT NULL,
  `hour_room_amount` decimal(10, 2) NULL DEFAULT NULL,
  `check_in` int NULL DEFAULT NULL,
  `hour_room` bigint NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `duty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值班人员',
  `business_json` json NULL COMMENT '经营情况',
  `room_type_json` json NULL COMMENT '酒店类型',
  UNIQUE INDEX `actable_uni_data_sale`(`data_sale`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of daily_paper
-- ----------------------------
INSERT INTO `daily_paper` VALUES (1627120155437633538, '2023-02-18', NULL, NULL, NULL, NULL, 'admin', '2023-02-19 09:37:30', 'admin', '2023-02-19 09:37:30', NULL, NULL, NULL);
INSERT INTO `daily_paper` VALUES (1627122392121544705, '2023-02-19', NULL, NULL, NULL, NULL, 'admin', '2023-02-19 09:46:23', 'admin', '2023-02-19 09:46:23', NULL, NULL, NULL);
INSERT INTO `daily_paper` VALUES (1627123726698737666, '2023-02-20', NULL, NULL, NULL, NULL, 'admin', '2023-02-19 09:51:42', 'admin', '2023-02-19 09:51:42', NULL, NULL, NULL);
INSERT INTO `daily_paper` VALUES (1627125308748312578, '2023-02-21', NULL, NULL, NULL, NULL, 'admin', '2023-02-19 09:57:59', 'admin', '2023-02-19 09:57:59', '小江', NULL, NULL);
INSERT INTO `daily_paper` VALUES (1627126376215457793, '2023-02-03', NULL, NULL, NULL, NULL, 'admin', '2023-02-19 10:02:13', 'admin', '2023-02-19 11:07:01', '小江', NULL, NULL);
INSERT INTO `daily_paper` VALUES (1627126432486240257, '2023-02-04', NULL, NULL, NULL, NULL, 'admin', '2023-02-19 10:02:27', 'admin', '2023-02-19 11:06:56', '小江', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL,
  `gen_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL,
  `column_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_pk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_increment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_required` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_insert` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_edit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for hotGuest
-- ----------------------------
DROP TABLE IF EXISTS `hotGuest`;
CREATE TABLE `hotGuest`  (
  `guest_id` bigint NOT NULL,
  `guest_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客人名称',
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `card_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住地址',
  `room_record_id` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotGuest
-- ----------------------------
INSERT INTO `hotGuest` VALUES (1623324259654668289, '李建江', '18349304247', '510522199612109258', 'admin', '2023-02-08 22:13:58', 'admin', '2023-02-08 22:13:58', NULL, 1623324259243626496);
INSERT INTO `hotGuest` VALUES (1623658958927265793, NULL, NULL, NULL, 'admin', '2023-02-09 20:23:57', 'admin', '2023-02-09 20:23:57', NULL, 1623658958843379712);
INSERT INTO `hotGuest` VALUES (1623676529231626242, '1', '3', '2', 'admin', '2023-02-09 21:33:46', 'admin', '2023-02-09 21:33:46', NULL, 1623676529093214208);
INSERT INTO `hotGuest` VALUES (1623676810044473345, '1', '3', '2', 'admin', '2023-02-09 21:34:53', 'admin', '2023-02-09 21:34:53', NULL, 1623676810031890432);
INSERT INTO `hotGuest` VALUES (1623676850691473409, '1', '3', '2', 'admin', '2023-02-09 21:35:02', 'admin', '2023-02-09 21:35:02', NULL, 1623676850670501888);
INSERT INTO `hotGuest` VALUES (1623677087896141826, '1', '3', '2', 'admin', '2023-02-09 21:35:59', 'admin', '2023-02-09 21:35:59', NULL, 1623677087908724736);
INSERT INTO `hotGuest` VALUES (1623677244033302530, '1', '3', '2', 'admin', '2023-02-09 21:36:36', 'admin', '2023-02-09 21:36:36', NULL, 1623677244033302528);
INSERT INTO `hotGuest` VALUES (1623677319744684034, '1', '3', '2', 'admin', '2023-02-09 21:36:54', 'admin', '2023-02-09 21:36:54', NULL, 1623677319736295424);
INSERT INTO `hotGuest` VALUES (1625119890756952065, '李建江', '19141909762', '510522199612109258', 'admin', '2023-02-13 21:09:10', 'admin', '2023-02-13 21:09:10', NULL, 1625119890677260288);
INSERT INTO `hotGuest` VALUES (1625468000465145858, NULL, NULL, NULL, 'admin', '2023-02-14 20:12:26', 'admin', '2023-02-14 20:12:26', NULL, 1625468000427397120);
INSERT INTO `hotGuest` VALUES (1625468779141877763, '李建江', NULL, NULL, 'admin', '2023-02-14 20:15:31', 'admin', '2023-02-14 20:15:31', NULL, 1625468779162849280);
INSERT INTO `hotGuest` VALUES (1625477579605385218, '213', '23', '2', 'admin', '2023-02-14 20:50:30', 'admin', '2023-02-14 20:50:30', NULL, 1625477579534082048);
INSERT INTO `hotGuest` VALUES (1625478007873183746, NULL, NULL, NULL, 'admin', '2023-02-14 20:52:12', 'admin', '2023-02-14 20:52:12', NULL, 1625477906010316800);
INSERT INTO `hotGuest` VALUES (1625478389999431682, NULL, NULL, NULL, 'admin', '2023-02-14 20:53:43', 'admin', '2023-02-14 20:53:43', NULL, 1625478389886185472);
INSERT INTO `hotGuest` VALUES (1625483219052605442, '李建江', '18349304247', '510522199612109258', 'admin', '2023-02-14 21:12:54', 'admin', '2023-02-14 21:12:54', NULL, 1625483218998079488);
INSERT INTO `hotGuest` VALUES (1625483349222830081, '李建江', '18349304247', '510522199612109258', 'admin', '2023-02-14 21:13:25', 'admin', '2023-02-14 21:13:25', NULL, 1625483349256384512);
INSERT INTO `hotGuest` VALUES (1625487789493399554, '231', '213', '213', 'admin', '2023-02-14 21:31:04', 'admin', '2023-02-14 21:31:04', NULL, 1625487789455650816);
INSERT INTO `hotGuest` VALUES (1625488108382138369, NULL, NULL, NULL, 'admin', '2023-02-14 21:32:20', 'admin', '2023-02-14 21:32:20', NULL, 1625488108403109888);
INSERT INTO `hotGuest` VALUES (1626204349677789185, '李建江', '18349304247', '510522199612109258', 'admin', '2023-02-16 20:58:25', 'admin', '2023-02-16 20:58:25', NULL, 1626204349560348672);
INSERT INTO `hotGuest` VALUES (1626204731065851905, '李建江', '18349304247', '510522199612109258', 'admin', '2023-02-16 20:59:56', 'admin', '2023-02-16 20:59:56', NULL, 1626204731061657600);
INSERT INTO `hotGuest` VALUES (1626916350771068929, '23', '23', '23', 'admin', '2023-02-18 20:07:39', 'admin', '2023-02-18 20:07:39', NULL, 1626916350745903104);
INSERT INTO `hotGuest` VALUES (1626916519696662530, '23', '23', '23', 'admin', '2023-02-18 20:08:20', 'admin', '2023-02-18 20:08:20', NULL, 1626916519696662528);
INSERT INTO `hotGuest` VALUES (1627642739132583938, '李建江', '183', '510522199612109258', '小江', '2023-02-20 20:14:04', '小江', '2023-02-20 20:14:04', NULL, 1627642739078057984);
INSERT INTO `hotGuest` VALUES (1627643212745003010, '23', '213', '213', '小江', '2023-02-20 20:15:57', '小江', '2023-02-20 20:15:57', NULL, 1627643212753391616);
INSERT INTO `hotGuest` VALUES (1627643423693279233, '李建江', '15', '15', '小江', '2023-02-20 20:16:47', '小江', '2023-02-20 20:16:47', NULL, 1627643423638753280);

-- ----------------------------
-- Table structure for hotInfrastructure
-- ----------------------------
DROP TABLE IF EXISTS `hotInfrastructure`;
CREATE TABLE `hotInfrastructure`  (
  `infrastructure_id` bigint NOT NULL,
  `infrastructure_name` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_num` int NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `room_type_id` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房间基础设施' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotInfrastructure
-- ----------------------------
INSERT INTO `hotInfrastructure` VALUES (1615702791139713025, '洗浴用品', '牙刷、牙膏', NULL, 'admin', '2023-01-18 20:31:27', 'admin', '2023-01-18 20:31:27', 1615702790867083264);
INSERT INTO `hotInfrastructure` VALUES (1615702791139713026, '食品饮品', '瓶装水', 1, 'admin', '2023-01-18 20:26:35', 'admin', '2023-01-18 20:26:35', 1615702790867083264);
INSERT INTO `hotInfrastructure` VALUES (1615702791139713027, '费用政策', '免费停车场', 2, 'admin', '2023-01-18 20:26:58', 'admin', '2023-01-18 20:26:58', 1615702790867083264);
INSERT INTO `hotInfrastructure` VALUES (1615702791139713028, '便利设施', NULL, 3, 'admin', '2023-01-18 20:30:03', 'admin', '2023-01-18 20:30:03', 1615702790867083264);
INSERT INTO `hotInfrastructure` VALUES (1615702791139713029, '浴室配套', NULL, 3, 'admin', '2023-01-18 20:31:18', 'admin', '2023-01-18 20:31:18', 1615702790867083264);
INSERT INTO `hotInfrastructure` VALUES (1615702791139713030, '媒体科技', '电视机', 4, 'admin', '2023-01-18 20:31:08', 'admin', '2023-01-18 20:31:08', 1615702790867083264);
INSERT INTO `hotInfrastructure` VALUES (1615702904188788737, '洗浴用品', '牙刷、牙膏', NULL, 'admin', '2023-01-18 20:31:27', 'admin', '2023-01-18 20:31:27', 1615702862526767104);
INSERT INTO `hotInfrastructure` VALUES (1615702904192983041, '食品饮品', '瓶装水', 1, 'admin', '2023-01-18 20:26:35', 'admin', '2023-01-18 20:26:35', 1615702862526767104);
INSERT INTO `hotInfrastructure` VALUES (1615702904197177346, '费用政策', '免费停车场', 2, 'admin', '2023-01-18 20:26:58', 'admin', '2023-01-18 20:26:58', 1615702862526767104);
INSERT INTO `hotInfrastructure` VALUES (1615702904201371650, '便利设施', '23', 3, 'admin', '2023-01-18 20:30:03', 'admin', '2023-01-18 20:30:03', 1615702862526767104);
INSERT INTO `hotInfrastructure` VALUES (1615702904205565953, '浴室配套', '24小时热水', 3, 'admin', '2023-01-18 20:31:18', 'admin', '2023-01-18 20:31:18', 1615702862526767104);
INSERT INTO `hotInfrastructure` VALUES (1615702904205565954, '媒体科技', '电视机', 4, 'admin', '2023-01-18 20:31:08', 'admin', '2023-01-18 20:31:08', 1615702862526767104);
INSERT INTO `hotInfrastructure` VALUES (1626568357584920577, '洗浴用品', NULL, NULL, 'admin', '2023-01-18 20:31:27', 'admin', '2023-01-18 20:31:27', 1626568357559754752);
INSERT INTO `hotInfrastructure` VALUES (1626568357584920578, '食品饮品', '瓶装水', 1, 'admin', '2023-01-18 20:26:35', 'admin', '2023-01-18 20:26:35', 1626568357559754752);
INSERT INTO `hotInfrastructure` VALUES (1626568357584920579, '费用政策', '免费停车场', 2, 'admin', '2023-01-18 20:26:58', 'admin', '2023-01-18 20:26:58', 1626568357559754752);
INSERT INTO `hotInfrastructure` VALUES (1626568357584920580, '便利设施', NULL, 3, 'admin', '2023-01-18 20:30:03', 'admin', '2023-01-18 20:30:03', 1626568357559754752);
INSERT INTO `hotInfrastructure` VALUES (1626568357584920581, '浴室配套', NULL, 3, 'admin', '2023-01-18 20:31:18', 'admin', '2023-01-18 20:31:18', 1626568357559754752);
INSERT INTO `hotInfrastructure` VALUES (1626568357584920582, '媒体科技', '电视机', 4, 'admin', '2023-01-18 20:31:08', 'admin', '2023-01-18 20:31:08', 1626568357559754752);
INSERT INTO `hotInfrastructure` VALUES (1626915107080241154, '洗浴用品', NULL, NULL, 'admin', '2023-01-18 20:31:27', 'admin', '2023-01-18 20:31:27', 1626915106904080384);
INSERT INTO `hotInfrastructure` VALUES (1626915107080241155, '食品饮品', '瓶装水', 1, 'admin', '2023-01-18 20:26:35', 'admin', '2023-01-18 20:26:35', 1626915106904080384);
INSERT INTO `hotInfrastructure` VALUES (1626915107080241156, '费用政策', '免费停车场', 2, 'admin', '2023-01-18 20:26:58', 'admin', '2023-01-18 20:26:58', 1626915106904080384);
INSERT INTO `hotInfrastructure` VALUES (1626915107080241157, '便利设施', NULL, 3, 'admin', '2023-01-18 20:30:03', 'admin', '2023-01-18 20:30:03', 1626915106904080384);
INSERT INTO `hotInfrastructure` VALUES (1626915107143155713, '浴室配套', '24小时热水', 3, 'admin', '2023-01-18 20:31:18', 'admin', '2023-01-18 20:31:18', 1626915106904080384);
INSERT INTO `hotInfrastructure` VALUES (1626915107143155714, '媒体科技', '电视机', 4, 'admin', '2023-01-18 20:31:08', 'admin', '2023-01-18 20:31:08', 1626915106904080384);

-- ----------------------------
-- Table structure for infrastructure_temp
-- ----------------------------
DROP TABLE IF EXISTS `infrastructure_temp`;
CREATE TABLE `infrastructure_temp`  (
  `infrastructure_name` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_num` int NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `infrastructure_temp_id` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房间基础设施模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infrastructure_temp
-- ----------------------------
INSERT INTO `infrastructure_temp` VALUES ('食品饮品', '瓶装水', 1, 'admin', '2023-01-18 20:26:35', 'admin', '2023-01-18 20:29:44', 1615687088324030465);
INSERT INTO `infrastructure_temp` VALUES ('费用政策', '免费停车场', 2, 'admin', '2023-01-18 20:26:58', 'admin', '2023-01-18 20:29:54', 1615687187183775745);
INSERT INTO `infrastructure_temp` VALUES ('便利设施', NULL, 3, 'admin', '2023-01-18 20:30:03', 'admin', '2023-01-18 20:30:03', 1615687962953854977);
INSERT INTO `infrastructure_temp` VALUES ('媒体科技', '电视机', 4, 'admin', '2023-01-18 20:31:08', 'admin', '2023-01-18 20:31:08', 1615688236195983361);
INSERT INTO `infrastructure_temp` VALUES ('浴室配套', NULL, 3, 'admin', '2023-01-18 20:31:18', 'admin', '2023-01-18 20:31:18', 1615688275576303617);
INSERT INTO `infrastructure_temp` VALUES ('洗浴用品', NULL, NULL, 'admin', '2023-01-18 20:31:27', 'admin', '2023-01-18 20:31:27', 1615688315485106178);

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `material_id` bigint NOT NULL,
  `consumable_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耗材编号',
  `material_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耗材名称',
  `inventory` bigint NULL DEFAULT NULL COMMENT '库存',
  `alarms_number` bigint NULL DEFAULT NULL COMMENT '报警数量',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material
-- ----------------------------

-- ----------------------------
-- Table structure for hotRoom
-- ----------------------------
DROP TABLE IF EXISTS `hotRoom`;
CREATE TABLE `hotRoom`  (
  `room_id` bigint NOT NULL,
  `room_type_id` bigint NULL DEFAULT NULL,
  `room_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房型名称',
  `room_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间编号',
  `room_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'hot_room_state 房间状态',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `room_record_id` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotRoom
-- ----------------------------
INSERT INTO `hotRoom` VALUES (1616417790774595585, 1615349962633965570, '豪华大床房', '3022', '1', 'admin', '2023-01-20 20:50:08', '小江', '2023-02-20 20:15:59', 1627643212753391616);
INSERT INTO `hotRoom` VALUES (1616417790774595586, 1615334675943641090, '标准双人间', '3021', '2', 'admin', '2023-01-20 20:50:08', '小江', '2023-02-20 20:16:47', 1627643423638753280);
INSERT INTO `hotRoom` VALUES (1616435611655065601, 1615349962633965570, '豪华大床房', '1022', '4', 'admin', '2023-01-20 22:00:56', '小江', '2023-02-20 20:16:50', 1626916519696662528);
INSERT INTO `hotRoom` VALUES (1616435611655065602, 1615334675943641090, '标准双人间', '1021', '1', 'admin', '2023-01-20 22:00:56', 'admin', '2023-02-17 21:04:16', 1625478389886185472);
INSERT INTO `hotRoom` VALUES (1616449353285435394, 1615334675943641090, '标准双人间', '1025', '1', 'admin', '2023-01-20 22:55:33', 'admin', '2023-02-09 21:35:02', NULL);
INSERT INTO `hotRoom` VALUES (1616449353285435395, 1615334675943641090, '标准双人间', '1025', '1', 'admin', '2023-01-20 22:55:33', 'admin', '2023-02-14 21:29:52', 1625483349256384512);
INSERT INTO `hotRoom` VALUES (1616449353285435396, 1615334675943641090, '标准双人间', '1025', '1', 'admin', '2023-01-20 22:55:33', 'admin', '2023-02-09 20:23:57', NULL);
INSERT INTO `hotRoom` VALUES (1616449353285435397, 1615334675943641090, '标准双人间', '1025', '1', 'admin', '2023-01-20 22:55:33', 'admin', '2023-01-20 22:55:33', NULL);
INSERT INTO `hotRoom` VALUES (1616449353285435398, 1615334675943641090, '标准双人间', '1025', '1', 'admin', '2023-01-20 22:55:33', 'admin', '2023-02-17 20:53:13', NULL);
INSERT INTO `hotRoom` VALUES (1616449353285435399, 1615334675943641090, '标准双人间', '1025', '1', 'admin', '2023-01-20 22:55:33', 'admin', '2023-02-17 21:04:11', NULL);
INSERT INTO `hotRoom` VALUES (1616449353285435400, 1615334675943641090, '标准双人间', '1025', '1', 'admin', '2023-01-20 22:55:33', 'admin', '2023-01-20 22:55:33', NULL);
INSERT INTO `hotRoom` VALUES (1616449353285435401, 1615334675943641090, '标准双人间', '1025', '1', 'admin', '2023-01-20 22:55:33', 'admin', '2023-01-20 22:55:33', NULL);
INSERT INTO `hotRoom` VALUES (1616451579429072898, 1615349962633965570, '豪华大床房', '1023', '1', 'admin', '2023-01-20 23:04:23', 'admin', '2023-02-14 20:12:26', NULL);
INSERT INTO `hotRoom` VALUES (1616451579429072899, 1615349962633965570, '豪华大床房', '1023', '1', 'admin', '2023-01-20 23:04:23', 'admin', '2023-02-09 21:36:54', NULL);
INSERT INTO `hotRoom` VALUES (1626568681058033665, 1615334675943641090, '标准双人间', '518', '1', 'admin', '2023-02-17 21:06:08', 'admin', '2023-02-17 21:06:08', NULL);
INSERT INTO `hotRoom` VALUES (1626568681066422274, 1615334675943641090, '标准双人间', '528', '1', 'admin', '2023-02-17 21:06:08', 'admin', '2023-02-17 21:06:08', NULL);
INSERT INTO `hotRoom` VALUES (1626568681066422275, 1615334675943641090, '标准双人间', '538', '1', 'admin', '2023-02-17 21:06:08', 'admin', '2023-02-17 21:06:08', NULL);
INSERT INTO `hotRoom` VALUES (1626568681066422276, 1615334675943641090, '标准双人间', '528', '1', 'admin', '2023-02-17 21:06:08', 'admin', '2023-02-17 21:06:08', NULL);
INSERT INTO `hotRoom` VALUES (1626568681066422277, 1615334675943641090, '标准双人间', '518', '1', 'admin', '2023-02-17 21:06:08', 'admin', '2023-02-17 21:06:08', NULL);
INSERT INTO `hotRoom` VALUES (1626915349095776258, 1615334675943641090, '标准双人间', '225', '1', 'admin', '2023-02-18 20:03:41', 'admin', '2023-02-18 20:03:41', NULL);

-- ----------------------------
-- Table structure for room_record
-- ----------------------------
DROP TABLE IF EXISTS `room_record`;
CREATE TABLE `room_record`  (
  `room_record_id` bigint NOT NULL,
  `start_date` date NULL DEFAULT NULL COMMENT '开房日期',
  `check_in_time` datetime(0) NULL DEFAULT NULL COMMENT '入住日期',
  `check_out_time` datetime(0) NULL DEFAULT NULL COMMENT '离店时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `end_date` date NULL DEFAULT NULL COMMENT '离店日期',
  `check_out` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_record
-- ----------------------------
INSERT INTO `room_record` VALUES (1627642739078057984, '2023-02-20', NULL, NULL, '小江', '2023-02-20 20:14:04', '小江', '2023-02-20 20:14:04', 55.00, '2023-02-21', '0', '1', '1', NULL);
INSERT INTO `room_record` VALUES (1627643212753391616, '2023-02-20', NULL, NULL, '小江', '2023-02-20 20:15:57', '小江', '2023-02-20 20:15:57', 2.00, '2023-02-21', '0', '1', '1', NULL);
INSERT INTO `room_record` VALUES (1627643423638753280, '2023-02-20', NULL, NULL, '小江', '2023-02-20 20:16:47', '小江', '2023-02-20 20:16:47', 45.00, '2023-02-21', '0', '1', '1', NULL);

-- ----------------------------
-- Table structure for room_service
-- ----------------------------
DROP TABLE IF EXISTS `room_service`;
CREATE TABLE `room_service`  (
  `room_service_id` bigint NOT NULL,
  `service_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务类型 hot_service_type',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_service
-- ----------------------------

-- ----------------------------
-- Table structure for room_tag
-- ----------------------------
DROP TABLE IF EXISTS `room_tag`;
CREATE TABLE `room_tag`  (
  `room_tag_id` bigint NOT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_tag
-- ----------------------------
INSERT INTO `room_tag` VALUES (1615321952107204609, 'WIFI', NULL, 'admin', '2023-01-17 20:15:39', 'admin', '2023-01-17 20:15:39');
INSERT INTO `room_tag` VALUES (1615338750294736897, '靠窗', NULL, 'admin', '2023-01-17 21:22:24', 'admin', '2023-01-17 21:22:24');
INSERT INTO `room_tag` VALUES (1615688590019080193, '早餐', NULL, 'admin', '2023-01-18 20:32:33', 'admin', '2023-01-18 20:32:33');

-- ----------------------------
-- Table structure for room_type
-- ----------------------------
DROP TABLE IF EXISTS `room_type`;
CREATE TABLE `room_type`  (
  `room_type_id` bigint NOT NULL,
  `room_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房型名称',
  `person_count` int NULL DEFAULT NULL COMMENT '居住人数',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_type
-- ----------------------------
INSERT INTO `room_type` VALUES (1615334675943641090, '标准双人间', NULL, 78.00, 'admin', '2023-01-17 21:06:13', 'admin', '2023-02-18 20:02:25');
INSERT INTO `room_type` VALUES (1615349962633965570, '豪华大床房', NULL, 115.00, 'admin', '2023-01-17 22:06:58', 'admin', '2023-02-17 20:50:24');
INSERT INTO `room_type` VALUES (1626568357559754752, '精致单人间', NULL, 88.00, 'admin', '2023-02-17 21:04:52', 'admin', '2023-02-17 21:04:52');
INSERT INTO `room_type` VALUES (1626915106904080384, '双人情侣房', NULL, 155.00, 'admin', '2023-02-18 20:02:43', 'admin', '2023-02-18 20:02:58');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint NOT NULL,
  `config_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `config_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-01-08 11:19:55', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-01-08 11:19:55', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-01-08 11:19:55', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-01-08 11:19:55', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-01-08 11:19:55', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2023-01-08 11:19:55', '', NULL, 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `ancestors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_num` int NULL DEFAULT NULL,
  `leader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '智慧酒店', 0, '管理员', '18349304247', 'xxhcloud@qq.com', '0', '0', 'admin', '2023-01-08 11:19:42', 'admin', '2023-01-20 23:05:22');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '财务部', 1, '财务部总经理', '15888888888', 'cwbzjl@qq.com', '0', '2', 'admin', '2023-01-08 11:19:42', 'admin', '2023-01-20 23:06:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL,
  `dict_sort` int NULL DEFAULT NULL,
  `dict_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dict_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `css_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `list_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-01-08 11:19:55', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-01-08 11:19:55', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-08 11:19:54', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (1616418614431043586, 0, '正常', '1', 'hot_room_state', NULL, 'success', NULL, '0', 'admin', '2023-01-20 20:53:24', 'admin', '2023-02-08 21:46:49', NULL);
INSERT INTO `sys_dict_data` VALUES (1622942518188294146, 2, '有客', '2', 'hot_room_state', NULL, 'info', NULL, '0', NULL, '2023-02-07 20:57:04', '小江', '2023-02-20 20:18:12', NULL);
INSERT INTO `sys_dict_data` VALUES (1622942518188294147, 3, '空闲', '3', 'hot_room_state', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:57:04', NULL, '2023-02-07 20:57:04', NULL);
INSERT INTO `sys_dict_data` VALUES (1622942520939757570, 1, '微信', '1', 'hot_pay_method', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:57:04', NULL, '2023-02-07 20:57:04', NULL);
INSERT INTO `sys_dict_data` VALUES (1622942520939757571, 2, '支付宝', '2', 'hot_pay_method', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:57:04', NULL, '2023-02-07 20:57:04', NULL);
INSERT INTO `sys_dict_data` VALUES (1622942520939757572, 3, '现金', '3', 'hot_pay_method', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:57:04', NULL, '2023-02-07 20:57:04', NULL);
INSERT INTO `sys_dict_data` VALUES (1622942520939757573, 4, '平台支付', '4', 'hot_pay_method', NULL, 'primary', NULL, '0', NULL, '2023-02-07 20:57:04', 'admin', '2023-02-19 08:58:44', NULL);
INSERT INTO `sys_dict_data` VALUES (1622943003653816322, 1, '美团', '1', 'hot_order_platform', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:59:00', NULL, '2023-02-07 20:59:00', NULL);
INSERT INTO `sys_dict_data` VALUES (1622943003653816323, 2, '去哪儿', '2', 'hot_order_platform', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:59:00', NULL, '2023-02-07 20:59:00', NULL);
INSERT INTO `sys_dict_data` VALUES (1622943003653816324, 3, '携程', '3', 'hot_order_platform', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:59:00', NULL, '2023-02-07 20:59:00', NULL);
INSERT INTO `sys_dict_data` VALUES (1622943003653816325, 4, '飞猪', '4', 'hot_order_platform', NULL, NULL, NULL, '0', NULL, '2023-02-07 20:59:00', NULL, '2023-02-07 20:59:00', NULL);
INSERT INTO `sys_dict_data` VALUES (1627643580065320961, 4, '空脏', '4', 'hot_room_state', NULL, 'warning', NULL, '0', '小江', '2023-02-20 20:17:24', '小江', '2023-02-20 20:18:17', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL,
  `dict_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dict_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-01-08 11:19:53', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (1616418570927722498, '房间状态', 'hot_room_state', '0', 'admin', '2023-01-20 20:53:14', 'admin', '2023-01-20 20:53:14', NULL);
INSERT INTO `sys_dict_type` VALUES (1622942520734236672, '支付方式', 'hot_pay_method', '0', NULL, '2023-02-07 20:57:04', NULL, '2023-02-07 20:57:04', NULL);
INSERT INTO `sys_dict_type` VALUES (1622943003439906816, '下单平台', 'hot_order_platform', '0', NULL, '2023-02-07 20:59:00', NULL, '2023-02-07 20:59:00', NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ipaddr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_time` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1611938701141389314, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-08');
INSERT INTO `sys_logininfor` VALUES (1615321799988187137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-17');
INSERT INTO `sys_logininfor` VALUES (1615331099108257794, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-17');
INSERT INTO `sys_logininfor` VALUES (1615682002906587138, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-18');
INSERT INTO `sys_logininfor` VALUES (1615682131201957890, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2023-01-18');
INSERT INTO `sys_logininfor` VALUES (1615682167348469761, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-18');
INSERT INTO `sys_logininfor` VALUES (1616417599975706625, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-20');
INSERT INTO `sys_logininfor` VALUES (1616418130412556289, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-20');
INSERT INTO `sys_logininfor` VALUES (1616431989756121089, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-01-20');
INSERT INTO `sys_logininfor` VALUES (1622572057658986498, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-06');
INSERT INTO `sys_logininfor` VALUES (1622576145096318978, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-06');
INSERT INTO `sys_logininfor` VALUES (1622939663352053761, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-07');
INSERT INTO `sys_logininfor` VALUES (1622944352676200449, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-07');
INSERT INTO `sys_logininfor` VALUES (1623297956830367745, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-08');
INSERT INTO `sys_logininfor` VALUES (1623309263130447874, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-08');
INSERT INTO `sys_logininfor` VALUES (1623658237498589186, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-09');
INSERT INTO `sys_logininfor` VALUES (1623665434693566466, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2023-02-09');
INSERT INTO `sys_logininfor` VALUES (1623665450229268481, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-09');
INSERT INTO `sys_logininfor` VALUES (1625119739187388418, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-13');
INSERT INTO `sys_logininfor` VALUES (1625120674550734850, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-13');
INSERT INTO `sys_logininfor` VALUES (1625467900426801153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-14');
INSERT INTO `sys_logininfor` VALUES (1626204151874412545, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-16');
INSERT INTO `sys_logininfor` VALUES (1626559988815966210, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-17');
INSERT INTO `sys_logininfor` VALUES (1626560215803310081, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-17');
INSERT INTO `sys_logininfor` VALUES (1626914977933426689, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-18');
INSERT INTO `sys_logininfor` VALUES (1626931705254047746, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2023-02-18');
INSERT INTO `sys_logininfor` VALUES (1626931718361247746, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-18');
INSERT INTO `sys_logininfor` VALUES (1627109201589112833, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-19');
INSERT INTO `sys_logininfor` VALUES (1627141249141944322, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-19');
INSERT INTO `sys_logininfor` VALUES (1627141280196571137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2023-02-19');
INSERT INTO `sys_logininfor` VALUES (1627141543519170561, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-19');
INSERT INTO `sys_logininfor` VALUES (1627640717444501505, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-20');
INSERT INTO `sys_logininfor` VALUES (1627654732090511362, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-20');
INSERT INTO `sys_logininfor` VALUES (1628026140524023810, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-21');
INSERT INTO `sys_logininfor` VALUES (1629112321462591490, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-24');
INSERT INTO `sys_logininfor` VALUES (1629119266793832450, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-24');
INSERT INTO `sys_logininfor` VALUES (1629820233403154434, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-02-26');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `order_num` int NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_frame` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_cache` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `visible` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `perms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', '', '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2023-01-08 11:19:45', NULL, '2023-01-17 20:51:42', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '1', '0', 'M', '1', '0', '', 'monitor', 'admin', '2023-01-08 11:19:45', 'admin', '2023-02-18 20:06:45', '系统监控目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-01-08 11:19:45', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-01-08 11:19:45', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-01-08 11:19:45', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-01-08 11:19:45', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-01-08 11:19:45', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-01-08 11:19:45', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-01-08 11:19:45', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-01-08 11:19:45', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2023-01-08 11:19:45', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '1', '0', 'C', '1', '0', 'monitor:online:list', 'online', 'admin', '2023-01-08 11:19:45', 'admin', '2023-02-18 20:06:38', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-01-08 11:19:45', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-01-08 11:19:45', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-01-08 11:19:45', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (117, 'Admin监控', 2, 5, 'Admin', 'monitor/admin/index', '', '1', '0', 'C', '0', '0', 'monitor:admin:list', 'dashboard', 'admin', '2023-01-08 11:19:45', '', NULL, 'Admin监控菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', '1', '0', 'C', '0', '0', 'system:oss:list', 'upload', 'admin', '2023-01-08 11:19:46', '', NULL, '文件管理菜单');
INSERT INTO `sys_menu` VALUES (120, '任务调度中心', 2, 5, 'XxlJob', 'monitor/xxljob/index', '', '1', '0', 'C', '0', '0', 'monitor:xxljob:list', 'job', 'admin', '2023-01-08 11:19:46', '', NULL, 'Xxl-Job控制台菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-01-08 11:19:46', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-01-08 11:19:46', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-01-08 11:19:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:query', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:upload', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:download', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:remove', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604, '配置添加', 118, 5, '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:add', '#', 'admin', '2023-01-08 11:19:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1611941206873186305, '酒店管理', 0, 1, 'hotel', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'icon', 'admin', '2023-01-08 12:21:47', 'admin', '2023-01-08 12:21:47', NULL);
INSERT INTO `sys_menu` VALUES (1611945274148495362, '酒店标签', 1611941206873186305, 9, 'hotRoomTag', 'hotel/hotRoomTag/index', NULL, '1', '0', 'C', '0', '0', NULL, 'rate', 'admin', '2023-01-08 12:37:57', 'admin', '2023-01-08 12:37:57', NULL);
INSERT INTO `sys_menu` VALUES (1606, '房间类型', 1611941206873186305, 2, 'hotRoomType', 'hotel/hotRoomType/index', '', '1', '0', 'C', '0', '0', 'hotel:hotRoomType:index', 'system', NULL, '2023-01-17 21:08:57', NULL, '2023-02-26 20:25:44', '系统管理目录');
INSERT INTO `sys_menu` VALUES (1607, '房间管理', 1611941206873186305, 3, 'hotRoom', 'hotel/hotRoom/index', '', '1', '0', 'C', '0', '0', 'hotel:hotRoom:index', 'system', NULL, '2023-01-17 21:08:57', NULL, '2023-02-26 20:25:44', '房间管理目录');
INSERT INTO `sys_menu` VALUES (1608, '房间设施', 1611941206873186305, 3, 'hotInfrastructureTemp', 'hotel/hotInfrastructureTemp/index', '', '1', '0', 'C', '0', '0', 'hotel:hotInfrastructureTemp:index', 'system', NULL, '2023-01-18 20:17:35', NULL, '2023-02-26 20:25:44', '房间设施');
INSERT INTO `sys_menu` VALUES (1609, '工作台', 0, -1, 'work', 'hotel/work/index', '', '1', '0', 'C', '0', '0', 'hotel:work:index', 'date-range', NULL, '2023-01-20 22:07:08', NULL, '2023-02-26 20:25:45', '工作台');
INSERT INTO `sys_menu` VALUES (1610, '居住记录', 1611941206873186305, 3, 'hotRoomRecord', 'hotel/hotRoomRecord/index', '', '1', '0', 'C', '0', '0', 'hotel:hotRoomRecord:index', 'system', NULL, '2023-02-08 21:17:14', NULL, '2023-02-26 20:25:45', '居住记录');
INSERT INTO `sys_menu` VALUES (1626941076381970433, '经营日报', 1611941206873186305, 6, 'hotDailyPaper', 'hotel/hotDailyPaper/index', NULL, '1', '0', 'C', '0', '0', NULL, 'chart', 'admin', '2023-02-18 21:45:54', 'admin', '2023-02-18 21:45:54', NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint NOT NULL,
  `notice_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `notice_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `notice_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `business_type` int NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `request_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `operator_type` int NULL DEFAULT NULL,
  `oper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oper_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `json_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `error_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oper_time` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1611941207280033794, '菜单管理', 1, 'com.cdmzl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 12:21:46\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-08 12:21:46\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1611941206873186305\",\"menuName\":\"酒店管理\",\"orderNum\":1,\"path\":\"hotel\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"icon\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-08');
INSERT INTO `sys_oper_log` VALUES (1611945274412736513, '菜单管理', 1, 'com.cdmzl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 12:37:56\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-08 12:37:56\",\"params\":{},\"parentName\":null,\"parentId\":\"1611941206873186305\",\"children\":[],\"menuId\":\"1611945274148495362\",\"menuName\":\"酒店标签\",\"orderNum\":9,\"path\":\"hotRoomTag\",\"component\":\"hotel/hotRoomTag/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"rate\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-08');
INSERT INTO `sys_oper_log` VALUES (1615336185679151105, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/1605', '127.0.0.1', '内网IP', '{menuId=1605}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-17');
INSERT INTO `sys_oper_log` VALUES (1616418571183575042, '字典类型', 1, 'com.cdmzl.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/soft/system/dict/type', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-20 20:53:13\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 20:53:13\",\"params\":{},\"dictId\":\"1616418570927722498\",\"dictName\":\"房间状态\",\"dictType\":\"hot_room_state\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616418614699479042, '字典数据', 1, 'com.cdmzl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-20 20:53:23\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 20:53:23\",\"params\":{},\"dictCode\":\"1616418614431043586\",\"dictSort\":0,\"dictLabel\":\"正常\",\"dictValue\":\"1\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616435765900595202, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/116', '127.0.0.1', '内网IP', '{menuId=116}', '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616435837925183489, '角色管理', 2, 'com.cdmzl.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/soft/system/role/dataScope', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 22:01:50\",\"params\":{},\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"普通角色\",\"flag\":false,\"menuIds\":null,\"deptIds\":[],\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616435865246879745, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/116', '127.0.0.1', '内网IP', '{menuId=116}', '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616435883710205953, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/5', '127.0.0.1', '内网IP', '{menuId=5}', '{\"code\":500,\"msg\":\"存在子菜单,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616435916161536001, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616435954208067586, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436109892243458, '角色管理', 2, 'com.cdmzl.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 22:02:55\",\"params\":{},\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"普通角色\",\"flag\":false,\"menuIds\":[2,109,1046,1047,1048,111,113,112,3,114,115,1055,1056,1058,1057,1059,1060],\"deptIds\":null,\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436152867082241, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/5', '127.0.0.1', '内网IP', '{menuId=5}', '{\"code\":500,\"msg\":\"存在子菜单,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436165982670850, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/116', '127.0.0.1', '内网IP', '{menuId=116}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436172970381314, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/5', '127.0.0.1', '内网IP', '{menuId=5}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436179568021505, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436213348945922, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/115', '127.0.0.1', '内网IP', '{menuId=115}', '{\"code\":500,\"msg\":\"存在子菜单,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436229098557441, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/1055', '127.0.0.1', '内网IP', '{menuId=1055}', '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436235612311553, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/1055', '127.0.0.1', '内网IP', '{menuId=1055}', '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436269787500546, '角色管理', 2, 'com.cdmzl.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 22:03:33\",\"params\":{},\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"普通角色\",\"flag\":false,\"menuIds\":[2,109,1046,1047,1048,111,113,112],\"deptIds\":null,\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436291803402241, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/1060', '127.0.0.1', '内网IP', '{menuId=1060}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436299210543105, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/1059', '127.0.0.1', '内网IP', '{menuId=1059}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436305971761153, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/1057', '127.0.0.1', '内网IP', '{menuId=1057}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436312460349442, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/1056', '127.0.0.1', '内网IP', '{menuId=1056}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436319674552321, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/1058', '127.0.0.1', '内网IP', '{menuId=1058}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436326729371650, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/1055', '127.0.0.1', '内网IP', '{menuId=1055}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436334027460609, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/115', '127.0.0.1', '内网IP', '{menuId=115}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436344848764929, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/114', '127.0.0.1', '内网IP', '{menuId=114}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616436352398512129, '菜单管理', 3, 'com.cdmzl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/menu/3', '127.0.0.1', '内网IP', '{menuId=3}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616451823365599233, '部门管理', 2, 'com.cdmzl.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dept', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:42\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 23:05:21\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"智慧酒店\",\"orderNum\":0,\"leader\":\"管理员\",\"phone\":\"18349304247\",\"email\":\"xxhcloud@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616451984565284866, '部门管理', 2, 'com.cdmzl.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dept', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:42\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-20 23:05:59\",\"params\":{},\"parentName\":\"智慧酒店\",\"parentId\":100,\"children\":[],\"deptId\":101,\"deptName\":\"财务部\",\"orderNum\":1,\"leader\":\"财务部总经理\",\"phone\":\"15888888888\",\"email\":\"cwbzjl@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616452001246031874, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/109', '127.0.0.1', '内网IP', '{deptId=109}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616452008019832834, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/108', '127.0.0.1', '内网IP', '{deptId=108}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616452013824749569, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616452024750911490, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"code\":500,\"msg\":\"部门存在用户,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616452033701556225, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/104', '127.0.0.1', '内网IP', '{deptId=104}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616452041234526209, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"code\":500,\"msg\":\"部门存在用户,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616452049958678530, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/107', '127.0.0.1', '内网IP', '{deptId=107}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616452083819294722, '用户管理', 3, 'com.cdmzl.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/user/2', '127.0.0.1', '内网IP', '{userIds=2}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616452142296281090, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/106', '127.0.0.1', '内网IP', '{deptId=106}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616452150991073281, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1616452159174160385, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"code\":500,\"msg\":\"部门存在用户,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-01-20');
INSERT INTO `sys_oper_log` VALUES (1623317428513378306, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-20 20:53:24\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:46:49\",\"params\":{},\"dictCode\":\"1616418614431043586\",\"dictSort\":0,\"dictLabel\":\"正常\",\"dictValue\":\"1\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"success\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-08');
INSERT INTO `sys_oper_log` VALUES (1623317489867657218, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:47:03\",\"params\":{},\"dictCode\":\"1622942518188294146\",\"dictSort\":2,\"dictLabel\":\"有客\",\"dictValue\":\"2\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"warning\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-08');
INSERT INTO `sys_oper_log` VALUES (1623323057898491905, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"userId\":null,\"deptId\":101,\"userName\":\"admin\",\"nickName\":\"2\",\"userType\":null,\"email\":\"\",\"phonenumber\":\"\",\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":500,\"msg\":\"新增用户\'admin\'失败，登录账号已存在\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-02-08');
INSERT INTO `sys_oper_log` VALUES (1623323069634154497, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-08 22:09:14\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 22:09:14\",\"params\":{},\"userId\":\"1623323069499936769\",\"deptId\":101,\"userName\":\"admin2\",\"nickName\":\"2\",\"userType\":null,\"email\":\"\",\"phonenumber\":\"\",\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-08');
INSERT INTO `sys_oper_log` VALUES (1623323123157667841, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-08 22:09:27\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 22:09:27\",\"params\":{},\"userId\":\"1623323122826317825\",\"deptId\":101,\"userName\":\"232323\",\"nickName\":\"2323\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-08');
INSERT INTO `sys_oper_log` VALUES (1625120785758511105, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-08 21:17:14\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-13 21:12:43\",\"params\":{},\"parentName\":null,\"parentId\":\"1611941206873186305\",\"children\":[],\"menuId\":1610,\"menuName\":\"居住记录\",\"orderNum\":3,\"path\":\"hotRoomRecord\",\"component\":\"hotel/hotRoomRecord/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"hotel:hotRoomRecord:index\",\"icon\":\"system\",\"remark\":\"居住记录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-13');
INSERT INTO `sys_oper_log` VALUES (1625469752178475009, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:19:23\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:19:23\",\"params\":{},\"userId\":\"1625469751935205377\",\"deptId\":100,\"userName\":\"admin2232\",\"nickName\":\"撒大声地\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14');
INSERT INTO `sys_oper_log` VALUES (1625470809059201025, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:23:35\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:23:35\",\"params\":{},\"userId\":\"1625470808757211137\",\"deptId\":null,\"userName\":\"xiaojiang1\",\"nickName\":\"23213\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14');
INSERT INTO `sys_oper_log` VALUES (1625473364547956737, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:33:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:33:44\",\"params\":{},\"userId\":\"1625473364262744066\",\"deptId\":null,\"userName\":\"xiaojiang1\",\"nickName\":\"23\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14');
INSERT INTO `sys_oper_log` VALUES (1625473410588831745, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:33:55\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:33:55\",\"params\":{},\"userId\":\"1625473410391699457\",\"deptId\":101,\"userName\":\"xiaojiang1213213\",\"nickName\":\"213\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14');
INSERT INTO `sys_oper_log` VALUES (1625473733915086850, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:35:12\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:35:12\",\"params\":{},\"userId\":\"1625473733386604545\",\"deptId\":null,\"userName\":\"32432324324\",\"nickName\":\"324324\",\"userType\":null,\"email\":null,\"phonenumber\":\"\",\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14');
INSERT INTO `sys_oper_log` VALUES (1625474330655567873, '用户管理', 1, 'com.cdmzl.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:37:34\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 20:37:34\",\"params\":{},\"userId\":\"1625474330462629889\",\"deptId\":101,\"userName\":\"xiaojiang1213213\",\"nickName\":\"213213\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14');
INSERT INTO `sys_oper_log` VALUES (1625489656646545410, '用户管理', 2, 'com.cdmzl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/user', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-14 20:37:35\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-14 21:38:28\",\"params\":{},\"userId\":\"1625474330462629889\",\"deptId\":101,\"userName\":\"xiaojiang1213213\",\"nickName\":\"213213\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"parentName\":null,\"parentId\":100,\"children\":[],\"deptId\":101,\"deptName\":\"财务部\",\"orderNum\":1,\"leader\":\"财务部总经理\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100\"},\"roles\":[],\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-14');
INSERT INTO `sys_oper_log` VALUES (1626916091999289346, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:45\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:06:37\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":109,\"menuName\":\"在线用户\",\"orderNum\":1,\"path\":\"online\",\"component\":\"monitor/online/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"monitor:online:list\",\"icon\":\"online\",\"remark\":\"在线用户菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626916123393654785, '菜单管理', 2, 'com.cdmzl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:45\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:06:45\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":2,\"menuName\":\"系统监控\",\"orderNum\":2,\"path\":\"monitor\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"monitor\",\"remark\":\"系统监控目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626917055779127297, '岗位管理', 2, 'com.cdmzl.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:10:27\",\"params\":{},\"postId\":1,\"postCode\":\"ceo\",\"postName\":\"BOSS\",\"postSort\":1,\"status\":\"0\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626917093330731010, '岗位管理', 2, 'com.cdmzl.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:10:36\",\"params\":{},\"postId\":1,\"postCode\":\"boss\",\"postName\":\"BOSS\",\"postSort\":1,\"status\":\"0\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626917238340403201, '岗位管理', 2, 'com.cdmzl.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:11:10\",\"params\":{},\"postId\":2,\"postCode\":\"front_desk\",\"postName\":\"酒店前台\",\"postSort\":2,\"status\":\"0\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626917321572171777, '岗位管理', 2, 'com.cdmzl.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:11:30\",\"params\":{},\"postId\":3,\"postCode\":\"cleaning\",\"postName\":\"保洁\",\"postSort\":3,\"status\":\"0\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626917423745417218, '岗位管理', 2, 'com.cdmzl.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-01-08 11:19:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:11:55\",\"params\":{},\"postId\":4,\"postCode\":\"securityGuard\",\"postName\":\"保安\",\"postSort\":4,\"status\":\"0\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626917613114048513, '岗位管理', 1, 'com.cdmzl.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL, '/soft/system/post', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 20:12:40\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:12:40\",\"params\":{},\"postId\":\"1626917612916916225\",\"postCode\":\"accountant\",\"postName\":\"会计\",\"postSort\":5,\"status\":\"0\",\"remark\":null,\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626917704063336450, '角色管理', 1, 'com.cdmzl.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 20:13:01\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:13:01\",\"params\":{},\"roleId\":\"1626917703933313026\",\"roleName\":\"会计\",\"roleKey\":\"accountant\",\"roleSort\":0,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":[],\"deptIds\":[],\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626919137458319361, '角色管理', 1, 'com.cdmzl.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 20:18:43\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:18:43\",\"params\":{},\"roleId\":\"1626919136992751617\",\"roleName\":\"酒店前台\",\"roleKey\":\"front_desk\",\"roleSort\":0,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":[1609,\"1611941206873186305\",1606,1607,1608,1610,\"1611945274148495362\"],\"deptIds\":[],\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626920000574726145, '角色管理', 1, 'com.cdmzl.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 20:22:09\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:22:09\",\"params\":{},\"roleId\":\"1626920000394371073\",\"roleName\":\"test\",\"roleKey\":\"test\",\"roleSort\":6,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":[],\"deptIds\":[],\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626920914769473537, '角色管理', 2, 'com.cdmzl.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/role', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 20:18:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 20:25:47\",\"params\":{},\"roleId\":\"1626919136992751617\",\"roleName\":\"酒店前台\",\"roleKey\":\"front_desk\",\"roleSort\":0,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":[1609,\"1611941206873186305\",1606,1607,1608,1610,\"1611945274148495362\"],\"deptIds\":null,\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626920933367017474, '角色管理', 3, 'com.cdmzl.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/role/1626920000394371073', '127.0.0.1', '内网IP', '{roleIds=1626920000394371073}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626931780688605185, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/101', '127.0.0.1', '内网IP', '{deptId=101}', '{\"code\":500,\"msg\":\"部门存在用户,不允许删除\",\"data\":null,\"error\":true,\"success\":false}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626931818672222209, '用户管理', 3, 'com.cdmzl.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/user/1625474330462629889', '127.0.0.1', '内网IP', '{userIds=1625474330462629889}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626931844681101314, '部门管理', 3, 'com.cdmzl.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dept/101', '127.0.0.1', '内网IP', '{deptId=101}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626932361234804737, '通知公告', 3, 'com.cdmzl.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/notice/1', '127.0.0.1', '内网IP', '{noticeIds=1}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626932368298012674, '通知公告', 3, 'com.cdmzl.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/notice/2', '127.0.0.1', '内网IP', '{noticeIds=2}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1626941076625240065, '菜单管理', 1, 'com.cdmzl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/soft/system/menu', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-18 21:45:54\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-18 21:45:54\",\"params\":{},\"parentName\":null,\"parentId\":\"1611941206873186305\",\"children\":[],\"menuId\":\"1626941076381970433\",\"menuName\":\"经营日报\",\"orderNum\":6,\"path\":\"hotDailyPaper\",\"component\":\"hotel/hotDailyPaper/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"chart\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-18');
INSERT INTO `sys_oper_log` VALUES (1627110279604932609, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-19 08:58:15\",\"params\":{},\"dictCode\":\"1622942520939757573\",\"dictSort\":4,\"dictLabel\":\"平台支付\",\"dictValue\":\"4\",\"dictType\":\"hot_pay_method\",\"cssClass\":null,\"listClass\":null,\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-19');
INSERT INTO `sys_oper_log` VALUES (1627110343995887618, '字典数据', 1, 'com.cdmzl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-19 08:58:30\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-19 08:58:30\",\"params\":{},\"dictCode\":\"1627110343794561025\",\"dictSort\":5,\"dictLabel\":\"移动支付\",\"dictValue\":\"5\",\"dictType\":\"hot_pay_method\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-19');
INSERT INTO `sys_oper_log` VALUES (1627110386886840322, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-19 08:58:41\",\"params\":{},\"dictCode\":\"1622942520939757573\",\"dictSort\":4,\"dictLabel\":\"平台支付\",\"dictValue\":\"4\",\"dictType\":\"hot_pay_method\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-19');
INSERT INTO `sys_oper_log` VALUES (1627110401080365057, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-19 08:58:44\",\"params\":{},\"dictCode\":\"1622942520939757573\",\"dictSort\":4,\"dictLabel\":\"平台支付\",\"dictValue\":\"4\",\"dictType\":\"hot_pay_method\",\"cssClass\":null,\"listClass\":\"primary\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-19');
INSERT INTO `sys_oper_log` VALUES (1627110415236141057, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2023-02-19 08:58:31\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-19 08:58:47\",\"params\":{},\"dictCode\":\"1627110343794561025\",\"dictSort\":5,\"dictLabel\":\"移动支付\",\"dictValue\":\"5\",\"dictType\":\"hot_pay_method\",\"cssClass\":null,\"listClass\":\"primary\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-19');
INSERT INTO `sys_oper_log` VALUES (1627642203633209346, '字典类型', 3, 'com.cdmzl.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/soft/system/dict/data/1627110343794561025', '127.0.0.1', '内网IP', '{dictCodes=1627110343794561025}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20');
INSERT INTO `sys_oper_log` VALUES (1627643580585414658, '字典数据', 1, 'com.cdmzl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-02-20 20:17:24\",\"updateBy\":\"小江\",\"updateTime\":\"2023-02-20 20:17:24\",\"params\":{},\"dictCode\":\"1627643580065320961\",\"dictSort\":0,\"dictLabel\":\"空脏\",\"dictValue\":\"4\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"danger\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20');
INSERT INTO `sys_oper_log` VALUES (1627643607219245057, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-02-20 20:17:24\",\"updateBy\":\"小江\",\"updateTime\":\"2023-02-20 20:17:30\",\"params\":{},\"dictCode\":\"1627643580065320961\",\"dictSort\":4,\"dictLabel\":\"空脏\",\"dictValue\":\"4\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"danger\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20');
INSERT INTO `sys_oper_log` VALUES (1627643750718967810, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"小江\",\"updateTime\":\"2023-02-20 20:18:04\",\"params\":{},\"dictCode\":\"1622942518188294146\",\"dictSort\":2,\"dictLabel\":\"有客\",\"dictValue\":\"2\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20');
INSERT INTO `sys_oper_log` VALUES (1627643781618405377, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":null,\"createTime\":\"2023-02-07 20:57:04\",\"updateBy\":\"小江\",\"updateTime\":\"2023-02-20 20:18:12\",\"params\":{},\"dictCode\":\"1622942518188294146\",\"dictSort\":2,\"dictLabel\":\"有客\",\"dictValue\":\"2\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"info\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20');
INSERT INTO `sys_oper_log` VALUES (1627643801700732930, '字典数据', 2, 'com.cdmzl.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/soft/system/dict/data', '127.0.0.1', '内网IP', '{\"searchValue\":null,\"createBy\":\"小江\",\"createTime\":\"2023-02-20 20:17:24\",\"updateBy\":\"小江\",\"updateTime\":\"2023-02-20 20:18:17\",\"params\":{},\"dictCode\":\"1627643580065320961\",\"dictSort\":4,\"dictLabel\":\"空脏\",\"dictValue\":\"4\",\"dictType\":\"hot_room_state\",\"cssClass\":null,\"listClass\":\"warning\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null,\"error\":false,\"success\":true}', 0, NULL, '2023-02-20');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint NOT NULL,
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_https` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对象存储配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, 'minio', 'ruoyi', 'ruoyi123', 'ruoyi', '', '127.0.0.1:9000', '', 'N', '', '0', '', 'admin', '2023-01-08 11:19:59', 'admin', '2023-01-08 11:19:59', NULL);
INSERT INTO `sys_oss_config` VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '', 'admin', '2023-01-08 11:19:59', 'admin', '2023-01-08 11:19:59', NULL);
INSERT INTO `sys_oss_config` VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '', 'admin', '2023-01-08 11:19:59', 'admin', '2023-01-08 11:19:59', NULL);
INSERT INTO `sys_oss_config` VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '', 'admin', '2023-01-08 11:19:59', 'admin', '2023-01-08 11:19:59', NULL);
INSERT INTO `sys_oss_config` VALUES (5, 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '', 'admin', '2023-01-08 11:19:59', 'admin', '2023-01-08 11:19:59', NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL,
  `post_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `post_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `post_sort` int NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'boss', 'BOSS', 1, '0', 'admin', '2023-01-08 11:19:44', 'admin', '2023-02-18 20:10:36', '');
INSERT INTO `sys_post` VALUES (2, 'front_desk', '酒店前台', 2, '0', 'admin', '2023-01-08 11:19:44', 'admin', '2023-02-18 20:11:11', '');
INSERT INTO `sys_post` VALUES (3, 'cleaning', '保洁', 3, '0', 'admin', '2023-01-08 11:19:44', 'admin', '2023-02-18 20:11:31', '');
INSERT INTO `sys_post` VALUES (4, 'securityGuard', '保安', 4, '0', 'admin', '2023-01-08 11:19:44', 'admin', '2023-02-18 20:11:55', '');
INSERT INTO `sys_post` VALUES (1626917612916916225, 'accountant', '会计', 5, '0', 'admin', '2023-02-18 20:12:40', 'admin', '2023-02-18 20:12:40', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_sort` int NULL DEFAULT NULL,
  `data_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_check_strictly` bit(1) NULL DEFAULT NULL,
  `dept_check_strictly` bit(1) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', b'1', b'1', '0', '0', 'admin', '2023-01-08 11:19:44', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', b'1', b'1', '0', '0', 'admin', '2023-01-08 11:19:44', 'admin', '2023-01-20 22:03:33', '普通角色');
INSERT INTO `sys_role` VALUES (1626917703933313026, '会计', 'accountant', 3, NULL, b'1', b'1', '0', '0', 'admin', '2023-02-18 20:13:02', 'admin', '2023-02-18 20:13:02', NULL);
INSERT INTO `sys_role` VALUES (1626919136992751617, '酒店前台', 'front_desk', 4, NULL, b'1', b'1', '0', '0', 'admin', '2023-02-18 20:18:44', 'admin', '2023-02-18 20:25:47', NULL);
INSERT INTO `sys_role` VALUES (1626920000394371073, 'test', 'test', 6, NULL, b'1', b'1', '0', '2', 'admin', '2023-02-18 20:22:09', 'admin', '2023-02-18 20:22:09', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL,
  `dept_id` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (1626919136992751617, 1609);
INSERT INTO `sys_role_menu` VALUES (1626919136992751617, 1611941206873186305);
INSERT INTO `sys_role_menu` VALUES (1626919136992751617, 1606);
INSERT INTO `sys_role_menu` VALUES (1626919136992751617, 1607);
INSERT INTO `sys_role_menu` VALUES (1626919136992751617, 1608);
INSERT INTO `sys_role_menu` VALUES (1626919136992751617, 1610);
INSERT INTO `sys_role_menu` VALUES (1626919136992751617, 1611945274148495362);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL,
  `dept_id` bigint NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phonenumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_date` date NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '小江', 'sys_user', '1296581679@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-02-26', 'admin', '2023-01-08 11:19:43', '小江', '2023-02-26 20:26:39', '管理员');
INSERT INTO `sys_user` VALUES (1625474330462629889, 101, 'xiaojiang1213213', '213213', NULL, NULL, NULL, NULL, NULL, '$2a$10$mfZ1vcNnxbUL0ThQqp8sA.ZR1Y9jb7yo/fzmDYdUq418vUv2EOuBy', '0', '2', NULL, NULL, 'admin', '2023-02-14 20:37:35', 'admin', '2023-02-14 21:38:29', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL,
  `post_id` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);

-- ----------------------------
-- Table structure for test_demo
-- ----------------------------
DROP TABLE IF EXISTS `test_demo`;
CREATE TABLE `test_demo`  (
  `id` bigint NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_demo
-- ----------------------------

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree`  (
  `id` bigint NOT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_tree
-- ----------------------------

-- ----------------------------
-- Table structure for type_tag
-- ----------------------------
DROP TABLE IF EXISTS `type_tag`;
CREATE TABLE `type_tag`  (
  `room_tag_id` bigint NOT NULL,
  `room_type_id` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_tag
-- ----------------------------
INSERT INTO `type_tag` VALUES (1615321952107204609, 1615702790867083264);
INSERT INTO `type_tag` VALUES (1615338750294736897, 1615702790867083264);
INSERT INTO `type_tag` VALUES (1615688590019080193, 1615702790867083264);
INSERT INTO `type_tag` VALUES (1615321952107204609, 1615702862526767104);
INSERT INTO `type_tag` VALUES (1615338750294736897, 1615702862526767104);
INSERT INTO `type_tag` VALUES (1615321952107204609, 1615349962633965570);
INSERT INTO `type_tag` VALUES (1615321952107204609, 1615334675943641090);
INSERT INTO `type_tag` VALUES (1615338750294736897, 1615334675943641090);
INSERT INTO `type_tag` VALUES (1615688590019080193, 1615334675943641090);
INSERT INTO `type_tag` VALUES (1615321952107204609, 1626915106904080384);

SET FOREIGN_KEY_CHECKS = 1;
