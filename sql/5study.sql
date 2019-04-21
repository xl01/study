/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : 5study

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 21/04/2019 19:33:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for my_admin_department
-- ----------------------------
DROP TABLE IF EXISTS `my_admin_department`;
CREATE TABLE `my_admin_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of my_admin_department
-- ----------------------------
INSERT INTO `my_admin_department` VALUES (1, '行政部', '行政部', 1, 1478228668, 1478228668);
INSERT INTO `my_admin_department` VALUES (2, '技术部', '技术部', 1, 1478228705, 1478228705);

-- ----------------------------
-- Table structure for my_admin_integral
-- ----------------------------
DROP TABLE IF EXISTS `my_admin_integral`;
CREATE TABLE `my_admin_integral`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `department_id` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  `jobs_id` int(11) DEFAULT 1 COMMENT '职位ID',
  `integral_value` int(11) NOT NULL COMMENT 'Integral value',
  `validation` int(11) NOT NULL DEFAULT 0 COMMENT '验证方法',
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for my_admin_jobs
-- ----------------------------
DROP TABLE IF EXISTS `my_admin_jobs`;
CREATE TABLE `my_admin_jobs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of my_admin_jobs
-- ----------------------------
INSERT INTO `my_admin_jobs` VALUES (1, '班长', '', 1, 1478245107, 1478245107);
INSERT INTO `my_admin_jobs` VALUES (2, '组长', '', 1, 1478245170, 1478245170);

-- ----------------------------
-- Table structure for my_admin_node
-- ----------------------------
DROP TABLE IF EXISTS `my_admin_node`;
CREATE TABLE `my_admin_node`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `node_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '节点名称',
  `module_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '模块名',
  `control_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '控制器名',
  `action_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '方法名',
  `is_menu` tinyint(1) DEFAULT 0 COMMENT '是否是菜单项 0不是 1是',
  `pid` int(11) DEFAULT NULL COMMENT '父级节点id',
  `icon` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '菜单样式',
  `sort` tinyint(3) UNSIGNED DEFAULT 255,
  `status` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of my_admin_node
