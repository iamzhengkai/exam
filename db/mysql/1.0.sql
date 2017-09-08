/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : zexam

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-09-06 11:22:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICT_INDEX` varchar(32) DEFAULT NULL COMMENT '索引',
  `DICT_KEY` varchar(32) DEFAULT NULL COMMENT '键',
  `DICT_VALUE` varchar(32) DEFAULT NULL COMMENT '值',
  `NO` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', 'QUESTION_TYPE', '1', '单选', '1');
INSERT INTO `sys_dict` VALUES ('2', 'QUESTION_TYPE', '2', '多选', '2');
INSERT INTO `sys_dict` VALUES ('3', 'QUESTION_TYPE', '3', '填空', '3');
INSERT INTO `sys_dict` VALUES ('4', 'QUESTION_TYPE', '4', '判断', '4');
INSERT INTO `sys_dict` VALUES ('5', 'QUESTION_TYPE', '5', '问答', '5');
INSERT INTO `sys_dict` VALUES ('6', 'QUESTION_DIFFICULTY', '1', '极易', '1');
INSERT INTO `sys_dict` VALUES ('7', 'QUESTION_DIFFICULTY', '2', '简单', '2');
INSERT INTO `sys_dict` VALUES ('8', 'QUESTION_DIFFICULTY', '3', '适中', '3');
INSERT INTO `sys_dict` VALUES ('9', 'QUESTION_DIFFICULTY', '4', '困难', '4');
INSERT INTO `sys_dict` VALUES ('10', 'QUESTION_DIFFICULTY', '5', '极难', '5');
INSERT INTO `sys_dict` VALUES ('11', 'QUESTION_OPTIONS', '1', 'A', '1');
INSERT INTO `sys_dict` VALUES ('12', 'QUESTION_OPTIONS', '2', 'B', '2');
INSERT INTO `sys_dict` VALUES ('13', 'QUESTION_OPTIONS', '3', 'C', '3');
INSERT INTO `sys_dict` VALUES ('14', 'QUESTION_OPTIONS', '4', 'D', '4');
INSERT INTO `sys_dict` VALUES ('15', 'QUESTION_OPTIONS', '5', 'E', '5');
INSERT INTO `sys_dict` VALUES ('16', 'QUESTION_OPTIONS', '6', 'F', '6');
INSERT INTO `sys_dict` VALUES ('17', 'QUESTION_OPTIONS', '7', 'G', '7');
INSERT INTO `sys_dict` VALUES ('18', 'STATE', '1', '启用', '1');
INSERT INTO `sys_dict` VALUES ('19', 'STATE', '0', '禁用', '2');
INSERT INTO `sys_dict` VALUES ('20', 'EXAM_USER_STATE', '1', '未考试', '1');
INSERT INTO `sys_dict` VALUES ('21', 'EXAM_USER_STATE', '2', '考试中', '2');
INSERT INTO `sys_dict` VALUES ('22', 'EXAM_USER_STATE', '3', '已交卷', '3');
INSERT INTO `sys_dict` VALUES ('23', 'EXAM_USER_STATE', '4', '强制交卷', '4');
INSERT INTO `sys_dict` VALUES ('24', 'EXAM_USER_STATE', '5', '判卷中', '5');
INSERT INTO `sys_dict` VALUES ('25', 'EXAM_USER_STATE', '6', '已判卷', '6');
INSERT INTO `sys_dict` VALUES ('26', 'EXAM_USER_STATE', '7', '不及格', '7');
INSERT INTO `sys_dict` VALUES ('27', 'EXAM_USER_STATE', '8', '及格', '8');
INSERT INTO `sys_dict` VALUES ('28', 'RES_TYPE', '1', '后台', '1');
INSERT INTO `sys_dict` VALUES ('29', 'RES_TYPE', '2', '前台', '2');

-- ----------------------------
-- Table structure for `sys_file`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL COMMENT '前缀',
  `EXT_NAME` varchar(32) DEFAULT NULL COMMENT '后缀',
  `FILE_TYPE` varchar(128) DEFAULT NULL COMMENT '类型',
  `PATH` varchar(64) DEFAULT NULL COMMENT '路径',
  `IP` varchar(16) DEFAULT NULL COMMENT '上传ip',
  `STATE` int(11) DEFAULT NULL COMMENT '0：删除；1：正常',
  `UPDATE_USER_ID` int(11) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_org`
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(32) DEFAULT NULL COMMENT '名称',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '父ID',
  `PARENT_SUB` varchar(512) DEFAULT NULL COMMENT '父子关系（格式：_父ID_子ID_子子ID_... ...）',
  `UPDATE_USER_ID` int(11) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `STATE` int(11) DEFAULT NULL COMMENT '0：删除；1：正常',
  `NO` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('1', '组织机构', '0', '_1_', '1', '2017-08-01 22:31:43', '1', '1');

