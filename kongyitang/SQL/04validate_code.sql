/*
Navicat MySQL Data Transfer

Source Server         : drinkmarket
Source Server Version : 50161
Source Host           : rdsayenemanerj2.mysql.rds.aliyuncs.com:3306
Source Database       : db4sm1ji23kix8uy

Target Server Type    : MYSQL
Target Server Version : 50161
File Encoding         : 65001

Date: 2014-05-29 03:23:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `04validate_code`
-- ----------------------------
DROP TABLE IF EXISTS `04validate_code`;
CREATE TABLE `04validate_code` (
  `id` int(6) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `code` varchar(4) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deadline` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 04validate_code
-- ----------------------------
INSERT INTO `04validate_code` VALUES ('2', '13701280947', '0356', '2014-05-29 02:54:21', '2014-05-29 03:09:21');
INSERT INTO `04validate_code` VALUES ('3', '15210983731', '6481', '2014-05-29 03:18:58', '2014-05-29 03:33:58');