-- ----------------------------
INSERT INTO `my_admin_node` VALUES (1, 1, '我的组织', '#', '#', '#', 1, 0, 'fa fa-globe', 255, 1, NULL, NULL, NULL);
INSERT INTO `my_admin_node` VALUES (2, 1, '员工管理', 'admin', 'User', 'user', 1, 1, '', 3, 1, NULL, 1478489017, '');
INSERT INTO `my_admin_node` VALUES (3, 1, '用户修改', 'admin', 'User', 'useredit', 0, 2, '', 255, 1, NULL, NULL, NULL);
INSERT INTO `my_admin_node` VALUES (4, 1, '还原密码', 'admin', 'User', 'password', 0, 2, '', 2, 1, 1479705083, 1479707835, '');
INSERT INTO `my_admin_node` VALUES (5, 1, '修改状态', 'admin', 'User', 'setStatus', 0, 2, '', 3, 1, 1479707901, 1479707901, '');
INSERT INTO `my_admin_node` VALUES (6, 1, '部门管理', 'admin', 'System', 'departmentlist', 1, 1, '', 255, 1, NULL, 1478489154, '');
INSERT INTO `my_admin_node` VALUES (7, 1, '部门修改', 'admin', 'System', 'DepartmentEdit', 0, 6, '', 2, 1, 1479708131, 1479708131, '');
INSERT INTO `my_admin_node` VALUES (8, 1, '状态设置', 'admin', 'System', 'setStatus', 0, 6, '', 3, 1, 1479708149, 1479708149, '');
INSERT INTO `my_admin_node` VALUES (9, 1, '工作职位', 'admin', 'System', 'jobslist', 1, 1, '', 255, 1, NULL, 1478489697, '');
INSERT INTO `my_admin_node` VALUES (10, 1, '职位修改', 'admin', 'System', 'JobsEdit', 0, 9, '', 1, 1, 1479708339, 1479708339, '');
INSERT INTO `my_admin_node` VALUES (11, 1, '状态设置', 'admin', 'System', 'setStatus', 0, 9, '', 3, 1, 1479708373, 1479708373, '');
INSERT INTO `my_admin_node` VALUES (12, 1, '系统管理', '#', '#', '#', 1, 0, 'fa fa-desktop', 255, 1, NULL, NULL, NULL);
INSERT INTO `my_admin_node` VALUES (13, 1, '后台角色', 'admin', 'Role', 'role', 1, 12, '', 255, 1, NULL, 1478489392, '');
INSERT INTO `my_admin_node` VALUES (14, 1, '添加角色', 'admin', 'Role', 'roleadd', 0, 13, '', 255, 1, NULL, NULL, NULL);
INSERT INTO `my_admin_node` VALUES (15, 1, '编辑角色', 'admin', 'Role', 'roleedit', 0, 13, '', 255, 1, NULL, NULL, NULL);
INSERT INTO `my_admin_node` VALUES (16, 1, '删除角色', 'admin', 'Role', 'roledel', 0, 13, '', 255, 1, NULL, NULL, NULL);
INSERT INTO `my_admin_node` VALUES (17, 1, '分配权限', 'admin', 'Role', 'giveaccess', 0, 13, '', 255, 1, NULL, NULL, NULL);
INSERT INTO `my_admin_node` VALUES (18, 1, '数据备份', 'admin', 'Data', 'index', 1, 12, '', 255, 1, NULL, 1478486078, NULL);
INSERT INTO `my_admin_node` VALUES (19, 1, '备份数据', 'admin', 'Data', 'importdata', 1, 18, '', 255, 1, NULL, 1480673310, '');
INSERT INTO `my_admin_node` VALUES (20, 1, '还原数据', 'admin', 'Data', 'backdata', 0, 18, '', 255, 1, NULL, 1478491159, '');
INSERT INTO `my_admin_node` VALUES (21, 1, '后台权限', 'admin', 'Node', 'node', 1, 12, '', 255, 1, NULL, 1478489411, '');
INSERT INTO `my_admin_node` VALUES (22, 1, '后台日志', 'admin', 'action', 'actionlog', 1, 12, '', 255, 1, 1475411492, 1478489442, '');
INSERT INTO `my_admin_node` VALUES (23, 1, '微信管理', '#', '#', '#', 1, 0, 'fa fa-wechat', 255, 1, NULL, 1482715400, NULL);
INSERT INTO `my_admin_node` VALUES (24, 1, '我的微信', 'admin', 'We', 'we', 1, 23, '', 255, 1, NULL, 1481959705, '');
INSERT INTO `my_admin_node` VALUES (25, 1, '我的粉丝', 'admin', 'We', 'fans', 1, 23, '', 255, 1, NULL, 1481959716, '');
INSERT INTO `my_admin_node` VALUES (26, 1, '微信菜单', 'admin', 'We', 'menu', 1, 23, '', 255, 1, NULL, 1481959724, '');
INSERT INTO `my_admin_node` VALUES (27, 1, '微信菜单按钮', 'admin', 'We', 'menuButton', 0, 26, '', 1, 1, 1482284604, 1482715400, '');
INSERT INTO `my_admin_node` VALUES (28, 1, '微信菜单编辑', 'admin', 'We', 'menuEdit', 0, 26, '', 255, 1, NULL, 1482715400, NULL);
INSERT INTO `my_admin_node` VALUES (29, 1, '微信菜单同步推送', 'admin', 'We', 'sendMenu', 0, 26, '', 255, 1, NULL, 1482715400, NULL);
INSERT INTO `my_admin_node` VALUES (30, 1, '微信菜单按钮编辑', 'admin', 'We', 'menuButtonEdit', 0, 26, '', 255, 1, NULL, 1482715400, NULL);
INSERT INTO `my_admin_node` VALUES (31, 1, '会员管理', '#', '#', '#', 1, 0, 'fa fa-user', 1, 1, NULL, 1482715400, NULL);
INSERT INTO `my_admin_node` VALUES (32, NULL, '会员管理列表', 'admin', 'User', 'member', 1, 31, '', 255, 1, NULL, 1482715400, NULL);
INSERT INTO `my_admin_node` VALUES (33, NULL, '会员修改', 'admin', 'User', 'memberEdit', 0, 32, '', 255, 1, NULL, 1482715400, NULL);
INSERT INTO `my_admin_node` VALUES (34, NULL, '会员等级', 'admin', 'User', 'memberGrade', 1, 31, '', 255, 1, NULL, 1482715400, NULL);
INSERT INTO `my_admin_node` VALUES (35, NULL, '会员等级编辑', 'admin', 'User', 'memberGradeEdit', 0, 34, '', 255, 1, NULL, 1482715400, NULL);