-- ----------------------------
-- Table structure for `sys_org_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_org_post`;
CREATE TABLE `sys_org_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORG_ID` int(11) DEFAULT NULL,
  `POST_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_1` (`ORG_ID`),
  KEY `FK_Reference_2` (`POST_ID`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`ORG_ID`) REFERENCES `sys_org` (`ID`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`POST_ID`) REFERENCES `sys_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org_post
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL,
  `UPDATE_USER_ID` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL COMMENT '0：删除；1：正常',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_post
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_post_res`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post_res`;
CREATE TABLE `sys_post_res` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL COMMENT '岗位ID',
  `RES_ID` int(11) DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_6` (`POST_ID`),
  KEY `FK_Reference_7` (`RES_ID`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`POST_ID`) REFERENCES `sys_post` (`ID`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`RES_ID`) REFERENCES `sys_res` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_post_res
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_post_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post_user`;
CREATE TABLE `sys_post_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_4` (`USER_ID`),
  KEY `FK_Reference_5` (`POST_ID`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`POST_ID`) REFERENCES `sys_post` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_post_user
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_res`
-- ----------------------------
DROP TABLE IF EXISTS `sys_res`;
CREATE TABLE `sys_res` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL COMMENT '名称',
  `URL` varchar(512) DEFAULT NULL COMMENT 'URL',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '父ID',
  `PARENT_SUB` varchar(128) DEFAULT NULL COMMENT '父子关系（格式：_父ID_子ID_子子ID_... ...）',
  `UPDATE_USER_ID` int(11) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `NO` int(11) DEFAULT NULL COMMENT '排序',
  `AUTH_POS` int(11) DEFAULT NULL COMMENT '权限位',
  `AUTH_CODE` int(11) DEFAULT NULL COMMENT '权限码',
  `ICON` varchar(32) DEFAULT NULL COMMENT '图标',
  `TYPE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_res
-- ----------------------------
INSERT INTO `sys_res` VALUES ('1', '系统资源', 'xtzy', '0', '_1_', '1', '2017-08-15 18:41:02', '1', '1', '1', '', null);
INSERT INTO `sys_res` VALUES ('2', '系统管理', 'xtgl', '1', '_1_2_', '1', '2017-08-01 23:02:52', '1', '1', '2', '', '1');
INSERT INTO `sys_res` VALUES ('3', '基础管理', 'jcgl', '2', '_1_2_3_', '1', '2017-08-01 23:04:09', '1', '1', '4', '', '1');
INSERT INTO `sys_res` VALUES ('4', '数据字典', 'dict/toList', '3', '_1_2_3_4_', '1', '2017-08-02 09:26:06', '3', '1', '8', '', '1');
INSERT INTO `sys_res` VALUES ('5', '列表', 'dict/list', '4', '_1_2_3_4_5_', '1', '2017-08-01 23:06:54', '1', '1', '16', '', '1');
INSERT INTO `sys_res` VALUES ('6', '添加', 'dict/toAdd|dict/doAdd', '4', '_1_2_3_4_6_', '1', '2017-08-01 23:08:51', '2', '1', '32', '', '1');
INSERT INTO `sys_res` VALUES ('7', '修改', 'dict/toEdit|dict/doEdit', '4', '_1_2_3_4_7_', '1', '2017-08-01 23:45:35', '3', '1', '64', '', '1');
INSERT INTO `sys_res` VALUES ('8', '删除', 'dict/doDel', '4', '_1_2_3_4_8_', '1', '2017-08-01 23:10:11', '4', '1', '128', '', '1');
INSERT INTO `sys_res` VALUES ('9', '移动', 'dict/toMove|dict/moveResTreeList|dict/doMove', '4', '_1_2_3_4_9_', '1', '2017-08-01 23:10:51', '5', '1', '256', '', '1');
INSERT INTO `sys_res` VALUES ('10', '资源管理', 'res/toList', '3', '_1_2_3_10_', '1', '2017-08-02 09:25:07', '1', '1', '512', '', '1');
INSERT INTO `sys_res` VALUES ('11', '列表', 'res/toList|res/treeList|res/list', '10', '_1_2_3_10_11_', '1', '2017-08-01 23:44:54', '1', '1', '1024', '', '1');
INSERT INTO `sys_res` VALUES ('12', '添加', 'res/toAdd|res/doAdd', '10', '_1_2_3_10_12_', '1', '2017-08-01 23:45:25', '2', '1', '2048', '', '1');
INSERT INTO `sys_res` VALUES ('13', '修改', 'res/toEdit|res/doEdit', '10', '_1_2_3_10_13_', '1', '2017-08-01 23:46:06', '3', '1', '4096', '', '1');
INSERT INTO `sys_res` VALUES ('14', '删除', 'res/doDel', '10', '_1_2_3_10_14_', '1', '2017-08-01 23:46:27', '4', '1', '8192', '', '1');
INSERT INTO `sys_res` VALUES ('15', '移动', 'res/toMove|res/moveResTreeList|res/doMove', '10', '_1_2_3_10_15_', '1', '2017-08-01 23:47:13', '5', '1', '16384', '', '1');
INSERT INTO `sys_res` VALUES ('16', '附件管理', 'file/toList', '3', '_1_2_3_16_', '1', '2017-08-01 23:49:46', '5', '1', '32768', '', '1');
INSERT INTO `sys_res` VALUES ('17', '列表', 'file/list', '16', '_1_2_3_16_17_', '1', '2017-08-01 23:52:34', '1', '1', '65536', '', '1');
INSERT INTO `sys_res` VALUES ('18', '上传', 'file/toUpload|file/doTempUpload|file/doUpload', '16', '_1_2_3_16_18_', '1', '2017-08-01 23:51:08', '2', '1', '131072', '', '1');
INSERT INTO `sys_res` VALUES ('19', '下载', 'file/doDownload', '16', '_1_2_3_16_19_', '1', '2017-08-01 23:51:45', '3', '1', '262144', '', '1');
INSERT INTO `sys_res` VALUES ('20', '删除', 'file/doDel', '16', '_1_2_3_16_20_', '1', '2017-08-01 23:52:23', '4', '1', '524288', '', '1');
INSERT INTO `sys_res` VALUES ('21', '在线用户', 'onlineUser/toList', '3', '_1_2_3_21_', '1', '2017-08-02 09:26:10', '7', '1', '1048576', '', '1');
INSERT INTO `sys_res` VALUES ('22', '列表', 'onlineUser/list', '21', '_1_2_3_21_22_', '1', '2017-08-02 09:17:19', '1', '1', '2097152', '', '1');
INSERT INTO `sys_res` VALUES ('23', '强制退出', 'onlineUser/doDel', '21', '_1_2_3_21_23_', '1', '2017-08-02 09:17:55', '2', '1', '4194304', '', '1');
INSERT INTO `sys_res` VALUES ('24', '实时日志', 'log/toList', '3', '_1_2_3_24_', '1', '2017-08-02 09:20:53', '9', '1', '8388608', '', '1');
INSERT INTO `sys_res` VALUES ('25', '列表', 'log/list', '24', '_1_2_3_24_25_', '1', '2017-08-02 09:20:01', '1', '1', '16777216', '', '1');
INSERT INTO `sys_res` VALUES ('26', '用户管理', 'yhgl', '2', '_1_2_26_', '1', '2017-08-02 09:27:15', '3', '1', '33554432', '', '1');
INSERT INTO `sys_res` VALUES ('27', '组织机构', 'org/toList', '26', '_1_2_26_27_', '1', '2017-08-02 09:29:33', '1', '1', '67108864', '', '1');
INSERT INTO `sys_res` VALUES ('28', '列表', 'org/treeList|org/list', '27', '_1_2_26_27_28_', '1', '2017-08-02 09:29:50', '1', '1', '134217728', '', '1');
INSERT INTO `sys_res` VALUES ('29', '添加', 'org/toAdd|org/doAdd', '27', '_1_2_26_27_29_', '1', '2017-08-02 09:30:03', '2', '1', '268435456', '', '1');
INSERT INTO `sys_res` VALUES ('30', '修改', 'org/toEdit|org/doEdit', '27', '_1_2_26_27_30_', '1', '2017-08-02 09:30:52', '3', '1', '536870912', '', '1');
INSERT INTO `sys_res` VALUES ('31', '删除', 'org/doDel', '27', '_1_2_26_27_31_', '1', '2017-08-02 09:30:47', '4', '1', '1073741824', '', '1');
INSERT INTO `sys_res` VALUES ('32', '移动', 'org/toMove|org/moveOrgTreeList|org/doMove', '27', '_1_2_26_27_32_', '1', '2017-08-02 09:30:38', '5', '2', '1', '', '1');
INSERT INTO `sys_res` VALUES ('33', '岗位管理', 'post/toList', '26', '_1_2_26_33_', '1', '2017-08-02 09:42:58', '3', '2', '2', '', '1');
INSERT INTO `sys_res` VALUES ('34', '列表', 'post/orgPostTreeList|post/list', '33', '_1_2_26_33_34_', '1', '2017-08-02 09:35:07', '1', '2', '4', '', '1');
INSERT INTO `sys_res` VALUES ('35', '添加', 'post/toAdd|post/doAdd', '33', '_1_2_26_33_35_', '1', '2017-08-02 09:35:23', '2', '2', '8', '', '1');
INSERT INTO `sys_res` VALUES ('36', '修改', 'post/toEdit|post/doEdit', '33', '_1_2_26_33_36_', '1', '2017-08-02 09:35:32', '3', '2', '16', '', '1');
INSERT INTO `sys_res` VALUES ('37', '删除', 'post/doDel', '33', '_1_2_26_33_37_', '1', '2017-08-02 09:35:41', '4', '2', '32', '', '1');
INSERT INTO `sys_res` VALUES ('38', '设置权限', 'post/toResUpdate|post/resUpdateResTreeList|post/doResUpdate', '33', '_1_2_26_33_38_', '1', '2017-08-02 09:35:57', '5', '2', '64', '', '1');
INSERT INTO `sys_res` VALUES ('39', '用户管理', 'user/toList', '26', '_1_2_26_39_', '1', '2017-08-02 09:43:19', '5', '2', '128', '', '1');
INSERT INTO `sys_res` VALUES ('40', '列表', 'user/orgTreeList|user/list', '39', '_1_2_26_39_40_', '1', '2017-08-02 09:45:22', '1', '2', '256', '', '1');
INSERT INTO `sys_res` VALUES ('41', '添加', 'user/toAdd|user/doAdd', '39', '_1_2_26_39_41_', '1', '2017-08-02 09:45:30', '2', '2', '512', '', '1');
INSERT INTO `sys_res` VALUES ('42', '修改', 'user/toEdit|user/doEdit', '39', '_1_2_26_39_42_', '1', '2017-08-02 09:45:41', '3', '2', '1024', '', '1');
INSERT INTO `sys_res` VALUES ('43', '删除', 'user/doDel', '39', '_1_2_26_39_43_', '1', '2017-08-02 09:45:50', '4', '2', '2048', '', '1');
INSERT INTO `sys_res` VALUES ('44', '设置机构', 'user/toOrgUpdate|user/orgUpdateOrgTreeList|user/doOrgUpdate', '39', '_1_2_26_39_44_', '1', '2017-08-02 09:46:15', '5', '2', '4096', '', '1');
INSERT INTO `sys_res` VALUES ('45', '设置岗位', 'user/toPostUpdate|user/postUpdatePostTreeList|user/doPostUpdate', '39', '_1_2_26_39_45_', '1', '2017-08-02 09:46:26', '6', '2', '8192', '', '1');
INSERT INTO `sys_res` VALUES ('46', '初始密码', 'user/initPwd', '39', '_1_2_26_39_46_', '1', '2017-08-02 09:46:41', '7', '2', '16384', '', '1');
INSERT INTO `sys_res` VALUES ('47', '考试管理', 'ksgl', '1', '_1_47_', '1', '2017-08-02 09:50:01', '3', '2', '32768', '', '1');
INSERT INTO `sys_res` VALUES ('48', '试题管理', 'stgl', '47', '_1_47_48_', '1', '2017-08-02 09:50:28', '1', '2', '65536', '', '1');
INSERT INTO `sys_res` VALUES ('49', '试题分类', 'questionType/toList', '48', '_1_47_48_49_', '1', '2017-08-02 09:52:59', '1', '2', '131072', '', '1');
INSERT INTO `sys_res` VALUES ('50', '列表', 'questionType/treeList|questionType/list', '49', '_1_47_48_49_50_', '1', '2017-08-02 09:53:16', '1', '2', '262144', '', '1');
INSERT INTO `sys_res` VALUES ('51', '添加', 'questionType/toAdd|questionType/doAdd', '49', '_1_47_48_49_51_', '1', '2017-08-02 09:53:26', '2', '2', '524288', '', '1');
INSERT INTO `sys_res` VALUES ('52', '修改', 'questionType/toEdit|questionType/doEdit', '49', '_1_47_48_49_52_', '1', '2017-08-02 09:53:34', '3', '2', '1048576', '', '1');
INSERT INTO `sys_res` VALUES ('53', '删除', 'questionType/doDel', '49', '_1_47_48_49_53_', '1', '2017-08-02 09:53:43', '4', '2', '2097152', '', '1');
INSERT INTO `sys_res` VALUES ('54', '移动', 'questionType/toMove|questionType/moveQuestionTypeTreeList|questionType/doMove', '49', '_1_47_48_49_54_', '1', '2017-08-02 09:55:27', '5', '2', '4194304', '', '1');
INSERT INTO `sys_res` VALUES ('55', '试题管理', 'question/toList', '48', '_1_47_48_55_', '1', '2017-08-02 09:57:51', '3', '2', '8388608', '', '1');
INSERT INTO `sys_res` VALUES ('56', '列表', 'question/questionTypeTreeList|question/list', '55', '_1_47_48_55_56_', '1', '2017-08-02 09:58:02', '1', '2', '16777216', '', '1');
INSERT INTO `sys_res` VALUES ('57', '添加', 'question/toAdd|question/doAdd', '55', '_1_47_48_55_57_', '1', '2017-08-02 09:58:13', '2', '2', '33554432', '', '1');
INSERT INTO `sys_res` VALUES ('58', '修改', 'question/toEdit|question/doEdit', '55', '_1_47_48_55_58_', '1', '2017-08-02 09:58:21', '3', '2', '67108864', '', '1');
INSERT INTO `sys_res` VALUES ('59', '删除', 'question/doDel', '55', '_1_47_48_55_59_', '1', '2017-08-02 09:58:29', '4', '2', '134217728', '', '1');
INSERT INTO `sys_res` VALUES ('60', '设置试题分类', 'question/toQuestionTypeUpdate|question/questionTypeUpdateQuestionTypeTreeList|question/doQuestionTypeUpdate', '55', '_1_47_48_55_60_', '1', '2017-08-02 09:59:58', '5', '2', '268435456', '', '1');
INSERT INTO `sys_res` VALUES ('61', '试卷管理', 'sjgl', '47', '_1_47_61_', '1', '2017-08-02 10:00:35', '3', '2', '536870912', '', '1');
INSERT INTO `sys_res` VALUES ('62', '试卷分类', 'paperType/toList', '61', '_1_47_61_62_', '1', '2017-08-02 10:03:05', '1', '2', '1073741824', '', '1');
INSERT INTO `sys_res` VALUES ('63', '列表', 'paperType/treeList|paperType/list', '62', '_1_47_61_62_63_', '1', '2017-08-02 10:03:18', '1', '3', '1', '', '1');
INSERT INTO `sys_res` VALUES ('64', '添加', 'paperType/toAdd|paperType/doAdd', '62', '_1_47_61_62_64_', '1', '2017-08-02 10:03:31', '2', '3', '2', '', '1');
INSERT INTO `sys_res` VALUES ('65', '修改', 'paperType/toEdit|paperType/doEdit', '62', '_1_47_61_62_65_', '1', '2017-08-02 10:03:39', '3', '3', '4', '', '1');
INSERT INTO `sys_res` VALUES ('66', '删除', 'paperType/doDel', '62', '_1_47_61_62_66_', '1', '2017-08-02 10:03:48', '4', '3', '8', '', '1');
INSERT INTO `sys_res` VALUES ('67', '移动', 'paperType/toMove|paperType/movePaperTypeTreeList|paperType/doMove', '62', '_1_47_61_62_67_', '1', '2017-08-02 10:04:01', '5', '3', '16', '', '1');
INSERT INTO `sys_res` VALUES ('68', '试卷管理', 'paper/toList', '61', '_1_47_61_68_', '1', '2017-08-02 10:13:12', '3', '3', '32', '', '1');
INSERT INTO `sys_res` VALUES ('69', '列表', 'paper/paperTypeTreeList|paper/list', '68', '_1_47_61_68_69_', '1', '2017-08-02 19:34:25', '1', '3', '64', '', '1');
INSERT INTO `sys_res` VALUES ('70', '添加', 'paper/toAdd|paper/doAdd', '68', '_1_47_61_68_70_', '1', '2017-08-02 10:14:56', '2', '3', '128', '', '1');
INSERT INTO `sys_res` VALUES ('71', '修改', 'paper/toEdit|paper/doEdit', '68', '_1_47_61_68_71_', '1', '2017-08-02 10:15:04', '3', '3', '256', '', '1');
INSERT INTO `sys_res` VALUES ('72', '删除', 'paper/doDel', '68', '_1_47_61_68_72_', '1', '2017-08-02 10:15:13', '4', '3', '512', '', '1');
INSERT INTO `sys_res` VALUES ('73', '设置试卷分类', 'paper/toPaperTypeUpdate|paper/paperTypeUpdatePaperTypeTreeList|paper/doPaperTypeUpdate', '68', '_1_47_61_68_73_', '1', '2017-08-02 10:17:09', '5', '3', '1024', '', '1');
INSERT INTO `sys_res` VALUES ('74', '配置试卷', 'paper/toPaperCfg|paper/paperCfgPaperTreeList|paper/toPaperCfgAdd|paper/doPaperCfgAdd|paper/toPaperCfgEdit|paper/doPaperCfgEdit|paper/toPaperCfgList|paper/paperCfgListQuestionTypeTreeList|paper/paperCfgList|paper/doPaperCfgListAdd|paper/doPaperCfgDel|paper/toPaperCfgSort|paper/doPaperCfgSort|paper/toPaperCfgPreview|paper/doPaperCfgScoreUpdate', '68', '_1_47_61_68_74_', '1', '2017-08-02 10:17:22', '6', '3', '2048', '', '1');
INSERT INTO `sys_res` VALUES ('75', '考试管理', 'ksgl2', '47', '_1_47_75_', '1', '2017-08-02 10:22:06', '5', '3', '4096', '', '1');
INSERT INTO `sys_res` VALUES ('76', '考试分类', 'examType/toList', '75', '_1_47_75_76_', '2', '2017-08-02 16:55:56', '1', '3', '8192', '', '1');
INSERT INTO `sys_res` VALUES ('77', '列表', 'examType/treeList|examType/list', '76', '_1_47_75_76_77_', '1', '2017-08-02 10:23:12', '1', '3', '16384', '', '1');
INSERT INTO `sys_res` VALUES ('78', '添加', 'examType/toAdd|examType/doAdd', '76', '_1_47_75_76_78_', '1', '2017-08-02 10:23:22', '2', '3', '32768', '', '1');
INSERT INTO `sys_res` VALUES ('79', '修改', 'examType/toEdit|examType/doEdit', '76', '_1_47_75_76_79_', '1', '2017-08-02 10:23:30', '3', '3', '65536', '', '1');
INSERT INTO `sys_res` VALUES ('80', '删除', 'examType/doDel', '76', '_1_47_75_76_80_', '1', '2017-08-02 10:23:39', '4', '3', '131072', '', '1');
INSERT INTO `sys_res` VALUES ('81', '移动', 'examType/toMove|examType/moveExamTypeTreeList|examType/doMove', '76', '_1_47_75_76_81_', '1', '2017-08-02 10:23:54', '5', '3', '262144', '', '1');
INSERT INTO `sys_res` VALUES ('82', '考试管理', 'exam/toList', '75', '_1_47_75_82_', '1', '2017-08-02 10:26:17', '3', '3', '524288', '', '1');
INSERT INTO `sys_res` VALUES ('83', '列表', 'exam/examTypeTreeList|exam/list', '82', '_1_47_75_82_83_', '1', '2017-08-02 10:26:31', '1', '3', '1048576', '', '1');
INSERT INTO `sys_res` VALUES ('84', '添加', 'exam/toAdd|exam/toPaperAddList|exam/paperAddListTypeTreeList|exam/paperAddList|exam/doAdd', '82', '_1_47_75_82_84_', '1', '2017-08-02 10:26:41', '2', '3', '2097152', '', '1');
INSERT INTO `sys_res` VALUES ('85', '修改', 'exam/toEdit|exam/toPaperAddList|exam/paperAddListTypeTreeList|exam/paperAddList|exam/doEdit', '82', '_1_47_75_82_85_', '1', '2017-08-02 10:27:36', '3', '3', '4194304', '', '1');
INSERT INTO `sys_res` VALUES ('86', '删除', 'exam/doDel', '82', '_1_47_75_82_86_', '1', '2017-08-02 10:26:57', '4', '3', '8388608', '', '1');
INSERT INTO `sys_res` VALUES ('87', '考试用户', 'exam/toExamUserList|exam/examUserOrgTreeList|exam/examUserList|exam/toExamUserAddList|exam/examUserAddOrgTreeList|exam/examUserAddList|exam/doExamUserAdd|exam/doExamUserDel', '82', '_1_47_75_82_87_', '1', '2017-08-02 10:29:18', '5', '3', '16777216', '', '1');
INSERT INTO `sys_res` VALUES ('88', '判卷用户', 'exam/toMarkUserList|exam/MarkUserOrgTreeList|exam/MarkUserList|exam/toMarkUserAddList|exam/MarkUserAddOrgTreeList|exam/MarkUserAddList|exam/doMarkUserAdd|exam/doMarkUserDel', '82', '_1_47_75_82_88_', '1', '2017-08-14 13:49:12', '6', '3', '33554432', '', '1');
INSERT INTO `sys_res` VALUES ('89', '前台首页', 'qtsy', '1', '_1_89_', '1', '2017-08-16 08:51:40', '1', '3', '67108864', '', '2');
INSERT INTO `sys_res` VALUES ('90', '前台首页', 'qtsy2', '89', '_1_89_90_', '1', '2017-08-22 23:00:14', '1', '3', '134217728', '', '2');
INSERT INTO `sys_res` VALUES ('95', '我的考试', 'home/myExam/toList', '90', '_1_89_90_95_', '1', '2017-08-23 10:13:33', '1', '3', '268435456', '', '2');
INSERT INTO `sys_res` VALUES ('96', '考试列表', 'home/myExam/list|home/myExam/toPaper|home/myExam/sysTime|home/myExam/updateAnswer|home/myExam/doPaper|home/myExam/toPaperView', '95', '_1_89_90_95_96_', '1', '2017-08-25 18:37:58', '1', '3', '536870912', '', '2');
INSERT INTO `sys_res` VALUES ('97', '判卷', 'home/mark/toList', '90', '_1_89_90_97_', '1', '2017-08-23 14:57:16', '3', '3', '1073741824', '', '2');
INSERT INTO `sys_res` VALUES ('98', '判卷列表', 'home/mark/list|home/mark/toMark|home/mark/updateScore|home/mark/doMark|home/mark/toMarkView', '97', '_1_89_90_97_98_', '1', '2017-08-28 17:01:37', '1', '4', '1', '', '2');
INSERT INTO `sys_res` VALUES ('99', '报表管理', 'bbgl', '1', '_1_99_', '1', '2017-08-29 14:19:59', '5', '4', '2', '', '1');
INSERT INTO `sys_res` VALUES ('100', '报表管理', 'bbgl2', '99', '_1_99_100_', '1', '2017-08-29 14:19:32', '1', '4', '4', '', '1');
INSERT INTO `sys_res` VALUES ('101', '成绩查询', 'gradeReport/toList', '100', '_1_99_100_101_', '1', '2017-08-29 15:34:19', '1', '4', '8', '', '1');
INSERT INTO `sys_res` VALUES ('102', '列表', 'gradeReport/list', '101', '_1_99_100_101_102_', '1', '2017-08-29 15:34:04', '1', '4', '16', '', '1');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(32) DEFAULT NULL COMMENT '用户名',
  `PWD` varchar(32) DEFAULT NULL COMMENT '密码',
  `LOGIN_NAME` varchar(32) DEFAULT NULL COMMENT '登陆名称',
  `LAST_LOGIN_TIME` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `UPDATE_USER_ID` int(11) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `ORG_ID` int(11) DEFAULT NULL COMMENT '组织机构',
  `STATE` int(11) DEFAULT NULL COMMENT '0：删除；1：正常',
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_3` (`ORG_ID`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`ORG_ID`) REFERENCES `sys_org` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '系统管理员', '5HK/W3IuS8X734A5JMigPg==', 'sysadmin', '2017-09-06 11:03:17', '1', '2017-08-01 22:33:19', '1', '1');

