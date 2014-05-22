/*
Navicat MySQL Data Transfer

Source Server         : drinkmarket
Source Server Version : 50161
Source Host           : rdsayenemanerj2.mysql.rds.aliyuncs.com:3306
Source Database       : db4sm1ji23kix8uy

Target Server Type    : MYSQL
Target Server Version : 50161
File Encoding         : 65001

Date: 2014-05-22 21:55:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `04answer`
-- ----------------------------
DROP TABLE IF EXISTS `04answer`;
CREATE TABLE `04answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(1000) NOT NULL,
  `doctor_id` int(11) NOT NULL COMMENT '回复的医生',
  `question_id` int(11) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 04answer
-- ----------------------------
INSERT INTO `04answer` VALUES ('1', '请前往医院医治', '2', '2', '2014-05-13 10:06:33', '2014-05-13 10:06:33');
INSERT INTO `04answer` VALUES ('2', '			脚踏实地，劳动所得！', '2', '1', '2014-05-13 10:17:07', '2014-05-13 10:17:07');
INSERT INTO `04answer` VALUES ('3', '			抢室友的', '2', '1', '2014-05-13 13:02:41', '2014-05-13 13:02:41');
INSERT INTO `04answer` VALUES ('4', '啊啊啊', '2', '2', '2014-05-13 13:05:03', '2014-05-13 13:05:03');
INSERT INTO `04answer` VALUES ('5', '			打算打算的', '2', '3', '2014-05-13 13:08:50', '2014-05-13 13:08:50');
INSERT INTO `04answer` VALUES ('6', '			按时大大', '2', '4', '2014-05-13 13:16:58', '2014-05-13 13:16:58');
INSERT INTO `04answer` VALUES ('7', '			呵呵呵呵呵呵', '2', '7', '2014-05-13 13:23:11', '2014-05-13 13:23:11');
INSERT INTO `04answer` VALUES ('8', '不是医生也能回答？', '2', '1', '2014-05-15 08:45:53', '2014-05-15 08:45:53');
INSERT INTO `04answer` VALUES ('9', '			呵呵额', '2', '1', '2014-05-16 19:40:34', '2014-05-16 19:40:34');
INSERT INTO `04answer` VALUES ('10', '			挺着', '2', '1', '2014-05-18 11:14:14', '2014-05-18 11:14:14');
INSERT INTO `04answer` VALUES ('11', '			同志们，辛苦了！！', '1', '21', '2014-05-21 04:36:13', '2014-05-21 04:36:13');
INSERT INTO `04answer` VALUES ('12', '			呵呵\r\n', '3', '1', '2014-05-21 10:08:28', '2014-05-21 10:08:28');
INSERT INTO `04answer` VALUES ('13', '			继续努力^O^！', '1', '20', '2014-05-21 14:55:54', '2014-05-21 14:55:54');
INSERT INTO `04answer` VALUES ('14', '			找个美女搭配一下', '5', '9', '2014-05-21 21:26:42', '2014-05-21 21:26:42');
INSERT INTO `04answer` VALUES ('15', '			开源节流为根本之道！！！！', '1', '1', '2014-05-22 01:32:42', '2014-05-22 01:32:42');
INSERT INTO `04answer` VALUES ('16', '			拉出去枪毙五分钟', '1', '2', '2014-05-22 03:53:19', '2014-05-22 03:53:19');
INSERT INTO `04answer` VALUES ('17', '			哈哈哈哈呵呵呵呵', '5', '26', '2014-05-22 13:25:41', '2014-05-22 13:25:41');

-- ----------------------------
-- Table structure for `04department`
-- ----------------------------
DROP TABLE IF EXISTS `04department`;
CREATE TABLE `04department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='科室信息表';

-- ----------------------------
-- Records of 04department
-- ----------------------------
INSERT INTO `04department` VALUES ('1', '中医内科', '1');
INSERT INTO `04department` VALUES ('2', '中医外科', '1');
INSERT INTO `04department` VALUES ('3', '妇科', '1');
INSERT INTO `04department` VALUES ('4', '儿科', '1');
INSERT INTO `04department` VALUES ('5', '针推科', '1');

-- ----------------------------
-- Table structure for `04ipmapuser`
-- ----------------------------
DROP TABLE IF EXISTS `04ipmapuser`;
CREATE TABLE `04ipmapuser` (
  `id` int(6) NOT NULL,
  `userID` int(6) NOT NULL,
  `role` int(1) NOT NULL,
  `address` varchar(60) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deadline` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 04ipmapuser
-- ----------------------------
INSERT INTO `04ipmapuser` VALUES ('1', '3', '0', '192.168.1.361.148.244.30', '2014-05-21 04:14:06', '2014-05-22 17:09:09');
INSERT INTO `04ipmapuser` VALUES ('2', '1', '1', 'fe80:0:0:0:910:49b1:51b1:b467%110:0:0:0:0:0:0:1', '2014-05-21 04:21:58', '2014-05-22 09:52:17');
INSERT INTO `04ipmapuser` VALUES ('3', '4', '0', '192.168.1.3210.76.108.133', '2014-05-21 09:14:12', '2014-05-22 14:28:22');
INSERT INTO `04ipmapuser` VALUES ('4', '3', '1', '192.168.1.3113.44.185.221', '2014-05-21 10:08:00', '2014-05-21 10:23:00');
INSERT INTO `04ipmapuser` VALUES ('5', '2', '0', '192.168.1.3123.126.156.194', '2014-05-21 21:20:45', '2014-05-22 14:50:30');
INSERT INTO `04ipmapuser` VALUES ('6', '5', '0', '192.168.1.3114.242.250.51', '2014-05-21 21:24:30', '2014-05-21 21:39:30');
INSERT INTO `04ipmapuser` VALUES ('7', '5', '1', '192.168.1.3210.76.108.133', '2014-05-21 21:25:55', '2014-05-22 13:40:05');
INSERT INTO `04ipmapuser` VALUES ('8', '2', '1', '192.168.1.3124.207.188.66', '2014-05-21 21:33:14', '2014-05-21 21:48:14');
INSERT INTO `04ipmapuser` VALUES ('9', '6', '0', 'fe80:0:0:0:8528:1816:fe60:77f1%11127.0.0.1', '2014-05-22 02:59:22', '2014-05-22 03:14:22');
INSERT INTO `04ipmapuser` VALUES ('10', '6', '1', '192.168.1.3202.108.130.177', '2014-05-22 09:56:43', '2014-05-22 10:11:43');
INSERT INTO `04ipmapuser` VALUES ('11', '6', '0', '192.168.1.3202.108.130.177', '2014-05-22 10:08:47', '2014-05-22 10:23:47');
INSERT INTO `04ipmapuser` VALUES ('12', '8', '0', 'fe80:0:0:0:c82a:b863:46a5:8f4f%11127.0.0.1', '2014-05-22 10:09:24', '2014-05-22 21:16:54');
INSERT INTO `04ipmapuser` VALUES ('13', '9', '0', '192.168.1.3210.76.108.133', '2014-05-22 12:57:30', '2014-05-22 13:41:05');
INSERT INTO `04ipmapuser` VALUES ('14', '10', '0', 'fe80:0:0:0:910:49b1:51b1:b467%110:0:0:0:0:0:0:1', '2014-05-22 13:45:49', '2014-05-22 14:00:49');

-- ----------------------------
-- Table structure for `04outpatient_info`
-- ----------------------------
DROP TABLE IF EXISTS `04outpatient_info`;
CREATE TABLE `04outpatient_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL COMMENT '可以出诊的时间，据此可以计算出周几',
  `time` varchar(4) NOT NULL COMMENT '上午／下午',
  `type` varchar(20) NOT NULL COMMENT '专家门诊／普通门诊',
  `amount` int(3) NOT NULL COMMENT '可以被预约的数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='门诊信息表（各医生可以出门诊的情况）';

-- ----------------------------
-- Records of 04outpatient_info
-- ----------------------------
INSERT INTO `04outpatient_info` VALUES ('1', '2014-06-09', '上午', '普通门诊', '13');
INSERT INTO `04outpatient_info` VALUES ('2', '2014-06-09', '下午', '普通门诊', '5');
INSERT INTO `04outpatient_info` VALUES ('3', '2014-06-10', '上午', '普通门诊', '5');
INSERT INTO `04outpatient_info` VALUES ('4', '2014-06-10', '下午', '普通门诊', '5');
INSERT INTO `04outpatient_info` VALUES ('5', '2014-06-11', '上午', '普通门诊', '50');
INSERT INTO `04outpatient_info` VALUES ('6', '2014-06-11', '下午', '普通门诊', '5');

-- ----------------------------
-- Table structure for `04question`
-- ----------------------------
DROP TABLE IF EXISTS `04question`;
CREATE TABLE `04question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL COMMENT '用户ID，提问者ID',
  `content` varchar(4000) NOT NULL COMMENT '病情',
  `picture_path` varchar(200) NOT NULL COMMENT '描述病情的图片',
  `department` int(11) NOT NULL COMMENT '部门，科室',
  `gender` int(1) NOT NULL,
  `age` int(3) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `answered_flag` tinyint(1) NOT NULL COMMENT '问题是否被回复',
  `createDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='提问';

-- ----------------------------
-- Records of 04question
-- ----------------------------
INSERT INTO `04question` VALUES ('1', '2', '挣的钱不够花怎么办？', 'http://www.baidu.com', '2', '1', '20', '1521098333', '1', '2014-05-13 07:10:26', '2014-05-22 01:32:43');
INSERT INTO `04question` VALUES ('2', '2', '人穷怎么破。。。', 'http://www.baidu.com', '2', '1', '24', '15210983333', '1', '2014-05-13 07:39:32', '2014-05-22 03:53:19');
INSERT INTO `04question` VALUES ('3', '2', '人穷怎么破。。。', 'http://www.baidu.com', '2', '1', '24', '15210983333', '1', '2014-05-13 07:40:36', '2014-05-13 13:08:51');
INSERT INTO `04question` VALUES ('4', '2', '防火防盗', 'http://www.baidu.com', '4', '1', '222', '15210983333', '1', '2014-05-13 08:12:45', '2014-05-13 13:16:58');
INSERT INTO `04question` VALUES ('5', '2', '	发大水的', 'http://www.baidu.com', '2', '1', '43', '15210981111', '0', '2014-05-13 10:18:57', '2014-05-13 10:18:57');
INSERT INTO `04question` VALUES ('6', '2', '呵呵呵', 'http://www.baidu.com', '1', '1', '25', '18619714771', '0', '2014-05-13 12:35:56', '2014-05-13 12:35:56');
INSERT INTO `04question` VALUES ('7', '2', '呵呵呵', 'http://www.baidu.com', '1', '1', '25', '18619714771', '1', '2014-05-13 12:35:56', '2014-05-13 13:23:11');
INSERT INTO `04question` VALUES ('8', '2', '	长得太帅', 'http://www.baidu.com', '2', '1', '10', '13716843806', '0', '2014-05-13 14:13:52', '2014-05-13 14:13:52');
INSERT INTO `04question` VALUES ('9', '2', '	长得太帅怎么办？', 'http://www.baidu.com', '4', '1', '10', '13716843806', '1', '2014-05-13 14:14:36', '2014-05-21 21:26:42');
INSERT INTO `04question` VALUES ('10', '2', '测试一下', 'http://www.baidu.com', '1', '1', '27', '13800138000', '0', '2014-05-13 19:42:28', '2014-05-13 19:42:28');
INSERT INTO `04question` VALUES ('11', '2', '测试', 'http://www.baidu.com', '1', '1', '55', '13800138000', '0', '2014-05-13 19:55:22', '2014-05-13 19:55:22');
INSERT INTO `04question` VALUES ('12', '2', '	长得太帅怎么办？', 'http://www.baidu.com', '2', '1', '10', '13716843806', '0', '2014-05-13 19:58:20', '2014-05-13 19:58:20');
INSERT INTO `04question` VALUES ('13', '2', '	长得太帅怎么办？', 'http://www.baidu.com', '2', '1', '10', '13716843806', '0', '2014-05-13 20:55:47', '2014-05-13 20:55:47');
INSERT INTO `04question` VALUES ('14', '2', '	长得太帅怎么办？', 'http://www.baidu.com', '3', '1', '10', '13716843806', '0', '2014-05-14 02:19:42', '2014-05-14 02:19:42');
INSERT INTO `04question` VALUES ('15', '2', '	啊啊啊', 'http://www.baidu.com', '3', '1', '18', '13716843806', '0', '2014-05-15 01:45:40', '2014-05-15 01:45:40');
INSERT INTO `04question` VALUES ('16', '2', '	哈哈哈', 'http://www.baidu.com', '3', '1', '17', '13586558556', '0', '2014-05-15 02:53:38', '2014-05-15 02:53:38');
INSERT INTO `04question` VALUES ('17', '2', '周四大清早又来提问了呀，医生赶紧回答吧！！！', 'http://www.baidu.com', '1', '1', '12', '15210982222', '0', '2014-05-15 11:06:53', '2014-05-15 11:06:53');
INSERT INTO `04question` VALUES ('18', '2', '	哈哈还差', 'http://www.baidu.com', '2', '1', '17', '13716843806', '0', '2014-05-15 21:33:05', '2014-05-15 21:33:05');
INSERT INTO `04question` VALUES ('19', '2', '	红红火火和', 'http://www.baidu.com', '4', '0', '56', '13311445567', '0', '2014-05-16 00:53:48', '2014-05-16 00:53:48');
INSERT INTO `04question` VALUES ('20', '3', '	又是一个不眠之夜，测试患者提问功能！', 'http://www.baidu.com', '2', '1', '34', '15210983731', '1', '2014-05-20 04:27:01', '2014-05-21 14:55:54');
INSERT INTO `04question` VALUES ('21', '3', '	再次测试医生患者区分登陆', 'http://www.baidu.com', '2', '1', '22', '15210983731', '1', '2014-05-21 04:15:53', '2014-05-21 04:36:13');
INSERT INTO `04question` VALUES ('22', '3', '	再次测试医生患者区分登陆', 'http://www.baidu.com', '2', '1', '22', '15210983731', '0', '2014-05-21 04:15:54', '2014-05-21 04:15:54');
INSERT INTO `04question` VALUES ('23', '4', '长得太帅怎么办？', 'http://www.baidu.com', '3', '1', '10', '13716843806', '0', '2014-05-21 09:15:29', '2014-05-21 09:15:29');
INSERT INTO `04question` VALUES ('24', '3', '	恍恍惚惚红红火火', 'http://www.baidu.com', '4', '1', '22', '18610714872', '0', '2014-05-21 10:35:58', '2014-05-21 10:35:58');
INSERT INTO `04question` VALUES ('25', '4', '	长得太酷怎么办？', 'http://www.baidu.com', '5', '1', '18', '13716843806', '0', '2014-05-22 08:55:31', '2014-05-22 08:55:31');
INSERT INTO `04question` VALUES ('26', '9', '死机啦说谁是', 'http://www.baidu.com', '5', '1', '15', '13800138002', '1', '2014-05-22 12:58:20', '2014-05-22 13:25:41');

-- ----------------------------
-- Table structure for `04reservation_normal`
-- ----------------------------
DROP TABLE IF EXISTS `04reservation_normal`;
CREATE TABLE `04reservation_normal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` varchar(20) NOT NULL COMMENT '地点（望京馆／五棵松馆）',
  `department` varchar(20) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `patient_illness_id` int(10) NOT NULL COMMENT '患者预约时填写的病情id',
  `treat_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已看病 0:否',
  `date` datetime NOT NULL,
  `userid` int(11) NOT NULL COMMENT '用户名(手机号)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 04reservation_normal
-- ----------------------------
INSERT INTO `04reservation_normal` VALUES ('1', '望京馆', '中医外科', '100001', '1', '0', '2014-05-09 19:31:24', '0');
INSERT INTO `04reservation_normal` VALUES ('2', '望京馆', '中医内科', '100002', '2', '0', '2014-05-10 16:31:38', '0');
INSERT INTO `04reservation_normal` VALUES ('3', '望京馆', '中医内科', '100001', '3', '0', '2014-05-12 18:49:24', '0');
INSERT INTO `04reservation_normal` VALUES ('4', '望京馆', '中医内科', '100001', '4', '0', '2014-05-12 18:54:10', '0');
INSERT INTO `04reservation_normal` VALUES ('5', '望京馆', '中医内科', '100001', '5', '0', '2014-05-12 19:13:37', '0');
INSERT INTO `04reservation_normal` VALUES ('6', '望京馆', '中医内科', '100001', '6', '0', '2014-05-12 19:16:13', '0');
INSERT INTO `04reservation_normal` VALUES ('7', '望京馆', '中医内科', '100001', '7', '0', '2014-05-13 05:41:06', '0');
INSERT INTO `04reservation_normal` VALUES ('8', '望京馆', '中医内科', '100001', '8', '0', '2014-05-13 13:11:37', '0');
INSERT INTO `04reservation_normal` VALUES ('9', '望京馆', '中医内科', '100001', '9', '0', '2014-05-13 20:12:10', '0');
INSERT INTO `04reservation_normal` VALUES ('10', '望京馆', '中医内科', '100001', '10', '0', '2014-05-13 20:53:32', '0');
INSERT INTO `04reservation_normal` VALUES ('11', '望京馆', '中医内科', '2', '11', '0', '2014-05-16 09:54:25', '0');
INSERT INTO `04reservation_normal` VALUES ('12', '望京馆', '中医内科', '2', '12', '0', '2014-05-16 09:57:37', '0');
INSERT INTO `04reservation_normal` VALUES ('13', '望京馆', '中医内科', '2', '13', '0', '2014-05-16 21:27:19', '0');
INSERT INTO `04reservation_normal` VALUES ('14', '望京馆', '中医外科', '1', '14', '0', '2014-05-18 00:21:22', '0');
INSERT INTO `04reservation_normal` VALUES ('15', '望京馆', '中医内科', '2', '15', '0', '2014-05-20 03:16:26', '0');
INSERT INTO `04reservation_normal` VALUES ('16', '望京馆', '中医外科', '1', '16', '0', '2014-05-20 03:17:55', '0');
INSERT INTO `04reservation_normal` VALUES ('17', '望京馆', '中医外科', '1', '17', '0', '2014-05-20 23:51:00', '0');
INSERT INTO `04reservation_normal` VALUES ('18', '望京馆', '中医内科', '222', '19', '0', '2014-05-22 00:08:12', '3');
INSERT INTO `04reservation_normal` VALUES ('19', '五棵松馆', '中医内科', '222', '20', '0', '2014-05-22 03:00:07', '0');
INSERT INTO `04reservation_normal` VALUES ('20', '三里屯SOHO馆', '中医外科', '0', '21', '0', '2014-05-22 03:43:22', '0');
INSERT INTO `04reservation_normal` VALUES ('21', '三里屯SOHO馆', '中医外科', '0', '22', '0', '2014-05-22 03:50:34', '0');
INSERT INTO `04reservation_normal` VALUES ('22', '三里屯SOHO馆', '中医内科', '222', '23', '0', '2014-05-22 03:51:33', '3');
INSERT INTO `04reservation_normal` VALUES ('23', '望京馆', '中医内科', '2', '15', '0', '2014-05-22 12:21:52', '0');
INSERT INTO `04reservation_normal` VALUES ('24', '望京馆', '中医内科', '2', '16', '0', '2014-05-22 12:22:54', '4');
INSERT INTO `04reservation_normal` VALUES ('25', '望京馆', '中医内科', '2', '17', '0', '2014-05-22 13:05:14', '9');
INSERT INTO `04reservation_normal` VALUES ('26', '展览路馆', '妇科', '6', '18', '0', '2014-05-22 13:07:00', '9');
INSERT INTO `04reservation_normal` VALUES ('27', '望京馆', '中医内科', '2', '19', '0', '2014-05-22 13:14:39', '3');

-- ----------------------------
-- Table structure for `04reservation_patient_illness`
-- ----------------------------
DROP TABLE IF EXISTS `04reservation_patient_illness`;
CREATE TABLE `04reservation_patient_illness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `illness_name` varchar(200) NOT NULL,
  `purpose` varchar(8) NOT NULL COMMENT '诊断／治疗／复诊 可多选  ；分割',
  `detail` varchar(400) NOT NULL,
  `mobile` float NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 04reservation_patient_illness
-- ----------------------------
INSERT INTO `04reservation_patient_illness` VALUES ('1', '1', '复查', '2', '3', '4');
INSERT INTO `04reservation_patient_illness` VALUES ('2', 'aas', '复查', 'e', '1.37013e+10', '李梅');
INSERT INTO `04reservation_patient_illness` VALUES ('3', '111', '复查', '123', '1.53833e+10', '待定');
INSERT INTO `04reservation_patient_illness` VALUES ('4', '20140512', '复查', '123', '1.53833e+10', '待定');
INSERT INTO `04reservation_patient_illness` VALUES ('5', '454544', '诊断 治疗', '5555', '1.53833e+10', '考研动态');
INSERT INTO `04reservation_patient_illness` VALUES ('6', '454544', '诊断 治疗', '5555', '1.53833e+10', '考研动态');
INSERT INTO `04reservation_patient_illness` VALUES ('7', '1920', '诊断', 'rrffdsafdsaf', '1.53833e+10', 'asfasfsa');
INSERT INTO `04reservation_patient_illness` VALUES ('8', '1923', '诊断 治疗', '333', '1.53833e+10', '44234');
INSERT INTO `04reservation_patient_illness` VALUES ('9', '一定要成功', '诊断', '一定要成功', '1.5211e+10', '一定要成功');
INSERT INTO `04reservation_patient_illness` VALUES ('10', '成功了', '诊断', '成功了', '1.5211e+10', '成功了');
INSERT INTO `04reservation_patient_illness` VALUES ('11', '帅癌', '诊断 治疗', '长得太帅', '1.37168e+10', '许宏川');
INSERT INTO `04reservation_patient_illness` VALUES ('12', '帅癌', '诊断 治疗', '长得太帅', '1.37168e+10', '许宏川');
INSERT INTO `04reservation_patient_illness` VALUES ('13', '帅癌', '诊断 治疗', '长得太帅', '1.37168e+10', '许宏川');
INSERT INTO `04reservation_patient_illness` VALUES ('14', '强迫症', '诊断', '强迫症啊强迫症', '1.38001e+10', '乔布斯');
INSERT INTO `04reservation_patient_illness` VALUES ('15', '感冒', '诊断', '感冒', '1.5211e+10', '李明');
INSERT INTO `04reservation_patient_illness` VALUES ('16', '啊', '诊断', '啊', '1.37168e+10', '许宏川');
INSERT INTO `04reservation_patient_illness` VALUES ('17', '啊啊啊', '诊断', '啊啊啊的', '1.38001e+10', '科技');
INSERT INTO `04reservation_patient_illness` VALUES ('18', '呃呃呃', '诊断 治疗', '呃呃呃', '1.38081e+10', '科技');
INSERT INTO `04reservation_patient_illness` VALUES ('19', '55', '诊断 治疗', '55', '1.37013e+10', '44');

-- ----------------------------
-- Table structure for `04reservation_shanggongfang_adjust`
-- ----------------------------
DROP TABLE IF EXISTS `04reservation_shanggongfang_adjust`;
CREATE TABLE `04reservation_shanggongfang_adjust` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` tinyint(1) NOT NULL COMMENT '0：male, 1：female',
  `age` int(3) NOT NULL,
  `mobile` float NOT NULL,
  `adjust_programe` varchar(40) NOT NULL COMMENT '调理项目',
  `book_date` varchar(40) NOT NULL COMMENT '调理项目',
  `adjust_master` varchar(40) NOT NULL COMMENT '调理师',
  `username` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 04reservation_shanggongfang_adjust
-- ----------------------------
INSERT INTO `04reservation_shanggongfang_adjust` VALUES ('1', '健康评估', '高久', '1', '24', '1.53833e+10', '办公室综合症调理', '2014-06-06 星期三 12:00', '孙庭剑', 'test_user', '2014-05-11 09:08:40');
INSERT INTO `04reservation_shanggongfang_adjust` VALUES ('2', '健康评估', '高久', '1', '24', '1.53833e+10', '办公室综合症调理', '2014-06-06 星期三 12:00', '孙庭剑', 'test_user', '2014-05-11 09:08:40');
INSERT INTO `04reservation_shanggongfang_adjust` VALUES ('3', '健康评估', '十分丰富', '0', '67', '1.53833e+10', '理络活颜', '2014-06-06 星期一 10:00', '王毅河', 'test_user', '2014-05-11 09:12:14');
INSERT INTO `04reservation_shanggongfang_adjust` VALUES ('4', '健康调理', 'mall', '0', '33', '1.53833e+10', '', '2014-06-06 星期一 10:00', '', 'test_user', '2014-05-11 09:42:18');
INSERT INTO `04reservation_shanggongfang_adjust` VALUES ('5', '健康调理', '广告歌', '1', '11', '1.53833e+10', '肩颈能量疏通', '2014-06-06 星期一 10:00', '王毅河', 'test_user', '2014-05-11 10:15:31');
INSERT INTO `04reservation_shanggongfang_adjust` VALUES ('6', '健康调理', '广告歌', '1', '11', '1.53833e+10', '肩颈能量疏通', '2014-06-06 星期一 10:00', '王毅河', 'test_user', '2014-05-11 10:15:33');
INSERT INTO `04reservation_shanggongfang_adjust` VALUES ('7', '健康调理', '512', '1', '33', '333', '肩颈能量疏通', '2014-06-06 星期一 10:00', '王毅河', 'test_user', '2014-05-12 19:32:33');
INSERT INTO `04reservation_shanggongfang_adjust` VALUES ('8', '健康调理', '512', '1', '33', '333', '肩颈能量疏通', '2014-06-06 星期一 10:00', '王毅河', 'test_user', '2014-05-12 19:32:33');

-- ----------------------------
-- Table structure for `04reservation_shanggongfang_assess`
-- ----------------------------
DROP TABLE IF EXISTS `04reservation_shanggongfang_assess`;
CREATE TABLE `04reservation_shanggongfang_assess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` tinyint(1) NOT NULL COMMENT '0：male, 1：female',
  `age` int(3) NOT NULL,
  `mobile` float NOT NULL,
  `assess_programe` varchar(40) NOT NULL COMMENT '评估项目',
  `book_date` varchar(40) NOT NULL,
  `assess_master` varchar(40) NOT NULL COMMENT '评估师',
  `username` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100021 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 04reservation_shanggongfang_assess
-- ----------------------------
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100001', '健康评估', '222', '2', '11', '1.37013e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-11 10:07:37');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100002', '健康评估', '222', '2', '11', '1.37013e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-11 10:08:34');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100003', '健康评估', 'aaaaaa', '2', '22', '1.38005e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-11 10:16:40');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100004', '健康评估', '微信', '0', '23', '1.35987e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-11 10:20:38');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100005', '健康评估', '微信', '0', '23', '1.35987e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-11 10:20:38');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100006', '健康评估', '微信2', '2', '12', '1.36987e+07', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-11 10:22:16');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100007', '健康评估', '服务器测试', '0', '22', '1.38005e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-12 19:27:25');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100008', '健康评估', '服务器测试', '0', '22', '1.38005e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-12 19:27:25');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100009', '健康评估', '服务器测试', '0', '53', '2.35323e+08', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-12 19:31:38');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100010', '健康评估', '服务器测试', '0', '53', '2.35323e+08', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-12 19:31:38');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100011', '健康评估', '20140512', '0', '33', '1.38005e+10', '健康评估', '2014-06-06 星期三 12:00', '孙立彬', 'test_user', '2014-05-12 19:35:15');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100012', '健康评估', '20140512', '0', '33', '1.38005e+10', '健康评估', '2014-06-06 星期三 12:00', '孙立彬', 'test_user', '2014-05-12 19:37:07');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100013', '健康评估', '20140512——2', '2', '22', '1.38005e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-12 19:38:00');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100014', '健康评估', '20140512——2', '2', '22', '1.38005e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-12 19:38:02');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100015', '健康评估', '20140512——23', '2', '23', '1.38005e+10', '健康评估', '2014-06-06 星期三 12:00', '王倩', 'test_user', '2014-05-12 19:39:36');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100016', '健康评估', '20140512——23', '2', '23', '1.38005e+10', '健康评估', '2014-06-06 星期三 12:00', '王倩', 'test_user', '2014-05-12 19:39:38');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100017', '健康评估', '22', '0', '22', '1.38005e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-12 19:44:33');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100018', '健康评估', '22', '0', '22', '1.38005e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-12 19:46:54');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100019', '健康评估', '22', '0', '22', '1.38005e+10', '私人医生顾问服务', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-12 19:46:56');
INSERT INTO `04reservation_shanggongfang_assess` VALUES ('100020', '健康评估', 'aaaaaa', '0', '23', '1.38005e+10', '健康咨询', '2014-06-06 星期一 10:00', '李志更', 'test_user', '2014-05-12 19:47:19');

-- ----------------------------
-- Table structure for `04reservation_xuetang`
-- ----------------------------
DROP TABLE IF EXISTS `04reservation_xuetang`;
CREATE TABLE `04reservation_xuetang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xuetang` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` tinyint(1) NOT NULL COMMENT '0：male, 1：female',
  `age` int(3) NOT NULL,
  `mobile` float NOT NULL,
  `job` varchar(40) NOT NULL,
  `company` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 04reservation_xuetang
-- ----------------------------
INSERT INTO `04reservation_xuetang` VALUES ('1', '国医学堂', '白叶', '1', '25', '1.53833e+10', '公关', 'Baidu', '经理', 'test_user', '2014-05-11 08:17:46');
INSERT INTO `04reservation_xuetang` VALUES ('2', '国医学堂', '还是大几的好多好多呵呵呵打电话', '0', '100', '1.37333e+13', '几点到几点解放军', '韭菜鸡蛋解放军发', '回复卡夫卡认可', 'test_user', '2014-05-11 08:19:27');
INSERT INTO `04reservation_xuetang` VALUES ('3', '国医学堂', '考研动态', '0', '33', '1.53833e+10', '律师', 'Tent', 'Manager', 'test_user', '2014-05-11 11:06:19');
INSERT INTO `04reservation_xuetang` VALUES ('4', '国医学堂', '待定', '0', '22', '1.53833e+10', 'WQRWR', 'RQWRQW', 'RQWRQW', 'test_user', '2014-05-12 19:21:00');
INSERT INTO `04reservation_xuetang` VALUES ('5', '国医学堂', '待定2', '0', '22', '1.53833e+10', 'WQRWR', 'RQWRQW', 'RQWRQW', 'test_user', '2014-05-12 19:21:53');
INSERT INTO `04reservation_xuetang` VALUES ('6', '国医学堂', 'null 白', '0', '11', '1.53833e+10', 'WQERWR', 'WQRQ3', '24234', 'test_user', '2014-05-12 19:22:30');
INSERT INTO `04reservation_xuetang` VALUES ('7', '国医学堂', '1908', '0', '23', '1.53833e+10', '12', '飞洒发生', '发生的发生', 'test_user', '2014-05-13 19:08:37');
INSERT INTO `04reservation_xuetang` VALUES ('8', '国医学堂', '嗯嗯', '0', '22', '1.53833e+10', '嗯嗯', '热热我确认', '丰富的撒范德萨发', 'test_user', '2014-05-13 19:12:34');
INSERT INTO `04reservation_xuetang` VALUES ('9', '国医学堂', '1914', '0', '22', '1.53833e+10', 'fsfdsa ', 'fsfa', 'afdsf ', 'test_user', '2014-05-13 19:16:14');
INSERT INTO `04reservation_xuetang` VALUES ('10', '国医学堂', '33', '0', '33', '1.37013e+10', '3', '3', '3', 'test_user', '2014-05-22 10:19:02');
INSERT INTO `04reservation_xuetang` VALUES ('11', '国医学堂', 'aa', '0', '55', '1.37013e+10', '114', '44', '4', 'test_user', '2014-05-22 11:48:27');

-- ----------------------------
-- Table structure for `04user`
-- ----------------------------
DROP TABLE IF EXISTS `04user`;
CREATE TABLE `04user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '姓名',
  `gender` int(1) NOT NULL COMMENT '0：女；1：男',
  `age` int(3) NOT NULL,
  `role` int(1) NOT NULL COMMENT '0:患者 1:医生',
  `mobile` varchar(11) NOT NULL,
  `password` varchar(60) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册日期',
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 04user
-- ----------------------------
INSERT INTO `04user` VALUES ('1', 'zhangsan', '0', '20', '0', '15210983333', '797e3994fc9186645cf9146e11261e40e298a5f72638b048', '2014-05-07 21:43:11', '2014-05-07 21:43:11');
INSERT INTO `04user` VALUES ('2', 'liming', '0', '23', '0', '15210983731', 'd40946426305850e7e757a4bd59369b24b44b7f70d194940', '2014-05-08 06:32:37', '2014-05-08 06:32:37');
INSERT INTO `04user` VALUES ('3', 'patient', '0', '20', '0', '222', '526e3cf1241f410a85988f28e77981864015b9802015de34', '2014-05-20 03:49:54', '2014-05-20 03:49:54');
INSERT INTO `04user` VALUES ('4', '许宏川', '0', '10', '0', '13716843806', 'd24099623957283d52717545d8652071de6a30752ee61072', '2014-05-21 09:14:11', '2014-05-21 09:14:11');
INSERT INTO `04user` VALUES ('5', '姜悦音', '1', '23', '0', '18691159469', '349227d6d04a70655bd1c193b25e18e78d59d0396b78c184', '2014-05-21 21:24:30', '2014-05-21 21:24:30');
INSERT INTO `04user` VALUES ('6', 'zzx', '0', '11', '0', '13701280947', 'b3893bf10f3047004226314830090a79b34d49b314e8da08', '2014-05-22 02:59:20', '2014-05-22 02:59:20');
INSERT INTO `04user` VALUES ('7', 'zzx_p', '0', '11', '0', '13701280947', '24140c08880c30bc64874662b2848194ed6f13830ae4761c', '2014-05-22 10:08:47', '2014-05-22 10:08:47');
INSERT INTO `04user` VALUES ('8', '刘宇', '0', '28', '0', '13426208431', '56cf4a899135092105a8631b967d98327043369f2b25a503', '2014-05-22 10:09:24', '2014-05-22 10:09:24');
INSERT INTO `04user` VALUES ('9', '科技', '0', '15', '0', '13800138002', '632e9777fc73f16e37f4682c92e15087e385586b1b58ce19', '2014-05-22 12:57:30', '2014-05-22 12:57:30');
INSERT INTO `04user` VALUES ('10', 'liming', '1', '34', '0', '15210981237', '83ba4ba92e1bf1cd36b5a01929b109b3b677e9de57d8a142', '2014-05-22 13:45:48', '2014-05-22 13:45:48');

-- ----------------------------
-- Table structure for `04user_doctor`
-- ----------------------------
DROP TABLE IF EXISTS `04user_doctor`;
CREATE TABLE `04user_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(2) NOT NULL,
  `age` int(3) NOT NULL,
  `role` int(1) NOT NULL COMMENT '0:患者 1:医生',
  `mobile` varchar(11) NOT NULL,
  `master` varchar(40) NOT NULL COMMENT '师承，流派',
  `doctor_criteria` varchar(80) NOT NULL COMMENT '医师资格证编号',
  `department` int(11) NOT NULL COMMENT '科室',
  `title` varchar(20) NOT NULL COMMENT '职称',
  `password` varchar(60) NOT NULL,
  `validate_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '患者默认已认证，医生需要认证。 0:未认证；1已认证',
  `belong_outpatient_department` tinyint(1) NOT NULL DEFAULT '1' COMMENT '该医生是否可以出门诊 ； 0：不可出诊，1：可出诊',
  `createDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册日期',
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 04user_doctor
-- ----------------------------
INSERT INTO `04user_doctor` VALUES ('1', 'doctor', '0', '20', '0', '111', '张三丰', '85', '2', '护士', 'b5b44843a688b7af6de59038b5b50be8a51d91180f187342', '1', '1', '2014-05-08 06:21:22', '2014-05-20 03:43:34');
INSERT INTO `04user_doctor` VALUES ('2', 'wangwu', '0', '23', '1', '15210983733', '张三丰', '87', '1', '护士', '459f9309e164a78767c1454079864835db1475a84917eb6d', '1', '1', '2014-05-08 06:34:43', '2014-05-20 03:43:37');
INSERT INTO `04user_doctor` VALUES ('3', '锤子哥', '1', '20', '1', '13716843806', '啊', '123456', '4', '医生', '731d09b19d69f6f94a882f3098b297d9c57526525b625123', '0', '1', '2014-05-21 10:08:00', '2014-05-21 10:08:00');
INSERT INTO `04user_doctor` VALUES ('4', '乔巴', '0', '15', '1', '13800138000', '乔布斯', '123456', '4', '医生', '87715ad8495ca4229c438e8983df14d6184e994941689635', '0', '1', '2014-05-21 21:04:46', '2014-05-21 21:04:46');
INSERT INTO `04user_doctor` VALUES ('5', '乔布斯', '0', '56', '1', '13800138001', '史玉柱', '654321', '5', '医生', '425e3544109fe5500c42a953e4eb85149d0fd1a92c318528', '1', '1', '2014-05-21 21:13:21', '2014-05-21 21:24:58');
INSERT INTO `04user_doctor` VALUES ('6', 'zzx', '0', '11', '1', '13701280948', '11', '11', '3', '11', '82759f04ea2882699752933ba3d89a71c566d7880f67148d', '1', '1', '2014-05-22 09:54:02', '2014-05-22 09:54:51');
INSERT INTO `04user_doctor` VALUES ('7', '文艺', '1', '19', '1', '13800138003', '哦了', '485', '5', '医生', 'd2fe63f94277e5679779b463340d26242b16b57d49124390', '0', '1', '2014-05-22 13:00:14', '2014-05-22 13:00:14');

-- ----------------------------
-- Table structure for `04weixinmapuser`
-- ----------------------------
DROP TABLE IF EXISTS `04weixinmapuser`;
CREATE TABLE `04weixinmapuser` (
  `id` int(6) NOT NULL,
  `weixinID` varchar(60) NOT NULL,
  `userID` int(6) NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0',
  `createDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 04weixinmapuser
-- ----------------------------
INSERT INTO `04weixinmapuser` VALUES ('1', 'oDK3oji70nN1CG77qYR_z_thFUBs', '2', '0', '2014-05-13 10:43:53', '2014-05-13 10:43:53');
INSERT INTO `04weixinmapuser` VALUES ('2', 'gh_f5c1c22104b0', '2', '1', '2014-05-13 10:44:36', '2014-05-13 10:44:36');