-- ----------------------------
-- Table structure for my_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `my_admin_role`;
CREATE TABLE `my_admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rolename` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '权限节点数据',
  `status` tinyint(4) DEFAULT 4,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of my_admin_role
-- ----------------------------
INSERT INTO `my_admin_role` VALUES (1, '超级管理员', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,23,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40', 1, NULL, NULL);
INSERT INTO `my_admin_role` VALUES (2, '系统维护员', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,23,25', 1, NULL, NULL);
INSERT INTO `my_admin_role` VALUES (3, '运营人员', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,22,23,25', 1, NULL, NULL);

-- ----------------------------
-- Table structure for my_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `my_admin_user`;
CREATE TABLE `my_admin_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL COMMENT '部门',
  `jobs_id` int(10) DEFAULT NULL COMMENT '职位',
  `weixin_openid` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `banding_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '微信绑定码',
  `role_id` int(11) NOT NULL,
  `aid_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '用户名',
  `simple_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户简称',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `birthday` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `calendar` tinyint(4) DEFAULT 0 COMMENT '0阳历，1农历',
  `loginnum` int(11) DEFAULT 0 COMMENT '登陆次数',
  `last_login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) DEFAULT 0 COMMENT '最后登录时间',
  `status` int(1) DEFAULT 0 COMMENT '状态',
  `typeid` int(11) DEFAULT 1 COMMENT '用户角色id',
  `position` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mobile` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机',
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `qq` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `weixinid` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `extattr` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `marriage` tinyint(4) DEFAULT NULL,
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bankcard` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `joinday` int(10) DEFAULT NULL,
  `join_from` tinyint(4) DEFAULT NULL,
  `leaveday` int(10) DEFAULT NULL,
  `leave_type` tinyint(4) DEFAULT NULL,
  `leave_why` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `update_time` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of my_admin_user
-- ----------------------------
INSERT INTO `my_admin_user` VALUES (1, 1, 0, 'oO059v39zsst76IkuiYV3yMvc4Sw', '55229586246', 0, '', 'mikkle', '', '何大鹏', 'b74ba7b7e2d0f1e7b9c834f52d84f04a', '', 0, 173, '14.153.203.45', 1485914301, 1, 1, '', '17092610050', 0, '', '', '', NULL, '', 0, '', '', 0, 0, 0, 0, '', NULL, '', 0.00, 1480426399, 0);
INSERT INTO `my_admin_user` VALUES (2, 2, 1, '', '', 1, NULL, 'admin', NULL, '超级管理员', 'f4a11cdf4ea5c8173800767de05f622c', '', 0, 22, '219.134.109.157', 1486449550, 1, 1, '', '', 1, '', '', '', NULL, NULL, 0, '', '', 0, 0, 0, 0, '', NULL, '', 0.00, 1480673171, 1480673171);

-- ----------------------------
-- Table structure for my_city
-- ----------------------------
DROP TABLE IF EXISTS `my_city`;
CREATE TABLE `my_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_city
-- ----------------------------
INSERT INTO `my_city` VALUES (1, 1, '烟台市');
INSERT INTO `my_city` VALUES (2, 1, '威海市');
INSERT INTO `my_city` VALUES (3, 0, '济南市');

-- ----------------------------
-- Table structure for my_province
-- ----------------------------
DROP TABLE IF EXISTS `my_province`;
CREATE TABLE `my_province`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_province
-- ----------------------------
INSERT INTO `my_province` VALUES (1, '山东省');
INSERT INTO `my_province` VALUES (2, '江苏省');

SET FOREIGN_KEY_CHECKS = 1;