-- ----------------------------
-- Table structure for `ex_exam`
-- ----------------------------
DROP TABLE IF EXISTS `ex_exam`;
CREATE TABLE `ex_exam` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(32) DEFAULT NULL COMMENT '名称',
  `PASS_SCORE` decimal(5,2) DEFAULT NULL COMMENT '及格分数',
  `DESCRIPTION` varchar(512) DEFAULT NULL COMMENT '描述',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `UPDATE_USER_ID` int(11) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `STATE` int(11) DEFAULT NULL COMMENT '0：删除；1：启用；2：禁用',
  `PAPER_ID` int(11) DEFAULT NULL COMMENT '试卷ID',
  `EXAM_TYPE_ID` int(11) DEFAULT NULL COMMENT '考试分类',
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_19` (`PAPER_ID`),
  KEY `FK_Reference_22` (`EXAM_TYPE_ID`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`PAPER_ID`) REFERENCES `ex_paper` (`id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`EXAM_TYPE_ID`) REFERENCES `ex_exam_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_exam
-- ----------------------------

-- ----------------------------
-- Table structure for `ex_exam_type`
-- ----------------------------
DROP TABLE IF EXISTS `ex_exam_type`;
CREATE TABLE `ex_exam_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(32) DEFAULT NULL COMMENT '名称',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '父ID',
  `PARENT_SUB` varchar(512) DEFAULT NULL COMMENT '父子关系（格式：_父ID_子ID_子子ID_... ...）',
  `UPDATE_USER_ID` int(11) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `STATE` int(11) DEFAULT NULL COMMENT '0：删除；1：正常',
  `NO` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_exam_type
