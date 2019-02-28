/*
 Navicat Premium Data Transfer

 Source Server         : localhostMySQL
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : learn

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 28/02/2019 16:23:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `count` int(11) NOT NULL COMMENT '库存',
  `sale` int(11) NULL DEFAULT NULL COMMENT '已售',
  `goods_img` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `goods_detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品介绍详情',
  `version` int(11) NOT NULL COMMENT '乐观锁，版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 'OPPO R9s', 10, 10, 'https://dsfs.oppo.com/cn/product/p/r9s/specs/spec-01.jpg', 1500.00, 'OPPO R9s前后1600万像素、IMX398传感器、双核对焦、F1.7大光圈,4G运存+64GB内存,3010mAh大电池,充电5分钟通话2小时!', 10);

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_id` int(11) NOT NULL COMMENT '商品Id',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 369 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_order
-- ----------------------------
INSERT INTO `goods_order` VALUES (333, 1, 'OPPO R9s', '2019-02-27 16:15:17');
INSERT INTO `goods_order` VALUES (334, 1, 'OPPO R9s', '2019-02-27 16:15:18');
INSERT INTO `goods_order` VALUES (335, 1, 'OPPO R9s', '2019-02-27 16:15:18');
INSERT INTO `goods_order` VALUES (336, 1, 'OPPO R9s', '2019-02-27 16:15:18');
INSERT INTO `goods_order` VALUES (337, 1, 'OPPO R9s', '2019-02-27 16:15:18');
INSERT INTO `goods_order` VALUES (338, 1, 'OPPO R9s', '2019-02-27 16:15:18');
INSERT INTO `goods_order` VALUES (339, 1, 'OPPO R9s', '2019-02-27 16:15:18');
INSERT INTO `goods_order` VALUES (340, 1, 'OPPO R9s', '2019-02-27 16:15:18');
INSERT INTO `goods_order` VALUES (341, 1, 'OPPO R9s', '2019-02-27 16:15:18');
INSERT INTO `goods_order` VALUES (342, 1, 'OPPO R9s', '2019-02-27 16:15:18');
INSERT INTO `goods_order` VALUES (343, 1, 'OPPO R9s', '2019-02-28 11:45:18');
INSERT INTO `goods_order` VALUES (344, 1, 'OPPO R9s', '2019-02-28 11:46:33');
INSERT INTO `goods_order` VALUES (345, 1, 'OPPO R9s', '2019-02-28 11:46:57');
INSERT INTO `goods_order` VALUES (346, 1, 'OPPO R9s', '2019-02-28 11:46:58');
INSERT INTO `goods_order` VALUES (347, 1, 'OPPO R9s', '2019-02-28 13:45:00');
INSERT INTO `goods_order` VALUES (348, 1, 'OPPO R9s', '2019-02-28 13:45:07');
INSERT INTO `goods_order` VALUES (349, 1, 'OPPO R9s', '2019-02-28 14:26:42');
INSERT INTO `goods_order` VALUES (350, 1, 'OPPO R9s', '2019-02-28 14:26:45');
INSERT INTO `goods_order` VALUES (351, 1, 'OPPO R9s', '2019-02-28 14:26:46');
INSERT INTO `goods_order` VALUES (352, 1, 'OPPO R9s', '2019-02-28 14:26:46');
INSERT INTO `goods_order` VALUES (353, 1, 'OPPO R9s', '2019-02-28 14:26:47');
INSERT INTO `goods_order` VALUES (354, 1, 'OPPO R9s', '2019-02-28 14:26:48');
INSERT INTO `goods_order` VALUES (355, 1, 'OPPO R9s', '2019-02-28 14:26:48');
INSERT INTO `goods_order` VALUES (356, 1, 'OPPO R9s', '2019-02-28 14:26:49');
INSERT INTO `goods_order` VALUES (357, 1, 'OPPO R9s', '2019-02-28 14:26:50');
INSERT INTO `goods_order` VALUES (358, 1, 'OPPO R9s', '2019-02-28 14:26:51');
INSERT INTO `goods_order` VALUES (359, 1, 'OPPO R9s', '2019-02-28 15:21:51');
INSERT INTO `goods_order` VALUES (360, 1, 'OPPO R9s', '2019-02-28 15:21:54');
INSERT INTO `goods_order` VALUES (361, 1, 'OPPO R9s', '2019-02-28 15:21:57');
INSERT INTO `goods_order` VALUES (362, 1, 'OPPO R9s', '2019-02-28 15:22:00');
INSERT INTO `goods_order` VALUES (363, 1, 'OPPO R9s', '2019-02-28 15:24:42');
INSERT INTO `goods_order` VALUES (364, 1, 'OPPO R9s', '2019-02-28 15:34:09');
INSERT INTO `goods_order` VALUES (365, 1, 'OPPO R9s', '2019-02-28 15:34:12');
INSERT INTO `goods_order` VALUES (366, 1, 'OPPO R9s', '2019-02-28 15:34:15');
INSERT INTO `goods_order` VALUES (367, 1, 'OPPO R9s', '2019-02-28 15:34:18');
INSERT INTO `goods_order` VALUES (368, 1, 'OPPO R9s', '2019-02-28 15:34:20');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (11, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (12, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (13, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (14, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (15, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (16, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (17, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (18, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (21, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (22, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (23, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (24, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (25, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (6, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (8, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (9, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主机地址',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名称',
  `operate_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `status` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作状态（0正常 1异常）',
  `operate_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型（1查询 2新增 3修改 4删除 0其他）',
  `operate_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求URL',
  `operate_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `error_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误消息',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 226 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.02002555900440206\"],\"loginName\":[\"\"],\"_\":[\"1545204379534\"]}', '0', '查询用户信息', '/user/getUserList', '18', '2018-12-19 15:26:20', NULL);
INSERT INTO `sys_log` VALUES (2, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.5315863161970258\"],\"loginName\":[\"\"],\"_\":[\"1545205704217\"]}', '0', '查询用户信息', '/user/getUserList', '769', '2018-12-19 15:48:25', NULL);
INSERT INTO `sys_log` VALUES (3, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.SysLogController.list()', '{\"rnd\":[\"0.7324776112175853\"],\"userName\":[\"\"],\"_\":[\"1545206027027\"]}', '0', '查询日志信息', '/sysLog/list', '248', '2018-12-19 15:53:47', NULL);
INSERT INTO `sys_log` VALUES (4, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.SysLogController.list()', '{\"rnd\":[\"0.16169250261870105\"],\"userName\":[\"\"],\"_\":[\"1545206038065\"]}', '0', '查询日志信息', '/sysLog/list', '20', '2018-12-19 15:53:59', NULL);
INSERT INTO `sys_log` VALUES (5, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.SysLogController.list()', '{\"rnd\":[\"0.16169250261870105\"],\"userName\":[\"admin\"],\"_\":[\"1545206038066\"]}', '0', '查询日志信息', '/sysLog/list', '136', '2018-12-19 15:55:24', NULL);
INSERT INTO `sys_log` VALUES (10, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.SysLogController.list()', '{\"rnd\":[\"0.16169250261870105\"],\"userName\":[\"admin\"],\"_\":[\"1545206038071\"]}', '0', '查询日志信息', '/sysLog/list', '25', '2018-12-19 15:55:37', NULL);
INSERT INTO `sys_log` VALUES (11, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.SysLogController.list()', '{\"rnd\":[\"0.16169250261870105\"],\"userName\":[\"admin\"],\"_\":[\"1545206038072\"]}', '0', '查询日志信息', '/sysLog/list', '16', '2018-12-19 15:55:39', NULL);
INSERT INTO `sys_log` VALUES (12, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.SysLogController.list()', '{\"rnd\":[\"0.8605545905047853\"],\"userName\":[\"\"],\"_\":[\"1545206151309\"]}', '0', '查询日志信息', '/sysLog/list', '16', '2018-12-19 15:55:51', NULL);
INSERT INTO `sys_log` VALUES (13, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.1409167025773359\"],\"loginName\":[\"\"],\"_\":[\"1545206843871\"]}', '0', '查询用户信息', '/user/getUserList', '77', '2018-12-19 16:07:24', NULL);
INSERT INTO `sys_log` VALUES (14, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.402567980923878\"],\"loginName\":[\"\"],\"_\":[\"1545209326128\"]}', '0', '查询用户信息', '/user/getUserList', '3454', '2018-12-19 16:48:50', '');
INSERT INTO `sys_log` VALUES (15, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '1', '查询菜单信息', '/menu/list', '1098', '2018-12-19 16:49:02', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (16, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '0', '查询菜单信息', '/menu/list', '1266', '2018-12-19 16:49:02', '');
INSERT INTO `sys_log` VALUES (17, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.35346553540213876\"],\"loginName\":[\"\"],\"_\":[\"1545209684422\"]}', '0', '查询用户信息', '/user/getUserList', '102', '2018-12-19 16:54:45', '');
INSERT INTO `sys_log` VALUES (18, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.35346553540213876\"],\"loginName\":[\"admin\"],\"_\":[\"1545209684423\"]}', '0', '查询用户信息', '/user/getUserList', '145', '2018-12-19 16:54:51', '');
INSERT INTO `sys_log` VALUES (19, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '1', '查询菜单信息', '/menu/list', '1013', '2018-12-19 16:56:21', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (20, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '0', '查询菜单信息', '/menu/list', '1092', '2018-12-19 16:56:21', '');
INSERT INTO `sys_log` VALUES (21, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '1', '查询菜单信息', '/menu/list', '1091', '2018-12-19 17:18:31', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (22, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '0', '查询菜单信息', '/menu/list', '1258', '2018-12-19 17:18:31', '');
INSERT INTO `sys_log` VALUES (23, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '1', '查询菜单信息', '/menu/list', '1016', '2018-12-19 17:18:41', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (24, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '0', '查询菜单信息', '/menu/list', '1080', '2018-12-19 17:18:42', '');
INSERT INTO `sys_log` VALUES (25, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '1', '查询菜单信息', '/menu/list', '1009', '2018-12-19 17:19:09', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (26, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '0', '查询菜单信息', '/menu/list', '1062', '2018-12-19 17:19:09', '');
INSERT INTO `sys_log` VALUES (27, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '1', '查询菜单信息', '/menu/list', '1013', '2018-12-19 17:20:25', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (28, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '1', '查询菜单信息', '/menu/list', '1023', '2018-12-19 17:30:04', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (31, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '1', '查询菜单信息', '/menu/list', '1018', '2018-12-20 14:47:11', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (32, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.5837140850168943\"],\"loginName\":[\"\"],\"_\":[\"1545288433135\"]}', '0', '查询用户信息', '/user/getUserList', '34', '2018-12-20 14:47:13', '');
INSERT INTO `sys_log` VALUES (35, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.7515997878100793\"],\"loginName\":[\"\"],\"_\":[\"1545288449141\"]}', '0', '查询用户信息', '/user/getUserList', '4', '2018-12-20 14:47:30', '');
INSERT INTO `sys_log` VALUES (37, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.7515997878100793\"],\"loginName\":[\"\"],\"_\":[\"1545288449143\"]}', '0', '查询用户信息', '/user/getUserList', '10', '2018-12-20 14:47:42', '');
INSERT INTO `sys_log` VALUES (38, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.7515997878100793\"],\"loginName\":[\"\"],\"_\":[\"1545288449144\"]}', '0', '查询用户信息', '/user/getUserList', '13', '2018-12-20 14:47:42', '');
INSERT INTO `sys_log` VALUES (42, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.7515997878100793\"],\"loginName\":[\"m\"],\"_\":[\"1545288449148\"]}', '0', '查询用户信息', '/user/getUserList', '273', '2018-12-20 14:48:11', '');
INSERT INTO `sys_log` VALUES (45, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":[\"asc\"]}', '1', '查询菜单信息', '/menu/list', '3002', '2018-12-21 13:42:05', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (46, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.7936200326348013\"],\"loginName\":[\"\"],\"_\":[\"1545370926656\"]}', '0', '查询用户信息', '/user/getUserList', '2792', '2018-12-21 13:42:09', '');
INSERT INTO `sys_log` VALUES (47, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '131', '2018-12-21 14:18:24', '');
INSERT INTO `sys_log` VALUES (48, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '[]', '1', '查询菜单信息', '/menu/list', '1013', '2018-12-21 14:18:52', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (49, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.9233784958216538\"],\"loginName\":[\"\"],\"_\":[\"1545373347788\"]}', '0', '查询用户信息', '/user/getUserList', '90', '2018-12-21 14:22:27', '');
INSERT INTO `sys_log` VALUES (50, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"rnd\":[\"0.9233784958216538\"],\"loginName\":[\"m\"],\"_\":[\"1545373347789\"]}', '0', '查询用户信息', '/user/getUserList', '109', '2018-12-21 14:22:54', '');
INSERT INTO `sys_log` VALUES (51, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '349', '2018-12-21 14:32:23', '');
INSERT INTO `sys_log` VALUES (52, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '', '1', '查询菜单信息', '/menu/list', '1026', '2018-12-21 14:32:27', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (53, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"m\"}]', '0', '查询用户信息', '/user/getUserList', '62', '2018-12-21 14:38:15', '');
INSERT INTO `sys_log` VALUES (54, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '53', '2018-12-21 14:39:49', '');
INSERT INTO `sys_log` VALUES (55, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"m\"}]', '0', '查询用户信息', '/user/getUserList', '19', '2018-12-21 14:40:20', '');
INSERT INTO `sys_log` VALUES (56, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"m\"}]', '0', '查询用户信息', '/user/getUserList', '10', '2018-12-21 14:40:34', '');
INSERT INTO `sys_log` VALUES (57, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '5', '2018-12-21 14:41:07', '');
INSERT INTO `sys_log` VALUES (58, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"admin\"}]', '0', '查询用户信息', '/user/getUserList', '16', '2018-12-21 14:41:09', '');
INSERT INTO `sys_log` VALUES (59, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '', '1', '查询菜单信息', '/menu/list', '1002', '2018-12-21 14:44:27', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (60, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '3', '2018-12-21 14:45:51', '');
INSERT INTO `sys_log` VALUES (61, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '', '1', '查询菜单信息', '/menu/list', '1038', '2018-12-21 14:46:05', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (62, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '27', '2018-12-21 14:46:41', '');
INSERT INTO `sys_log` VALUES (63, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '', '1', '查询菜单信息', '/menu/list', '1008', '2018-12-21 14:46:45', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (64, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '2039', '2018-12-21 14:47:51', '');
INSERT INTO `sys_log` VALUES (65, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '', '1', '查询菜单信息', '/menu/list', '2275', '2018-12-21 14:47:52', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (72, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '21', '2018-12-21 14:55:24', '');
INSERT INTO `sys_log` VALUES (73, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"m\"}]', '0', '查询用户信息', '/user/getUserList', '15', '2018-12-21 14:55:27', '');
INSERT INTO `sys_log` VALUES (74, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '5', '2018-12-21 14:56:43', '');
INSERT INTO `sys_log` VALUES (75, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '193', '2018-12-21 15:11:57', '');
INSERT INTO `sys_log` VALUES (76, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '25', '2018-12-21 15:17:50', '');
INSERT INTO `sys_log` VALUES (77, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '282', '2018-12-21 15:21:14', '');
INSERT INTO `sys_log` VALUES (78, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '88', '2018-12-21 15:23:55', '');
INSERT INTO `sys_log` VALUES (79, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"m\"}]', '0', '查询用户信息', '/user/getUserList', '383', '2018-12-21 15:24:20', '');
INSERT INTO `sys_log` VALUES (80, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '114', '2018-12-21 15:26:06', '');
INSERT INTO `sys_log` VALUES (81, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '138', '2018-12-21 15:27:38', '');
INSERT INTO `sys_log` VALUES (82, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '1793', '2018-12-21 15:35:57', '');
INSERT INTO `sys_log` VALUES (83, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"m\"}]', '0', '查询用户信息', '/user/getUserList', '109', '2018-12-21 15:37:11', '');
INSERT INTO `sys_log` VALUES (84, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '7', '2018-12-21 15:39:34', '');
INSERT INTO `sys_log` VALUES (85, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '98', '2018-12-21 15:47:22', '');
INSERT INTO `sys_log` VALUES (86, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '157', '2018-12-21 15:49:07', '');
INSERT INTO `sys_log` VALUES (87, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '166', '2018-12-21 15:50:10', '');
INSERT INTO `sys_log` VALUES (88, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '7', '2018-12-21 16:19:07', '');
INSERT INTO `sys_log` VALUES (89, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '159', '2018-12-21 16:21:15', '');
INSERT INTO `sys_log` VALUES (90, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '152', '2018-12-21 16:23:07', '');
INSERT INTO `sys_log` VALUES (91, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '150', '2018-12-21 16:25:27', '');
INSERT INTO `sys_log` VALUES (92, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '17', '2018-12-21 16:26:45', '');
INSERT INTO `sys_log` VALUES (93, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '122', '2018-12-21 16:27:43', '');
INSERT INTO `sys_log` VALUES (94, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '13', '2018-12-21 16:28:54', '');
INSERT INTO `sys_log` VALUES (95, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"\"}]', '0', '查询用户信息', '/user/getUserList', '81', '2018-12-21 16:29:41', '');
INSERT INTO `sys_log` VALUES (96, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '[{\"loginName\":\"m\"}]', '0', '查询用户信息', '/user/getUserList', '134', '2018-12-21 16:31:17', '');
INSERT INTO `sys_log` VALUES (97, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息', '/user/getUserList', '116', '2018-12-21 16:33:14', '');
INSERT INTO `sys_log` VALUES (98, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"loginName\":\"m\"}', '0', '查询用户信息', '/user/getUserList', '10', '2018-12-21 16:34:04', '');
INSERT INTO `sys_log` VALUES (99, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"loginName\":\"m\"}', '0', '查询用户信息', '/user/getUserList', '11', '2018-12-21 16:34:34', '');
INSERT INTO `sys_log` VALUES (100, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息', '/user/getUserList', '354', '2018-12-21 16:46:16', '');
INSERT INTO `sys_log` VALUES (101, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '{\"loginName\":\"\"}', '0', '查询用户信息', '/user/getUserList', '307', '2018-12-21 17:03:41', '');
INSERT INTO `sys_log` VALUES (102, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息', '/user/getUserList', '374', '2018-12-21 17:04:47', '');
INSERT INTO `sys_log` VALUES (103, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息', '/menu/list', '3077', '2018-12-21 17:23:58', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (104, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '1642', '2018-12-24 11:31:45', '');
INSERT INTO `sys_log` VALUES (105, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '3602', '2018-12-24 11:32:14', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (106, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '1510', '2018-12-26 10:19:51', '');
INSERT INTO `sys_log` VALUES (107, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '1604', '2018-12-26 10:20:00', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (108, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '130', '2018-12-26 10:58:41', '');
INSERT INTO `sys_log` VALUES (109, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '1081', '2018-12-26 10:58:54', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (110, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '260', '2018-12-26 11:03:04', '');
INSERT INTO `sys_log` VALUES (111, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '150', '2018-12-26 11:22:31', '');
INSERT INTO `sys_log` VALUES (112, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '99', '2018-12-26 11:26:55', '');
INSERT INTO `sys_log` VALUES (113, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '181', '2018-12-26 11:31:20', '');
INSERT INTO `sys_log` VALUES (114, 1, 'admin', '0:0:0:0:0:0:0:1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '250', '2018-12-26 11:33:13', '');
INSERT INTO `sys_log` VALUES (115, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2365', '2018-12-28 10:27:15', '');
INSERT INTO `sys_log` VALUES (116, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '1783', '2018-12-28 10:44:17', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (117, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '5034', '2018-12-28 16:10:43', '');
INSERT INTO `sys_log` VALUES (118, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '623', '2018-12-28 16:11:45', 'Redis command timed out; nested exception is io.lettuce.core.RedisCommandTimeoutException: Command timed out after no timeout');
INSERT INTO `sys_log` VALUES (119, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '0', '查询菜单信息,操作类型=select', '/menu/list', '891', '2018-12-28 16:13:43', '');
INSERT INTO `sys_log` VALUES (120, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '104', '2018-12-28 16:48:37', '');
INSERT INTO `sys_log` VALUES (121, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '0', '查询菜单信息,操作类型=select', '/menu/list', '37', '2018-12-28 16:48:41', '');
INSERT INTO `sys_log` VALUES (122, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '18705', '2018-12-29 17:18:38', '');
INSERT INTO `sys_log` VALUES (123, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '1600', '2019-01-02 10:26:21', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (124, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '601', '2019-01-02 10:26:24', '');
INSERT INTO `sys_log` VALUES (125, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '2348', '2019-01-02 12:24:10', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (126, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '4427', '2019-01-02 12:24:15', '');
INSERT INTO `sys_log` VALUES (127, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '15759', '2019-01-03 13:47:29', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (128, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '22463', '2019-01-03 13:47:38', '');
INSERT INTO `sys_log` VALUES (129, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '79', '2019-01-03 14:59:49', '');
INSERT INTO `sys_log` VALUES (130, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '1015', '2019-01-03 14:59:54', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (131, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '7', '2019-01-03 15:00:53', '');
INSERT INTO `sys_log` VALUES (132, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '10', '2019-01-03 15:01:20', '');
INSERT INTO `sys_log` VALUES (133, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '1856', '2019-01-08 09:42:34', '');
INSERT INTO `sys_log` VALUES (134, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '36', '2019-01-08 09:43:26', '');
INSERT INTO `sys_log` VALUES (135, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '55', '2019-01-08 09:45:43', '');
INSERT INTO `sys_log` VALUES (136, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '6', '2019-01-08 09:45:53', '');
INSERT INTO `sys_log` VALUES (137, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '7', '2019-01-08 09:46:31', '');
INSERT INTO `sys_log` VALUES (138, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '2011', '2019-01-08 09:46:33', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (139, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '8', '2019-01-08 09:47:07', '');
INSERT INTO `sys_log` VALUES (140, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '6', '2019-01-08 09:48:39', '');
INSERT INTO `sys_log` VALUES (141, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '129', '2019-01-08 09:51:29', '');
INSERT INTO `sys_log` VALUES (142, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '5', '2019-01-08 09:52:24', '');
INSERT INTO `sys_log` VALUES (143, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '4', '2019-01-08 09:54:25', '');
INSERT INTO `sys_log` VALUES (144, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '4', '2019-01-08 09:54:29', '');
INSERT INTO `sys_log` VALUES (145, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '5', '2019-01-08 09:56:05', '');
INSERT INTO `sys_log` VALUES (146, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '4', '2019-01-08 09:56:39', '');
INSERT INTO `sys_log` VALUES (147, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '18', '2019-01-08 09:57:45', '');
INSERT INTO `sys_log` VALUES (148, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '6', '2019-01-08 09:58:53', '');
INSERT INTO `sys_log` VALUES (149, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '11', '2019-01-08 09:59:06', '');
INSERT INTO `sys_log` VALUES (150, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '13', '2019-01-08 09:59:27', '');
INSERT INTO `sys_log` VALUES (151, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '4', '2019-01-08 09:59:32', '');
INSERT INTO `sys_log` VALUES (152, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '18', '2019-01-08 10:00:02', '');
INSERT INTO `sys_log` VALUES (153, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '8', '2019-01-08 10:00:17', '');
INSERT INTO `sys_log` VALUES (154, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '5', '2019-01-08 10:00:52', '');
INSERT INTO `sys_log` VALUES (155, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '9', '2019-01-08 10:01:46', '');
INSERT INTO `sys_log` VALUES (156, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '9', '2019-01-08 10:03:28', '');
INSERT INTO `sys_log` VALUES (157, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '6', '2019-01-08 10:04:18', '');
INSERT INTO `sys_log` VALUES (158, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '6', '2019-01-08 10:04:36', '');
INSERT INTO `sys_log` VALUES (159, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '21', '2019-01-08 10:06:27', '');
INSERT INTO `sys_log` VALUES (160, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '5', '2019-01-08 10:06:47', '');
INSERT INTO `sys_log` VALUES (161, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '6', '2019-01-08 10:06:51', '');
INSERT INTO `sys_log` VALUES (162, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '27', '2019-01-08 10:07:40', '');
INSERT INTO `sys_log` VALUES (163, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '4', '2019-01-08 10:08:02', '');
INSERT INTO `sys_log` VALUES (164, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '6', '2019-01-08 10:08:21', '');
INSERT INTO `sys_log` VALUES (165, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '7', '2019-01-08 10:10:10', '');
INSERT INTO `sys_log` VALUES (166, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '5', '2019-01-08 10:10:13', '');
INSERT INTO `sys_log` VALUES (167, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '10', '2019-01-08 10:10:22', '');
INSERT INTO `sys_log` VALUES (168, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '12', '2019-01-08 10:10:22', '');
INSERT INTO `sys_log` VALUES (169, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '536', '2019-01-08 11:09:08', '');
INSERT INTO `sys_log` VALUES (170, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '1694', '2019-01-14 15:59:45', '');
INSERT INTO `sys_log` VALUES (171, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '5', '2019-01-14 16:03:26', '');
INSERT INTO `sys_log` VALUES (172, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:03:30', '');
INSERT INTO `sys_log` VALUES (173, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '176', '2019-01-14 16:06:55', '');
INSERT INTO `sys_log` VALUES (174, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '1650', '2019-01-14 16:07:01', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (175, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '4', '2019-01-14 16:09:30', '');
INSERT INTO `sys_log` VALUES (176, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '6', '2019-01-14 16:10:55', '');
INSERT INTO `sys_log` VALUES (177, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '6', '2019-01-14 16:11:29', '');
INSERT INTO `sys_log` VALUES (178, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '8', '2019-01-14 16:13:18', '');
INSERT INTO `sys_log` VALUES (179, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '90', '2019-01-14 16:23:46', '');
INSERT INTO `sys_log` VALUES (180, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:28:02', '');
INSERT INTO `sys_log` VALUES (181, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2', '2019-01-14 16:28:07', '');
INSERT INTO `sys_log` VALUES (182, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:30:03', '');
INSERT INTO `sys_log` VALUES (183, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2', '2019-01-14 16:30:24', '');
INSERT INTO `sys_log` VALUES (184, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '6', '2019-01-14 16:31:42', '');
INSERT INTO `sys_log` VALUES (185, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2', '2019-01-14 16:31:52', '');
INSERT INTO `sys_log` VALUES (186, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:31:56', '');
INSERT INTO `sys_log` VALUES (187, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2', '2019-01-14 16:32:41', '');
INSERT INTO `sys_log` VALUES (188, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:36:04', '');
INSERT INTO `sys_log` VALUES (189, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2', '2019-01-14 16:41:58', '');
INSERT INTO `sys_log` VALUES (190, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '11', '2019-01-14 16:42:23', '');
INSERT INTO `sys_log` VALUES (191, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2', '2019-01-14 16:42:27', '');
INSERT INTO `sys_log` VALUES (192, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '17', '2019-01-14 16:42:48', '');
INSERT INTO `sys_log` VALUES (193, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:44:14', '');
INSERT INTO `sys_log` VALUES (194, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:44:22', '');
INSERT INTO `sys_log` VALUES (195, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '6', '2019-01-14 16:44:39', '');
INSERT INTO `sys_log` VALUES (196, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2', '2019-01-14 16:45:02', '');
INSERT INTO `sys_log` VALUES (197, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:45:24', '');
INSERT INTO `sys_log` VALUES (198, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:45:29', '');
INSERT INTO `sys_log` VALUES (199, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '5', '2019-01-14 16:45:56', '');
INSERT INTO `sys_log` VALUES (200, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '4', '2019-01-14 16:47:31', '');
INSERT INTO `sys_log` VALUES (201, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '7', '2019-01-14 16:50:19', '');
INSERT INTO `sys_log` VALUES (202, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '5', '2019-01-14 16:50:32', '');
INSERT INTO `sys_log` VALUES (203, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2', '2019-01-14 16:50:43', '');
INSERT INTO `sys_log` VALUES (204, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '4', '2019-01-14 16:50:47', '');
INSERT INTO `sys_log` VALUES (205, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '7', '2019-01-14 16:50:57', '');
INSERT INTO `sys_log` VALUES (206, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:51:50', '');
INSERT INTO `sys_log` VALUES (207, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:53:01', '');
INSERT INTO `sys_log` VALUES (208, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '5', '2019-01-14 16:53:16', '');
INSERT INTO `sys_log` VALUES (209, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '10', '2019-01-14 16:54:19', '');
INSERT INTO `sys_log` VALUES (210, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '1068', '2019-01-14 16:54:48', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (211, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '1062', '2019-01-14 16:58:48', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (212, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 16:58:51', '');
INSERT INTO `sys_log` VALUES (213, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '4', '2019-01-14 16:59:52', '');
INSERT INTO `sys_log` VALUES (214, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 17:01:08', '');
INSERT INTO `sys_log` VALUES (215, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '3', '2019-01-14 17:06:02', '');
INSERT INTO `sys_log` VALUES (216, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2', '2019-01-14 17:06:12', '');
INSERT INTO `sys_log` VALUES (217, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2', '2019-01-14 17:06:14', '');
INSERT INTO `sys_log` VALUES (218, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '2', '2019-01-14 17:07:23', '');
INSERT INTO `sys_log` VALUES (219, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '4916', '2019-01-24 11:48:23', '');
INSERT INTO `sys_log` VALUES (220, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '1', '查询菜单信息,操作类型=select', '/menu/list', '1466', '2019-01-24 11:48:30', 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379');
INSERT INTO `sys_log` VALUES (221, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '1359', '2019-02-25 15:18:58', '');
INSERT INTO `sys_log` VALUES (222, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '246', '2019-02-25 15:39:44', '');
INSERT INTO `sys_log` VALUES (223, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '210', '2019-02-25 15:43:26', '');
INSERT INTO `sys_log` VALUES (224, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.UserController.getUserList()', '', '0', '查询用户信息,操作类型=select', '/user/getUserList', '928', '2019-02-28 15:45:00', '');
INSERT INTO `sys_log` VALUES (225, 1, 'admin', '127.0.0.1', 'com.lin.sysmanage.controller.MenuController.list()', '{\"order\":\"asc\"}', '0', '查询菜单信息,操作类型=select', '/menu/list', '746', '2019-02-28 15:45:03', '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1056 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '表单构建', 3, 1, '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (113, '代码生成', 3, 2, '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (114, '系统接口', 3, 3, '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '重置密码', 100, 5, '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '角色查询', 101, 1, '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色新增', 101, 2, '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色修改', 101, 3, '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色删除', 101, 4, '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色导出', 101, 4, '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '菜单查询', 102, 1, '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单新增', 102, 2, '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单修改', 102, 3, '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单删除', 102, 4, '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '部门查询', 103, 1, '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门新增', 103, 2, '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门修改', 103, 3, '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门删除', 103, 4, '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '岗位查询', 104, 1, '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位新增', 104, 2, '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位修改', 104, 3, '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位删除', 104, 4, '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位导出', 104, 4, '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '字典查询', 105, 1, '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典新增', 105, 2, '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典修改', 105, 3, '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典删除', 105, 4, '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典导出', 105, 4, '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '参数查询', 106, 1, '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数新增', 106, 2, '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数修改', 106, 3, '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数删除', 106, 4, '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数导出', 106, 4, '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '公告查询', 107, 1, '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告新增', 107, 2, '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告修改', 107, 3, '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告删除', 107, 4, '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '操作查询', 500, 1, '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作删除', 500, 2, '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '详细信息', 500, 3, '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 2, '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '在线查询', 109, 1, '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '批量强退', 109, 2, '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '单条强退', 109, 3, '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '任务查询', 110, 1, '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务新增', 110, 2, '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务修改', 110, 3, '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务删除', 110, 4, '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '状态修改', 110, 5, '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '任务导出', 110, 5, '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '生成查询', 113, 1, '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '生成代码', 113, 2, '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'ROLE_ADMIN', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帐号状态（0正常 1停用）',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', 'admin', '1');
INSERT INTO `sys_user` VALUES (2, 'abel', 'abel', 'abel', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
