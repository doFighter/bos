-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bos32
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `auth_function`
--

DROP TABLE IF EXISTS `auth_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_function` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `generatemenu` varchar(255) DEFAULT NULL,
  `zindex` int(11) DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AK_Key_2` (`name`),
  KEY `FK33r6np87v1p6gge7t6rpcao5h` (`pid`),
  CONSTRAINT `FK33r6np87v1p6gge7t6rpcao5h` FOREIGN KEY (`pid`) REFERENCES `auth_function` (`id`),
  CONSTRAINT `FK_Reference_1x` FOREIGN KEY (`pid`) REFERENCES `auth_function` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_function`
--

LOCK TABLES `auth_function` WRITE;
/*!40000 ALTER TABLE `auth_function` DISABLE KEYS */;
INSERT INTO `auth_function` VALUES ('11','基础档案','jichudangan',NULL,NULL,'1',0,NULL),('112','收派标准','standard',NULL,'page_base_standard.action','1',1,'11'),('113','取派员设置','staff',NULL,'page_base_staff.action','1',2,'11'),('114','区域设置','region',NULL,'page_base_region.action','1',3,'11'),('115','管理分区','subarea',NULL,'page_base_subarea.action','1',4,'11'),('116','管理定区/调度排班','decidedzone',NULL,'page_base_decidedzone.action','1',5,'11'),('12','受理','shouli',NULL,NULL,'1',1,NULL),('121','业务受理','noticebill',NULL,'page_qupai_noticebill_add.action','1',0,'12'),('122','工作单快速录入','quickworkordermanage',NULL,'page_qupai_quickworkorder.action','1',1,'12'),('124','工作单导入','workordermanageimport',NULL,'page_qupai_workorderimport.action','1',3,'12'),('13','调度','diaodu',NULL,NULL,'1',2,NULL),('131','查台转单','changestaff',NULL,NULL,'1',0,'13'),('132','人工调度','personalassign',NULL,'page_qupai_diaodu.action','1',1,'13'),('14','物流配送流程管理','zhongzhuan',NULL,NULL,'1',3,NULL),('141','启动配送流程','start',NULL,'workOrderManageAction_list.action','1',0,'14'),('142','查看个人任务','personaltask',NULL,'taskAction_findPersonalTask.action','1',1,'14'),('143','查看我的组任务','grouptask',NULL,'taskAction_findGroupTask.action','1',2,'14'),('40280981713f869201713fd76f570000','取派员列表查询权限','staff-list','zz','/page_base_staff.action','0',2,'113'),('8a7e843355a4392d0155a43aa7150000','删除取派员','staff.delete','xxx','staffAction_delete.action','0',1,'113');
/*!40000 ALTER TABLE `auth_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role`
--

DROP TABLE IF EXISTS `auth_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AK_Key_2` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role`
--

LOCK TABLES `auth_role` WRITE;
/*!40000 ALTER TABLE `auth_role` DISABLE KEYS */;
INSERT INTO `auth_role` VALUES ('40280981713a024c01713a0338bd0000','user','user','111'),('40280981713a100601713a1b06e30000','超级管理员','admin','超级管理员'),('40280981713a100601713a1b9b450001','普通管理员','common_user','普通管理员'),('402809817140492d01714053eac90000','超级管理员','admin','bb'),('40280981714075c801714081d1240001','user','user01',''),('40280981714075c801714082c3ae0002','staf-list','staf-list','');
/*!40000 ALTER TABLE `auth_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bc_decidedzone`
--

DROP TABLE IF EXISTS `bc_decidedzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bc_decidedzone` (
  `id` varchar(32) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `staff_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh0xplk12o52a6eryw4hcqnfwt` (`staff_id`),
  CONSTRAINT `FK_decidedzone_staff` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKh0xplk12o52a6eryw4hcqnfwt` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bc_decidedzone`
--

LOCK TABLES `bc_decidedzone` WRITE;
/*!40000 ALTER TABLE `bc_decidedzone` DISABLE KEYS */;
INSERT INTO `bc_decidedzone` VALUES ('123','平西区','4028098170f67d380170f67fc7090001'),('234','朝阳区','4028098170f67d380170f67fc7090002');
/*!40000 ALTER TABLE `bc_decidedzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bc_region`
--

DROP TABLE IF EXISTS `bc_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bc_region` (
  `id` varchar(32) NOT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postcode` varchar(50) DEFAULT NULL,
  `shortcode` varchar(30) DEFAULT NULL,
  `citycode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bc_region`
--

LOCK TABLES `bc_region` WRITE;
/*!40000 ALTER TABLE `bc_region` DISABLE KEYS */;
INSERT INTO `bc_region` VALUES ('QY001','北京市','北京市','东城区','110101','BJBJDC','beijing'),('QY002','北京市','北京市','西城区','110102','BJBJXC','beijing'),('QY003','北京市','北京市','朝阳区','110105','BJBJCY','beijing'),('QY004','北京市','北京市','丰台区','110106','BJBJFT','beijing'),('QY005','北京市','北京市','石景山区','110107','BJBJSJS','beijing'),('QY006','北京市','北京市','海淀区','110108','BJBJHD','beijing'),('QY007','北京市','北京市','门头沟区','110109','BJBJMTG','beijing'),('QY008','北京市','北京市','房山区','110111','BJBJFS','beijing'),('QY009','北京市','北京市','通州区','110112','BJBJTZ','beijing'),('QY010','北京市','北京市','顺义区','110113','BJBJSY','beijing'),('QY011','北京市','北京市','昌平区','110114','BJBJCP','beijing'),('QY012','北京市','北京市','大兴区','110115','BJBJDX','beijing'),('QY013','北京市','北京市','怀柔区','110116','BJBJHR','beijing'),('QY014','北京市','北京市','平谷区','110117','BJBJPG','beijing'),('QY015','北京市','北京市','密云县','110228','BJBJMY','beijing'),('QY016','北京市','北京市','延庆县','110229','BJBJYQ','beijing'),('QY017','河北省','石家庄市','长安区','130102','HBSJZZA','shijiazhuang'),('QY018','河北省','石家庄市','桥东区','130103','HBSJZQD','shijiazhuang'),('QY019','河北省','石家庄市','桥西区','130104','HBSJZQX','shijiazhuang'),('QY020','河北省','石家庄市','新华区','130105','HBSJZXH','shijiazhuang'),('QY021','河北省','石家庄市','井陉矿区','130107','HBSJZJXK','shijiazhuang'),('QY022','河北省','石家庄市','裕华区','130108','HBSJZYH','shijiazhuang'),('QY023','河北省','石家庄市','井陉县','130121','HBSJZJX','shijiazhuang'),('QY024','河北省','石家庄市','正定县','130123','HBSJZZD','shijiazhuang'),('QY025','河北省','石家庄市','栾城县','130124','HBSJZLC','shijiazhuang'),('QY026','河北省','石家庄市','行唐县','130125','HBSJZXT','shijiazhuang'),('QY027','河北省','石家庄市','灵寿县','130126','HBSJZLS','shijiazhuang'),('QY028','河北省','石家庄市','高邑县','130127','HBSJZGY','shijiazhuang'),('QY029','河北省','石家庄市','深泽县','130128','HBSJZSZ','shijiazhuang'),('QY030','河北省','石家庄市','赞皇县','130129','HBSJZZH','shijiazhuang'),('QY031','河北省','石家庄市','无极县','130130','HBSJZWJ','shijiazhuang'),('QY032','河北省','石家庄市','平山县','130131','HBSJZPS','shijiazhuang'),('QY033','河北省','石家庄市','元氏县','130132','HBSJZYS','shijiazhuang'),('QY034','河北省','石家庄市','赵县','130133','HBSJZZ','shijiazhuang'),('QY035','河北省','石家庄市','辛集市','130181','HBSJZXJ','shijiazhuang'),('QY036','河北省','石家庄市','藁城市','130182','HBSJZGC','shijiazhuang'),('QY037','河北省','石家庄市','晋州市','130183','HBSJZJZ','shijiazhuang'),('QY038','河北省','石家庄市','新乐市','130184','HBSJZXL','shijiazhuang'),('QY039','河北省','石家庄市','鹿泉市','130185','HBSJZLQ','shijiazhuang'),('QY040','天津市','天津市','和平区','120101','TJTJHP','tianjin'),('QY041','天津市','天津市','河东区','120102','TJTJHD','tianjin'),('QY042','天津市','天津市','河西区','120103','TJTJHX','tianjin'),('QY043','天津市','天津市','南开区','120104','TJTJNK','tianjin'),('QY044','天津市','天津市','河北区','120105','TJTJHB','tianjin'),('QY045','天津市','天津市','红桥区','120106','TJTJHQ','tianjin'),('QY046','天津市','天津市','滨海新区','120116','TJTJBHX','tianjin'),('QY047','天津市','天津市','东丽区','120110','TJTJDL','tianjin'),('QY048','天津市','天津市','西青区','120111','TJTJXQ','tianjin'),('QY049','天津市','天津市','津南区','120112','TJTJJN','tianjin'),('QY050','天津市','天津市','北辰区','120113','TJTJBC','tianjin'),('QY051','天津市','天津市','武清区','120114','TJTJWQ','tianjin'),('QY052','天津市','天津市','宝坻区','120115','TJTJBC','tianjin'),('QY053','天津市','天津市','宁河县','120221','TJTJNH','tianjin'),('QY054','天津市','天津市','静海县','120223','TJTJJH','tianjin'),('QY055','天津市','天津市','蓟县','120225','TJTJJ','tianjin'),('QY056','山西省','太原市','小店区','140105','SXTYXD','taiyuan'),('QY057','山西省','太原市','迎泽区','140106','SXTYYZ','taiyuan'),('QY058','山西省','太原市','杏花岭区','140107','SXTYXHL','taiyuan'),('QY059','山西省','太原市','尖草坪区','140108','SXTYJCP','taiyuan'),('QY060','山西省','太原市','万柏林区','140109','SXTYWBL','taiyuan'),('QY061','山西省','太原市','晋源区','140110','SXTYJY','taiyuan'),('QY062','山西省','太原市','清徐县','140121','SXTYQX','taiyuan'),('QY063','山西省','太原市','阳曲县','140122','SXTYYQ','taiyuan'),('QY064','山西省','太原市','娄烦县','140123','SXTYLF','taiyuan'),('QY065','山西省','太原市','古交市','140181','SXTYGJ','taiyuan');
/*!40000 ALTER TABLE `bc_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bc_staff`
--

DROP TABLE IF EXISTS `bc_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bc_staff` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `haspda` char(1) DEFAULT NULL,
  `deltag` char(1) DEFAULT NULL,
  `station` varchar(40) DEFAULT NULL,
  `standard` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bc_staff`
--

LOCK TABLES `bc_staff` WRITE;
/*!40000 ALTER TABLE `bc_staff` DISABLE KEYS */;
INSERT INTO `bc_staff` VALUES ('4028098170f2e3c50170f2e4a4ce0000','熊二','13244645897','1','1','运输一公司','标准一'),('4028098170f67d380170f67f43fb0000','熊大','13244645897','1','0','运输二公司','标准二'),('4028098170f67d380170f67fc7090001','李四','15789657896','1','0','运输三公司','标准一'),('4028098170f67d380170f67fc7090002','旺达','15789657896','1','0','运输二公司','标准二');
/*!40000 ALTER TABLE `bc_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bc_subarea`
--

DROP TABLE IF EXISTS `bc_subarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bc_subarea` (
  `id` varchar(32) NOT NULL,
  `decidedzone_id` varchar(32) DEFAULT NULL,
  `region_id` varchar(32) DEFAULT NULL,
  `addresskey` varchar(100) DEFAULT NULL,
  `startnum` varchar(30) DEFAULT NULL,
  `endnum` varchar(30) DEFAULT NULL,
  `single` char(1) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlndbc8oldgbg3k1x63n3n6t7n` (`decidedzone_id`),
  KEY `FKcjwxm19mx5njn3xyqgqp431mb` (`region_id`),
  CONSTRAINT `FK_area_decidedzone` FOREIGN KEY (`decidedzone_id`) REFERENCES `bc_decidedzone` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_area_region` FOREIGN KEY (`region_id`) REFERENCES `bc_region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKcjwxm19mx5njn3xyqgqp431mb` FOREIGN KEY (`region_id`) REFERENCES `bc_region` (`id`),
  CONSTRAINT `FKlndbc8oldgbg3k1x63n3n6t7n` FOREIGN KEY (`decidedzone_id`) REFERENCES `bc_decidedzone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bc_subarea`
--

LOCK TABLES `bc_subarea` WRITE;
/*!40000 ALTER TABLE `bc_subarea` DISABLE KEYS */;
INSERT INTO `bc_subarea` VALUES ('4028098171028e190171028f2b7f0000','123','QY002','hebei','123456','234656','0','北京南'),('40280981710626490171062d689c0000','123','QY057','二娃','123456','234656','0','北京南'),('402809817117110801711716ba460000','234','QY009','西城','123','456','0','北京西');
/*!40000 ALTER TABLE `bc_subarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qp_noticebill`
--

DROP TABLE IF EXISTS `qp_noticebill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qp_noticebill` (
  `id` varchar(32) NOT NULL,
  `staff_id` varchar(32) DEFAULT NULL,
  `customer_id` varchar(32) DEFAULT NULL,
  `customer_name` varchar(20) DEFAULT NULL,
  `delegater` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `pickaddress` varchar(200) DEFAULT NULL,
  `arrivecity` varchar(20) DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL,
  `pickdate` date DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `volume` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ordertype` varchar(20) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl5j3pm969oy1qdc1318jrmbgt` (`user_id`),
  KEY `FKhmbqr6qlg0uets978w5xshler` (`staff_id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhmbqr6qlg0uets978w5xshler` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FKl5j3pm969oy1qdc1318jrmbgt` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qp_noticebill`
--

LOCK TABLES `qp_noticebill` WRITE;
/*!40000 ALTER TABLE `qp_noticebill` DISABLE KEYS */;
INSERT INTO `qp_noticebill` VALUES ('40280981711a8aa801711a8b9f600000','4028098170f67d380170f67fc7090001','6','小黑','小黑','13722222222','天津市南开区红旗路20号','','',NULL,NULL,NULL,'','','自动分单',NULL),('40280981711a9c7401711a9ce1570000',NULL,'1','张三','张三','13811111111','北京市西城区长安街100号','','',NULL,NULL,NULL,'','','人工分单',NULL);
/*!40000 ALTER TABLE `qp_noticebill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qp_workbill`
--

DROP TABLE IF EXISTS `qp_workbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qp_workbill` (
  `id` varchar(32) NOT NULL,
  `noticebill_id` varchar(32) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `pickstate` varchar(20) DEFAULT NULL,
  `buildtime` timestamp NULL DEFAULT NULL,
  `attachbilltimes` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `staff_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKggojlcovnpimuukxcueb18apt` (`noticebill_id`),
  KEY `FK55ckcnjyvwinnnniu5jpelg7y` (`staff_id`),
  CONSTRAINT `FK55ckcnjyvwinnnniu5jpelg7y` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_workbill_noticebill_fk` FOREIGN KEY (`noticebill_id`) REFERENCES `qp_noticebill` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKggojlcovnpimuukxcueb18apt` FOREIGN KEY (`noticebill_id`) REFERENCES `qp_noticebill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qp_workbill`
--

LOCK TABLES `qp_workbill` WRITE;
/*!40000 ALTER TABLE `qp_workbill` DISABLE KEYS */;
INSERT INTO `qp_workbill` VALUES ('40280981711a8aa801711a8b9faa0001','40280981711a8aa801711a8b9f600000','新单','未取件','2020-03-26 21:51:30',0,'','4028098170f67d380170f67fc7090001');
/*!40000 ALTER TABLE `qp_workbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qp_workordermanage`
--

DROP TABLE IF EXISTS `qp_workordermanage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qp_workordermanage` (
  `id` varchar(32) NOT NULL,
  `arrivecity` varchar(20) DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `floadreqr` varchar(255) DEFAULT NULL,
  `prodtimelimit` varchar(40) DEFAULT NULL,
  `prodtype` varchar(40) DEFAULT NULL,
  `sendername` varchar(20) DEFAULT NULL,
  `senderphone` varchar(20) DEFAULT NULL,
  `senderaddr` varchar(200) DEFAULT NULL,
  `receivername` varchar(20) DEFAULT NULL,
  `receiverphone` varchar(20) DEFAULT NULL,
  `receiveraddr` varchar(200) DEFAULT NULL,
  `feeitemnum` int(11) DEFAULT NULL,
  `actlweit` double DEFAULT NULL,
  `vol` varchar(20) DEFAULT NULL,
  `managerCheck` varchar(1) DEFAULT NULL,
  `updatetime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qp_workordermanage`
--

LOCK TABLES `qp_workordermanage` WRITE;
/*!40000 ALTER TABLE `qp_workordermanage` DISABLE KEYS */;
INSERT INTO `qp_workordermanage` VALUES ('1','1','1',1,1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `qp_workordermanage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_function`
--

DROP TABLE IF EXISTS `role_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_function` (
  `role_id` varchar(32) NOT NULL,
  `function_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`function_id`),
  KEY `FK_Reference_2xx` (`function_id`),
  CONSTRAINT `FK10qo908yd9evkyb40vf88og85` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`),
  CONSTRAINT `FK5f8riddotqjpm9vly0b8c5nmf` FOREIGN KEY (`function_id`) REFERENCES `auth_function` (`id`),
  CONSTRAINT `FK_Reference_2x` FOREIGN KEY (`function_id`) REFERENCES `auth_function` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_2xx` FOREIGN KEY (`function_id`) REFERENCES `auth_function` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_3x` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_function`
--

LOCK TABLES `role_function` WRITE;
/*!40000 ALTER TABLE `role_function` DISABLE KEYS */;
INSERT INTO `role_function` VALUES ('40280981713a100601713a1b06e30000','11'),('40280981713a100601713a1b9b450001','11'),('402809817140492d01714053eac90000','11'),('40280981714075c801714081d1240001','11'),('40280981714075c801714082c3ae0002','11'),('40280981713a100601713a1b06e30000','112'),('40280981713a100601713a1b9b450001','112'),('402809817140492d01714053eac90000','112'),('40280981713a100601713a1b06e30000','113'),('40280981713a100601713a1b9b450001','113'),('402809817140492d01714053eac90000','113'),('40280981714075c801714081d1240001','113'),('40280981714075c801714082c3ae0002','113'),('40280981713a100601713a1b06e30000','114'),('40280981713a100601713a1b9b450001','114'),('402809817140492d01714053eac90000','114'),('40280981713a100601713a1b06e30000','115'),('40280981713a100601713a1b9b450001','115'),('402809817140492d01714053eac90000','115'),('40280981713a100601713a1b06e30000','116'),('40280981713a100601713a1b9b450001','116'),('402809817140492d01714053eac90000','116'),('40280981713a100601713a1b06e30000','12'),('40280981713a100601713a1b9b450001','12'),('402809817140492d01714053eac90000','12'),('40280981713a100601713a1b06e30000','121'),('40280981713a100601713a1b9b450001','121'),('402809817140492d01714053eac90000','121'),('40280981713a100601713a1b06e30000','122'),('40280981713a100601713a1b9b450001','122'),('402809817140492d01714053eac90000','122'),('40280981713a100601713a1b06e30000','124'),('40280981713a100601713a1b9b450001','124'),('402809817140492d01714053eac90000','124'),('40280981713a100601713a1b06e30000','13'),('402809817140492d01714053eac90000','13'),('40280981713a100601713a1b06e30000','131'),('402809817140492d01714053eac90000','131'),('40280981713a100601713a1b06e30000','132'),('402809817140492d01714053eac90000','132'),('40280981713a024c01713a0338bd0000','14'),('40280981713a100601713a1b06e30000','14'),('402809817140492d01714053eac90000','14'),('40280981713a024c01713a0338bd0000','141'),('40280981713a100601713a1b06e30000','141'),('402809817140492d01714053eac90000','141'),('40280981713a024c01713a0338bd0000','142'),('40280981713a100601713a1b06e30000','142'),('402809817140492d01714053eac90000','142'),('40280981713a024c01713a0338bd0000','143'),('40280981713a100601713a1b06e30000','143'),('402809817140492d01714053eac90000','143'),('402809817140492d01714053eac90000','40280981713f869201713fd76f570000'),('40280981714075c801714081d1240001','40280981713f869201713fd76f570000'),('40280981714075c801714082c3ae0002','40280981713f869201713fd76f570000'),('40280981713a100601713a1b06e30000','8a7e843355a4392d0155a43aa7150000'),('40280981713a100601713a1b9b450001','8a7e843355a4392d0155a43aa7150000'),('402809817140492d01714053eac90000','8a7e843355a4392d0155a43aa7150000');
/*!40000 ALTER TABLE `role_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_customer`
--

DROP TABLE IF EXISTS `t_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `station` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `decidedzone_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_customer`
--

LOCK TABLES `t_customer` WRITE;
/*!40000 ALTER TABLE `t_customer` DISABLE KEYS */;
INSERT INTO `t_customer` VALUES (1,'张三','百度','13811111111','北京市西城区长安街100号',NULL),(2,'李四','哇哈哈','13822222222','上海市虹桥区南京路250号','234'),(3,'王五','搜狗','13533333333','天津市河北区中山路30号','234'),(4,'赵六','联想','18633333333','石家庄市桥西区和平路10号',NULL),(5,'小白','测试空间','18511111111','内蒙古自治区呼和浩特市和平路100号','234'),(6,'小黑','联想','13722222222','天津市南开区红旗路20号','123'),(7,'小花','百度','13733333333','北京市东城区王府井大街20号','123'),(8,'小李','长城','13788888888','北京市昌平区建材城西路100号','123');
/*!40000 ALTER TABLE `t_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id` varchar(32) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salary` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `station` varchar(40) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('1000','admin','123456',NULL,NULL,NULL,NULL,NULL,NULL),('40280981713b08f701713b0b5b120000','admin','123456',1000,NULL,'女','厅点','13244645454',NULL),('40280981713b08f701713b0dd5140001','admin01','123456',1000,NULL,'男','基地运转中心','18511111111',NULL),('40280981713b14d801713b1810050000','admin03','123456',NULL,NULL,'','','18511111111',NULL),('40280981713b501501713b50cf040000','admin','123456',1000,'2019-04-08','男','分公司','13244645454',NULL),('402809817140492d017140560de00001','user01','123456',NULL,NULL,'','','18511111111',NULL),('40280981714065610171406a74f80000','user01','123456',1000,'2020-03-31','','','13244645454',NULL),('402809817140722d01714073a8230000','user01','123456',NULL,'2020-03-31','','','13244645454',NULL),('40280981714075c80171407d68520000','user02','123456',1000,'2020-03-31','男','基地运转中心','18511111111',NULL),('40280981714075c8017140831ab20003','user04','123456',NULL,'2020-03-31','女','','18511111111',NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKqqlqhas35obkljn18mrh6mmms` (`role_id`),
  CONSTRAINT `FK_Reference_4x` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_5x` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKeqon9sx5vssprq67dxm3s7ump` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKqqlqhas35obkljn18mrh6mmms` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('402809817140492d017140560de00001','40280981713a024c01713a0338bd0000'),('40280981714065610171406a74f80000','40280981713a024c01713a0338bd0000'),('40280981713b08f701713b0b5b120000','40280981713a100601713a1b9b450001'),('40280981713b08f701713b0dd5140001','40280981713a100601713a1b9b450001'),('40280981713b14d801713b1810050000','40280981713a100601713a1b9b450001'),('40280981714075c80171407d68520000','402809817140492d01714053eac90000'),('40280981714075c8017140831ab20003','40280981714075c801714082c3ae0002');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-20 21:21:53