-- ----------------------------
INSERT INTO `ex_exam_type` VALUES ('1', '考试分类', '0', '_1_', '1', '2017-08-01 22:31:43', '1', '1');

-- ----------------------------
-- Table structure for `ex_exam_user`
-- ----------------------------
DROP TABLE IF EXISTS `ex_exam_user`;
CREATE TABLE `ex_exam_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `EXAM_ID` int(11) DEFAULT NULL COMMENT '考试ID',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  `UPDATE_USER_ID` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_MARK_USER_ID` int(11) DEFAULT NULL,
  `UPDATE_MARK_TIME` datetime DEFAULT NULL,
  `TOTAL_SCORE` decimal(5,2) DEFAULT NULL COMMENT '总分',
  `STATE` int(11) DEFAULT NULL COMMENT '1：未考试；2：考试中；3：已交卷；4：强制交卷；5：判卷中；6：未通过；7：已通过',
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_23` (`EXAM_ID`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`EXAM_ID`) REFERENCES `ex_exam` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_exam_user
-- ----------------------------

-- ----------------------------
-- Table structure for `ex_exam_user_question`
-- ----------------------------
DROP TABLE IF EXISTS `ex_exam_user_question`;
CREATE TABLE `ex_exam_user_question` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `EXAM_USER_ID` int(11) DEFAULT NULL COMMENT '考试用户ID',
  `EXAM_ID` int(11) DEFAULT NULL COMMENT '考试ID',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  `QUESTION_ID` int(11) DEFAULT NULL COMMENT '试题ID',
  `UPDATE_USER_ID` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_MARK_USER_ID` int(11) DEFAULT NULL,
  `UPDATE_MARK_TIME` datetime DEFAULT NULL,
  `ANSWER` text COMMENT '答案',
  `SCORE` decimal(5,2) DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_24` (`EXAM_USER_ID`),
  KEY `FK_Reference_25` (`QUESTION_ID`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`EXAM_USER_ID`) REFERENCES `ex_exam_user` (`ID`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`QUESTION_ID`) REFERENCES `ex_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_exam_user_question
