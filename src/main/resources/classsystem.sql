/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : classsystem

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-03-25 15:40:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `max_num` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `boy_num` int(11) DEFAULT NULL,
  `girl_num` int(255) DEFAULT NULL,
  `average_score` double(255,0) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('40', '创新1班', '5', '创新', '3', '4', '100', null);
INSERT INTO `class` VALUES ('41', '创新2班', '5', '创新', null, null, null, null);
INSERT INTO `class` VALUES ('42', '实验1班', '5', '实验', null, null, null, null);
INSERT INTO `class` VALUES ('43', '实验2班', '5', '实验', null, null, null, null);

-- ----------------------------
-- Table structure for followstudent
-- ----------------------------
DROP TABLE IF EXISTS `followstudent`;
CREATE TABLE `followstudent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_card` varchar(18) NOT NULL COMMENT '身份证',
  `sex` varchar(255) NOT NULL,
  `total_grade` double(11,0) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL COMMENT '民族',
  `native_place` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `patriarch` varchar(255) DEFAULT NULL COMMENT '家长',
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of followstudent
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_card` varchar(18) NOT NULL COMMENT '身份证',
  `sex` varchar(255) NOT NULL,
  `total_grade` double(255,0) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL COMMENT '民族',
  `native_place` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `patriarch` varchar(255) DEFAULT NULL COMMENT '家长',
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2189 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2109', '陈七', '110101199003072893', '女', '564', null, '体育', '白', '云南昆明', '陈七大', '15005946178', '仓山区2号', '4');
INSERT INTO `student` VALUES ('2110', '陈一', '110101199003073431', '男', '533', null, '普通', '汉', '辽宁沈阳', '陈一大', '18059939236', '城厢区123号', '3');
INSERT INTO `student` VALUES ('2111', '陈十', '23060219900307411X', '男', '538', null, '普通', '汉', '江苏南京', '陈十大', '13912680600', '涵江区1号', '3');
INSERT INTO `student` VALUES ('2112', '陈九', '230602199003074291', '男', '630', null, '保送', '畲', '福建漳州', '陈九大', '15567707963', '仓山区333号', '2');
INSERT INTO `student` VALUES ('2113', '柔柔', '248406195502034755', '女', '721', '43', '普通', '汉', '福建泉州', '算法', '12574464600', '翔安区466号', '3');
INSERT INTO `student` VALUES ('2114', '大大', '248406195502065434', '女', '653', '43', '普通', '汉', '福建泉州', '干货', '12574464688', '翔安区50号', '3');
INSERT INTO `student` VALUES ('2115', '小蓝', '248406195502065512', '男', '632', '43', '普通', '汉', '福建泉州', '李莉', '12574464622', '翔安区46号', '3');
INSERT INTO `student` VALUES ('2116', '小小', '248406195502065520', '女', '534', null, '普通', '汉', '福建泉州', '蒂夫', '12574464667', '翔安区49号', '3');
INSERT INTO `student` VALUES ('2117', '林北', '248406195502065532', '男', '465', null, '体育', '汉', '福建泉州', '林玲', '12574464646', '翔安区40号', '4');
INSERT INTO `student` VALUES ('2118', '小红', '248406195502065533', '女', '345', null, '普通', '汉', '福建泉州', '图图', '12574464623', '翔安区42号', '3');
INSERT INTO `student` VALUES ('2119', '小白', '248406195502065534', '男', '456', null, '普通', '汉', '福建泉州', '兔兔', '12574464621', '翔安区45号', '3');
INSERT INTO `student` VALUES ('2120', '小草', '248406195502065546', '男', '347', null, '普通', '汉', '福建泉州', '史蒂夫', '12574464625', '翔安区47号', '3');
INSERT INTO `student` VALUES ('2121', '可可', '248406195502065545', '女', '348', null, '普通', '汉', '福建泉州', '时代', '12574464699', '翔安区454号', '3');
INSERT INTO `student` VALUES ('2122', '小花', '248406195502065567', '男', '587', '42', '普通', '汉', '福建泉州', '冻豆腐', '12574464656', '翔安区48号', '3');
INSERT INTO `student` VALUES ('2123', '周一', '248406199502065532', '男', '562', null, '普通', '侗', '贵州黎平', '周六', '12575464646', '安福区33', '3');
INSERT INTO `student` VALUES ('2124', '美佳', '2484061996212333', '女', '446', null, '体育', '汉', '福建厦门', '美食杰', '15701640945', '爱情公寓2号', '4');
INSERT INTO `student` VALUES ('2125', '关键', '304862199703157762', '女', '521', null, '普通', '侗', '贵州六盘水', '时刻', '12438709455', '夜明区87号', '3');
INSERT INTO `student` VALUES ('2126', '陈二', '330102199903070524', '男', '543', null, '保送', '回', '吉林长春', '陈二大', '15187679726', '涵江区934号', '2');
INSERT INTO `student` VALUES ('2127', '陈四', '330102199903074429', '女', '432', null, '普通', '汉', '安徽合肥', '陈四大', '15007961507', '荔城区233号', '3');
INSERT INTO `student` VALUES ('2128', '零零七', '336291200011119765', '男', '436', null, '普通', '朝鲜', '黑龙江哈尔滨', '林哈哈', '13899568393', '湖里区413号', '3');
INSERT INTO `student` VALUES ('2129', '小明', '341003199911200121', '女', '580', null, '普通', '汉', '安徽黄山', '大明明', '13212346677', '黄山区344', '3');
INSERT INTO `student` VALUES ('2130', '小黑', '341003199911210231', '男', '570', null, '普通', '汉', '安徽黄山', '大黑黑', '13859064257', '黄山区235', '3');
INSERT INTO `student` VALUES ('2131', '大明', '341003199911223303', '男', '600', '43', '普通', '汉', '福建厦门', '大大明', '15759067238', '湖里区111', '3');
INSERT INTO `student` VALUES ('2132', '大黑', '341003199912222301', '男', '700', null, '保送', '苗', '福建泉州', '大大黑', '13655095703', '晋江市863号', '2');
INSERT INTO `student` VALUES ('2133', '林某七', '346798199901119946', '男', '519', null, '普通', '蒙古', '内蒙古大草原', '林哈哈', '13898386237', '思明区45号', '3');
INSERT INTO `student` VALUES ('2134', '林某二', '349765199603061644', '男', '750', null, '体育', '汉', '山东济南', '林宛瑜', '15967389238', '思明区136号', '4');
INSERT INTO `student` VALUES ('2135', '李四', '350136199001116679', '女', '665', '42', '普通', '汉', '福建宁德', '李二四', '15766497683', '集美区123号', '3');
INSERT INTO `student` VALUES ('2136', '王五', '350136199001126680', '男', '138', null, '体育', '汉', '福建龙岩', '王某人', '15734916280', '集美区369号', '4');
INSERT INTO `student` VALUES ('2137', '赵六', '350136199011116976', '女', '125', null, '保送', '汉', '江西南昌', '赵丽颖', '13896076739', '湖里区369号', '2');
INSERT INTO `student` VALUES ('2138', '司马', '350166766892968000', '男', '678', '42', '普通', '汉', '福建厦门', '司马战歌', '13589751716', '集美小区123', '3');
INSERT INTO `student` VALUES ('2139', '张三', '350526199001106637', '男', '436', null, '普通', '汉', '福建厦门', '张一三', '15733649751', '集美区111号', '3');
INSERT INTO `student` VALUES ('2140', '郭米娜', '350628120051223223', '女', '718', null, '保送', '汉', '福建厦门', '郭显宏', '13464857678', '集美区2号', '2');
INSERT INTO `student` VALUES ('2141', '慕容齐', '350628120061104237', '男', '712', null, '保送', '汉', '福建厦门', '慕容北辰', '18150409344', '海沧区34号', '2');
INSERT INTO `student` VALUES ('2142', '妖腰酒', '350628199911025698', '男', '601', null, '保送', '汉', '福建莆田', '妖奇怪', '15059678365', '涵江区866号', '2');
INSERT INTO `student` VALUES ('2143', '妖饿林', '350628199911046954', '女', '576', null, '普通', '汉', '福建厦门', '妖拐', '15059647539', '思明区865号', '3');
INSERT INTO `student` VALUES ('2144', '孟德尔', '350628199911050963', '男', '588', '42', '普通', '汉', '辽宁沈阳', '也是一', '15059647487', '思明区1111号', '3');
INSERT INTO `student` VALUES ('2145', '米开朗基罗', '350628199911052380', '男', '666', '40', '跟踪生源', '汉', '北京', '叶一', '15059647497', '思明区111号', '1');
INSERT INTO `student` VALUES ('2146', '哥伦布', '350628199911054236', '男', '538', '40', '跟踪生源', '傣', '广西南宁', '也把', '15059647490', '集美区88号', '1');
INSERT INTO `student` VALUES ('2147', '爱因斯坦', '350628199911054568', '男', '699', '40', '跟踪生源', '汉', '浙江杭州', '也许', '15059647493', '海沧区555号', '1');
INSERT INTO `student` VALUES ('2148', '特斯拉', '350628199911054632', '男', '547', '41', '跟踪生源', '苗', '湖南长沙', '也就', '15059647489', '湖里区996号', '1');
INSERT INTO `student` VALUES ('2149', '毕加索', '350628199911054658', '男', '658', '40', '跟踪生源', '汉', '山东济南', '夜跑', '15059647495', '集美区333号', '1');
INSERT INTO `student` VALUES ('2150', '牛顿', '350628199911054687', '男', '678', '41', '跟踪生源', '汉', '江苏南京', '择日', '15059647494', '翔安区44号', '1');
INSERT INTO `student` VALUES ('2151', '拉瓦锡', '350628199911054721', '男', '621', null, '保送', '藏', '湖北武汉', '叶十', '15059647488', '海沧区1010号', '2');
INSERT INTO `student` VALUES ('2152', '普朗克', '350628199911054786', '男', '687', '41', '跟踪生源', '回', '福建福州', '叶九', '15059647492', '同安区666号', '1');
INSERT INTO `student` VALUES ('2153', '袁隆平', '350628199911054836', '男', '603', null, '保送', '汉', '吉林长春', '也是儿', '15059647486', '湖里区1212号', '2');
INSERT INTO `student` VALUES ('2154', '腰饿饿', '350628199911057630', '男', '555', null, '普通', '汉', '福建厦门', '腰瘦', '13776658356', '巴拉拉小区5号', '3');
INSERT INTO `student` VALUES ('2155', '哥白尼', '350628199911057896', '男', '534', '41', '跟踪生源', '畲', '广东广州', '也是', '15059647491', '思明区777号', '1');
INSERT INTO `student` VALUES ('2156', '妖妖凌', '350628199911058019', '女', '653', null, '保送', '汉', '福建漳州', '妖齐', '15059647536', '芗城区864号', '2');
INSERT INTO `student` VALUES ('2157', '麦哲伦', '350628199911058621', '男', '569', null, '体育', '汉', '山西太原', '夜十三', '15059647485', '惠济区 1313号', '4');
INSERT INTO `student` VALUES ('2158', '达芬奇', '350628199911058680', '男', '555', '41', '跟踪生源', '汉', '天津', '叶儿', '15059647496', '湖里区222号', '1');
INSERT INTO `student` VALUES ('2159', '关古', '3506282003033077', '男', '675', null, '体育', '汉', '福建厦门', '关谷一', '12697345573', '天天小区', '4');
INSERT INTO `student` VALUES ('2160', '吴所谓', '3506282005060824', '男', '486', null, '普通', '汉', '福建厦门', '吴犁头', '19643575432', '天天小区', '3');
INSERT INTO `student` VALUES ('2161', '林某六', '359265199701181378', '男', '572', null, '保送', '汉', '新疆乌鲁木齐', '林哈哈', '13686956867', '思明区99号', '2');
INSERT INTO `student` VALUES ('2162', '陈八', '430102199003077978', '女', '675', '42', '普通', '汉', '福建厦门', '陈八大', '13969081277', '长乐区222号', '3');
INSERT INTO `student` VALUES ('2163', '陈六', '430102199003079893', '男', '555', null, '普通', '汉', '福建福州', '陈六大', '13674067628', '鼓楼区1号', '3');
INSERT INTO `student` VALUES ('2164', '林某五', '438953199904282535', '女', '549', null, '体育', '回', '浙江温州', '林俊杰', '16937953891', '同安区99号', '4');
INSERT INTO `student` VALUES ('2165', '林某四', '439582199808164853', '女', '555', null, '体育', '汉', '内蒙古赤峰市', '林哥', '13094938953', '同安区11号', '4');
INSERT INTO `student` VALUES ('2166', '陈三', '440103200103077311', '女', '643', null, '体育', '蒙古', '内蒙古呼和浩特', '陈三大', '18789356423', '荔城区22号', '4');
INSERT INTO `student` VALUES ('2167', '王红', '440103200103077418', '女', '586', '43', '普通', '汉', '福建厦门', '王必胜', '13779926488', '翔安区56号', '3');
INSERT INTO `student` VALUES ('2168', '陈五', '440103200103079418', '男', '666', null, '保送', '鄂温克', '云南丽江', '陈五大', '13585710776', '秀屿区222号', '2');
INSERT INTO `student` VALUES ('2169', '李明', '44010320081224674Z', '男', '566', null, '体育', '汉', '福建厦门', '李轩', '13779936457', '思明区4号', '4');
INSERT INTO `student` VALUES ('2170', '史莱克', '52231199912034458', '男', '722', null, '保送', '汉', '陕西西安', '麦当娜', '17532864052', '小康公园8号', '2');
INSERT INTO `student` VALUES ('2171', '李针坏', '5226311992120945', '男', '635', null, '保送', '汉', '福建厦门', '李铁蛋', '18346643735', '喜马拉雅小区', '2');
INSERT INTO `student` VALUES ('2172', '肖婷', '522631199705035224', '女', '600', null, '保送', '汉', '湖南长沙', '肖理', '13779937465', '天心区58号', '2');
INSERT INTO `student` VALUES ('2173', '李安杰', '522631199711093455', '男', '478', null, '体育', '汉', '广东广州', '李杰', '15761257211', '环岛小区37号', '4');
INSERT INTO `student` VALUES ('2174', '封景', '522631199805053433', '男', '701', null, '保送', '汉', '湖北武汉', '封铭', '13885523846', '美好小区88号', '2');
INSERT INTO `student` VALUES ('2175', '乔大', '522631199806240042', '男', '622', null, '体育', '汉', '广东广西', '乔梅花', '18788364289', '明湖区462号', '4');
INSERT INTO `student` VALUES ('2176', '陆鹿', '522631199902133321', '女', '555', null, '普通', '水', '福建泉州', '陆旭', '13779926374', '康康小区23号', '3');
INSERT INTO `student` VALUES ('2177', '库里', '522631199904050021', '男', '742', '41', '保送', '汉', '贵州黎平', '斯蒂芬', '17822820798', '环保区82号', '2');
INSERT INTO `student` VALUES ('2178', '欧科', '522631199908217499', '男', '602', null, '体育', '汉', '吉林长春', '蝌蚪', '15408453696', '金华区22号', '4');
INSERT INTO `student` VALUES ('2179', '周末', '522631200011160012', '男', '546', null, '普通', '汉', '湖南长沙', '周围', '13339654931', '天心区203号', '3');
INSERT INTO `student` VALUES ('2180', '吴宇轩', '522631200312022278', '男', '489', null, '普通', '布依', '贵州贵阳', '吴清安', '15268837465', '良瑜公园12号', '3');
INSERT INTO `student` VALUES ('2181', '夏天', '522631200503152351', '女', '598', null, '体育', '瑶', '贵州黎平', '夏季', '15736284659', '金穗小区34号', '4');
INSERT INTO `student` VALUES ('2182', '杨乐', '522631200506095422', '女', '690', null, '保送', '汉', '福建龙岩', '杨君', '13776658325', '巴啦啦小区6号', '2');
INSERT INTO `student` VALUES ('2183', '王萍', '522631200604122353', '女', '568', null, '普通', '侗', '贵州遵义', '王兰', '15584589944', '安宁小区18号', '3');
INSERT INTO `student` VALUES ('2184', '马拉拉', '522631200612234485', '女', '666', null, '保送', '藏', '青海西宁', '马哈哈', '13887463549', '滨河家园12号', '2');
INSERT INTO `student` VALUES ('2185', '甄嬛', '522631200709157134', '女', '680', null, '保送', '满', '北京朝阳区', '甄好', '13775542686', '朝阳区188号', '2');
INSERT INTO `student` VALUES ('2186', '梁琪', '522631200744232233', '女', '567', null, '普通', '汉', '福建厦门', '梁亮', '15885888360', '集美区176号', '3');
INSERT INTO `student` VALUES ('2187', '林某一', '734994199802293763', '男', '720', null, '保送', '汉', '广东广州', '林黛玉', '13798313198', '湖里区398号', '2');
INSERT INTO `student` VALUES ('2188', '林某三', '794653199606304565', '女', '465', null, '普通', '汉', '西藏拉萨', '林伟', '13867956861', '海沧区996号', '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'admin');
