/*
Navicat MySQL Data Transfer

Source Server         : user
Source Server Version : 50623
Source Host           : localhost:3308
Source Database       : mushroom

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2017-03-17 11:23:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `recname` varchar(20) CHARACTER SET utf8 NOT NULL,
  `tel` varchar(15) CHARACTER SET utf8 NOT NULL,
  `adds` varchar(60) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`username`,`recname`,`tel`,`adds`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', '1', '福建-三明');
INSERT INTO `address` VALUES ('1', 'qq', '324356765', '南京工程学院');
INSERT INTO `address` VALUES ('1', 'ww', '987654432', '江苏省南京市弘景大道3602号');
INSERT INTO `address` VALUES ('mushroom', '1', '1', '河北-邢台');
INSERT INTO `address` VALUES ('mushroom', '123', '234', '福建-三明');
INSERT INTO `address` VALUES ('mushroom', 'mush', '123456789', '江苏省南京市弘景大道3601号');
INSERT INTO `address` VALUES ('mushroom', 'mushroom', '135792468', '江苏省南京市弘景大道3603号');
INSERT INTO `address` VALUES ('mushroom', 'room', '987654321', '江苏省南京市弘景大道3602号');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `c_username` varchar(20) NOT NULL DEFAULT '',
  `c_proname` varchar(20) NOT NULL,
  `c_price` int(5) NOT NULL,
  `c_num` int(5) NOT NULL,
  `c_img` varchar(60) NOT NULL,
  PRIMARY KEY (`c_username`,`c_proname`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '安慕希', '64', '1', '../imgs/pros/niunai/nn3/nn3_2.jpg');
INSERT INTO `cart` VALUES ('1', '冰红茶', '6', '3', '../imgs/pros/yinliao/yl1/yl1_1.jpg');
INSERT INTO `cart` VALUES ('1', '长鼻王夹心卷', '18', '1', '../imgs/pros/xiuxian/xx3/xx3_8.jpg');
INSERT INTO `cart` VALUES ('1', '康师傅红烧牛肉面', '17', '2', '../imgs/pros/fangbian/fb3/fb3_3.jpg');
INSERT INTO `cart` VALUES ('1', '咪咪虾条', '1', '4', '../imgs/pros/xiuxian/xx3/xx3_2.jpg');
INSERT INTO `cart` VALUES ('1', '旺旺仙贝', '8', '1', '../imgs/pros/xiuxian/xx3/xx3_3.jpg');
INSERT INTO `cart` VALUES ('1', '原味扁薯条', '9', '3', '../imgs/pros/xiuxian/xx3/xx3_7.jpg');
INSERT INTO `cart` VALUES ('mushroom', '澳牛原味酸奶饮料', '59', '2', '../imgs/pros/niunai/nn3/nn3_3.jpg');
INSERT INTO `cart` VALUES ('mushroom', '北田糙米卷', '9', '2', '../imgs/pros/xiuxian/xx2/xx2_3.jpg');
INSERT INTO `cart` VALUES ('mushroom', '咪咪虾条', '1', '1', '../imgs/pros/xiuxian/xx3/xx3_2.jpg');

-- ----------------------------
-- Table structure for `detail`
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `orderid` varchar(20) NOT NULL,
  `proname` varchar(20) NOT NULL,
  `pronum` int(4) NOT NULL,
  `proprice` int(5) NOT NULL,
  PRIMARY KEY (`orderid`,`proname`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO `detail` VALUES ('0088798451', 'QQ星儿童酸奶', '1', '50');
INSERT INTO `detail` VALUES ('0994596229', '咪咪虾条', '4', '4');
INSERT INTO `detail` VALUES ('0994596229', '原味扁薯条', '3', '27');
INSERT INTO `detail` VALUES ('31A1097874', '乐事薯片', '3', '21');
INSERT INTO `detail` VALUES ('31A1097874', '虾片', '1', '5');
INSERT INTO `detail` VALUES ('58DDF97615', '今麦郎大今野拉面', '6', '60');
INSERT INTO `detail` VALUES ('58DDF97615', '康师傅红烧牛肉面', '2', '34');
INSERT INTO `detail` VALUES ('8BCC400964', '旺仔小馒头', '3', '6');
INSERT INTO `detail` VALUES ('8BCC400964', '原味扁薯条', '2', '18');
INSERT INTO `detail` VALUES ('AE65696449', '冬荫功面', '1', '14');
INSERT INTO `detail` VALUES ('AE65696449', '康师傅红烧牛肉面', '2', '34');
INSERT INTO `detail` VALUES ('D9D2B98312', '冬荫功面', '1', '14');
INSERT INTO `detail` VALUES ('D9D2B98312', '今麦郎大今野拉面', '6', '60');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `useradd` varchar(50) NOT NULL,
  `userphone` varchar(20) NOT NULL,
  `sumnum` int(4) NOT NULL,
  `sumprice` int(5) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0088798451', 'mushroom', '江苏省南京市弘景大道3603号', '135792468', '1', '50');
INSERT INTO `orders` VALUES ('0994596229', 'qq', '南京工程学院', '324356765', '7', '31');
INSERT INTO `orders` VALUES ('31A1097874', 'mush', '江苏省南京市弘景大道3601号', '123456789', '4', '26');
INSERT INTO `orders` VALUES ('58DDF97615', 'qq', '南京工程学院', '324356765', '8', '94');
INSERT INTO `orders` VALUES ('8BCC400964', '123', '福建-三明', '234', '5', '24');
INSERT INTO `orders` VALUES ('AE65696449', 'qq', '南京工程学院', '324356765', '3', '48');
INSERT INTO `orders` VALUES ('D9D2B98312', 'qq', '南京工程学院', '324356765', '7', '74');

-- ----------------------------
-- Table structure for `pro_father`
-- ----------------------------
DROP TABLE IF EXISTS `pro_father`;
CREATE TABLE `pro_father` (
  `f_id` int(8) NOT NULL,
  `f_name` varchar(20) CHARACTER SET gbk NOT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pro_father
-- ----------------------------
INSERT INTO `pro_father` VALUES ('110000', '进口食品');
INSERT INTO `pro_father` VALUES ('120000', '方便速食');
INSERT INTO `pro_father` VALUES ('130000', '饮料茶水');
INSERT INTO `pro_father` VALUES ('140000', '休闲零食');
INSERT INTO `pro_father` VALUES ('150000', '牛奶');
INSERT INTO `pro_father` VALUES ('160000', '坚果果干');
INSERT INTO `pro_father` VALUES ('170000', '饼干糕点');
INSERT INTO `pro_father` VALUES ('180000', '其他');

-- ----------------------------
-- Table structure for `pro_gson`
-- ----------------------------
DROP TABLE IF EXISTS `pro_gson`;
CREATE TABLE `pro_gson` (
  `g_id` int(8) NOT NULL DEFAULT '0',
  `g_name` varchar(20) DEFAULT NULL,
  `s_id` int(8) DEFAULT NULL,
  `g_img` varchar(60) DEFAULT NULL,
  `g_price` int(10) DEFAULT NULL,
  `g_sales` int(10) DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_gson
-- ----------------------------
INSERT INTO `pro_gson` VALUES ('110101', '德菲丝清新抹茶', '110100', '../imgs/pros/jinkou/jk1/jk1_1.jpg', '16', '7');
INSERT INTO `pro_gson` VALUES ('110102', '德菲丝松露巧克力', '110100', '../imgs/pros/jinkou/jk1/jk1_2.jpg', '10', '8');
INSERT INTO `pro_gson` VALUES ('110103', '费列罗榛果巧克力', '110100', '../imgs/pros/jinkou/jk1/jk1_3.jpg', '13', '9');
INSERT INTO `pro_gson` VALUES ('110104', '乐天黑巧克力', '110100', '../imgs/pros/jinkou/jk1/jk1_4.jpg', '39', '7');
INSERT INTO `pro_gson` VALUES ('110105', '麦提莎牛奶巧克力', '110100', '../imgs/pros/jinkou/jk1/jk1_5.jpg', '12', '6');
INSERT INTO `pro_gson` VALUES ('110106', '瑞士莲', '110100', '../imgs/pros/jinkou/jk1/jk1_6.jpg', '56', '4');
INSERT INTO `pro_gson` VALUES ('110107', '瑞士三角', '110100', '../imgs/pros/jinkou/jk1/jk1_7.jpg', '34', '0');
INSERT INTO `pro_gson` VALUES ('110108', '瑞特斯波的', '110100', '../imgs/pros/jinkou/jk1/jk1_8.jpg', '24', '0');
INSERT INTO `pro_gson` VALUES ('110201', '波路梦巧克力味饼干', '110200', '../imgs/pros/jinkou/jk2/jk2_1.jpg', '62', '67');
INSERT INTO `pro_gson` VALUES ('110202', '聪明小熊曲奇饼干', '110200', '../imgs/pros/jinkou/jk2/jk2_2.jpg', '34', '25');
INSERT INTO `pro_gson` VALUES ('110203', '丹麦蓝罐曲奇', '110200', '../imgs/pros/jinkou/jk2/jk2_3.jpg', '145', '9');
INSERT INTO `pro_gson` VALUES ('110204', '非凡农庄曲奇', '110200', '../imgs/pros/jinkou/jk2/jk2_4.jpg', '89', '0');
INSERT INTO `pro_gson` VALUES ('110205', '皇冠丹麦曲奇', '110200', '../imgs/pros/jinkou/jk2/jk2_5.jpg', '109', '6');
INSERT INTO `pro_gson` VALUES ('110206', '杰克布森黄油曲奇', '110200', '../imgs/pros/jinkou/jk2/jk2_6.jpg', '45', '2');
INSERT INTO `pro_gson` VALUES ('110207', '蔓越莓曲奇', '110200', '../imgs/pros/jinkou/jk2/jk2_7.jpg', '34', '0');
INSERT INTO `pro_gson` VALUES ('110208', '味硕曲奇', '110200', '../imgs/pros/jinkou/jk2/jk2_8.jpg', '56', '34');
INSERT INTO `pro_gson` VALUES ('110301', '多味水果糖', '110300', '../imgs/pros/jinkou/jk3/jk3_1.jpg', '108', '5');
INSERT INTO `pro_gson` VALUES ('110302', '哈瑞宝凝胶糖', '110300', '../imgs/pros/jinkou/jk3/jk3_2.jpg', '79', '56');
INSERT INTO `pro_gson` VALUES ('110303', '和风什锦糖', '110300', '../imgs/pros/jinkou/jk3/jk3_3.jpg', '59', '23');
INSERT INTO `pro_gson` VALUES ('110304', '嘉云斯薄荷糖', '110300', '../imgs/pros/jinkou/jk3/jk3_4.jpg', '53', '11');
INSERT INTO `pro_gson` VALUES ('110305', '京都念慈菴乌梅糖', '110300', '../imgs/pros/jinkou/jk3/jk3_5.jpg', '80', '1');
INSERT INTO `pro_gson` VALUES ('110306', '拉斐尔桃仁糖果', '110300', '../imgs/pros/jinkou/jk3/jk3_6.jpg', '80', '24');
INSERT INTO `pro_gson` VALUES ('110307', '乐家巧克力糖', '110300', '../imgs/pros/jinkou/jk3/jk3_7.jpg', '23', '0');
INSERT INTO `pro_gson` VALUES ('110308', '利口乐润喉糖', '110300', '../imgs/pros/jinkou/jk3/jk3_8.jpg', '29', '4');
INSERT INTO `pro_gson` VALUES ('120101', '桂圆莲子八宝粥', '120100', '../imgs/pros/fangbian/fb1/fb1_1.jpg', '7', '12');
INSERT INTO `pro_gson` VALUES ('120102', '火腿罐头', '120100', '../imgs/pros/fangbian/fb1/fb1_2.jpg', '15', '8');
INSERT INTO `pro_gson` VALUES ('120103', '金枪鱼罐头', '120100', '../imgs/pros/fangbian/fb1/fb1_3.jpg', '12', '12');
INSERT INTO `pro_gson` VALUES ('120104', '桔片罐头', '120100', '../imgs/pros/fangbian/fb1/fb1_4.jpg', '16', '6');
INSERT INTO `pro_gson` VALUES ('120105', '糖水黄桃', '120100', '../imgs/pros/fangbian/fb1/fb1_5.jpg', '20', '3');
INSERT INTO `pro_gson` VALUES ('120106', '午餐肉罐头', '120100', '../imgs/pros/fangbian/fb1/fb1_6.jpg', '18', '8');
INSERT INTO `pro_gson` VALUES ('120107', '喜多多什锦椰果', '120100', '../imgs/pros/fangbian/fb1/fb1_7.jpg', '8', '25');
INSERT INTO `pro_gson` VALUES ('120108', '香菇肉酱', '120100', '../imgs/pros/fangbian/fb1/fb1_8.jpg', '14', '65');
INSERT INTO `pro_gson` VALUES ('120201', '金锣火腿肠', '120200', '../imgs/pros/fangbian/fb2/fb2_1.jpg', '8', '98');
INSERT INTO `pro_gson` VALUES ('120202', '马可波罗火腿肠', '120200', '../imgs/pros/fangbian/fb2/fb2_2.jpg', '12', '46');
INSERT INTO `pro_gson` VALUES ('120203', '泡面拍档', '120200', '../imgs/pros/fangbian/fb2/fb2_3.jpg', '8', '0');
INSERT INTO `pro_gson` VALUES ('120204', '三只松鼠碳烤肠', '120200', '../imgs/pros/fangbian/fb2/fb2_4.jpg', '15', '76');
INSERT INTO `pro_gson` VALUES ('120205', '双汇火腿肠', '120200', '../imgs/pros/fangbian/fb2/fb2_5.jpg', '14', '12');
INSERT INTO `pro_gson` VALUES ('120206', '双汇鸡肉肠', '120200', '../imgs/pros/fangbian/fb2/fb2_6.jpg', '15', '0');
INSERT INTO `pro_gson` VALUES ('120207', '小力士鱼肠', '120200', '../imgs/pros/fangbian/fb2/fb2_7.jpg', '12', '45');
INSERT INTO `pro_gson` VALUES ('120208', '玉米热狗肠', '120200', '../imgs/pros/fangbian/fb2/fb2_8.jpg', '9', '24');
INSERT INTO `pro_gson` VALUES ('120301', '冬荫功面', '120300', '../imgs/pros/fangbian/fb3/fb3_1.jpg', '14', '9');
INSERT INTO `pro_gson` VALUES ('120302', '今麦郎大今野拉面', '120300', '../imgs/pros/fangbian/fb3/fb3_2.jpg', '10', '12');
INSERT INTO `pro_gson` VALUES ('120303', '康师傅红烧牛肉面', '120300', '../imgs/pros/fangbian/fb3/fb3_3.jpg', '17', '45');
INSERT INTO `pro_gson` VALUES ('120304', '老坛酸菜牛肉面', '120300', '../imgs/pros/fangbian/fb3/fb3_4.jpg', '13', '64');
INSERT INTO `pro_gson` VALUES ('120305', '石锅牛肉拉面', '120300', '../imgs/pros/fangbian/fb3/fb3_5.jpg', '19', '34');
INSERT INTO `pro_gson` VALUES ('120306', '汤达人', '120300', '../imgs/pros/fangbian/fb3/fb3_6.jpg', '15', '9');
INSERT INTO `pro_gson` VALUES ('120307', '统一来一桶', '120300', '../imgs/pros/fangbian/fb3/fb3_7.jpg', '12', '5');
INSERT INTO `pro_gson` VALUES ('120308', '辛拉面', '120300', '../imgs/pros/fangbian/fb3/fb3_8.jpg', '9', '3');
INSERT INTO `pro_gson` VALUES ('130101', '冰红茶', '130100', '../imgs/pros/yinliao/yl1/yl1_1.jpg', '6', '86');
INSERT INTO `pro_gson` VALUES ('130102', '蜂蜜柚子茶', '130100', '../imgs/pros/yinliao/yl1/yl1_2.jpg', '3', '45');
INSERT INTO `pro_gson` VALUES ('130103', '港式奶茶', '130100', '../imgs/pros/yinliao/yl1/yl1_3.jpg', '6', '73');
INSERT INTO `pro_gson` VALUES ('130104', '加多宝凉茶', '130100', '../imgs/pros/yinliao/yl1/yl1_4.jpg', '4', '52');
INSERT INTO `pro_gson` VALUES ('130105', '立顿柠檬茶', '130100', '../imgs/pros/yinliao/yl1/yl1_5.jpg', '6', '86');
INSERT INTO `pro_gson` VALUES ('130106', '茉莉蜜茶', '130100', '../imgs/pros/yinliao/yl1/yl1_6.jpg', '3', '24');
INSERT INTO `pro_gson` VALUES ('130107', '三得利乌龙茶', '130100', '../imgs/pros/yinliao/yl1/yl1_7.jpg', '5', '0');
INSERT INTO `pro_gson` VALUES ('130108', '小茗同学', '130100', '../imgs/pros/yinliao/yl1/yl1_8.jpg', '5', '45');
INSERT INTO `pro_gson` VALUES ('130201', 'C满E', '130200', '../imgs/pros/yinliao/yl2/yl2_1.jpg', '6', '13');
INSERT INTO `pro_gson` VALUES ('130202', '果粒橙', '130200', '../imgs/pros/yinliao/yl2/yl2_2.jpg', '3', '67');
INSERT INTO `pro_gson` VALUES ('130203', '汇源桃汁', '130200', '../imgs/pros/yinliao/yl2/yl2_3.jpg', '4', '43');
INSERT INTO `pro_gson` VALUES ('130204', '芒果汁', '130200', '../imgs/pros/yinliao/yl2/yl2_4.jpg', '6', '75');
INSERT INTO `pro_gson` VALUES ('130205', '葡萄汁', '130200', '../imgs/pros/yinliao/yl2/yl2_5.jpg', '5', '23');
INSERT INTO `pro_gson` VALUES ('130206', '水溶C', '130200', '../imgs/pros/yinliao/yl2/yl2_6.jpg', '6', '86');
INSERT INTO `pro_gson` VALUES ('130207', '唯他可可椰子水', '130200', '../imgs/pros/yinliao/yl2/yl2_7.jpg', '5', '34');
INSERT INTO `pro_gson` VALUES ('130208', '乌梅汁', '130200', '../imgs/pros/yinliao/yl2/yl2_8.jpg', '3', '87');
INSERT INTO `pro_gson` VALUES ('130301', '百事可乐', '130300', '../imgs/pros/yinliao/yl3/yl3_1.jpg', '4', '23');
INSERT INTO `pro_gson` VALUES ('130302', '芬达', '130300', '../imgs/pros/yinliao/yl3/yl3_2.jpg', '4', '76');
INSERT INTO `pro_gson` VALUES ('130303', '可口可乐', '130300', '../imgs/pros/yinliao/yl3/yl3_3.jpg', '5', '34');
INSERT INTO `pro_gson` VALUES ('130304', '乐天妙之吻', '130300', '../imgs/pros/yinliao/yl3/yl3_4.jpg', '3', '65');
INSERT INTO `pro_gson` VALUES ('130305', '美年达', '130300', '../imgs/pros/yinliao/yl3/yl3_5.jpg', '5', '34');
INSERT INTO `pro_gson` VALUES ('130306', '七喜', '130300', '../imgs/pros/yinliao/yl3/yl3_6.jpg', '4', '9');
INSERT INTO `pro_gson` VALUES ('130307', '屈臣氏苏打水', '130300', '../imgs/pros/yinliao/yl3/yl3_7.jpg', '7', '2');
INSERT INTO `pro_gson` VALUES ('130308', '雪碧', '130300', '../imgs/pros/yinliao/yl3/yl3_8.jpg', '3', '7');
INSERT INTO `pro_gson` VALUES ('140101', 'YOGEE果冻', '140100', '../imgs/pros/xiuxian/xx1/xx1_1.jpg', '9', '0');
INSERT INTO `pro_gson` VALUES ('140102', '果爱果冻', '140100', '../imgs/pros/xiuxian/xx1/xx1_2.jpg', '6', '35');
INSERT INTO `pro_gson` VALUES ('140103', '可康果冻', '140100', '../imgs/pros/xiuxian/xx1/xx1_3.jpg', '8', '7');
INSERT INTO `pro_gson` VALUES ('140104', '乐卡思什锦果冻', '140100', '../imgs/pros/xiuxian/xx1/xx1_4.jpg', '4', '35');
INSERT INTO `pro_gson` VALUES ('140105', '马卡龙双层布甸', '140100', '../imgs/pros/xiuxian/xx1/xx1_5.jpg', '5', '74');
INSERT INTO `pro_gson` VALUES ('140106', '萌太子', '140100', '../imgs/pros/xiuxian/xx1/xx1_6.jpg', '9', '8');
INSERT INTO `pro_gson` VALUES ('140107', '盛乡珍鸡蛋味果冻', '140100', '../imgs/pros/xiuxian/xx1/xx1_7.jpg', '8', '24');
INSERT INTO `pro_gson` VALUES ('140108', '优格果冻', '140100', '../imgs/pros/xiuxian/xx1/xx1_8.jpg', '6', '75');
INSERT INTO `pro_gson` VALUES ('140201', 'TYRRELLS薯片', '140200', '../imgs/pros/xiuxian/xx2/xx2_1.jpg', '12', '45');
INSERT INTO `pro_gson` VALUES ('140202', 'ZEK芝士鳕鱼肠', '140200', '../imgs/pros/xiuxian/xx2/xx2_2.jpg', '10', '75');
INSERT INTO `pro_gson` VALUES ('140203', '北田糙米卷', '140200', '../imgs/pros/xiuxian/xx2/xx2_3.jpg', '9', '23');
INSERT INTO `pro_gson` VALUES ('140204', '海太碳烤薯条', '140200', '../imgs/pros/xiuxian/xx2/xx2_4.jpg', '7', '9');
INSERT INTO `pro_gson` VALUES ('140205', '烤海苔卷', '140200', '../imgs/pros/xiuxian/xx2/xx2_5.jpg', '8', '35');
INSERT INTO `pro_gson` VALUES ('140206', '丽芝士玉米棒饼', '140200', '../imgs/pros/xiuxian/xx2/xx2_6.jpg', '10', '7');
INSERT INTO `pro_gson` VALUES ('140207', '日式休闲丸子', '140200', '../imgs/pros/xiuxian/xx2/xx2_7.jpg', '8', '23');
INSERT INTO `pro_gson` VALUES ('140208', '沙嗲味牛肉脯', '140200', '../imgs/pros/xiuxian/xx2/xx2_8.jpg', '12', '9');
INSERT INTO `pro_gson` VALUES ('140301', '乐事薯片', '140300', '../imgs/pros/xiuxian/xx3/xx3_1.jpg', '7', '43');
INSERT INTO `pro_gson` VALUES ('140302', '咪咪虾条', '140300', '../imgs/pros/xiuxian/xx3/xx3_2.jpg', '1', '67');
INSERT INTO `pro_gson` VALUES ('140303', '旺旺仙贝', '140300', '../imgs/pros/xiuxian/xx3/xx3_3.jpg', '8', '35');
INSERT INTO `pro_gson` VALUES ('140304', '旺旺雪饼', '140300', '../imgs/pros/xiuxian/xx3/xx3_4.jpg', '6', '86');
INSERT INTO `pro_gson` VALUES ('140305', '旺仔小馒头', '140300', '../imgs/pros/xiuxian/xx3/xx3_5.jpg', '2', '34');
INSERT INTO `pro_gson` VALUES ('140306', '虾片', '140300', '../imgs/pros/xiuxian/xx3/xx3_6.jpg', '5', '87');
INSERT INTO `pro_gson` VALUES ('140307', '原味扁薯条', '140300', '../imgs/pros/xiuxian/xx3/xx3_7.jpg', '9', '25');
INSERT INTO `pro_gson` VALUES ('140308', '长鼻王夹心卷', '140300', '../imgs/pros/xiuxian/xx3/xx3_8.jpg', '18', '67');
INSERT INTO `pro_gson` VALUES ('150101', '安佳纯牛奶', '150100', '../imgs/pros/niunai/nn1/nn1_1.jpg', '55', '43');
INSERT INTO `pro_gson` VALUES ('150102', '多美鲜全脂牛奶', '150100', '../imgs/pros/niunai/nn1/nn1_2.jpg', '43', '75');
INSERT INTO `pro_gson` VALUES ('150103', '荷高全脂纯牛奶', '150100', '../imgs/pros/niunai/nn1/nn1_3.jpg', '50', '24');
INSERT INTO `pro_gson` VALUES ('150104', '兰奇纯牛奶', '150100', '../imgs/pros/niunai/nn1/nn1_4.jpg', '49', '5');
INSERT INTO `pro_gson` VALUES ('150105', '纽麦福纯牛奶', '150100', '../imgs/pros/niunai/nn1/nn1_5.jpg', '50', '9');
INSERT INTO `pro_gson` VALUES ('150106', '纽仕兰全脂牛奶', '150100', '../imgs/pros/niunai/nn1/nn1_6.jpg', '48', '34');
INSERT INTO `pro_gson` VALUES ('150107', '欧德堡纯牛奶', '150100', '../imgs/pros/niunai/nn1/nn1_7.jpg', '59', '53');
INSERT INTO `pro_gson` VALUES ('150108', '慕思兰德早餐牛奶', '150100', '../imgs/pros/niunai/nn1/nn1_8.jpg', '119', '1');
INSERT INTO `pro_gson` VALUES ('150201', '爱薇牛', '150200', '../imgs/pros/niunai/nn2/nn2_1.jpg', '69', '8');
INSERT INTO `pro_gson` VALUES ('150202', '安怡高钙奶粉', '150200', '../imgs/pros/niunai/nn2/nn2_2.jpg', '53', '1');
INSERT INTO `pro_gson` VALUES ('150203', '咔哇熊全脂奶粉', '150200', '../imgs/pros/niunai/nn2/nn2_3.jpg', '58', '6');
INSERT INTO `pro_gson` VALUES ('150204', '卡瑞特兹奶粉', '150200', '../imgs/pros/niunai/nn2/nn2_4.jpg', '69', '8');
INSERT INTO `pro_gson` VALUES ('150205', '凯倍美原装奶粉', '150200', '../imgs/pros/niunai/nn2/nn2_5.jpg', '59', '2');
INSERT INTO `pro_gson` VALUES ('150206', '美可卓全脂奶粉', '150200', '../imgs/pros/niunai/nn2/nn2_6.jpg', '63', '5');
INSERT INTO `pro_gson` VALUES ('150207', '纽瑞滋脱脂奶粉', '150200', '../imgs/pros/niunai/nn2/nn2_7.jpg', '68', '2');
INSERT INTO `pro_gson` VALUES ('150208', '纽仕兰全脂调制乳粉', '150200', '../imgs/pros/niunai/nn2/nn2_8.jpg', '54', '0');
INSERT INTO `pro_gson` VALUES ('150301', 'QQ星儿童酸奶', '150300', '../imgs/pros/niunai/nn3/nn3_1.jpg', '50', '4');
INSERT INTO `pro_gson` VALUES ('150302', '安慕希', '150300', '../imgs/pros/niunai/nn3/nn3_2.jpg', '64', '3');
INSERT INTO `pro_gson` VALUES ('150303', '澳牛原味酸奶饮料', '150300', '../imgs/pros/niunai/nn3/nn3_3.jpg', '59', '5');
INSERT INTO `pro_gson` VALUES ('150304', '宾格瑞香蕉牛奶', '150300', '../imgs/pros/niunai/nn3/nn3_4.jpg', '60', '3');
INSERT INTO `pro_gson` VALUES ('150305', '纯甄', '150300', '../imgs/pros/niunai/nn3/nn3_5.jpg', '58', '5');
INSERT INTO `pro_gson` VALUES ('150306', '德亚酸牛奶', '150300', '../imgs/pros/niunai/nn3/nn3_6.jpg', '54', '2');
INSERT INTO `pro_gson` VALUES ('150307', '莫斯利安', '150300', '../imgs/pros/niunai/nn3/nn3_7.jpg', '65', '2');
INSERT INTO `pro_gson` VALUES ('150308', '哇哈哈', '150300', '../imgs/pros/niunai/nn3/nn3_8.jpg', '32', '5');
INSERT INTO `pro_gson` VALUES ('160101', '碧根果', '160100', '../imgs/pros/jianguo/jg1/jg1_1.jpg', '29', '2');
INSERT INTO `pro_gson` VALUES ('160102', '蔓越莓干', '160100', '../imgs/pros/jianguo/jg1/jg1_2.jpg', '38', '4');
INSERT INTO `pro_gson` VALUES ('160103', '什锦果仁', '160100', '../imgs/pros/jianguo/jg1/jg1_3.jpg', '48', '2');
INSERT INTO `pro_gson` VALUES ('160104', '手剥松子', '160100', '../imgs/pros/jianguo/jg1/jg1_4.jpg', '50', '4');
INSERT INTO `pro_gson` VALUES ('160105', '嗵嗵香蕉片', '160100', '../imgs/pros/jianguo/jg1/jg1_5.jpg', '18', '43');
INSERT INTO `pro_gson` VALUES ('160106', '夏威夷果', '160100', '../imgs/pros/jianguo/jg1/jg1_6.jpg', '49', '6');
INSERT INTO `pro_gson` VALUES ('160107', '盐烤味腰果', '160100', '../imgs/pros/jianguo/jg1/jg1_7.jpg', '30', '4');
INSERT INTO `pro_gson` VALUES ('160108', '枣夹核桃', '160100', '../imgs/pros/jianguo/jg1/jg1_8.jpg', '5', '2');
INSERT INTO `pro_gson` VALUES ('160201', '豆干', '160200', '../imgs/pros/jianguo/jg2/jg2_1.jpg', '3', '43');
INSERT INTO `pro_gson` VALUES ('160202', '鸡蛋干', '160200', '../imgs/pros/jianguo/jg2/jg2_2.jpg', '3', '63');
INSERT INTO `pro_gson` VALUES ('160203', '牛肉粒', '160200', '../imgs/pros/jianguo/jg2/jg2_3.jpg', '18', '23');
INSERT INTO `pro_gson` VALUES ('160204', '牛肉条', '160200', '../imgs/pros/jianguo/jg2/jg2_4.jpg', '9', '64');
INSERT INTO `pro_gson` VALUES ('160205', '泡椒凤爪', '160200', '../imgs/pros/jianguo/jg2/jg2_5.jpg', '9', '43');
INSERT INTO `pro_gson` VALUES ('160206', '鸭舌', '160200', '../imgs/pros/jianguo/jg2/jg2_6.jpg', '10', '52');
INSERT INTO `pro_gson` VALUES ('160207', '鱼豆腐', '160200', '../imgs/pros/jianguo/jg2/jg2_7.jpg', '5', '0');
INSERT INTO `pro_gson` VALUES ('160208', '猪肉脯', '160200', '../imgs/pros/jianguo/jg2/jg2_8.jpg', '10', '0');
INSERT INTO `pro_gson` VALUES ('170101', 'EDOPACK原味饼干', '170100', '../imgs/pros/bingan/bg1/bg1_1.jpg', '13', '23');
INSERT INTO `pro_gson` VALUES ('170102', 'MIXX香葱梳打饼干', '170100', '../imgs/pros/bingan/bg1/bg1_2.jpg', '18', '12');
INSERT INTO `pro_gson` VALUES ('170103', 'MIXX芝士饼干', '170100', '../imgs/pros/bingan/bg1/bg1_3.jpg', '61', '31');
INSERT INTO `pro_gson` VALUES ('170104', '爱时乐卷心酥', '170100', '../imgs/pros/bingan/bg1/bg1_4.jpg', '19', '42');
INSERT INTO `pro_gson` VALUES ('170105', '宝制果高钙饼干', '170100', '../imgs/pros/bingan/bg1/bg1_5.jpg', '26', '5');
INSERT INTO `pro_gson` VALUES ('170106', '波路梦威化饼', '170100', '../imgs/pros/bingan/bg1/bg1_6.jpg', '36', '16');
INSERT INTO `pro_gson` VALUES ('170107', '脆脆鲨', '170100', '../imgs/pros/bingan/bg1/bg1_7.jpg', '10', '123');
INSERT INTO `pro_gson` VALUES ('170108', '朱蒂丝三明治', '170100', '../imgs/pros/bingan/bg1/bg1_8.jpg', '30', '43');
INSERT INTO `pro_gson` VALUES ('170201', '布朗尼蛋糕', '170200', '../imgs/pros/bingan/bg2/bg2_1.jpg', '25', '45');
INSERT INTO `pro_gson` VALUES ('170202', '德用平家派', '170200', '../imgs/pros/bingan/bg2/bg2_2.jpg', '28', '23');
INSERT INTO `pro_gson` VALUES ('170203', '凤梨酥', '170200', '../imgs/pros/bingan/bg2/bg2_3.jpg', '30', '0');
INSERT INTO `pro_gson` VALUES ('170204', '福多香兰味蛋糕', '170200', '../imgs/pros/bingan/bg2/bg2_4.jpg', '20', '8');
INSERT INTO `pro_gson` VALUES ('170205', '和风红豆糯米饼', '170200', '../imgs/pros/bingan/bg2/bg2_5.jpg', '19', '23');
INSERT INTO `pro_gson` VALUES ('170206', '小泡芙', '170200', '../imgs/pros/bingan/bg2/bg2_6.jpg', '18', '64');
INSERT INTO `pro_gson` VALUES ('170207', '雪之恋麻薯', '170200', '../imgs/pros/bingan/bg2/bg2_7.jpg', '21', '23');
INSERT INTO `pro_gson` VALUES ('170208', '竹田小馒头', '170200', '../imgs/pros/bingan/bg2/bg2_8.jpg', '12', '64');

-- ----------------------------
-- Table structure for `pro_son`
-- ----------------------------
DROP TABLE IF EXISTS `pro_son`;
CREATE TABLE `pro_son` (
  `s_id` int(8) NOT NULL,
  `s_name` varchar(20) CHARACTER SET gbk NOT NULL,
  `f_id` int(8) NOT NULL,
  `s_img` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pro_son
-- ----------------------------
INSERT INTO `pro_son` VALUES ('110100', '巧克力', '110000', null);
INSERT INTO `pro_son` VALUES ('110200', '曲奇', '110000', null);
INSERT INTO `pro_son` VALUES ('110300', '糖果', '110000', null);
INSERT INTO `pro_son` VALUES ('120100', '罐头', '120000', null);
INSERT INTO `pro_son` VALUES ('120200', '火腿肠', '120000', null);
INSERT INTO `pro_son` VALUES ('120300', '泡面', '120000', null);
INSERT INTO `pro_son` VALUES ('130100', '茶饮料', '130000', null);
INSERT INTO `pro_son` VALUES ('130200', '果汁', '130000', null);
INSERT INTO `pro_son` VALUES ('130300', '碳酸饮料', '130000', null);
INSERT INTO `pro_son` VALUES ('140100', '果冻布丁', '140000', null);
INSERT INTO `pro_son` VALUES ('140200', '零时', '140000', null);
INSERT INTO `pro_son` VALUES ('140300', '膨化食品', '140000', null);
INSERT INTO `pro_son` VALUES ('150100', '纯牛奶', '150000', null);
INSERT INTO `pro_son` VALUES ('150200', '奶粉', '150000', null);
INSERT INTO `pro_son` VALUES ('150300', '酸奶', '150000', null);
INSERT INTO `pro_son` VALUES ('160100', '坚果蜜饯', '160000', null);
INSERT INTO `pro_son` VALUES ('160200', '肉干果脯', '160000', null);
INSERT INTO `pro_son` VALUES ('170100', '饼干', '170000', null);
INSERT INTO `pro_son` VALUES ('170200', '糕点', '170000', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_user` varchar(20) NOT NULL,
  `u_pwd` varchar(30) NOT NULL,
  `u_q` varchar(50) NOT NULL,
  `u_ans` varchar(50) NOT NULL,
  PRIMARY KEY (`u_user`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1234567', '您的学号（或工号）是', '52');
INSERT INTO `user` VALUES ('1111', '1111111111111', '您的生日是', '2333');
INSERT INTO `user` VALUES ('2', '123123', '您的生日是', '123123');
INSERT INTO `user` VALUES ('mush', '123456', '您的出生地是', 'ah');
INSERT INTO `user` VALUES ('mushroom', '1235660', '您的生日是', '0930');
INSERT INTO `user` VALUES ('sps', 'spssps', '您的邮箱是', '邮箱呀');
INSERT INTO `user` VALUES ('tp', 'tptptp', '您的生日是', 'xpp');
INSERT INTO `user` VALUES ('xyl', 'xyllyx', '您的学号（或工号）是', '222');
INSERT INTO `user` VALUES ('哈哈', '666666', '您的邮箱是', '邮箱');
