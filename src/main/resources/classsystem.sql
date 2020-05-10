/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : classsystem

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-05-10 12:43:54
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
  `average_score` double(255,2) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `flag` int(1) DEFAULT '1' COMMENT '分班起始标志',
  `belonging` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('11', '创新1班', '30', '创新', '15', '14', '356.52', null, '-2', 'simingG');
INSERT INTO `class` VALUES ('12', '创新2班', '30', '创新', '18', '13', '402.77', null, '-2', 'simingG');
INSERT INTO `class` VALUES ('13', '实验1班', '30', '实验', '0', '0', '0.00', null, '1', 'simingG');
INSERT INTO `class` VALUES ('14', '实验2班', '30', '实验', '0', '0', '0.00', null, '1', 'simingG');
INSERT INTO `class` VALUES ('15', '实验3班', '30', '实验', '0', '0', '0.00', null, '1', 'simingG');

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
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '/addUser', 'addUser', '添加用户', '1');
INSERT INTO `permission` VALUES ('2', '/findAllUsers', 'findAllUsers', '查询所有用户', '1');
INSERT INTO `permission` VALUES ('3', '/updateUser', 'updateUser', '更新用户', '1');
INSERT INTO `permission` VALUES ('4', '/deleteUser/**', 'deleteUser', '删除用户', '1');
INSERT INTO `permission` VALUES ('5', '/main', 'simingG', '思明区高中', '0');
INSERT INTO `permission` VALUES ('6', '/main', 'simingC', '思明区初中', '0');
INSERT INTO `permission` VALUES ('7', '/main', 'xianganG', '翔安区高中', '0');
INSERT INTO `permission` VALUES ('8', '/main', 'xianganC', '翔安区初中', '0');
INSERT INTO `permission` VALUES ('9', '/main', 'manage', '系统管理', '0');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '校长');
INSERT INTO `role` VALUES ('2', '副校长');
INSERT INTO `role` VALUES ('3', '主任');
INSERT INTO `role` VALUES ('4', '管理员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '1');
INSERT INTO `role_permission` VALUES ('2', '1', '2');
INSERT INTO `role_permission` VALUES ('3', '1', '3');
INSERT INTO `role_permission` VALUES ('4', '1', '4');
INSERT INTO `role_permission` VALUES ('5', '1', '5');
INSERT INTO `role_permission` VALUES ('6', '1', '6');
INSERT INTO `role_permission` VALUES ('7', '1', '7');
INSERT INTO `role_permission` VALUES ('8', '1', '8');
INSERT INTO `role_permission` VALUES ('9', '2', '1');
INSERT INTO `role_permission` VALUES ('10', '2', '2');
INSERT INTO `role_permission` VALUES ('11', '2', '3');
INSERT INTO `role_permission` VALUES ('12', '2', '4');
INSERT INTO `role_permission` VALUES ('13', '2', '5');
INSERT INTO `role_permission` VALUES ('14', '1', '9');

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
  `tel` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `patriarch` varchar(255) DEFAULT NULL COMMENT '家长',
  `phone` varchar(255) DEFAULT NULL COMMENT '家长电话',
  `address` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `belonging` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3501 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('3001', '曾丽莎', '350203200406071324', '女', '550', null, '普通生', '汉族', '思明', null, '胡素华', '13859900808', '厦门市思明区阳台山路3号302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3002', '畅翌', '350203200311171621', '女', '548', null, '普通生', '汉族', '思明', null, '畅守波', '13606010661', '福建省厦门市思明区开元路129号之五501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3003', '陈钫妮', '350525200312035642', '女', '549', null, '普通生', '汉族', '湖里', null, '范碧珠', '13275926005', '福建省厦门市湖里区围里社412号201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3004', '陈鹏', '350724200408251512', '男', '550', null, '普通生', '汉族', '集美', null, '李春梅', '13860140052', '福建省厦门市集美区东宅六柱里3号', '3', 'simingG');
INSERT INTO `student` VALUES ('3005', '陈婷', '350628200312135023', '女', '551', null, '普通生', '汉族', '湖里', null, '陈顺正', '15160017329', '福建省厦门市湖里区园山南路242-10', '3', 'simingG');
INSERT INTO `student` VALUES ('3006', '陈维锟', '350881200405250373', '男', '548', null, '普通生', '汉族', '集美', null, '陈晓堂', '13850087891', '福建省厦门市集美区马銮路25—9号304室', '3', 'simingG');
INSERT INTO `student` VALUES ('3007', '陈雯雯', '35020320030927332X', '女', '550', null, '普通生', '汉族', '思明', null, '陈志明', '13950072168', '福建省厦门市思明区莲秀里61号12C室', '3', 'simingG');
INSERT INTO `student` VALUES ('3008', '陈阳光', '350424200312116934', '男', '550', null, '普通生', '汉族', '思明', null, '陈龙生', '15060753618', '福建省厦门市思明区何厝顶何39号', '3', 'simingG');
INSERT INTO `student` VALUES ('3009', '陈瑛琪', '350206200312182022', '女', '549', null, '普通生', '汉族', '湖里', null, '林丽霞', '18060990359', '福建省湖里区中埔新社10176-2栋502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3010', '付子毅', '230204200405211435', '男', '546', null, '普通生', '汉族', '思明', null, '吴龙花', '18950820188', '福建省厦门市思明区屿后北里407号107室', '3', 'simingG');
INSERT INTO `student` VALUES ('3011', '高伯锴', '350203200401212319', '男', '548', null, '普通生', '汉族', '思明', null, '高树欣', '13950159331', '福建省厦门市思明区育秀里37号1505室', '3', 'simingG');
INSERT INTO `student` VALUES ('3012', '高阳', '35058320040620923X', '男', '546', null, '普通生', '汉族', '思明', null, '苏珍华', '15960279295', '厦门市思明区西林西二里金磊花园17号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3013', '韩佳欣', '231003200409171323', '女', '547', null, '普通生', '朝鲜族', '思明', null, '高春艳', '18906017219', '厦门市思明区思明南路195号中华城6楼', '3', 'simingG');
INSERT INTO `student` VALUES ('3014', '黄海艺', '350583200404130077', '男', '547', null, '普通生', '汉族', '湖里', null, '黄录圩', '15980850918', '福建省厦门市湖里区台湾街177号1301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3015', '黄嘉靓', '35042720040501002X', '女', '547', null, '普通生', '汉族', '思明', null, '叶幼莲', '13507596516', '三明市沙县莲花中路42号', '3', 'simingG');
INSERT INTO `student` VALUES ('3016', '黄欣雨', '350181200403231621', '女', '551', null, '普通生', '汉族', '湖里', null, '黄其强', '13906006576', '福建省厦门市湖里区钟宅西二里4号2103室', '3', 'simingG');
INSERT INTO `student` VALUES ('3017', '黄子凌', '350206200404150036', '男', '481', null, '足球-非守门员', '汉族', '湖里', null, '黄有贵', '13459017828', '福建省厦门市湖里区嘉园路20号之三201室', '4', 'simingG');
INSERT INTO `student` VALUES ('3018', '姜婧涵', '350206200408045540', '女', '549', null, '普通生', '汉族', '思明', null, '张阿彬', '13606094522', '厦门市湖里区金山西里39号201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3019', '蒋承烨', '350425200401160730', '男', '550', null, '普通生', '汉族', '湖里', null, '林秀兰', '15759236375', '福建省厦门市湖里区新丰路63号202室', '3', 'simingG');
INSERT INTO `student` VALUES ('3020', '柯佳瑜', '1390887(6)', '女', '549', null, '普通生', '汉族', '思明', null, '柯玉阳', '13779987668', '思明区前村埔路家家海景573号704室', '3', 'simingG');
INSERT INTO `student` VALUES ('3021', '李木子', '350203200401123631', '男', '548', null, '普通生', '汉族', '思明', null, '李谆', '13328756228', '厦门市思明区湖滨一里96号201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3022', '李烨珊', '350521200407303528', '女', '547', null, '普通生', '汉族', '湖里', null, '庄雪娇', '13385928710', '福建省惠安县山霞镇东坑村东坑728号', '3', 'simingG');
INSERT INTO `student` VALUES ('3023', '李圆缘', '350824200406013823', '女', '547', null, '普通生', '汉族', '思明', null, '邱玉连', '13860132445', '福建省厦门市同安区西柯镇官田洋一里10号101室', '3', 'simingG');
INSERT INTO `student` VALUES ('3024', '刘晶莹', '350205200408293046', '女', '550', null, '普通生', '汉族', '海沧', null, '刘金锋', '13600948710', '福建省厦门市海沧区滨湖一里11号1101室', '3', 'simingG');
INSERT INTO `student` VALUES ('3025', '刘欣欣', '350627200405171027', '女', '547', null, '普通生', '汉族', '思明', null, '刘燕媚', '15880279786', '福建省厦门市湖里区东渡路252号金龙大厦A幢1203室', '3', 'simingG');
INSERT INTO `student` VALUES ('3026', '刘颖', '411622200404116945', '女', '548', null, '普通生', '汉族', '思明', null, '刘兴楷', '15711551217', '福建省厦门市思明区莲前街道前埔社前埔村283号', '3', 'simingG');
INSERT INTO `student` VALUES ('3027', '龙湘芝', '43048120040308682X', '女', '550', null, '普通生', '汉族', '湖里', null, '龙希荣', '18205928388', '福建省厦门市湖里区枋湖西三路307号1002室', '3', 'simingG');
INSERT INTO `student` VALUES ('3028', '罗钰臻', '350206200311250011', '男', '537', null, '民乐-竹笛', '汉族', '思明', null, '王丽华', '13696918393', '福建省厦门市思明区嘉禾路251号1306室', '4', 'simingG');
INSERT INTO `student` VALUES ('3029', '毛思睿', '350203200407124029', '女', '551', null, '普通生', '汉族', '思明', null, '毛通双', '13606926181', '湖滨中路95号703室', '3', 'simingG');
INSERT INTO `student` VALUES ('3030', '莫一诺', '350624200312230025', '女', '550', null, '普通生', '汉族', '思明', null, '吴丽萍', '15959625568', '福建省厦门市思明区思明东路48号718室', '3', 'simingG');
INSERT INTO `student` VALUES ('3031', '潘岳羽', '350206200404010017', '男', '547', null, '普通生', '汉族', '思明', null, '潘明', '18950056086', '福建省厦门市湖里区东渡路183号之五205室', '3', 'simingG');
INSERT INTO `student` VALUES ('3032', '阮丽容', '350982200511030085', '女', '546', null, '普通生', '汉族', '思明', null, '李秀云', '13400612065', '福建省厦门市思明区西林村西林社49号4楼403室', '3', 'simingG');
INSERT INTO `student` VALUES ('3033', '施杰磊', '350206200403290037', '男', '549', null, '普通生', '汉族', '湖里', null, '施光华', '13779998650', '福建省厦门市湖里区长岸路410号103', '3', 'simingG');
INSERT INTO `student` VALUES ('3034', '苏媛媛', '500384200307197425', '女', '547', null, '普通生', '汉族', '集美', null, '刘泽兰', '18950094379', '福建省厦门市集美区乐安西里129号', '3', 'simingG');
INSERT INTO `student` VALUES ('3035', '王世安', '360681200404236511', '男', '550', null, '普通生', '汉族', '湖里', null, '王金才', '13074857854', '厦门市湖里区殿前6组6062号', '3', 'simingG');
INSERT INTO `student` VALUES ('3036', '王思瑶', '362531200402175420', '女', '551', null, '普通生', '汉族', '海沧', null, '王爱明', '15980995064', '福建省厦门市海沧区霞阳社区西路13号807室', '3', 'simingG');
INSERT INTO `student` VALUES ('3037', '吴思橦', '350206200309121042', '女', '548', null, '普通生', '汉族', '思明', null, '吴文龙', '13950003577', '枋湖东四里水晶森林69号101', '3', 'simingG');
INSERT INTO `student` VALUES ('3038', '杨震', '340826200404200837', '男', '546', null, '普通生', '汉族', '海沧', null, '杨海华', '13646008310', '厦门市海沧区海富路255号303室', '3', 'simingG');
INSERT INTO `student` VALUES ('3039', '詹瑞涛', '35020520040315301X', '男', '546', null, '普通生', '汉族', '海沧', null, '吕秀蓉', '15080340230', '厦门市海沧区沧林东一里128号104室', '3', 'simingG');
INSERT INTO `student` VALUES ('3040', '张棋', '350823200405185811', '男', '549', null, '普通生', '汉族', '思明', null, '邱彩凤', '13959220272', '厦门市湖里区嘉园路55号502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3041', '张锐豪', '35062820040424151X', '男', '412', null, '足球-非守门员', '汉族', '思明', null, '张月明', '15359422566', '厦门市思明区龙虎山路学林雅苑301', '4', 'simingG');
INSERT INTO `student` VALUES ('3042', '张丝涵', '14020220040820704X', '女', '547', null, '普通生', '汉族', '湖里', null, '郑仙珠', '13806026101', '厦门市湖里区五缘西一里90号1202室', '3', 'simingG');
INSERT INTO `student` VALUES ('3043', '张妤薇', '350203200405062629', '女', '547', null, '普通生', '汉族', '思明', null, '张晓晖', '13806007077', '厦门市思明区文塔路90号1302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3044', '赵艺羚', '341802200312140048', '女', '551', null, '普通生', '汉族', '思明', null, '赵艾兵', '13850095693', '福建省厦门市思明区软件园望海路55号B203', '3', 'simingG');
INSERT INTO `student` VALUES ('3045', '郑炜芃', '350203200310033614', '男', '549', null, '普通生', '汉族', '思明', null, '高小虾', '13806091808', '厦门市思明区 莲前西路怡富花园260号702室', '3', 'simingG');
INSERT INTO `student` VALUES ('3046', '周文正', '350206200312253011', '男', '447', null, '足球-非守门员', '汉族', '思明', null, '周宗辉', '13806027250', '厦门市湖里区五通村凤头社25号', '4', 'simingG');
INSERT INTO `student` VALUES ('3047', '周宇敏', '35052420031127301X', '男', '428', null, '足球-非守门员', '汉族', '思明', null, '周池波', '13616028635', '厦门市思明区西林东里208-307', '4', 'simingG');
INSERT INTO `student` VALUES ('3048', '邱灵', '350822200311245928', '女', '509', null, '啦啦操-啦啦操（去思明就读）', '汉族', '湖里', null, '邱耀开', '15859265608', '厦门市湖里区县后阳光公寓东一里8号楼爱绿幼儿园', '4', 'simingG');
INSERT INTO `student` VALUES ('3049', '蔡梓涵', '230181200403240627', '女', '434', null, '竞技健美操-竞技健美操（去思明就读）', '满族', '海沧', null, '满雪松', '13616012553', '厦门市海沧区钟林里193号202室', '4', 'simingG');
INSERT INTO `student` VALUES ('3050', '蔡嘉豪', '350213200404102011', '男', '453', null, '棒球-非左打击球员', '汉族', '翔安', null, '蔡江旗', '15159202018', '福建省厦门市翔安区北门里137号', '4', 'simingG');
INSERT INTO `student` VALUES ('3051', '蔡文轩', '230302200408114430', '男', '550', null, '普通生', '汉族', '思明', null, '迟艳玲', '18050057303', '思明区建业路9号1404室', '3', 'simingG');
INSERT INTO `student` VALUES ('3052', '蔡玉洁', '350302200404152445', '女', '551', null, '普通生', '汉族', '思明', null, '蔡振华', '13959256283', '福建省厦门市思明区莲前西路93号106室', '3', 'simingG');
INSERT INTO `student` VALUES ('3053', '陈君灵', '35030520040424236X', '女', '547', null, '普通生', '汉族', '湖里', null, '林亚亲', '18950083892', '福建省厦门市湖里区嘉达花园1号楼704室', '3', 'simingG');
INSERT INTO `student` VALUES ('3054', '陈鹭杰', '350623200312124816', '男', '547', null, '跟踪生源', '汉族', '思明', null, '陈荣金', '18950116951', '厦门市湖里区台湾街24号707室', '1', 'simingG');
INSERT INTO `student` VALUES ('3055', '陈婉茹', '350524200404167427', '女', '548', null, '普通生', '汉族', '海沧', null, '林秋菊', '15959361799', '厦门市海沧区沧湖东一里536号1402室', '3', 'simingG');
INSERT INTO `student` VALUES ('3056', '陈筱涵', '350206200312095025', '女', '548', null, '普通生', '汉族', '湖里', null, '陈奕明', '13860180368', '福建省厦门市湖里区马垅村马垅社147号', '3', 'simingG');
INSERT INTO `student` VALUES ('3057', '陈新晟', '350426200405156014', '男', '549', null, '普通生', '汉族', '集美', null, '陈其凤', '18359213076', '集美区康成二里36号1104室', '3', 'simingG');
INSERT INTO `student` VALUES ('3058', '丁乐晨', '350203200408202623', '女', '549', null, '普通生', '汉族', '思明', null, '丁冬', '13779968089', '湖滨北路18号之三402室', '3', 'simingG');
INSERT INTO `student` VALUES ('3059', '范鹭', '350823200412281027', '女', '549', null, '普通生', '汉族', '思明', null, '范德武', '13606079328', '厦门市思明区黄厝塔头432号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3060', '葛祺威', '350206200408010014', '男', '548', null, '普通生', '汉族', '湖里', null, '徐善娟', '13606936861', '福建省厦门市湖里区金湖路金湖一里东海山庄32梯1001室', '3', 'simingG');
INSERT INTO `student` VALUES ('3061', '何雯欣', '350622200407083520', '女', '547', null, '普通生', '汉族', '湖里', null, '李丽仕', '15859262762', '湖里区江头后埔村后埔社344号', '3', 'simingG');
INSERT INTO `student` VALUES ('3062', '何毅', '350203200408122359', '男', '547', null, '普通生', '汉族', '思明', null, '何加汉', '13606019925', '福建省厦门市体育东村育秀里39号13C', '3', 'simingG');
INSERT INTO `student` VALUES ('3063', '黄楚珺', '350206200407205549', '女', '548', null, '普通生', '汉族', '湖里', null, '徐冬', '13806043232', '厦门市湖里区五缘西三里24号1506室', '3', 'simingG');
INSERT INTO `student` VALUES ('3064', '黄嘉欣', '350203200401230322', '女', '549', null, '普通生', '汉族', '湖里', null, '黄朝阳', '13600944417', '厦门市湖里区嘉禾路366号1602室', '3', 'simingG');
INSERT INTO `student` VALUES ('3065', '江蕾', '35072120040411292X', '女', '550', null, '普通生', '汉族', '集美', null, '江仁忠', '15960839897', '福建省厦门市集美区灌口镇黄庄三里301号', '3', 'simingG');
INSERT INTO `student` VALUES ('3066', '蓝素萍', '350823200312041624', '女', '547', null, '普通生', '畲族', '湖里', null, '蓝耀来', '18965128149', '厦门市湖里区祥店社286号502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3067', '李德凯', '430802200405310318', '男', '548', null, '普通生', '汉族', '思明', null, '李传勇', '13606025875', '福建省厦门市思明区莲前西路357号401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3068', '李慧娜', '350524200311294523', '女', '551', null, '普通生', '汉族', '海沧', null, '李彩梅', '13074823576', '厦门海沧石塘南片246号', '3', 'simingG');
INSERT INTO `student` VALUES ('3069', '李佳铭', '350524200403151511', '男', '547', null, '普通生', '汉族', '思明', null, '李清枝', '13850070576', '福建省厦门市思明区莲花二村和光里1号505', '3', 'simingG');
INSERT INTO `student` VALUES ('3070', '练伟鹏', '35082420031018461X', '男', '475', null, '足球-非守门员', '汉族', '湖里', null, '廖元珍', '18359270095', '福建省厦门市湖里区南片41号303号', '4', 'simingG');
INSERT INTO `student` VALUES ('3071', '廖世杰', '350203200405213319', '男', '550', null, '普通生', '汉族', '思明', null, '廖山海', '13799849695', '福建省厦门市思明区盈翠里17号501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3072', '廖宇腾', '350524200312060550', '男', '549', null, '普通生', '汉族', '湖里', null, '王燕评', '18950052433', '福建省厦门市集美区后溪镇珩山一里7号1506室', '3', 'simingG');
INSERT INTO `student` VALUES ('3073', '林敏', '350505200402078528', '女', '549', null, '普通生', '汉族', '思明', null, '林细辉', '13600919342', '海沧区沧虹路115号1512室', '3', 'simingG');
INSERT INTO `student` VALUES ('3074', '林佩汐', '350203200406241629', '女', '549', null, '普通生', '汉族', '思明', null, '林鹭伟', '13906018406', '厦门市祥店里6号之一1203室', '3', 'simingG');
INSERT INTO `student` VALUES ('3075', '林育贤', '350205200403312527', '女', '549', null, '普通生', '汉族', '海沧', null, '林邵明', '13806044977', '海沧区海沧街道锦里村北片38号', '3', 'simingG');
INSERT INTO `student` VALUES ('3076', '林志宏', '350203200311113317', '男', '550', null, '普通生', '汉族', '思明', null, '林金捷', '18950048499', '福建省厦门市思明区龙山南路92号202室', '3', 'simingG');
INSERT INTO `student` VALUES ('3077', '刘毅', '360782200403076212', '男', '546', null, '普通生', '汉族', '思明', null, '刘冬华', '18650810188', '思明区红本部街24号', '3', 'simingG');
INSERT INTO `student` VALUES ('3078', '缪沛航', '350924200402290095', '男', '547', null, '普通生', '汉族', '海沧', null, '缪长森', '15859257333', '福建省厦门市海沧区海富里360号1001室', '3', 'simingG');
INSERT INTO `student` VALUES ('3079', '苏锐林', '350203200402233314', '男', '550', null, '普通生', '汉族', '思明', null, '苏新辉', '13313869369', '福建省厦门市嘉禾路166号1906室', '3', 'simingG');
INSERT INTO `student` VALUES ('3080', '王慧云', '350505200311258021', '女', '548', null, '普通生', '汉族', '思明', null, '马永成', '13860453041', '厦门市思明区东浦一里建发花园3梯202室', '3', 'simingG');
INSERT INTO `student` VALUES ('3081', '王建雄', '513434200306203412', '男', '547', null, '跟踪生源', '藏族', '海沧', null, '王友刚', '15759237962', '厦门市海沧区新安村北片301号209室', '1', 'simingG');
INSERT INTO `student` VALUES ('3082', '王业辉', '513921200308272492', '男', '550', null, '普通生', '汉族', '集美', null, '彭信兰', '13860148261', '福建省厦门市集美区滨水一里112号滨水学校初中2016级', '3', 'simingG');
INSERT INTO `student` VALUES ('3083', '吴俊伟', '350622200406223018', '男', '426', null, '棒球-非左打击球员', '汉族', '思明', null, '吴速云', '15280255750', '厦门市思明区洪文泥窟社南片区68-2', '4', 'simingG');
INSERT INTO `student` VALUES ('3084', '吴思榆', '350582200409102060', '女', '551', null, '普通生', '汉族', '思明', null, '张利萍', '15659516222', '厦门市思明区文屏路领秀城4号楼2501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3085', '吴泽旭', '43062320040531001X', '男', '547', null, '普通生', '汉族', '思明', null, '刘芳', '13860467503', '厦门市思明区阳台山路9号之二204室', '3', 'simingG');
INSERT INTO `student` VALUES ('3086', '杨俊涛', '411623200403069012', '男', '546', null, '普通生', '汉族', '湖里', null, '杨建设', '18859206301', '河南省周口市川汇区李埠口乡姜庄村一组', '3', 'simingG');
INSERT INTO `student` VALUES ('3087', '杨昕', '350582200309023568', '女', '549', null, '普通生', '汉族', '湖里', null, '黄群芳', '15160079788', '厦门市湖里区五缘西三里150号401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3088', '叶林涛', '350206200408225517', '男', '546', null, '普通生', '汉族', '思明', null, '林桂花', '13950085297', '福建省厦门市思明区岭兜佳园6号楼1003室', '3', 'simingG');
INSERT INTO `student` VALUES ('3089', '余文健', '350205200312043034', '男', '546', null, '普通生', '汉族', '海沧', null, '余智龙', '18906008719', '福建省厦门市海沧区滨湖东路444号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3090', '余知雅', '350203200311301326', '女', '546', null, '跟踪生源', '汉族', '思明', null, '余庆明', '13600912145', '福建省厦门市思明区角滨路11号源隆花园A座701室', '1', 'simingG');
INSERT INTO `student` VALUES ('3091', '张恒毅', '350881200305220011', '男', '551', null, '跟踪生源', '汉族', '海沧', null, '李惠燕', '13606086435', '福建省厦门市海沧区钟林里43号402室', '1', 'simingG');
INSERT INTO `student` VALUES ('3092', '张瑶', '350823200406056720', '女', '550', null, '普通生', '汉族', '湖里', null, '张爱民', '18150083759', '厦门市湖里区尚忠社121号601', '3', 'simingG');
INSERT INTO `student` VALUES ('3093', '章旻烨', '350102200412111642', '女', '547', null, '普通生', '汉族', '思明', null, '章冰', '18030188269', '福建省厦门市湖里区殿前街道翔鹭花城三期11#902室', '3', 'simingG');
INSERT INTO `student` VALUES ('3094', '郑慧琪', '350822200405225522', '女', '548', null, '普通生', '汉族', '海沧', null, '郑振望', '18259265638', '厦门市海沧区青礁村院前33号', '3', 'simingG');
INSERT INTO `student` VALUES ('3095', '周颖', '431023200312230529', '女', '550', null, '普通生', '汉族', '思明', null, '周桂成', '18950166266', '东浦路66号-2号2101室', '3', 'simingG');
INSERT INTO `student` VALUES ('3096', '朱子熙', '350427200407050017', '男', '548', null, '普通生', '汉族', '集美', null, '朱灿彬', '18650981199', '福建省厦门市海沧钟林路西雅图八号楼2303室', '3', 'simingG');
INSERT INTO `student` VALUES ('3097', '邹嘉伟', '350629200311011017', '男', '547', null, '普通生', '汉族', '湖里', null, '邹国金', '13606940078', '福建省华安县沙建镇庭安村下楼35号', '3', 'simingG');
INSERT INTO `student` VALUES ('3098', '吴尚涵', '35020320040716301X', '男', '538', null, '田径-田径（跑跳类）（去思明就读）', '汉族', '思明', null, '吴乙斌', '13806015359', '福建省厦门市镇海明珠B幢2801', '4', 'simingG');
INSERT INTO `student` VALUES ('3099', '程茹欣', '500241200309094627', '女', '455', null, '啦啦操-啦啦操（去思明就读）', '土家族', '湖里', null, '程俊', '15160090611', '福建省厦门市湖里区禾山街道尚忠社309号', '4', 'simingG');
INSERT INTO `student` VALUES ('3100', '林珺', '350524200312283527', '女', '511', null, '啦啦操-啦啦操（去思明就读）', '汉族', '湖里', null, '张日花', '18650003503', '福建省厦门市湖里区江浦南里17号1102室', '4', 'simingG');
INSERT INTO `student` VALUES ('3101', '蔡瑾', '350305200408050621', '女', '547', null, '普通生', '汉族', '集美', null, '蔡雄强', '13950769966', '福建省莆田市涵江区国欢镇人民政府', '3', 'simingG');
INSERT INTO `student` VALUES ('3102', '曾晶', '350205200403293047', '女', '550', null, '普通生', '汉族', '海沧', null, '曾庆荣', '18650010813', '厦门市海沧区沧虹路金龙商城二期825号605室', '3', 'simingG');
INSERT INTO `student` VALUES ('3103', '陈博闻', '350203200311212614', '男', '549', null, '普通生', '汉族', '湖里', null, '黄幼绿', '18906029155', '厦门市湖里区高林居住区一里8号楼26层2604', '3', 'simingG');
INSERT INTO `student` VALUES ('3104', '陈彩萍', '350628200311075567', '女', '548', null, '普通生', '汉族', '海沧', null, '陈佳山', '15260218352', '海沧区锦里村中片61号', '3', 'simingG');
INSERT INTO `student` VALUES ('3105', '陈涵基', '35020320040902163X', '男', '547', null, '普通生', '汉族', '思明', null, '陈灿', '13606912934', '厦门市思明区石亭路127号102室', '3', 'simingG');
INSERT INTO `student` VALUES ('3106', '陈秋怡', '510522200309045584', '女', '546', null, '普通生', '汉族', '海沧', null, '何小兰', '18650040096', '福建省厦门市海沧区沧翔路89号C102室', '3', 'simingG');
INSERT INTO `student` VALUES ('3107', '陈昱荣', '350206200309072033', '男', '549', null, '普通生', '汉族', '湖里', null, '陈福强', '13859993344', '厦门市湖里区高殿村殿前6组6043号', '3', 'simingG');
INSERT INTO `student` VALUES ('3108', '邓海琳', '350211200405285523', '女', '549', null, '普通生', '汉族', '集美', null, '邓新发', '13860110017', '福建省厦门市集美区叶厝村下梧社二组60号', '3', 'simingG');
INSERT INTO `student` VALUES ('3109', '冯博', '350205200407173034', '男', '550', null, '普通生', '汉族', '思明', null, '冯浩', '13806078851', '厦门市思明区岭兜西一里3号1105室', '3', 'simingG');
INSERT INTO `student` VALUES ('3110', '付语涵', '350205200405033046', '女', '445', null, '民乐-古筝', '汉族', '海沧', null, '付钰', '15259256081', '福建省厦门市海沧区滨湖一里31号1604室', '4', 'simingG');
INSERT INTO `student` VALUES ('3111', '郭乐彤', '350203200311303620', '女', '547', null, '普通生', '汉族', '思明', null, '朱燕群', '13600920045', '福建省厦门市思明区古兴里3号404室', '3', 'simingG');
INSERT INTO `student` VALUES ('3112', '郭子怡', '360427200404090023', '女', '547', null, '普通生', '汉族', '思明', null, '郭晓松', '13799791970', '福建省厦门市湖里区长浩一里翔鹭花城23#201', '3', 'simingG');
INSERT INTO `student` VALUES ('3113', '何思琪', '350203200408252022', '女', '547', null, '普通生', '汉族', '思明', null, '何庆灿', '13906040930', '福建省厦门市思明区思明南路176号703室', '3', 'simingG');
INSERT INTO `student` VALUES ('3114', '何锡煌', '350623200310316910', '男', '548', null, '普通生', '汉族', '湖里', null, '林碧珍', '13376984936', '厦门市湖里区殿前街道5组5118号', '3', 'simingG');
INSERT INTO `student` VALUES ('3115', '黄佳婧', '350203200402232047', '女', '550', null, '普通生', '汉族', '思明', null, '黄墒水', '13003923222', '福建省厦门市湖里区高林一里32号802室', '3', 'simingG');
INSERT INTO `student` VALUES ('3116', '黄江彬', '350583200301136011', '男', '551', null, '普通生', '汉族', '湖里', null, '洪四川', '13600919720', '福建省南安市东田镇蓝溪村前街南66号', '3', 'simingG');
INSERT INTO `student` VALUES ('3117', '黄薪予', '350203200401071624', '女', '550', null, '普通生', '汉族', '思明', null, '黄伟平', '18959287879', '东浦一里197号402号', '3', 'simingG');
INSERT INTO `student` VALUES ('3118', '江楠', '350206200408200029', '女', '549', null, '普通生', '汉族', '湖里', null, '邹南英', '18965152778', '福建省厦门市湖里区金尚小区金泰里31栋47号101室', '3', 'simingG');
INSERT INTO `student` VALUES ('3119', '李琪', '510503200312175284', '女', '547', null, '普通生', '汉族', '思明', null, '李学江', '15980823731', '厦门市湖里区殿前三航六机电公程处五组5105', '3', 'simingG');
INSERT INTO `student` VALUES ('3120', '李新源', '350582200407132530', '男', '546', null, '普通生', '汉族', '思明', null, '李剑虹', '13860130066', '联兴路27号1902室', '3', 'simingG');
INSERT INTO `student` VALUES ('3121', '李子园', '350203200408042340', '女', '516', null, '民乐-中阮', '汉族', '思明', null, '李政峰', '13003988537', '厦港新村5号李政峰', '4', 'simingG');
INSERT INTO `student` VALUES ('3122', '林以祯', '350204200303260022', '女', '550', null, '普通生', '汉族', '思明', null, '林琅', '13850093948', '福建省厦门市思明区菜妈街46号501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3123', '林云天', '350203200408114017', '男', '550', null, '普通生', '汉族', '思明', null, '林少军', '15359278277', '福建省厦门市思明区厦大白城七号201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3124', '刘曾曾', '35062820040722052X', '女', '550', null, '普通生', '汉族', '湖里', null, '刘平', '15860731720', '福建省厦门市湖里区悦华路古龙公寓12号楼3梯902室', '3', 'simingG');
INSERT INTO `student` VALUES ('3125', '毛梓乔', '362322200407130021', '女', '551', null, '普通生', '汉族', '思明', null, '毛盛荣', '13799277523', '福建省厦门市思明区开元路269号201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3126', '苏依琳', '350203200406153645', '女', '547', null, '普通生', '汉族', '思明', null, '苏福生', '13799792792', '西林西里62号508', '3', 'simingG');
INSERT INTO `student` VALUES ('3127', '汤雨琦', '350206200406032025', '女', '549', null, '普通生', '汉族', '湖里', null, '马炳秀', '13606919241', '福建省厦门市湖里区金湖一里36号102室', '3', 'simingG');
INSERT INTO `student` VALUES ('3128', '王靖岚', '35020320040828135X', '男', '546', null, '普通生', '汉族', '思明', null, '王澍', '13599511588', '福建省厦门市思明区前埔西路200号701室', '3', 'simingG');
INSERT INTO `student` VALUES ('3129', '王镕蘋', '511126200312065222', '女', '547', null, '普通生', '汉族', '湖里', null, '王忠华', '13774657098', '福建省厦门市思明区鼓浪屿鹿礁路101号', '3', 'simingG');
INSERT INTO `student` VALUES ('3130', '王伟杰', '350205200405172011', '男', '548', null, '普通生', '汉族', '海沧', null, '王章亮', '13599926879', '福建省厦门市海沧区东孚镇东瑶村东瑶社44号', '3', 'simingG');
INSERT INTO `student` VALUES ('3131', '王逸风', '52210120031012321X', '男', '505', null, '棒球-非左打击球员', '汉族', '思明', null, '王向东', '13860477546', '福建省厦门市思明区莲前西路635号402室', '4', 'simingG');
INSERT INTO `student` VALUES ('3132', '邬佳怡', '350681200312082023', '女', '551', null, '普通生', '汉族', '思明', null, '邬岳军', '13860183793', '古楼北里52号705', '3', 'simingG');
INSERT INTO `student` VALUES ('3133', '许文凯', '350213200312060010', '男', '549', null, '普通生', '汉族', '湖里', null, '杨亚惠', '13850051655', '福建省厦门市华昌路159号809', '3', 'simingG');
INSERT INTO `student` VALUES ('3134', '许兆显', '350206200403250051', '男', '547', null, '普通生', '汉族', '思明', null, '许延南', '18965803117', '厦门市湖滨北路27号世纪海湾2号楼606室', '3', 'simingG');
INSERT INTO `student` VALUES ('3135', '杨博涵', '500383200311118770', '男', '549', null, '普通生', '汉族', '湖里', null, '董太群', '13860469232', '福建省厦门市湖里区江宁里25号502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3136', '叶良皓', '350203200401251318', '男', '546', null, '普通生', '汉族', '思明', null, '叶兆寅', '13606936185', '福建省厦门市思明区龙华里35号401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3137', '叶垭鑫', '350722200402270023', '女', '547', null, '普通生', '汉族', '海沧', null, '叶新平', '18950655005', '福建省厦门市海沧区石塘村南片136号606室', '3', 'simingG');
INSERT INTO `student` VALUES ('3138', '张彬婷', '350322200402033026', '女', '548', null, '普通生', '汉族', '海沧', null, '张飞彪', '18859284753', '海沧区锦里村西片108号401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3139', '张慧芳', '350525200311294028', '女', '551', null, '普通生', '汉族', '思明', null, '张建忠', '15859452036', '厦门市湖里区蔡塘社167号之一101', '3', 'simingG');
INSERT INTO `student` VALUES ('3140', '张文琪', '350424200312203026', '女', '548', null, '普通生', '汉族', '集美', null, '吴小琴', '13950069419', '福建省厦门市集美区叶厝里198号', '3', 'simingG');
INSERT INTO `student` VALUES ('3141', '张子恒', '350213200402232015', '男', '421', null, '棒球-非左打击球员', '汉族', '翔安', null, '郑小青', '13110591648', '福建省厦门市翔安区阳塘南里454号', '4', 'simingG');
INSERT INTO `student` VALUES ('3142', '赵明珠', '350305200410201468', '女', '550', null, '跟踪生源', '汉族', '集美', null, '赵瑞强', '15805933493', '福建省厦门市集美区滨水一里112号滨水学校初中2016级', '1', 'simingG');
INSERT INTO `student` VALUES ('3143', '郑炫凯', '350681200309190517', '男', '549', null, '跟踪生源', '汉族', '思明', null, '郑志勇', '15359282959', '思明区禾祥西路13号206室', '1', 'simingG');
INSERT INTO `student` VALUES ('3144', '钟宸', '350206200302190010', '男', '546', null, '跟踪生源', '汉族', '思明', null, '林丽英', '13860182458', '福建省厦门市湖里区嘉园里29号312室', '1', 'simingG');
INSERT INTO `student` VALUES ('3145', '钟玮麒', '350824200404122532', '男', '546', null, '跟踪生源', '汉族', '思明', null, '钟圆', '13850003400', '思明区禾祥西路686-34', '1', 'simingG');
INSERT INTO `student` VALUES ('3146', '钟炜壕', '350505200310276519', '男', '551', null, '跟踪生源', '畲族', '湖里', null, '钟惠锋', '13859951879', '福建省厦门市湖里区西潘社212号302室', '1', 'simingG');
INSERT INTO `student` VALUES ('3147', '周俊斌', '362326200311046015', '男', '491', null, '足球-非守门员', '汉族', '思明', null, '周欣华', '15960842464', '厦门市思明区龙山东路8-201', '4', 'simingG');
INSERT INTO `student` VALUES ('3148', '庄诗妍', '350213200407251020', '女', '549', null, '跟踪生源', '汉族', '湖里', null, '卓丽娜', '18750275482', '厦门市湖里区华昌路140号鸿展大厦', '1', 'simingG');
INSERT INTO `student` VALUES ('3149', '许玥', '35020320030922232X', '女', '472', null, '啦啦操-啦啦操（去思明就读）', '汉族', '思明', null, '许章鑫', '13906031360', '福建省厦门市湖里区东渡路51号A座404', '4', 'simingG');
INSERT INTO `student` VALUES ('3150', '许佩雯', '350203200401251342', '女', '493', null, '啦啦操-啦啦操（去思明就读）', '汉族', '思明', null, '郑慧玲', '15305028008', '思明区禾祥西路186号402室', '4', 'simingG');
INSERT INTO `student` VALUES ('3151', '曹珉柯', '350205200402263014', '男', '547', null, '跟踪生源', '汉族', '思明', null, '曹新元', '13859990371', '思明区东浦路203号之一301室', '1', 'simingG');
INSERT INTO `student` VALUES ('3152', '曾焕琦', '350628200408206017', '男', '547', null, '跟踪生源', '汉族', '集美', null, '曾元中', '13559484018', '福建省平和县崎岭乡南湖村祥和楼75号', '1', 'simingG');
INSERT INTO `student` VALUES ('3153', '陈鹂', '511324200408196604', '女', '550', null, '普通生', '汉族', '思明', null, '罗红英', '15750765739', '厦门市湖里区保税区象兴一路11号宝象国际商务中心一楼大堂', '3', 'simingG');
INSERT INTO `student` VALUES ('3154', '陈莹', '350203200312021027', '女', '489', null, '民乐-琵琶', '汉族', '思明', null, '张翠丽', '15305928365', '福建省厦门市思明区局口街8号104', '4', 'simingG');
INSERT INTO `student` VALUES ('3155', '陈云娜', '350521200402263029', '女', '551', null, '普通生', '汉族', '思明', null, '孙培卿', '18950171528', '东坪二里122号602室', '3', 'simingG');
INSERT INTO `student` VALUES ('3156', '陈鋆颖', '350203200310283322', '女', '547', null, '普通生', '汉族', '思明', null, '陈隆亮', '13600939215', '福建省厦门市思明区流芳里14号303室', '3', 'simingG');
INSERT INTO `student` VALUES ('3157', '戴晨爔', '350821200405014227', '女', '549', null, '普通生', '汉族', '思明', null, '詹丽', '15959292953', '厦门市思明区侨福城侨龙里2号501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3158', '邓宇轩', '350783200401274519', '男', '421', null, '足球-非守门员', '汉族', '湖里', null, '吴钦秀', '13600923868', '福建省建瓯市玉山镇东山村庆元电站坪1号', '4', 'simingG');
INSERT INTO `student` VALUES ('3159', '杜圳炀', '350504200404221555', '男', '551', null, '普通生', '汉族', '思明', null, '杜瑞生', '13600932126', '福建省厦门市思明区双莲池83号302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3160', '方皓昀', '350203200407223019', '男', '548', null, '普通生', '汉族', '思明', null, '方志山', '18959288317', '厦门市思明区南华路36号之五302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3161', '韩三阅', '350203200404080323', '女', '527', null, '民乐-琵琶', '汉族', '思明', null, '张毓苗', '13666015567', '福建省厦门市湖里区金鼎路35号二号楼304室', '4', 'simingG');
INSERT INTO `student` VALUES ('3162', '何昱曈', '330282200309175027', '女', '550', null, '普通生', '汉族', '思明', null, '何剑锋', '18906021667', '厦门市思明区前埔北区一里212之8', '3', 'simingG');
INSERT INTO `student` VALUES ('3163', '黄尹', '35020320031222334X', '女', '550', null, '普通生', '汉族', '思明', null, '黄旭', '13950004851', '福建省厦门市思明区龙腾里2号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3164', '李景晖', '350583200402144918', '男', '549', null, '普通生', '汉族', '集美', null, '李培勤', '15359306732', '福建省厦门市集美区兑山村下蔡社八组122号', '3', 'simingG');
INSERT INTO `student` VALUES ('3165', '李蓉', '350203200401263327', '女', '549', null, '普通生', '汉族', '思明', null, '李志雄', '13600933585', '福建省厦门市思明区蓉芳里5号401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3166', '李诗雨', '361125200401211426', '女', '546', null, '普通生', '汉族', '湖里', null, '王和仙', '15859276970', '厦门市翔安区新圩镇中澳城新曙二里6号3#A梯803号', '3', 'simingG');
INSERT INTO `student` VALUES ('3167', '李宗晟', '350213200401311037', '男', '548', null, '普通生', '汉族', '湖里', null, '陈菊花', '13365040878', '福建省厦门市湖里区后坑前社153号603室', '3', 'simingG');
INSERT INTO `student` VALUES ('3168', '林弼邦', '350525200309016635', '男', '550', null, '普通生', '汉族', '湖里', null, '林丽民', '15359244159', '福建省厦门市湖里区塘边社15-1号501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3169', '林冬鹏', '35021120040229351X', '男', '508', null, '管弦乐-大提琴', '汉族', '思明', null, '陈美合', '15060707877', '福建省厦门市思明区凤屿路378号203室', '4', 'simingG');
INSERT INTO `student` VALUES ('3170', '林诣铮', '350524200403250536', '男', '550', null, '普通生', '汉族', '湖里', null, '林敬华', '13850055785', '福建省厦门市湖里区和悦里89号602室', '3', 'simingG');
INSERT INTO `student` VALUES ('3171', '刘瑶', '362329200411215719', '男', '547', null, '普通生', '汉族', '思明', null, '王美莲', '18250882071', '厦门市思明区洪莲中路213-3号312室', '3', 'simingG');
INSERT INTO `student` VALUES ('3172', '罗渊文', '350821200403193313', '男', '546', null, '普通生', '汉族', '海沧', null, '肖桂兰', '13720898918', '福建省厦门市海沧区兴港五里59号807室', '3', 'simingG');
INSERT INTO `student` VALUES ('3173', '马雪芳', '350627200310313520', '女', '547', null, '普通生', '汉族', '湖里', null, '卢玉梅', '15960829602', '福建省厦门市湖里区蔡塘社451号', '3', 'simingG');
INSERT INTO `student` VALUES ('3174', '秦鹭杰', '411623200312047723', '女', '546', null, '普通生', '汉族', '海沧', null, '程花', '18005023926', '福建省厦门市海沧区兴港五里67号303室', '3', 'simingG');
INSERT INTO `student` VALUES ('3175', '师万林', '500105200404081815', '男', '547', null, '跟踪生源', '汉族', '湖里', null, '王付英', '18060988670', '重庆市江北区建新东路53号附5号22-2', '1', 'simingG');
INSERT INTO `student` VALUES ('3176', '万丰源', '421083200312070013', '男', '549', null, '跟踪生源', '汉族', '海沧', null, '万新成', '15959299429', '福建省厦门市海沧区嵩屿南二里101号1605', '1', 'simingG');
INSERT INTO `student` VALUES ('3177', '王佳钰', '350203200406183625', '女', '550', null, '跟踪生源', '汉族', '湖里', null, '郭锦媛', '13159268308', '厦门市思明区莲前街道洪文石村南片区16号', '1', 'simingG');
INSERT INTO `student` VALUES ('3178', '王敏敏', '350524200408233524', '女', '548', null, '跟踪生源', '汉族', '思明', null, '许足兰', '13358399235', '前埔二里209号1701', '1', 'simingG');
INSERT INTO `student` VALUES ('3179', '王永超', '350524200311065579', '男', '447', null, '足球-非守门员', '汉族', '思明', null, '王清江', '13950060050', '厦门市湖里区台湾街290号B栋1314', '4', 'simingG');
INSERT INTO `student` VALUES ('3180', '吴俊霖', '350622200405193013', '男', '547', null, '跟踪生源', '汉族', '思明', null, '李丽华', '13860428879', '福建省厦门市湖里区和宁里64号601室', '1', 'simingG');
INSERT INTO `student` VALUES ('3181', '吴思涵', '350802200312181561', '女', '549', null, '跟踪生源', '汉族', '湖里', null, '罗宝惠', '15280231410', '福建省厦门市湖里区华昌路7号201室', '1', 'simingG');
INSERT INTO `student` VALUES ('3182', '吴宇豪', '350623200403110014', '男', '550', null, '跟踪生源', '汉族', '湖里', null, '吴民鑫', '13850055010', '福建省厦门市湖里区长岸路88号601室', '1', 'simingG');
INSERT INTO `student` VALUES ('3183', '许若梵', '350203200312163324', '女', '548', null, '普通生', '汉族', '思明', null, '许伯辉', '13616054054', '福建省厦门市思明区莲花五村龙昌里29号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3184', '杨济铭', '35062420040221001X', '男', '546', null, '普通生', '汉族', '海沧', null, '杨贵海', '18359718651', '海沧区霞光东里99号2506室', '3', 'simingG');
INSERT INTO `student` VALUES ('3185', '杨绍昆', '350623200406071014', '男', '548', null, '普通生', '汉族', '思明', null, '杨小芬', '18906049820', '厦门市思明区大字酒巷三号后门', '3', 'simingG');
INSERT INTO `student` VALUES ('3186', '姚志杨', '350525200407111011', '男', '551', null, '普通生', '汉族', '思明', null, '姚启泼', '15980815828', '福建省厦门市思明区长青路504号108室', '3', 'simingG');
INSERT INTO `student` VALUES ('3187', '叶晴雯', '350212200405234028', '女', '549', null, '普通生', '汉族', '思明', null, '叶进丁', '15160048449', '湖里南片56号', '3', 'simingG');
INSERT INTO `student` VALUES ('3188', '詹玉慧', '411623200310237320', '女', '547', null, '普通生', '汉族', '思明', null, '袁水英', '18950161867', '福建省厦门市翔安区新店镇洪琳湖一里9号401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3189', '张思思', '35082220031107222X', '女', '549', null, '普通生', '汉族', '湖里', null, '曾利珍', '13600959929', '福建省厦门市湖里区县后社11号307室', '3', 'simingG');
INSERT INTO `student` VALUES ('3190', '张蔚翔', '35020320040218361X', '男', '551', null, '普通生', '汉族', '思明', null, '张维颖', '13959295109', '福建省厦门市思明区盈翠里10号2008室', '3', 'simingG');
INSERT INTO `student` VALUES ('3191', '张文博', '41162220030310155X', '男', '548', null, '普通生', '汉族', '思明', null, '杨莉红', '13003973159', '思明区前埔社区前村510号403室', '3', 'simingG');
INSERT INTO `student` VALUES ('3192', '张莹娜', '350203200310061623', '女', '549', null, '普通生', '汉族', '海沧', null, '郑丽明', '13376923170', '福建省厦门市海沧区沧元路48号603室', '3', 'simingG');
INSERT INTO `student` VALUES ('3193', '张子昀', '35062720040328006X', '女', '551', null, '普通生', '汉族', '思明', null, '郑翔', '18950075588', '福建省厦门市思明区龙华里2号202室', '3', 'simingG');
INSERT INTO `student` VALUES ('3194', '郑思涛', '350213200401192015', '男', '547', null, '普通生', '汉族', '思明', null, '郑财福', '13906001189', '福建省厦门市思明区莲景二里12号1105室', '3', 'simingG');
INSERT INTO `student` VALUES ('3195', '郑薏', '522229200312074425', '女', '551', null, '普通生', '土家族', '集美', null, '邹清平', '15710648490', '贵州省铜仁市松桃苗族自治县甘龙镇官坟村秦家山组', '3', 'simingG');
INSERT INTO `student` VALUES ('3196', '郑宇翔', '350481200312130514', '男', '547', null, '普通生', '汉族', '海沧', null, '郑永龙', '13799258971', '福建省厦门市海沧区沧虹路115号510室', '3', 'simingG');
INSERT INTO `student` VALUES ('3197', '周磊', '350203200406104317', '男', '549', null, '跟踪生源', '汉族', '思明', null, '周天生', '18965824728', '福建省厦门市思明区何厝村顶何社149号', '1', 'simingG');
INSERT INTO `student` VALUES ('3198', '朱伊南', '35020620040331553X', '男', '546', null, '跟踪生源', '汉族', '思明', null, '孙彬', '13606072157', '福建省厦门市思明区玉荷里31号703室', '1', 'simingG');
INSERT INTO `student` VALUES ('3199', '任佳明', '350203200408262327', '女', '500', null, '啦啦操-啦啦操（去思明就读）', '汉族', '思明', null, '李雪梅', '13806022148', '思明区金桥路199号404室', '4', 'simingG');
INSERT INTO `student` VALUES ('3200', '曹原青', '411602200309262527', '女', '549', null, '跟踪生源', '汉族', '湖里', null, '杨雪界', '13860484945', '湖里区后坑村湖边下社155号', '1', 'simingG');
INSERT INTO `student` VALUES ('3201', '陈冠宇', '350402200310294018', '男', '548', null, '跟踪生源', '汉族', '思明', null, '陈家利', '18950100296', '福建省厦门市思明区东浦路53号102 室', '1', 'simingG');
INSERT INTO `student` VALUES ('3202', '陈浩宇', '350206200407061012', '男', '546', null, '跟踪生源', '汉族', '湖里', null, '陈锦贵', '13666087818', '福建省厦门市湖里区后埔东里101号', '1', 'simingG');
INSERT INTO `student` VALUES ('3203', '陈慧鑫', '350623200311247232', '男', '461', null, '足球-非守门员', '汉族', '思明', null, '林秀琴', '17306017685', '厦门市湖里区乌石浦三里45-101', '4', 'simingG');
INSERT INTO `student` VALUES ('3204', '陈嘉澍', '350181200406111713', '男', '551', null, '跟踪生源', '汉族', '思明', null, '陈峰', '13806029944', '福建省厦门市思明区莲前西路龙源里25号源昌·君悦山8号楼2梯3602室', '1', 'simingG');
INSERT INTO `student` VALUES ('3205', '陈瑾林', '350206200408240020', '女', '547', null, '普通生', '汉族', '湖里', null, '林秀花', '13860135008', '福建厦门湖里凤湖街61号', '3', 'simingG');
INSERT INTO `student` VALUES ('3206', '陈刘涛', '350322200408295115', '男', '547', null, '普通生', '汉族', '湖里', null, '刘会明', '13950064005', '福建省厦门市湖里区长浩一里28号204室', '3', 'simingG');
INSERT INTO `student` VALUES ('3207', '陈淇', '35052620040810002X', '女', '548', null, '普通生', '汉族', '思明', null, '杨明銮', '18906048368', '厦门市思明区西林东路173号703室', '3', 'simingG');
INSERT INTO `student` VALUES ('3208', '陈睿昕', '350203200310273028', '女', '551', null, '普通生', '汉族', '思明', null, '陈永建', '13459012648', '厦门市思明区寿彭路1号7号楼504', '3', 'simingG');
INSERT INTO `student` VALUES ('3209', '陈世雄', '350524200402213514', '男', '549', null, '普通生', '汉族', '湖里', null, '陈德金', '13600955108', '福建省厦门市湖里区台湾街450号C座201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3210', '陈思杰', '350524200406061511', '男', '548', null, '普通生', '汉族', '海沧', null, '陈小珍', '13625969567', '福建省厦门市海沧区滨湖一里83号1102室', '3', 'simingG');
INSERT INTO `student` VALUES ('3211', '陈馨语', '350206200401315528', '女', '549', null, '普通生', '汉族', '思明', null, '陈根勇', '13600918765', '厦门市思明区溪岸路62号', '3', 'simingG');
INSERT INTO `student` VALUES ('3212', '陈一', '350203200406051331', '男', '547', null, '普通生', '汉族', '思明', null, '陈宾', '13395021583', '湖明路130号202室', '3', 'simingG');
INSERT INTO `student` VALUES ('3213', '陈艺文', '430623200403200028', '女', '547', null, '普通生', '汉族', '湖里', null, '张佳红', '15305922529', '福建省厦门市湖里区金山西二里303号302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3214', '董伯凯', '350203200312171017', '男', '549', null, '普通生', '汉族', '思明', null, '林细引', '13606903107', '思明区局口街112号', '3', 'simingG');
INSERT INTO `student` VALUES ('3215', '冯佳节', '340321200401101164', '女', '549', null, '普通生', '汉族', '思明', null, '冯继军', '13696959977', '福建省厦门市思明区岳阳小区135号601室', '3', 'simingG');
INSERT INTO `student` VALUES ('3216', '何瑾轩', '340811200312166315', '男', '547', null, '普通生', '汉族', '思明', null, '何宏哲', '15960267206', '厦门市思明区龙山南路110号101室', '3', 'simingG');
INSERT INTO `student` VALUES ('3217', '洪尧坤', '350212200309166010', '男', '390', null, '棒球-非左打击球员', '汉族', '翔安', null, '洪宗加', '18359296692', '福建省厦门市翔安区后堡里192号', '4', 'simingG');
INSERT INTO `student` VALUES ('3218', '黄湘涛', '350206200405185011', '男', '549', null, '普通生', '汉族', '湖里', null, '李焱宇', '13906005412', '福建省厦门市湖里区兴隆路624号502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3219', '黄昱衡', '350206200408105515', '男', '547', null, '普通生', '汉族', '湖里', null, '潘明环', '13860455108', '福建省厦门市湖里区金山街道后坑社区后社229号', '3', 'simingG');
INSERT INTO `student` VALUES ('3220', '赖洛婷', '330329200309280904', '女', '547', null, '跟踪生源', '汉族', '思明', null, '赖克淼', '13850009625', '思明区禾祥西路240之一301', '1', 'simingG');
INSERT INTO `student` VALUES ('3221', '刘瀚元', '350203200312033319', '男', '549', null, '跟踪生源', '汉族', '思明', null, '余晓琦', '13950153232', '槟榔西里３１号５０１室', '1', 'simingG');
INSERT INTO `student` VALUES ('3222', '刘沐嘉', '350203200404013323', '女', '547', null, '跟踪生源', '汉族', '湖里', null, '刘庆涛', '13806067851', '厦门市湖里区五缘西五里23号1301室', '1', 'simingG');
INSERT INTO `student` VALUES ('3223', '刘赟', '340421200401085411', '男', '551', null, '跟踪生源', '汉族', '思明', null, '刘宁', '13906022977', '福建省厦门市思明区凤屿路370号803室', '1', 'simingG');
INSERT INTO `student` VALUES ('3224', '刘忠霖', '350403200310287017', '男', '547', null, '跟踪生源', '汉族', '思明', null, '刘慧芳', '13774695321', '福建省厦门市思明区屿后南里53号305室', '1', 'simingG');
INSERT INTO `student` VALUES ('3225', '马家乐', '411622200402216133', '男', '547', null, '跟踪生源', '汉族', '思明', null, '袁满红', '13606909032', '福建省厦门市思明区洪文石村社北片区52-1号', '1', 'simingG');
INSERT INTO `student` VALUES ('3226', '毛益程', '360602200406162530', '男', '475', null, '棒球-非左打击球员', '汉族', '思明', null, '毛强胜', '13625006283', '厦门市思明区洪文三里5号202室', '4', 'simingG');
INSERT INTO `student` VALUES ('3227', '苏家炜', '350822200310044411', '男', '546', null, '跟踪生源', '汉族', '思明', null, '苏源安', '18859227387', '湖里区五通泥金109号', '1', 'simingG');
INSERT INTO `student` VALUES ('3228', '童夏言', '350205200406083010', '男', '550', null, '跟踪生源', '汉族', '海沧', null, '童东升', '18950037945', '福建省厦门市海沧区海沧镇海兴路13号1002室', '1', 'simingG');
INSERT INTO `student` VALUES ('3229', '王雅雯', '350213200406150041', '女', '550', null, '跟踪生源', '汉族', '思明', null, '王真荣', '18359206179', '福建省厦门市思明区槟榔花园219栋402室', '1', 'simingG');
INSERT INTO `student` VALUES ('3230', '魏之麒', '35070220031020084X', '女', '550', null, '普通生', '汉族', '海沧', null, '魏长明', '18950012318', '福建省厦门市海沧区嵩屿北五里41号2105', '3', 'simingG');
INSERT INTO `student` VALUES ('3231', '温紫怡', '350206200404060022', '女', '546', null, '普通生', '汉族', '思明', null, '温波', '13806059699', '东坪二里165号302', '3', 'simingG');
INSERT INTO `student` VALUES ('3232', '吴尚山', '350524200311106019', '男', '543', null, '棒球-非左打击球员', '汉族', '思明', null, '苏美满', '13860164878', '厦门市思明区金尚路57号之五', '4', 'simingG');
INSERT INTO `student` VALUES ('3233', '吴依娜', '362523200401222029', '女', '548', null, '跟踪生源', '汉族', '湖里', null, '谢贤群', '18020725280', '长浩一里66号102', '1', 'simingG');
INSERT INTO `student` VALUES ('3234', '谢佳昕', '350203200407312345', '女', '547', null, '跟踪生源', '汉族', '思明', null, '何静', '13906045416', '福建省厦门市思明区莲岳里133号505室', '1', 'simingG');
INSERT INTO `student` VALUES ('3235', '谢佳欣', '350822200311152246', '女', '551', null, '跟踪生源', '汉族', '海沧', null, '李月清', '18950017701', '福建省厦门市海沧区钟山村335号', '1', 'simingG');
INSERT INTO `student` VALUES ('3236', '谢雨彤', '362523200406090029', '女', '550', null, '跟踪生源', '汉族', '湖里', null, '谢绿辉', '13806063396', '长浩一里22号201', '1', 'simingG');
INSERT INTO `student` VALUES ('3237', '许霆威', '350203200406023314', '男', '549', null, '跟踪生源', '汉族', '思明', null, '许腾龙', '13806086727', '福建省厦门市思明区盈翠里14号301室', '1', 'simingG');
INSERT INTO `student` VALUES ('3238', '杨鑫睿', '350211200404053034', '男', '551', null, '跟踪生源', '汉族', '思明', null, '赖哲苗', '13666063168', '厦门市思明区永福宫3号208室', '1', 'simingG');
INSERT INTO `student` VALUES ('3239', '杨紫彤', '360425200402295225', '女', '550', null, '跟踪生源', '汉族', '思明', null, '杨增志', '15960808652', '福建省漳州台商投资区角美镇崎巷路21号建坤花园9幢604室', '1', 'simingG');
INSERT INTO `student` VALUES ('3240', '尧文慧', '362523200403250824', '女', '547', null, '跟踪生源', '汉族', '湖里', null, '黄润秀', '13646002093', '福建省厦门市湖里区江头街道江华里路36号裕兴大厦2037室', '1', 'simingG');
INSERT INTO `student` VALUES ('3241', '占俊杰', '362324200403275410', '男', '547', null, '跟踪生源', '汉族', '翔安', null, '占接华', '15396268279', '江西省上饶市铅山县石圹镇里洋村占家畈自然村８８号', '1', 'simingG');
INSERT INTO `student` VALUES ('3242', '张凌羽', '350822200311202610', '男', '547', null, '跟踪生源', '汉族', '湖里', null, '廖清平', '13860498325', '福建省厦门市湖里区梧桐里40号401', '1', 'simingG');
INSERT INTO `student` VALUES ('3243', '张欣媛', '429001200401020424', '女', '548', null, '普通生', '汉族', '思明', null, '张小国', '13178355181', '仙岳路469号聚祥花园8051室', '3', 'simingG');
INSERT INTO `student` VALUES ('3244', '张艺豪', '520102200406284610', '男', '550', null, '普通生', '土家族', '湖里', null, '向进红', '15980812986', '福建省厦门市湖里区枋湖新景龙郡105号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3245', '张宇凡', '35020620040427301X', '男', '384', null, '足球-守门员', '汉族', '湖里', null, '张永志', '13860184066', '厦门市湖里区五通村泥金社48号', '4', 'simingG');
INSERT INTO `student` VALUES ('3246', '赵兵兵', '341225200405205519', '男', '546', null, '普通生', '汉族', '集美', null, '赵东亚', '13859961427', '福建省厦门市集美区乐安西里139号', '3', 'simingG');
INSERT INTO `student` VALUES ('3247', '周雨晨', '360124200404234212', '男', '551', null, '普通生', '汉族', '湖里', null, '周青云', '13959264195', '江西省南昌市进贤县下埠集乡和塘村委会周家村22号', '3', 'simingG');
INSERT INTO `student` VALUES ('3248', '朱宇昕', '350881200401232274', '男', '548', null, '普通生', '汉族', '思明', null, '杜茶花', '15259206631', '思明区镇海路12-9号606室', '3', 'simingG');
INSERT INTO `student` VALUES ('3249', '吕佳娴', '350206200312135541', '女', '514', null, '竞技健美操-竞技健美操（去思明就读）', '汉族', '思明', null, '吕柏毅', '18605921913', '厦门市金榜路149号701', '4', 'simingG');
INSERT INTO `student` VALUES ('3250', '蔡婉莹', '350582200406014022', '女', '546', null, '普通生', '汉族', '思明', null, '蔡志成', '15959282779', '福建省厦门市思明区槟榔西里249号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3251', '曾依杰', '350521200309144578', '男', '436', null, '棒球-非左打击球员', '汉族', '思明', null, '曾伟强', '13600958355', '厦门市思明区洪文五里8号101室', '4', 'simingG');
INSERT INTO `student` VALUES ('3252', '曾宇', '350212200405312014', '男', '547', null, '普通生', '汉族', '湖里', null, '曾清辉', '18959254736', '福建省厦门市同安区莲花镇云埔村中厝53号', '3', 'simingG');
INSERT INTO `student` VALUES ('3253', '陈瀚林', '350524200407212537', '男', '547', null, '普通生', '汉族', '海沧', null, '陈启强', '18965126866', '福建省厦门市海沧区嵩屿北五里24号906室', '3', 'simingG');
INSERT INTO `student` VALUES ('3254', '陈艺梅', '35052120040228302X', '女', '547', null, '普通生', '汉族', '思明', null, '陈炎彬', '13806092078', '思明区洪莲里福满山庄94号1102', '3', 'simingG');
INSERT INTO `student` VALUES ('3255', '陈艺童', '350627200310230549', '女', '550', null, '普通生', '汉族', '湖里', null, '陈瑞昌', '13358392812', '福建省厦门市湖里区枋湖村穆厝社441号502', '3', 'simingG');
INSERT INTO `student` VALUES ('3256', '陈雨欣', '350203200407211325', '女', '548', null, '跟踪生源', '汉族', '思明', null, '陈开来', '18250888587', '湖滨中路83号之一402', '1', 'simingG');
INSERT INTO `student` VALUES ('3257', '郭馨阅', '350681200310121025', '女', '550', null, '跟踪生源', '汉族', '海沧', null, '郭利民', '18605928062', '福建省厦门市海沧区钟林南里1号605室', '1', 'simingG');
INSERT INTO `student` VALUES ('3258', '何诗羽', '350203200403303628', '女', '502', null, '民乐-琵琶', '汉族', '思明', null, '何建军', '13656036880', '福建省厦门市江头西路219号301室', '4', 'simingG');
INSERT INTO `student` VALUES ('3259', '黄晗晖', '350206200407195520', '女', '550', null, '跟踪生源', '汉族', '湖里', null, '黄志民', '13696905992', '厦门市湖里区马山安置小区134号802室', '1', 'simingG');
INSERT INTO `student` VALUES ('3260', '黄铄', '35021120040322601X', '男', '442', null, '棒球-左打击球员', '汉族', '翔安', null, '黄健', '18959273688', '福建省厦门市集美区文达路21号308室', '4', 'simingG');
INSERT INTO `student` VALUES ('3261', '蒋帆', '35042620040801402X', '女', '551', null, '跟踪生源', '汉族', '海沧', null, '蒋清宁', '15980865878', '福建省厦门市海沧区兴港七里30号水岸名筑13号楼303室', '1', 'simingG');
INSERT INTO `student` VALUES ('3262', '李巧璋', '350583200408224919', '男', '548', null, '跟踪生源', '汉族', '思明', null, '李荣归', '13606083895', '湖滨六里229号502室', '1', 'simingG');
INSERT INTO `student` VALUES ('3263', '李彤', '350823200311144920', '女', '546', null, '跟踪生源', '汉族', '海沧', null, '李万丰', '18950111858', '福建省厦门市海沧区钟林里（锦辉花园）100号810室', '1', 'simingG');
INSERT INTO `student` VALUES ('3264', '林小玲', '350628200306254026', '女', '546', null, '普通生', '汉族', '集美', null, '林秋荣', '18860021529', '福建省厦门市集美区滨水一里112号滨水学校初中2016级', '3', 'simingG');
INSERT INTO `student` VALUES ('3265', '林欣彤', '350681200407102023', '女', '549', null, '普通生', '汉族', '海沧', null, '林志雄', '15880220886', '福建省厦门市海沧区沧湖东一里542号2406室', '3', 'simingG');
INSERT INTO `student` VALUES ('3266', '林欣翔', '350203200408131351', '男', '547', null, '普通生', '汉族', '思明', null, '林旭峰', '13159275950', '厦门市思明区前埔北区二里148号406室', '3', 'simingG');
INSERT INTO `student` VALUES ('3267', '林彦伶', '36042420040202500X', '女', '547', null, '普通生', '汉族', '湖里', null, '孙衍连', '15985841036', '厦门市湖里区金湖一里（联发欣悦园）4号804室', '3', 'simingG');
INSERT INTO `student` VALUES ('3268', '林宇翔', '350205200311212553', '男', '550', null, '普通生', '汉族', '海沧', null, '林志钦', '13696988538', '海沧区锦里村东片41号', '3', 'simingG');
INSERT INTO `student` VALUES ('3269', '林子嫣', '350624200406252567', '女', '549', null, '普通生', '汉族', '思明', null, '吴艳雪', '13666014094', '福建省厦门市思明区屿后北里394号404室', '3', 'simingG');
INSERT INTO `student` VALUES ('3270', '凌靖岚', '350502200405151023', '女', '550', null, '普通生', '汉族', '湖里', null, '许文婷', '13358388044', '福建省厦门市集美区灌口镇莿林内社452号501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3271', '刘宏彬', '35020620040829001X', '男', '547', null, '普通生', '汉族', '湖里', null, '王月芬', '13860132774', '福建省厦门市湖里区南山路南山新村117之5号710', '3', 'simingG');
INSERT INTO `student` VALUES ('3272', '刘一润', '350203200406242314', '男', '549', null, '普通生', '汉族', '思明', null, '刘华泉', '18050042781', '思明区湖滨西路8号1104室', '3', 'simingG');
INSERT INTO `student` VALUES ('3273', '尚昊楠', '341402200311226817', '男', '550', null, '普通生', '汉族', '思明', null, '蒋良英', '13003943766', '莲前西路627号302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3274', '孙诗滢', '350424200403194727', '女', '549', null, '普通生', '汉族', '海沧', null, '曹清招', '13799290535', '漳州市角美镇龙池开发区龙池山庄（圣地亚哥）25栋1701号', '3', 'simingG');
INSERT INTO `student` VALUES ('3275', '涂思敏', '350206200403210025', '女', '551', null, '普通生', '汉族', '思明', null, '涂炎财', '13606014953', '湖滨南三里68号904室', '3', 'simingG');
INSERT INTO `student` VALUES ('3276', '王晓茹', '350524200312244544', '女', '550', null, '普通生', '汉族', '思明', null, '王美雪', '13959204175', '厦门市湖里区林后社573号508室', '3', 'simingG');
INSERT INTO `student` VALUES ('3277', '王伊锦', '350203200410187020', '女', '549', null, '普通生', '汉族', '思明', null, '王恒宗', '13850089332', '曾厝垵西里150号402室', '3', 'simingG');
INSERT INTO `student` VALUES ('3278', '王梓祺', '350203200310021621', '女', '549', null, '普通生', '汉族', '思明', null, '王旭东', '13859918773', '文屏一里15号501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3279', '吴海弘', '350824200402130010', '男', '551', null, '普通生', '汉族', '思明', null, '熊琴', '15880280995', '厦门市思明区龙虎西二里文曾花苑3#501', '3', 'simingG');
INSERT INTO `student` VALUES ('3280', '吴贻璠', '35020320040207232X', '女', '551', null, '普通生', '汉族', '思明', null, '杨霖', '13906030880', '福建省厦门市思明区湖滨南路813号801室', '3', 'simingG');
INSERT INTO `student` VALUES ('3281', '肖晴颖', '350203200312082321', '女', '549', null, '普通生', '汉族', '思明', null, '肖志勇', '13906039108', '福建省厦门市思明区湖滨三里96号502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3282', '谢浩铭', '350213200406262035', '男', '405', null, '棒球-非左打击球员', '汉族', '翔安', null, '张爱玲', '18359740109', '福建省厦门市翔安区顶红壁里61号', '4', 'simingG');
INSERT INTO `student` VALUES ('3283', '谢珂颖', '350721200312090022', '女', '547', null, '普通生', '汉族', '海沧', null, '范宝仙', '15980980086', '福建省漳州市龙海市龙池开发区华坤花园一期12号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3284', '徐依晗', '35072220040502002X', '女', '551', null, '普通生', '汉族', '湖里', null, '徐晓明', '13655095808', '福建省厦门市思明区龙山东路6号105室', '3', 'simingG');
INSERT INTO `student` VALUES ('3285', '许睿桢', '350203200405123620', '女', '546', null, '普通生', '汉族', '思明', null, '吴团英', '13850000017', '厦门市莲前西路178号201', '3', 'simingG');
INSERT INTO `student` VALUES ('3286', '阳纯骏', '350206200404191014', '男', '549', null, '普通生', '汉族', '思明', null, '阳作裕', '13959208215', '湖里区尚忠社360号4号楼505室', '3', 'simingG');
INSERT INTO `student` VALUES ('3287', '杨钢', '350628200407280514', '男', '546', null, '普通生', '汉族', '湖里', null, '杨文汉', '18959248657', '福建厦门湖里长岸路88号302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3288', '杨坤', '411523200311092017', '男', '551', null, '普通生', '汉族', '思明', null, '杨庆锋', '18950042566', '福建省厦门市思明区屿后北里234 1-13', '3', 'simingG');
INSERT INTO `student` VALUES ('3289', '杨奕', '350206200404290012', '男', '547', null, '普通生', '汉族', '湖里', null, '陈春梅', '13666062357', '福建省厦门市湖里区南山路404号603室', '3', 'simingG');
INSERT INTO `student` VALUES ('3290', '叶亮', '350212200403074518', '男', '512', null, '民乐-二胡', '汉族', '同安', null, '叶春觎', '13074856253', '福建省厦门市同安区五显镇竹坝里122号', '4', 'simingG');
INSERT INTO `student` VALUES ('3291', '袁贵森', '520381200309104610', '男', '549', null, '普通生', '汉族', '湖里', null, '赵发勤', '15960283607', '贵州省赤水市长沙镇笃睦村五新组137号', '3', 'simingG');
INSERT INTO `student` VALUES ('3292', '张珺楷', '350203200405061650', '男', '548', null, '普通生', '汉族', '思明', null, '张明强', '13806099115', '思明区厦港新村4号楼602室', '3', 'simingG');
INSERT INTO `student` VALUES ('3293', '张洛豪', '421083200402221612', '男', '548', null, '普通生', '汉族', '思明', null, '张进才', '13779944110', '厦门市思明区屿后北里336号101室', '3', 'simingG');
INSERT INTO `student` VALUES ('3294', '张夏蕊', '350203200406283028', '女', '547', null, '普通生', '汉族', '思明', null, '彭美雅', '13720879769', '厦门市思明区不见天13号304室', '3', 'simingG');
INSERT INTO `student` VALUES ('3295', '赵思展', '350623200407156917', '男', '549', null, '普通生', '汉族', '思明', null, '赵志清', '18250899169', '厦门市思明区西林路20之14', '3', 'simingG');
INSERT INTO `student` VALUES ('3296', '郑森凯', '35020620040522501X', '男', '550', null, '普通生', '汉族', '思明', null, '张惠芬', '15305041998', '湖里区祥店里96号603室', '3', 'simingG');
INSERT INTO `student` VALUES ('3297', '周航', '362226200402060036', '男', '548', null, '普通生', '汉族', '思明', null, '周治秀', '13625002339', '东浦路56-2号401', '3', 'simingG');
INSERT INTO `student` VALUES ('3298', '朱晨', '350206200311120049', '女', '547', null, '普通生', '汉族', '湖里', null, '朱吉来', '13950015785', '福建厦门湖里昌宾路49号803室', '3', 'simingG');
INSERT INTO `student` VALUES ('3299', '叶鲁明', 'B5482200', '男', '557', null, '普通生（去思明就读）', '其他', '思明', null, '王世圆', '15860743156', '厦门市思明区龙虎山路460-301', '3', 'simingG');
INSERT INTO `student` VALUES ('3300', '王东芃', '350203200401064010', '男', '29', '11', '保送生（去思明就读）', '汉族', '思明', null, '周华萍', '18959216088', '厦门市思明区龙舟新村521号303室', '2', 'simingG');
INSERT INTO `student` VALUES ('3301', '蔡雨菲', '350213200404210020', '女', '476', null, '啦啦操-啦啦操（去思明就读）', '汉族', '翔安', null, '蔡海岩', '13074856121', '思明区湖滨南路48号之三504室', '4', 'simingG');
INSERT INTO `student` VALUES ('3302', '蔡文祺', '350203200401100616', '男', '547', null, '普通生', '汉族', '思明', null, '洪爱华', '13860435571', '思明区湖滨西路74号302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3303', '曾宸', '350203200405213618', '男', '551', null, '普通生', '汉族', '思明', null, '曾德金', '13906028133', '厦门市思明区阳台山路6号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3304', '曾佳婧', '350206200310090044', '女', '551', null, '普通生', '汉族', '湖里', null, '曾永福', '13850019917', '厦门市湖里区日圆三里11号2403室', '3', 'simingG');
INSERT INTO `student` VALUES ('3305', '曾王策', '350625200310310036', '男', '548', null, '普通生', '汉族', '思明', null, '王美玲', '18959288066', '东明路26号502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3306', '陈飞羽', '350623200406127225', '女', '550', null, '普通生', '汉族', '湖里', null, '曹征', '18950035571', '福建省漳浦县马坪镇马圩村东郭2号', '3', 'simingG');
INSERT INTO `student` VALUES ('3307', '陈嘉诚', '350823200311207119', '男', '548', null, '普通生', '汉族', '思明', null, '陈良', '13779930118', '福建省厦门市思明区前埔二里36号304室', '3', 'simingG');
INSERT INTO `student` VALUES ('3308', '陈锦彪', '350524200404125016', '男', '547', null, '普通生', '汉族', '思明', null, '王亚珍', '13606051055', '福建省厦门市思明区下堡路189号2501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3309', '陈文煌', '35020320031009701X', '男', '551', null, '普通生', '汉族', '湖里', null, '陈建春', '13600934363', '福建省厦门市思明区曾厝垵村西边社52号', '3', 'simingG');
INSERT INTO `student` VALUES ('3310', '陈盈欣', '350206200312270081', '女', '547', null, '普通生', '汉族', '湖里', null, '李春娇', '13850096527', '厦门市湖里区梧桐里12号', '3', 'simingG');
INSERT INTO `student` VALUES ('3311', '戈慧惠', '430321200408311246', '女', '548', null, '普通生', '汉族', '思明', null, '戈峰光', '18965533312', '厦门市翔安区新店镇洪琳湖五里6单元402室', '3', 'simingG');
INSERT INTO `student` VALUES ('3312', '郭德容', '350213200405180046', '女', '551', null, '普通生', '汉族', '湖里', null, '王娟', '13055436434', '厦门市湖里区昌源鑫海湾56号702室', '3', 'simingG');
INSERT INTO `student` VALUES ('3313', '郭雁初', '362422200409030054', '男', '549', null, '普通生', '汉族', '海沧', null, '郭必明', '13959280302', '福建省厦门市海沧区渐美里103号201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3314', '何棂俊', '500383200308138738', '男', '550', null, '普通生', '汉族', '湖里', null, '施建芬', '13600951587', '厦门市湖里区县后社271号', '3', 'simingG');
INSERT INTO `student` VALUES ('3315', '洪瑞麒', '350203200407012334', '男', '549', null, '普通生', '汉族', '思明', null, '郭菲莉', '15980948258', '半山御景4号楼2502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3316', '黄锐帆', '350206200310245536', '男', '547', null, '普通生', '汉族', '湖里', null, '黄祖兵', '13959216085', '福建省厦门市湖里区金国里96号202室', '3', 'simingG');
INSERT INTO `student` VALUES ('3317', '黄思旸', '350203200402223642', '女', '549', null, '普通生', '汉族', '思明', null, '黄俊猛', '13806082289', '思明区禾祥西二路35号华侨海景城4#1106室', '3', 'simingG');
INSERT INTO `student` VALUES ('3318', '江海灿', '350822200312173313', '男', '546', null, '普通生', '汉族', '湖里', null, '苏满娥', '15359243236', '福建省厦门市湖里区尚忠社309号304室', '3', 'simingG');
INSERT INTO `student` VALUES ('3319', '蒋家瑜', '350203200401103366', '女', '547', null, '普通生', '汉族', '思明', null, '余昭蓉', '13606938349', '福建省厦门市思明区湖明路34号406室', '3', 'simingG');
INSERT INTO `student` VALUES ('3320', '赖旭琛', '35082220040706331X', '男', '547', null, '普通生', '汉族', '海沧', null, '江洁华', '18965151550', '福建省厦门市海沧区钟林南里8号3205室', '3', 'simingG');
INSERT INTO `student` VALUES ('3321', '李婕', '350821200310220829', '女', '547', null, '普通生', '汉族', '思明', null, '朱秀文', '18950158680', '福建省厦门市思明区香秀里31号502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3322', '林灿堃', '350524200311131011', '男', '547', null, '普通生', '汉族', '湖里', null, '林冬青', '13695027766', '厦门市湖里区五缘西一里54号603室', '3', 'simingG');
INSERT INTO `student` VALUES ('3323', '林佳琦', '350203200312203613', '男', '546', null, '普通生', '汉族', '思明', null, '林晨光', '18959243185', '福建省厦门市思明区西林西里10号305室', '3', 'simingG');
INSERT INTO `student` VALUES ('3324', '林卓', '350205200407283014', '男', '551', null, '普通生', '汉族', '海沧', null, '林华燕', '13950012188', '福建省厦门市海沧区渐美村626号', '3', 'simingG');
INSERT INTO `student` VALUES ('3325', '刘北辰', '350203200404263613', '男', '547', null, '普通生', '汉族', '湖里', null, '郭孜慧', '13666095619', '厦门市湖里区五缘南里34号402室', '3', 'simingG');
INSERT INTO `student` VALUES ('3326', '刘星遥', '350583200401202629', '女', '551', null, '普通生', '汉族', '思明', null, '刘文艺', '13599912508', '福建省厦门市思明区源昌君悦山8号楼4梯1803室', '3', 'simingG');
INSERT INTO `student` VALUES ('3327', '刘子阅', '440106200405054421', '女', '549', null, '普通生', '汉族', '湖里', null, '伍燕玲', '13394068115', '厦门市湖里区五缘西三里26号404室', '3', 'simingG');
INSERT INTO `student` VALUES ('3328', '卢馨玥', '350206200401015023', '女', '551', null, '普通生', '汉族', '思明', null, '卢维伟', '13860190099', '福建省厦门市思明区洪莲西路嘉盛豪园16-203室', '3', 'simingG');
INSERT INTO `student` VALUES ('3329', '罗翔', '350481200401185031', '男', '546', null, '普通生', '汉族', '湖里', null, '罗志扬', '18965818627', '厦门市湖里区寨上二组2347号', '3', 'simingG');
INSERT INTO `student` VALUES ('3330', '史洛丞', '350203200404142619', '男', '547', null, '普通生', '汉族', '思明', null, '史树军', '18965115989', '厦门市思明区建兴路武夷嘉园11号403室', '3', 'simingG');
INSERT INTO `student` VALUES ('3331', '田睿妮', '421087200310232723', '女', '549', null, '普通生', '汉族', '湖里', null, '田伟', '13063096618', '厦门市湖里区园山北里74号1604', '3', 'simingG');
INSERT INTO `student` VALUES ('3332', '王凯文', '350203200406094315', '男', '550', null, '普通生', '汉族', '思明', null, '徐春梅', '18050029750', '福建省厦门市思明区前埔村前埔社200号', '3', 'simingG');
INSERT INTO `student` VALUES ('3333', '王沈欣', '350203200409044022', '女', '547', null, '普通生', '汉族', '思明', null, '王沈扬', '13806040291', '厦门大学后勤集团人力资源部 高美芸转王沈欣收', '3', 'simingG');
INSERT INTO `student` VALUES ('3334', '王薇然', '350203200311201325', '女', '550', null, '普通生', '汉族', '思明', null, '王明毅', '13003978212', '福建省厦门市思明区霞溪路181号1203室', '3', 'simingG');
INSERT INTO `student` VALUES ('3335', '吴屿靖', '350627200404282024', '女', '550', null, '普通生', '汉族', '湖里', null, '卢爱琴', '18250826256', '厦门市湖里区禾山街道坂上社257号101室', '3', 'simingG');
INSERT INTO `student` VALUES ('3336', '谢晓玮', '350203200405261329', '女', '551', null, '普通生', '汉族', '思明', null, '谢江龙', '13625017196', '福建省厦门市思明区坑内路36号503室', '3', 'simingG');
INSERT INTO `student` VALUES ('3337', '许珈语', '350203200404073668', '女', '549', null, '普通生', '汉族', '思明', null, '许建昕', '13860469797', '福建省厦门市思明区盈翠里10号504室', '3', 'simingG');
INSERT INTO `student` VALUES ('3338', '许靖雅', '35020320040402302X', '女', '548', null, '普通生', '汉族', '思明', null, '李秀娟', '13860188292', '思明区思明南路445号', '3', 'simingG');
INSERT INTO `student` VALUES ('3339', '许越洋', '350203200402123035', '男', '549', null, '普通生', '汉族', '思明', null, '王晓薇', '13600930627', '福建省厦门市思明区湖滨南五里3号802室', '3', 'simingG');
INSERT INTO `student` VALUES ('3340', '杨嘉鑫', '350206200309220016', '男', '547', null, '普通生', '汉族', '思明', null, '杨春', '13328326876', '福建省厦门市思明区石亭路59号501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3341', '杨露', '420322200405065726', '女', '549', null, '普通生', '汉族', '思明', null, '张琴', '15060786606', '厦门市思明区前埔路502号华联电子', '3', 'simingG');
INSERT INTO `student` VALUES ('3342', '杨天赐', '342422200404246354', '男', '547', null, '普通生', '汉族', '湖里', null, '杨生保', '13696918120', '湖里区殿前六组6013号', '3', 'simingG');
INSERT INTO `student` VALUES ('3343', '张家铭', '350203200405171358', '男', '547', null, '普通生', '汉族', '思明', null, '王含凝', '13666064448', '厦门市思明区湖滨南路90号立信广场负一楼佰鑫汽车服务有限公司', '3', 'simingG');
INSERT INTO `student` VALUES ('3344', '张敬尧', '350582200311273515', '男', '550', null, '普通生', '汉族', '思明', null, '高招娣', '13489477671', '福建省厦门市思明区塔埔小区西里30号楼203梯1203室', '3', 'simingG');
INSERT INTO `student` VALUES ('3345', '张一诺', '610502200408040023', '女', '550', null, '普通生', '汉族', '思明', null, '王秋云', '13606915500', '福建省厦门市思明区体育路96号蓝湾国际北二一单元2202', '3', 'simingG');
INSERT INTO `student` VALUES ('3346', '张子璇', '360681200407086811', '男', '546', null, '普通生', '汉族', '思明', null, '张利华', '15880205236', '福建省厦门市翔安区新店镇浦园一里12号1803室', '3', 'simingG');
INSERT INTO `student` VALUES ('3347', '郑雅文', '350205200403183024', '女', '549', null, '普通生', '汉族', '海沧', null, '郑建设', '13859922662', '厦门市海沧区沧林东一里373号701室', '3', 'simingG');
INSERT INTO `student` VALUES ('3348', '周婧文', '350583200311257124', '女', '550', null, '普通生', '汉族', '湖里', null, '郭少红', '13616028732', '厦门市同安区西柯镇官浔社区官田洋一里中海万锦熙岸8号902', '3', 'simingG');
INSERT INTO `student` VALUES ('3349', '朱亦宸', '350212200309266513', '男', '547', null, '普通生', '汉族', '同安', null, '陈淑娟', '13806050500', '福建省厦门市同安区凤山一里122号902室', '3', 'simingG');
INSERT INTO `student` VALUES ('3350', '庄嘉炜', '35020320040219161X', '男', '547', null, '普通生', '汉族', '思明', null, '庄建平', '13606066086', '吕岭路220之-602室', '3', 'simingG');
INSERT INTO `student` VALUES ('3351', '庄炜', '350205200311272011', '男', '549', null, '普通生', '汉族', '海沧', null, '庄学彬', '13063085653', '福建省厦门市海沧区海达路76号401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3352', '蔡卓阅', '350503200406210511', '男', '552', null, '普通生', '汉族', '思明', null, '肖彩玲', '18650150199', '福建省厦门市思明区高雄路18号通达国际中心13楼又一城公司', '3', 'simingG');
INSERT INTO `student` VALUES ('3353', '曾皓', '35052120040822301X', '男', '556', '12', '普通生', '汉族', '思明', null, '曾雪琼', '15060759151', '福建省厦门市思明区东浦路16号盛达威楼上', '3', 'simingG');
INSERT INTO `student` VALUES ('3354', '曾心怡', '350204200309256024', '女', '553', null, '普通生', '汉族', '思明', null, '曾志文', '13606095366', '福建省厦门市思明区谊爱路24号302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3355', '陈芳宇', '350203200407024319', '男', '555', '11', '普通生', '汉族', '思明', null, '陈定标', '15959276689', '福建省厦门市思明区岭兜一里74号402室', '1', 'simingG');
INSERT INTO `student` VALUES ('3356', '陈国君', '350206200403192015', '男', '554', null, '普通生', '汉族', '湖里', null, '范干香', '13459246848', '厦门市湖里区钟宅社7032号君华诊所', '3', 'simingG');
INSERT INTO `student` VALUES ('3357', '陈峤松', '350203200407193614', '男', '551', null, '普通生', '汉族', '思明', null, '陈晋', '13806031118', '洪莲东二里8号1103室', '3', 'simingG');
INSERT INTO `student` VALUES ('3358', '陈炫仁', '350203200401111315', '男', '557', '11', '普通生', '汉族', '思明', null, '刘纯丹', '18950111758', '福建省厦门市思明区凤凰西里3号1701室', '3', 'simingG');
INSERT INTO `student` VALUES ('3359', '陈宇乐', '350206200401131016', '男', '552', null, '普通生', '畲族', '思明', null, '陈艺雄', '13806013731', '福建省厦门市思明区岭兜一里158号大洲国际龙郡1201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3360', '陈振楚', '360622200402055338', '男', '553', null, '普通生', '汉族', '思明', null, '陈爱金', '13860421798', '厦门市翔安区新店镇新兴街1126之二', '3', 'simingG');
INSERT INTO `student` VALUES ('3361', '邓成钊', '350825200404034512', '男', '553', null, '普通生', '汉族', '湖里', null, '邓啟雄', '13959265902', '福建省厦门市湖里区江头东路10号1104室', '3', 'simingG');
INSERT INTO `student` VALUES ('3362', '邓文杰', '35042320040510651X', '男', '554', null, '普通生', '汉族', '海沧', null, '邓正根', '13779923443', '福建省厦门市海沧区锦里村东片4-101号', '3', 'simingG');
INSERT INTO `student` VALUES ('3363', '方子俊', '360681200310264714', '男', '551', null, '普通生', '汉族', '海沧', null, '方育林', '15860791398', '福建省厦门市海沧区嵩屿贞庵村岭上社282号201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3364', '郭萱', '350203200310211628', '女', '557', '12', '普通生', '汉族', '思明', null, '郭国忠', '13600942415', '东浦一里45号302', '3', 'simingG');
INSERT INTO `student` VALUES ('3365', '郭烨华', '350403200312282017', '男', '551', null, '普通生', '汉族', '思明', null, '谢燕菁', '13950922311', '福建省厦门市思明区金桥路181号601室', '3', 'simingG');
INSERT INTO `student` VALUES ('3366', '何思为', '350581200310283010', '男', '554', null, '普通生', '汉族', '湖里', null, '何发海', '18650145198', '厦门市海沧区沧虹路813号302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3367', '何岳洋', '350205200405123519', '男', '568', '11', '普通生', '汉族', '思明', null, '何高峰', '13696943337', '福建省厦门市思明区同安里5号', '3', 'simingG');
INSERT INTO `student` VALUES ('3368', '洪静怡', '350205200406133049', '女', '552', null, '普通生', '汉族', '海沧', null, '洪青强', '13023998382', '福建省厦门市海沧区海青花园296号202室', '3', 'simingG');
INSERT INTO `student` VALUES ('3369', '洪子尧', '350203200407027034', '男', '29', '11', '保送生', '汉族', '思明', null, '谢志红', '13950091545', '厦门市思明区曾厝垵379号401室', '2', 'simingG');
INSERT INTO `student` VALUES ('3370', '黄光瀚', '350203200408073630', '男', '551', null, '普通生', '汉族', '思明', null, '陈月敏', '13806030130', '思明区中山路122号903室', '3', 'simingG');
INSERT INTO `student` VALUES ('3371', '黄静冰', '350524200407206567', '女', '555', '11', '普通生', '汉族', '集美', null, '汤子菊', '15750789628', '福建省厦门市集美区滨水一里112号滨水学校初中2016级', '3', 'simingG');
INSERT INTO `student` VALUES ('3372', '金泽旭', '350206200309205019', '男', '550', null, '普通生', '朝鲜族', '思明', null, '毕红梅', '13599511187', '槟榔西里253号904室', '3', 'simingG');
INSERT INTO `student` VALUES ('3373', '柯冠宏', '350206200312035516', '男', '557', '12', '普通生', '汉族', '湖里', null, '柯军生', '13616041331', '福建省厦门市湖里区金山西里45号501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3374', '柯欣妍', '350582200406259329', '女', '29', '11', '保送生', '汉族', '思明', null, '许真雅', '13860171971', '厦门市思明区曾厝垵村后厝91号202室', '2', 'simingG');
INSERT INTO `student` VALUES ('3375', '兰雯', '350824200403183210', '男', '553', null, '普通生', '汉族', '湖里', null, '姜小芬', '13799781729', '厦门市湖里区下忠社197号店面', '3', 'simingG');
INSERT INTO `student` VALUES ('3376', '兰泽军', '350824200401015870', '男', '554', null, '普通生', '汉族', '海沧', null, '兰道发', '13400664477', '厦门市海沧区沧虹路汇利花园三五一号五零四室', '3', 'simingG');
INSERT INTO `student` VALUES ('3377', '林怀众', '350206200403105516', '男', '555', '11', '普通生', '汉族', '湖里', null, '林俊灵', '13850008877', '厦门市湖里区高林村前头社17号', '3', 'simingG');
INSERT INTO `student` VALUES ('3378', '林婧雯', '350203200402018024', '女', '29', '11', '保送生', '汉族', '思明', null, '林淼', '18959206118', '厦门市思明区黄厝茂后社111号', '2', 'simingG');
INSERT INTO `student` VALUES ('3379', '林棋荣', '35052420030901051X', '男', '555', '12', '普通生', '汉族', '湖里', null, '林江华', '13806095974', '厦门市湖里区长浩一里32号202', '3', 'simingG');
INSERT INTO `student` VALUES ('3380', '林昱达', '350213200406210518', '男', '22', '12', '保送生', '汉族', '思明', null, '林朝阳', '13850058739', '厦门市翔安区马巷镇琼头社区新北里10号', '2', 'simingG');
INSERT INTO `student` VALUES ('3381', '王雨菲', '362428200312124124', '女', '557', '11', '普通生', '汉族', '思明', null, '廖华', '18950065040', '思明区厦禾路780号105', '3', 'simingG');
INSERT INTO `student` VALUES ('3382', '刘恬', '42030220040601014X', '女', '551', null, '普通生', '汉族', '思明', null, '刘建辉', '13600955700', '福建省厦门市思明区侨岳路319号701室', '3', 'simingG');
INSERT INTO `student` VALUES ('3383', '龙祎璠', '411323200501123821', '女', '549', null, '普通生', '侗族', '集美', null, '龙建军', '13559216305', '集美区杏林内茂里75号702室', '3', 'simingG');
INSERT INTO `student` VALUES ('3384', '罗颖霖', '350203200411182328', '女', '553', null, '普通生', '汉族', '思明', null, '张晓红', '13606915594', '厦门市湖里区枋湖东一里17号502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3385', '吕昕航', '210381200311304811', '男', '554', null, '普通生', '汉族', '湖里', null, '吕刚', '18906015606', '辽宁省海城市王石镇长岭村3组243号', '3', 'simingG');
INSERT INTO `student` VALUES ('3386', '秦榆杰', '511623200408280056', '男', '556', '12', '普通生', '汉族', '集美', null, '秦勇', '13015918081', '四川省邻水县袁市镇团坝村', '3', 'simingG');
INSERT INTO `student` VALUES ('3387', '王陈奇', '350926200404240035', '男', '556', '11', '普通生', '汉族', '思明', null, '陈容花', '13950599158', '福建省厦门市思明区文屏路39-3号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3388', '王晨颖', '350211200310273028', '女', '558', '11', '普通生', '汉族', '集美', null, '王启运', '13950002587', '福建省厦门市集美区后溪镇永祥新城9号梯1804室', '3', 'simingG');
INSERT INTO `student` VALUES ('3389', '王东鹏', '361027200401110518', '男', '25', '12', '保送生', '汉族', '思明', null, '王井岗', '15959250635', '厦门市思明区环岛南路376-1号', '2', 'simingG');
INSERT INTO `student` VALUES ('3390', '王嘉茵', '350583200312254320', '女', '551', null, '普通生', '汉族', '湖里', null, '王美英', '13805901603', '福建省南安市水头镇巷内村蓬鑫107号', '3', 'simingG');
INSERT INTO `student` VALUES ('3391', '吴晨喆', '410726200406299570', '男', '553', null, '普通生', '汉族', '思明', null, '吴金路', '13666076312', '福建省厦门市湖里区尚忠社263号203室', '3', 'simingG');
INSERT INTO `student` VALUES ('3392', '徐上', '350203200402122315', '男', '556', '12', '普通生', '汉族', '思明', null, '徐牧笙', '13806011408', '思明区湖滨一里38号302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3393', '许烨', '350203200311073618', '男', '554', null, '普通生', '汉族', '思明', null, '许水沿', '18950088058', '福建省厦门市思明区厦港新村48号604室', '3', 'simingG');
INSERT INTO `student` VALUES ('3394', '杨嘉轩', '360981200407185517', '男', '552', null, '普通生', '汉族', '思明', null, '杨明云', '13959252102', '厦禾路886号3320室', '3', 'simingG');
INSERT INTO `student` VALUES ('3395', '姚曼琪', '35020620040623556X', '女', '551', null, '普通生', '汉族', '湖里', null, '姚兴銮', '13385927057', '福建省厦门市湖里区薛岭北里11号701室', '3', 'simingG');
INSERT INTO `student` VALUES ('3396', '叶诗琪', '35020620031226102X', '女', '555', '12', '普通生', '汉族', '湖里', null, '刘碧蓉', '13799743959', '厦门市湖里区墩岭一里8号404室', '3', 'simingG');
INSERT INTO `student` VALUES ('3397', '游宇昊', '362202200408060036', '男', '552', null, '普通生', '汉族', '思明', null, '游杰凡', '18020779350', '厦门市思明区公园南路21号玉滨城一期A座21C', '3', 'simingG');
INSERT INTO `student` VALUES ('3398', '赵煜锦', '350524200408311510', '男', '552', null, '普通生', '汉族', '湖里', null, '许宝花', '13015959862', '厦门市湖里区神山公寓', '3', 'simingG');
INSERT INTO `student` VALUES ('3399', '郑意晨', '350213200312290529', '女', '557', '11', '普通生', '汉族', '湖里', null, '洪金宽', '18150070798', '福建省厦门市翔安区郑坂村村南198号', '3', 'simingG');
INSERT INTO `student` VALUES ('3400', '钟瑶凯', '360781200404053673', '男', '553', null, '普通生', '汉族', '思明', null, '王水红', '13860436279', '集美区宁海一里46号302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3401', '朱毅轩', '350521200402090033', '男', '550', null, '普通生', '汉族', '思明', null, '朱坤列', '13850003216', '厦门市思明区何厝下何170号', '3', 'simingG');
INSERT INTO `student` VALUES ('3402', '白海峰', '350203200403022316', '男', '558', '12', '普通生', '汉族', '思明', null, '白政和', '13600978966', '湖明路154-1003', '3', 'simingG');
INSERT INTO `student` VALUES ('3403', '蔡译乐', '35020320040104233X', '男', '552', null, '普通生', '汉族', '思明', null, '蔡政', '13606056107', '福建省厦门市思明区七星西路17号2004室', '3', 'simingG');
INSERT INTO `student` VALUES ('3404', '蔡雨霏', '350722200405170044', '女', '553', null, '普通生', '汉族', '海沧', null, '蔡伟', '13859492275', '福建省厦门市海沧区滨湖一里12号1405室', '3', 'simingG');
INSERT INTO `student` VALUES ('3405', '曹文赐', '341225200407225572', '男', '553', null, '普通生', '汉族', '海沧', null, '陈敏', '15159237583', '海沧区石塘村北片408', '3', 'simingG');
INSERT INTO `student` VALUES ('3406', '陈江峰', '610721200310142611', '男', '558', '12', '普通生', '汉族', '湖里', null, '陈晓宏', '15860781006', '厦门市湖里区寨上1055', '3', 'simingG');
INSERT INTO `student` VALUES ('3407', '陈明凤', '350206200403271020', '女', '560', '12', '普通生', '汉族', '湖里', null, '陈建安', '13806026261', '福建省厦门市湖里区岭下村墩上社', '3', 'simingG');
INSERT INTO `student` VALUES ('3408', '陈一池', '130181200406264823', '女', '553', null, '普通生', '汉族', '思明', null, '成玉霞', '13959207248', '同安区西柯镇美溪一里8号', '3', 'simingG');
INSERT INTO `student` VALUES ('3409', '陈奕雄', '350623200312292318', '男', '554', null, '普通生', '汉族', '海沧', null, '陈荣华', '13606910898', '福建省厦门市海沧区海发路74号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3410', '冯志祥', '411526200409241913', '男', '551', null, '普通生', '汉族', '思明', null, '冯燕霞', '13616062866', '厦门市思明区西林社72号101室', '3', 'simingG');
INSERT INTO `student` VALUES ('3411', '傅志恒', '350212200402216537', '男', '557', '12', '普通生', '汉族', '湖里', null, '傅玉杰', '13859945789', '福建省厦门市同安区祥平街道航空祥郡151号楼102室', '3', 'simingG');
INSERT INTO `student` VALUES ('3412', '高一洋', '350203200408140012', '男', '557', '11', '普通生', '汉族', '思明', null, '谢滨', '18950088836', '福建省厦门市思明区瓮王巷12号之一301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3413', '高泽伟', '350681200402056515', '男', '30', '11', '保送生', '汉族', '思明', null, '汪小月', '15359887281', '厦门市思明区黄厝村茂后96号', '2', 'simingG');
INSERT INTO `student` VALUES ('3414', '郭宇坤', '35098120040819013X', '男', '550', null, '普通生', '回族', '海沧', null, '郭周方', '13706925218', '福建省厦门市海沧区滨湖二里198号3705室', '3', 'simingG');
INSERT INTO `student` VALUES ('3415', '黄和', '350524200408207131', '男', '556', '12', '普通生', '汉族', '思明', null, '黄赐渊', '13860425277', '厦门市翔安区浦园一里明发.半岛翔湾2号802A区', '3', 'simingG');
INSERT INTO `student` VALUES ('3416', '江忆', '350105200407011566', '女', '556', '12', '普通生', '汉族', '湖里', null, '江东华', '13696924184', '福建省厦门市湖里区金昌路5-2号702室', '3', 'simingG');
INSERT INTO `student` VALUES ('3417', '金胤辰', '350203200402222324', '女', '552', null, '普通生', '汉族', '思明', null, '洪丽美', '18906014001', '福建省厦门市思明区仙阁里49号307室', '3', 'simingG');
INSERT INTO `student` VALUES ('3418', '李和原', '350822200402201912', '男', '30', '11', '保送生', '汉族', '思明', null, '陈珠妹', '13779982039', '厦门市思明区曾厝垵村东宅社87号204', '2', 'simingG');
INSERT INTO `student` VALUES ('3419', '李劭杰', '350203200403103319', '男', '551', null, '普通生', '汉族', '思明', null, '林丽淑', '13606078129', '福建省厦门市思明区溪岸街亿力百家苑68号1201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3420', '李欣婷', '36028120040320142X', '女', '554', null, '普通生', '汉族', '集美', null, '李金保', '18950018318', '江西省乐平市镇桥镇渡头村230号', '3', 'simingG');
INSERT INTO `student` VALUES ('3421', '梁煜晨', '350203200312104025', '女', '29', '12', '保送生', '汉族', '思明', null, '梁欣森', '13459016136', '厦门市思明区下沃仔12-604', '2', 'simingG');
INSERT INTO `student` VALUES ('3422', '林芊帆', '350203200311231620', '女', '557', '12', '普通生', '汉族', '思明', null, '陈艳婷', '13600977750', '福建省厦门市思明区盈翠西路26号301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3423', '林晓晗', '350206200404295024', '女', '556', '11', '普通生', '汉族', '湖里', null, '林燕', '13306002312', '福建省厦门市湖里区南山路411号102', '3', 'simingG');
INSERT INTO `student` VALUES ('3424', '林妍汐', '350783200408201224', '女', '554', null, '普通生', '汉族', '湖里', null, '丁芳丽', '15960394953', '福建省厦门市湖里区殿前街道园山北里82号308室', '3', 'simingG');
INSERT INTO `student` VALUES ('3425', '林奕衡', '350206200405160017', '男', '551', null, '普通生', '汉族', '湖里', null, '林佩丁', '15859276992', '福建省厦门市湖里区兴隆路111号401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3426', '刘佳琪', '350203200407070622', '女', '25', '11', '保送生', '汉族', '思明', null, '李琤', '13806062300', '厦门市思明区龙虎山路685号701', '2', 'simingG');
INSERT INTO `student` VALUES ('3427', '平帆', '362323200402123910', '男', '556', '11', '普通生', '汉族', '湖里', null, '平重庆', '13959297528', '福建省厦门市湖里区南山路36号401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3428', '苏豪康', '350822200410040039', '男', '555', '12', '普通生', '汉族', '湖里', null, '苏学方', '13666036192', '福建省厦门市湖里区枋湖村蔡坑社7号', '3', 'simingG');
INSERT INTO `student` VALUES ('3429', '孙贵如', '41162320030912816X', '女', '30', '11', '保送生', '汉族', '思明', null, '孙金华', '18950115553', '厦门市翔安区新店镇洪琳湖二里6号804室', '2', 'simingG');
INSERT INTO `student` VALUES ('3430', '唐颖', '320723200406214222', '女', '553', null, '普通生', '汉族', '思明', null, '唐海兴', '18605925588', '福建省厦门市思明区会展北里61号1804室', '3', 'simingG');
INSERT INTO `student` VALUES ('3431', '王春燕', '360124200306035121', '女', '552', null, '普通生', '汉族', '集美', null, '林清凤', '18250722981', '福建省厦门市集美区滨水一里112号滨水学校初中2016级', '3', 'simingG');
INSERT INTO `student` VALUES ('3432', '王琳', '350623200404113823', '女', '30', '11', '保送生', '汉族', '思明', null, '王海泉', '13616024785', '厦门市思明区曾厝垵村前田社57号', '2', 'simingG');
INSERT INTO `student` VALUES ('3433', '王妮臻', '350525200312163548', '女', '551', null, '普通生', '汉族', '湖里', null, '王永生', '13850070826', '厦门市湖里区坂上社257号', '3', 'simingG');
INSERT INTO `student` VALUES ('3434', '王谭雅诗', '500234200311214129', '女', '554', null, '普通生', '汉族', '湖里', null, '谭祖梅', '18020752353', '福建省厦门市湖里区悦华路9号103', '3', 'simingG');
INSERT INTO `student` VALUES ('3435', '王洋彬', '350206200309091023', '女', '555', '12', '普通生', '汉族', '湖里', null, '纪华', '13338360882', '厦门市湖里区禾山街道墩岭一里4号403室', '3', 'simingG');
INSERT INTO `student` VALUES ('3436', '王一锋', '350203200407223617', '男', '555', null, '普通生', '汉族', '海沧', null, '王宏震', '18060987056', '福建省厦门市海沧区沧湖东一里80号606室', '3', 'simingG');
INSERT INTO `student` VALUES ('3437', '王子超', '350424200402084710', '男', '557', '11', '普通生', '汉族', '思明', null, '孙菊珠', '15960213209', '福建省厦门市思明区龙山南路150号', '3', 'simingG');
INSERT INTO `student` VALUES ('3438', '吴凯文', '350521200401195255', '男', '553', null, '普通生', '汉族', '思明', null, '黄玉云', '13950062881', '厦门市思明区莲花五村龙华里37号302室', '3', 'simingG');
INSERT INTO `student` VALUES ('3439', '吴毅锴', '350203200403300013', '男', '551', null, '普通生', '汉族', '思明', null, '吴鹭海', '13600903044', '厦门市思明区东砖仔埕5号', '3', 'simingG');
INSERT INTO `student` VALUES ('3440', '熊炜', '350203200312143614', '男', '553', null, '普通生', '汉族', '思明', null, '熊祥麟', '18965128247', '福建省厦门市思明区古楼北里60号之二503室', '3', 'simingG');
INSERT INTO `student` VALUES ('3441', '颜小玲', '35052520040207352X', '女', '554', null, '普通生', '汉族', '湖里', null, '颜纯峰', '13606007614', '湖里区寨上社1377号', '3', 'simingG');
INSERT INTO `student` VALUES ('3442', '杨宴欣', '350203200406213329', '女', '553', null, '普通生', '土家族', '思明', null, '蔡丽红', '18906031338', '厦门市思明区厦港新村10号楼202室', '3', 'simingG');
INSERT INTO `student` VALUES ('3443', '叶佳鹏', '350628200406134515', '男', '552', null, '普通生', '汉族', '海沧', null, '叶长安', '15859241997', '福建省平和县大溪镇环镇东路200号', '3', 'simingG');
INSERT INTO `student` VALUES ('3444', '叶晟辰', '350206200407310031', '男', '552', null, '普通生', '汉族', '湖里', null, '黄丽娇', '13950186721', '福建省厦门市湖里区海天路237号105室', '3', 'simingG');
INSERT INTO `student` VALUES ('3445', '叶维超', '350625200407050533', '男', '551', null, '普通生', '汉族', '集美', null, '叶阿生', '18559229997', '福建省厦门市集美区后溪镇永祥新城39栋1606室', '3', 'simingG');
INSERT INTO `student` VALUES ('3446', '张吴悠', '350782200403050029', '女', '553', null, '普通生', '汉族', '思明', null, '张宜彬', '15359237552', '厦禾路886号3625', '3', 'simingG');
INSERT INTO `student` VALUES ('3447', '郑安祺', '350783200404058512', '男', '555', null, '普通生', '汉族', '湖里', null, '江秋菊', '13123393286', '福建省厦门市湖里区塘边社223号201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3448', '郑羽凡', '350203200401072328', '女', '556', '11', '普通生', '汉族', '思明', null, '郭勤英', '13950159829', '凤屿路364号706室', '3', 'simingG');
INSERT INTO `student` VALUES ('3449', '周以成', '350203200310047012', '男', '30', '12', '保送生', '汉族', '思明', null, '周信东', '13850008182', '厦门市思明区曾厝垵后厝社116号', '2', 'simingG');
INSERT INTO `student` VALUES ('3450', '周子扬', '350203200405131014', '男', '554', null, '普通生', '汉族', '思明', null, '曾素娜', '13306032780', '福建省厦门市湖里区金益三里8号3503室', '3', 'simingG');
INSERT INTO `student` VALUES ('3451', '朱文昊', '362323200402084536', '男', '554', null, '普通生', '汉族', '海沧', null, '朱升阳', '18605924607', '福建省厦门市海沧区兴港七里17号1007室', '3', 'simingG');
INSERT INTO `student` VALUES ('3452', '蔡舒颖', '350203200408303344', '女', '554', null, '普通生', '汉族', '思明', null, '蔡桂林', '13950073266', '福建省厦门市思明区龙山路176号1704室', '3', 'simingG');
INSERT INTO `student` VALUES ('3453', '陈晗静', '350521200406183528', '女', '554', null, '普通生', '汉族', '思明', null, '陈江山', '13375959633', '厦门市思明区塔埔路100号2916室', '3', 'simingG');
INSERT INTO `student` VALUES ('3454', '陈航', '350204200310153014', '男', '553', null, '普通生', '汉族', '思明', null, '陈成添', '13600902487', '东浦路89之十六501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3455', '陈家琛', '350623200406224818', '男', '557', '12', '普通生', '汉族', '思明', null, '陈仁才', '13860428808', '厦门市湖里区枋湖南路碧湖嘉园16梯602室', '3', 'simingG');
INSERT INTO `student` VALUES ('3456', '陈家轩', '341702200304141213', '男', '540', null, '普通生', '汉族', '思明', null, '朱晓峰', '18759211298', '福建省厦门市思明区店上东里75号103室', '3', 'simingG');
INSERT INTO `student` VALUES ('3457', '陈靖玮', '350583200311202641', '女', '554', null, '普通生', '汉族', '思明', null, '尤真真', '18205939118', '厦门市湖里区金湖二里禹州城上城88号703室', '3', 'simingG');
INSERT INTO `student` VALUES ('3458', '陈俊逸', '35020320041115401X', '男', '554', null, '普通生', '汉族', '思明', null, '陈华', '13606911308', '福建省厦门市思明区莲花花园龙伏里14号楼402室', '3', 'simingG');
INSERT INTO `student` VALUES ('3459', '陈子轩', '350203200409104013', '男', '22', '11', '保送生', '汉族', '思明', null, '杨翼飞', '13950175819', '厦门市思明区厦大海滨东区2-701', '2', 'simingG');
INSERT INTO `student` VALUES ('3460', '丁林洁', '350922200403260020', '女', '549', null, '普通生', '回族', '思明', null, '丁朝华', '18950120592', '福建省厦门市思明区文屏路8号1306室', '3', 'simingG');
INSERT INTO `student` VALUES ('3461', '高海天', '350206200311220015', '男', '558', '11', '普通生', '汉族', '思明', null, '高忠', '13959289711', '福建省厦门市思明区思明南路279号701室', '3', 'simingG');
INSERT INTO `student` VALUES ('3462', '郭元玉', '350203200408072320', '女', '548', null, '普通生', '回族', '湖里', null, '唐华', '13600920321', '厦门市湖里区五缘西三里110号101室', '3', 'simingG');
INSERT INTO `student` VALUES ('3463', '黄楚昊', '350203200310272316', '男', '552', null, '普通生', '汉族', '思明', null, '潘宝珍', '13606077898', '福建省厦门市思明区体育路98号903室', '3', 'simingG');
INSERT INTO `student` VALUES ('3464', '黄清瑶', '342425200310162044', '女', '554', null, '普通生', '汉族', '湖里', null, '沈正分', '15960808019', '福建省厦门市湖里区南山路102号419室', '3', 'simingG');
INSERT INTO `student` VALUES ('3465', '黄思琦', '350205200406263521', '女', '556', '12', '普通生', '汉族', '海沧', null, '周春艺', '15985801185', '福建省厦门市海沧区后井村内坑社26号', '3', 'simingG');
INSERT INTO `student` VALUES ('3466', '江昊玥', '350203200406093320', '女', '555', null, '普通生', '汉族', '思明', null, '江展华', '13459267239', '福建省厦门市湖里区兴山花园二期乌石浦108号2105室', '3', 'simingG');
INSERT INTO `student` VALUES ('3467', '康桠平', '362421200502173512', '男', '555', null, '普通生', '汉族', '思明', null, '康桂根', '13860493631', '福建省厦门市翔安区新店镇祥吴五里9号503室', '3', 'simingG');
INSERT INTO `student` VALUES ('3468', '李洁玲', '350213200408230029', '女', '26', '11', '保送生', '汉族', '思明', null, '李宪双', '15860708936', '厦门市翔安区春江里25号501室', '2', 'simingG');
INSERT INTO `student` VALUES ('3469', '李梦瑶', '350881200404050564', '女', '553', null, '普通生', '汉族', '思明', null, '谢妹', '13860191686', '厦门市思明区莲花二村流芳里60号504室', '3', 'simingG');
INSERT INTO `student` VALUES ('3470', '李巍', '350203200401307027', '女', '30', '12', '保送生', '汉族', '思明', null, '魏云', '13950158775', '厦门市思明区龙虎南里14号601室', '2', 'simingG');
INSERT INTO `student` VALUES ('3471', '李伟豪', '341721200402190210', '男', '552', null, '普通生', '汉族', '思明', null, '李三宏', '13606029068', '福建省厦门市思明区龙山路154号601室', '3', 'simingG');
INSERT INTO `student` VALUES ('3472', '林华晨', '350212200309125518', '男', '551', null, '普通生', '汉族', '海沧', null, '林均访', '13358391355', '福建省厦门市海沧区亚太广场401梯901室', '3', 'simingG');
INSERT INTO `student` VALUES ('3473', '林晓艺', '350125200407313682', '女', '553', null, '普通生', '汉族', '海沧', null, '蔡美华', '18050025852', '福建省厦门市湖里区江头小区江浦北里26栋401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3474', '刘鹭翔', '350203200310297011', '男', '30', '12', '保送生', '汉族', '思明', null, '刘志远', '18205933093', '厦门市思明区龙虎南二里25-501', '2', 'simingG');
INSERT INTO `student` VALUES ('3475', '刘诗晴', '350783200311274021', '女', '553', null, '普通生', '汉族', '思明', null, '刘礼权', '13600930481', '厦门市思明区前埔南区前埔社233号', '3', 'simingG');
INSERT INTO `student` VALUES ('3476', '骆兮婷', '350203200404031628', '女', '553', null, '普通生', '汉族', '思明', null, '骆义明', '13606020307', '禾祥东路金源花园24之2号502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3477', '宋丽青', '360730200402141127', '女', '552', null, '普通生', '汉族', '湖里', null, '宋金福', '13959283979', '福建省厦门市湖里区后埔社355-1号', '3', 'simingG');
INSERT INTO `student` VALUES ('3478', '苏娜', '511922200312242100', '女', '27', '12', '保送生', '汉族', '思明', null, '苏伟', '15859270159', '厦门市思明区曾厝垵村东宅社42号', '2', 'simingG');
INSERT INTO `student` VALUES ('3479', '汪靓', '360921200308161521', '女', '556', '12', '普通生', '汉族', '思明', null, '胡大连', '15259208825', '福建省厦门市思明区前埔社区前村325号401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3480', '王雅萍', '360731200309235344', '女', '556', '11', '普通生', '汉族', '湖里', null, '蔡彩双', '13696998309', '厦门市湖里区五缘湾槟城道新景缘24梯501', '3', 'simingG');
INSERT INTO `student` VALUES ('3481', '林正毅', '350203200401192311', '男', '556', '11', '普通生', '汉族', '思明', null, '郑青云', '13003932716', '福建省厦门市思明区新华路65-5号1301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3482', '王钰帆', '350203200402133620', '女', '551', null, '普通生', '汉族', '思明', null, '吴素琴', '13616055141', '侨兴里19号401室', '3', 'simingG');
INSERT INTO `student` VALUES ('3483', '王志强', '36012420030603521X', '男', '555', null, '普通生', '汉族', '集美', null, '林清凤', '18250722981', '福建省厦门市集美区滨水一里112号滨水学校初中2016级', '3', 'simingG');
INSERT INTO `student` VALUES ('3484', '危志豪', '362531200311083619', '男', '20', '12', '保送生', '汉族', '集美', null, '危满文', '13950125934', '厦门市集美区灌口镇双桥一里22号302室', '2', 'simingG');
INSERT INTO `student` VALUES ('3485', '翁嘉怡', '350203200407081321', '女', '551', null, '普通生', '汉族', '思明', null, '翁齐文', '13328790700', '厦门市思明区上李龙虎南里29号402室', '3', 'simingG');
INSERT INTO `student` VALUES ('3486', '翁毓诚', '350206200311010034', '男', '553', null, '普通生', '汉族', '湖里', null, '郭晓玲', '13459002287', '福建省厦门市湖里区嘉园路14号之一301室', '3', 'simingG');
INSERT INTO `student` VALUES ('3487', '吴彦勋', '350524200405092519', '男', '553', null, '普通生', '汉族', '思明', null, '朱海丹', '13859708099', '福建省厦门市思明区东明路26号1501室', '3', 'simingG');
INSERT INTO `student` VALUES ('3488', '谢飞洋', '35020320040507163X', '男', '551', null, '普通生', '汉族', '思明', null, '陈琳琳', '18059255518', '厦门市思明区湖滨六里187号602室', '3', 'simingG');
INSERT INTO `student` VALUES ('3489', '徐靖颖', '350625200401131527', '女', '558', '12', '普通生', '汉族', '集美', null, '徐幼青', '13696956853', '集美区后溪镇新村中里欣一佳超市137号', '3', 'simingG');
INSERT INTO `student` VALUES ('3490', '严舒晴', '350505200408188525', '女', '553', null, '普通生', '汉族', '思明', null, '蔡志梅', '15805916322', '翔安区浦园一里26号901室', '3', 'simingG');
INSERT INTO `student` VALUES ('3491', '杨承宇', '362202200311173819', '男', '556', '12', '普通生', '汉族', '思明', null, '杨述根', '15060754980', '厦门市思明区寿彭路1号之五号楼307室', '3', 'simingG');
INSERT INTO `student` VALUES ('3492', '姚蕊', '350203200403011625', '女', '552', null, '普通生', '汉族', '思明', null, '王武红', '13806016496', '思明区东浦一里建发花园199号801室', '3', 'simingG');
INSERT INTO `student` VALUES ('3493', '詹琦', '350524200408218324', '女', '551', null, '普通生', '汉族', '湖里', null, '詹伟宏', '13515977999', '福建省厦门市湖里区仙岳路1937号1601室', '3', 'simingG');
INSERT INTO `student` VALUES ('3494', '张欢', '511922200312204729', '女', '560', '11', '普通生', '汉族', '湖里', null, '陈利珍', '13055500283', '四川省南江县下两镇罗山村1社', '3', 'simingG');
INSERT INTO `student` VALUES ('3495', '张凯强', '350203200312141619', '男', '552', null, '普通生', '汉族', '思明', null, '张守志', '13625008609', '文屏路83-1-402', '3', 'simingG');
INSERT INTO `student` VALUES ('3496', '张睿然', '350322200312081526', '女', '554', null, '普通生', '汉族', '海沧', null, '张德明', '18965150779', '厦门市海沧区彼岸小区386号1201室', '3', 'simingG');
INSERT INTO `student` VALUES ('3497', '张兆雄', '350206200404285512', '男', '556', '12', '普通生', '汉族', '思明', null, '张安城', '13515969753', '福建省厦门市湖里区吕岭路167号502室', '3', 'simingG');
INSERT INTO `student` VALUES ('3498', '赵子青', '350203200409233325', '女', '30', '12', '保送生', '汉族', '思明', null, '林丽玉', '18950100661', '厦门市思明区曾厝垵村西边社131-501', '2', 'simingG');
INSERT INTO `student` VALUES ('3499', '郑重', '360103200403300730', '男', '551', null, '普通生', '汉族', '思明', null, '郑元锋', '13395995469', '福建省厦门市思明区白鹿路57号602室', '3', 'simingG');
INSERT INTO `student` VALUES ('3500', '钟茹萍', '360731200309232629', '女', '555', null, '普通生', '汉族', '湖里', null, '王兴旺', '13365929525', '厦门市湖里区钟宅社4242-201室', '3', 'simingG');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '123456',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456');
INSERT INTO `user` VALUES ('5', 'user', '123456');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('7', '5', '2');