-- ----------------------------

-- ----------------------------
-- Table structure for `ex_mark_user`
-- ----------------------------
DROP TABLE IF EXISTS `ex_mark_user`;
CREATE TABLE `ex_mark_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `EXAM_ID` int(11) DEFAULT NULL COMMENT '考试ID',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_37` (`EXAM_ID`),
  CONSTRAINT `FK_Reference_37` FOREIGN KEY (`EXAM_ID`) REFERENCES `ex_exam` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_mark_user
-- ----------------------------

-- ----------------------------
-- Table structure for `ex_paper`
-- ----------------------------
DROP TABLE IF EXISTS `ex_paper`;
CREATE TABLE `ex_paper` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL COMMENT '名称',
  `DESCRIPTION` varchar(512) DEFAULT NULL COMMENT '描述',
  `TOTLE_SCORE` decimal(5,2) DEFAULT NULL COMMENT '总分数',
  `STATE` int(11) DEFAULT NULL COMMENT '0：删除；1：启用；2：禁用',
  `UPDATE_USER_ID` int(11) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `PAPER_TYPE_ID` int(11) DEFAULT NULL COMMENT '试卷分类',
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_16` (`PAPER_TYPE_ID`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`PAPER_TYPE_ID`) REFERENCES `ex_paper_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_paper
-- ----------------------------

-- ----------------------------
-- Table structure for `ex_paper_question`
-- ----------------------------
DROP TABLE IF EXISTS `ex_paper_question`;
CREATE TABLE `ex_paper_question` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(32) DEFAULT NULL COMMENT '章节名称',
  `DESCRIPTION` varchar(512) DEFAULT NULL COMMENT '章节描述',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '父ID',
  `PARENT_SUB` varchar(512) DEFAULT NULL COMMENT '父子关系（格式：_父ID_子ID_子子ID_... ...）',
  `UPDATE_USER_ID` int(11) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `PAPER_ID` int(11) DEFAULT NULL COMMENT '试卷ID',
  `QUESTION_ID` int(11) DEFAULT NULL COMMENT '试题ID',
  `TYPE` int(11) DEFAULT NULL COMMENT '1：章节；2：试题',
  `SCORE` decimal(5,2) DEFAULT NULL COMMENT '分数',
  `NO` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_17` (`QUESTION_ID`),
  KEY `FK_Reference_18` (`PAPER_ID`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`QUESTION_ID`) REFERENCES `ex_question` (`id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`PAPER_ID`) REFERENCES `ex_paper` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_paper_question
-- ----------------------------

-- ----------------------------
-- Table structure for `ex_paper_type`
-- ----------------------------
DROP TABLE IF EXISTS `ex_paper_type`;
CREATE TABLE `ex_paper_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(32) DEFAULT NULL COMMENT '名称',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '父ID',
  `PARENT_SUB` varchar(512) DEFAULT NULL COMMENT '父子关系（格式：_父ID_子ID_子子ID_... ...）',
  `UPDATE_USER_ID` int(11) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `STATE` int(11) DEFAULT NULL COMMENT '0：删除；1：正常',
  `NO` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_paper_type
-- ----------------------------
INSERT INTO `ex_paper_type` VALUES ('1', '试卷分类', '0', '_1_', '1', '2017-08-01 22:31:43', '1', '1');

-- ----------------------------
-- Table structure for `ex_question`
-- ----------------------------
DROP TABLE IF EXISTS `ex_question`;
CREATE TABLE `ex_question` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` int(11) DEFAULT NULL COMMENT '1：单选；2：多选；3：填空；4：判断；5：问答',
  `DIFFICULTY` int(11) DEFAULT NULL COMMENT '1：极易；2：简单；3：适中；4：困难；5：极难',
  `TITLE` text COMMENT '题干',
  `OPTION_A` text COMMENT '选项A',
  `OPTION_B` text COMMENT '选项B',
  `OPTION_C` text COMMENT '选项C',
  `OPTION_D` text COMMENT '选项D',
  `OPTION_E` text COMMENT '选项E',
  `OPTION_F` text COMMENT '选项F',
  `OPTION_G` text COMMENT '选项G',
  `ANSWER` text COMMENT '答案',
  `ANALYSIS` text COMMENT '解析',
  `STATE` int(11) DEFAULT NULL COMMENT '0：删除；1：启用；2：禁用',
  `UPDATE_USER_ID` int(11) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `QUESTION_TYPE_ID` int(11) DEFAULT NULL COMMENT '试题分类',
  `NO` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_15` (`QUESTION_TYPE_ID`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`QUESTION_TYPE_ID`) REFERENCES `ex_question_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_question
-- ----------------------------

-- ----------------------------
-- Table structure for `ex_question_type`
-- ----------------------------
DROP TABLE IF EXISTS `ex_question_type`;
CREATE TABLE `ex_question_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(32) DEFAULT NULL COMMENT '名称',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '父ID',
  `PARENT_SUB` varchar(512) DEFAULT NULL COMMENT '父子关系（格式：_父ID_子ID_子子ID_... ...）',
  `UPDATE_USER_ID` int(11) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `STATE` int(11) DEFAULT NULL COMMENT '0：删除；1：正常',
  `NO` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ex_question_type
-- ----------------------------
INSERT INTO `ex_question_type` VALUES ('1', '试题分类', '0', '_1_', '1', '2017-08-01 22:31:43', '1', '1');