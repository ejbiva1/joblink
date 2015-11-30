-- MySQL dump 10.13  Distrib 5.5.37, for Linux (x86_64)
--
-- Host: localhost    Database: JOBLINK
-- ------------------------------------------------------
-- Server version	5.5.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `TB_APPLICATION`
--

DROP TABLE IF EXISTS `TB_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_APPLICATION` (
  `ID` varchar(50) NOT NULL COMMENT '申请ID',
  `POSITION_ID` varchar(50) NOT NULL COMMENT '职位ID',
  `APPLICANT_USERID` varchar(50) NOT NULL COMMENT '求职者ID',
  `APPLY_DATE` datetime NOT NULL COMMENT '提交申请日期时间',
  `IF_INTERVIEW` tinyint(1) NOT NULL COMMENT '是否面试',
  `STATUS` int(11) NOT NULL DEFAULT '0' COMMENT '申请状态 0 已申请, 1 已付款, 2 已面试(面试官评价), 3 已评价(求职者评价), 4 已推荐, 5 已成功(内推入职)',
  `TECH_RATE` int(11) DEFAULT NULL COMMENT '核心技术评分',
  `FRAMEWORK_RATE` int(11) DEFAULT NULL COMMENT '框架技术评分',
  `DATABASE_RATE` int(11) DEFAULT NULL COMMENT '数据库技术评分',
  `ENGLISH_RATE` int(11) DEFAULT NULL COMMENT '英语水平评分',
  `COMMUNICATION_RATE` int(11) DEFAULT NULL COMMENT '交流能力评分',
  `MANAGEMENT_RATE` int(11) DEFAULT NULL COMMENT '管理能力评分',
  `INTERVIEWER_COMMENT` varchar(1000) DEFAULT NULL COMMENT '面试官反馈',
  `INTERVIEWER_COMMENT_DATE` datetime DEFAULT NULL COMMENT '面试官反馈日期时间',
  `APPLICANT_COMMENT` varchar(1000) DEFAULT NULL COMMENT '求职者反馈',
  `APPLICANT_COMMENT_DATE` datetime DEFAULT NULL COMMENT '求职者反馈日期时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `POSITION_ID` (`POSITION_ID`,`APPLICANT_USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='求职申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_APPLICATION`
--

LOCK TABLES `TB_APPLICATION` WRITE;
/*!40000 ALTER TABLE `TB_APPLICATION` DISABLE KEYS */;
INSERT INTO `TB_APPLICATION` VALUES ('8a282a22501991b601501996e9ee0001','8a282a22500f38c70150198668670005','8a282a224fdb6f67014fdb854c860004','2015-09-29 22:52:12',0,3,5,4,4,3,3,3,'还可以','2015-09-29 22:52:39','多谢','2015-09-29 22:53:00'),('8a282a22504d1eb601505027c46e000f','8a282a22504d1eb601504f2e27bd000b','8a282a22504d1eb60150501ba48b000d','2015-10-10 13:09:54',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `TB_APPLICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_BALANCE_SHEET`
--

DROP TABLE IF EXISTS `TB_BALANCE_SHEET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_BALANCE_SHEET` (
  `ID` varchar(50) NOT NULL,
  `INCOME_RESOURCE` int(11) DEFAULT NULL COMMENT '1:面试收入 +N2:培训收入 +N3:下载简历 -',
  `REFERENCE_ID` int(11) DEFAULT NULL COMMENT '根据收入来源来关联不同的其他ID 比如 如果TYPE=1 REFERENCE_ID去取的是INTERVIEW_ID,如果是培训收入则去取TRAINING_ID',
  `CREATE_USERID` varchar(50) NOT NULL COMMENT '创建人ID',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建日期时间',
  `LAST_UPDATE_USERID` varchar(50) NOT NULL COMMENT '最后更新人ID',
  `LAST_UPDATE_DATE` datetime NOT NULL COMMENT '最后更新日期时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户余额表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BALANCE_SHEET`
--

LOCK TABLES `TB_BALANCE_SHEET` WRITE;
/*!40000 ALTER TABLE `TB_BALANCE_SHEET` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_BALANCE_SHEET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_EMPLOYER`
--

DROP TABLE IF EXISTS `TB_EMPLOYER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_EMPLOYER` (
  `ID` varchar(50) NOT NULL,
  `EMPLOYER_NAME` varchar(50) DEFAULT NULL COMMENT '公司或雇主名称',
  `CATEGORY` int(11) DEFAULT NULL COMMENT '行业类别N1：金融N2：互联网N3：电商N4：软件服务N5：产品研发N20：其他',
  `SCALE` int(11) DEFAULT NULL COMMENT '规模N1：10人N2：50人N3：100人N4：500人N5：1000人N6：5000人N7：更多',
  `ADDRESS` varchar(200) DEFAULT NULL COMMENT '公司地址',
  `BUSINESS_FOCUS` text COMMENT '主营业务 比如互联网金融的P2P,小贷，担保等',
  `WELFARE` text COMMENT '公司福利',
  `CREATE_USERID` varchar(50) NOT NULL COMMENT '创建人ID',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建日期时间',
  `LAST_UPDATE_USERID` varchar(50) NOT NULL COMMENT '最后更新人ID',
  `LAST_UPDATE_DATE` datetime NOT NULL COMMENT '最后更新日期时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMPLOYER_NAME` (`EMPLOYER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业雇主或公司表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_EMPLOYER`
--

LOCK TABLES `TB_EMPLOYER` WRITE;
/*!40000 ALTER TABLE `TB_EMPLOYER` DISABLE KEYS */;
INSERT INTO `TB_EMPLOYER` VALUES ('8a282a224f7f1fcc014f7f21555a0003','Infosys',4,7,'集电港','外包','一般','8a282a224f7f1fcc014f7f2108f80002','2015-08-30 23:02:15','8a282a224f7f1fcc014f7f2108f80002','2015-08-30 23:02:15'),('8a282a224fe62801014feafc50ad0003','IBM',4,7,'杨浦区五角场创智天地',NULL,NULL,'8a282a224fe62801014feafb4dc60002','2015-09-20 21:40:48','8a282a22504808bc01504cfa5f4e0019','2015-10-09 22:23:31'),('8a282a224fe62801014feb0173880004','腾讯',2,1,'上海',NULL,NULL,'8a282a224f7f1fcc014f7f2108f80002','2015-09-20 21:46:25','8a282a224f7f1fcc014f7f2108f80002','2015-09-20 21:48:05'),('8a282a224fe62801014feb05543d0005','携程',2,7,'上海	  福泉路99号携程网络技术大楼','携程的总部设在中国上海，在北京、广州、成都、香港、深圳、杭州、南京、武汉、西安、重庆、青岛、沈阳、厦门、昆明等22个城市设有分支机构。携程现有员工30000余人，是国内领先的综合性旅行服务公司，提供酒店预订、机票预订、旅游度假、商旅管理、美食订餐及旅游资讯等全方位旅行服务。 ','还不错，给股票，就是累点','8a282a224f7f1fcc014f7f2108f80002','2015-09-20 21:50:39','8a282a22504808bc0150481353050002','2015-10-15 17:46:57'),('8a282a224fe62801014feb0654700006','摩根士丹利',1,1,'上海市 长宁区',NULL,NULL,'8a282a224f7f1fcc014f7f2108f80002','2015-09-20 21:51:44','8a282a224f7f1fcc014f7f2108f80002','2015-09-20 21:51:44'),('8a282a224fe62801014feb07baa00007','霍尼韦尔',5,1,'上海市 长宁区',NULL,NULL,'8a282a224f7f1fcc014f7f2108f80002','2015-09-20 21:53:16','8a282a224f7f1fcc014f7f2108f80002','2015-09-20 21:57:07'),('8a282a224fe62801014feb097c680008','Google',2,7,'黄浦区莱福士大厦',NULL,NULL,'8a282a224fe62801014feafb4dc60002','2015-09-20 21:55:11','8a282a224fe62801014feafb4dc60002','2015-09-20 21:55:11'),('8a282a224fe62801014feb09ccc30009','网易',2,7,'北京',NULL,NULL,'8a282a224f7f1fcc014f7f2108f80002','2015-09-20 21:55:32','8a282a224f7f1fcc014f7f2108f80002','2015-09-20 22:20:13'),('8a282a224fe62801014feb0b1c89000a','花旗软件',4,4,'浦东新区张江高科浦东软件园三期',NULL,NULL,'8a282a224fe62801014feafb4dc60002','2015-09-20 21:56:58','8a282a224fe62801014feafb4dc60002','2015-09-20 21:56:58'),('8a282a224fe62801014feb0d20c0000b','万达信息',4,5,'漕河泾科技园',NULL,NULL,'8a282a224fe62801014feafb4dc60002','2015-09-20 21:59:10','8a282a224fe62801014feafb4dc60002','2015-09-20 21:59:10'),('8a282a224fe62801014feb0dc451000c','SAP',5,5,'浦东软件园三期',NULL,NULL,'8a282a224fe62801014feafb4dc60002','2015-09-20 21:59:52','8a282a224fe62801014feafb4dc60002','2015-09-20 21:59:52'),('8a282a224fe62801014feb0ea3c8000d','一号店',3,7,'张江软件园',NULL,NULL,'8a282a224f7f1fcc014f7f2108f80002','2015-09-20 22:00:49','8a282a22504808bc015048315aa9000c','2015-10-09 00:03:40'),('8a282a224fe62801014feb210755000e','陆金所',1,1,'陆家嘴',NULL,NULL,'8a282a224f7f1fcc014f7f2108f80002','2015-09-20 22:20:54','8a282a224f7f1fcc014f7f2108f80002','2015-09-20 22:20:54'),('8a282a224ff5a3e0014ffac34c480001','Bleum',4,4,'上海市长宁区延安西路1118号',NULL,NULL,'8a282a224fdb6f67014fdb76ad1b0002','2015-09-23 23:12:27','8a282a224fdb6f67014fdb76ad1b0002','2015-09-23 23:12:27'),('8a282a224ff5a3e00150037b4c030006','PWC',4,5,'浦东张江软件园金科路','软件资讯，外包，服务等','还可以，美资工资都差不多','8a282a224ff5a3e00150037a801c0005','2015-09-25 15:50:23','8a282a22504d1eb601505a0ad99e0013','2015-10-12 11:16:17'),('8a282a22504d1eb601504d25da900003','森浦资讯',1,4,'陆家嘴世纪金融广场',NULL,NULL,'8a282a22504d1eb601504d25214e0002','2015-10-09 23:08:57','8a282a22504d1eb601504d25214e0002','2015-10-09 23:16:04'),('8a282a22504d1eb601504f24a3d00007','思科',5,7,'上海市漕河泾高新技术开发区宜山路900号','思科公司是全球领先的网络解决方案供应商。今天，网络作为一个平台成为了商业、教育、政府和家庭通信不可或缺的一部分，思科的互联网技术正是这些网络的基础。','相当不错','8a282a22504d1eb601504f1dc8460006','2015-10-10 08:26:52','8a282a22504d1eb601504f1dc8460006','2015-10-10 08:26:52'),('8a282a22504d1eb60150502074af000e','IT',2,7,'',NULL,NULL,'8a282a22504d1eb60150501ba48b000d','2015-10-10 13:01:55','8a282a22504d1eb60150501ba48b000d','2015-10-10 13:01:55'),('8a282a22504d1eb601505c5a6d210018','上海正念信息科技有限公司',5,2,'上海市卢湾区黄陂南路700号D座','O2O定制软件','还可以','8a282a22504d1eb601505c56e47b0017','2015-10-12 22:00:41','8a282a22504d1eb601505c56e47b0017','2015-10-12 22:00:41'),('8a282a22504d1eb6015061a13ca60020','平安科技',1,7,'上海浦东徐汇区龙华',NULL,NULL,'8a282a22504d1eb60150619ec3ea001f','2015-10-13 22:36:08','8a282a22504d1eb60150619ec3ea001f','2015-10-13 22:36:08'),('8a282a225063de80015066af57590004','蚂蚁金服',1,6,'上海市浦东新区杨高中路','蚂蚁金服-支付事业群-技术部','待遇不用说 还给给股票','8a282a225063de80015066a9512e0003','2015-10-14 22:09:38','8a282a225063de80015066a9512e0003','2015-10-14 22:09:38');
/*!40000 ALTER TABLE `TB_EMPLOYER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_PAYMENT`
--

DROP TABLE IF EXISTS `TB_PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_PAYMENT` (
  `ID` varchar(50) NOT NULL,
  `PAYMENT_TYPE` int(11) NOT NULL COMMENT '支付类型: 1 面试; 2 培训; 3 下载简历',
  `REFERENCE_ID` varchar(50) NOT NULL COMMENT '关联ID',
  `PAYMENT_CHANNEL` enum('wechat','alipay') NOT NULL COMMENT '支付渠道',
  `PAYMENT_AMOUNT` decimal(5,2) NOT NULL COMMENT '金额',
  `PAYMENT_USERID` varchar(50) NOT NULL COMMENT '支付人ID',
  `SUBMIT_DATE` datetime DEFAULT NULL COMMENT '提交订单日期时间',
  `PAYMENT_DATE` datetime DEFAULT NULL COMMENT '支付日期时间',
  `STATUS` int(11) DEFAULT '0' COMMENT '状态  0 未支付  1 已支付',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PAYMENT_TYPE` (`PAYMENT_TYPE`,`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PAYMENT`
--

LOCK TABLES `TB_PAYMENT` WRITE;
/*!40000 ALTER TABLE `TB_PAYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_POSITION`
--

DROP TABLE IF EXISTS `TB_POSITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_POSITION` (
  `ID` varchar(50) NOT NULL COMMENT '职位ID',
  `EMPLOYER_ID` varchar(50) NOT NULL COMMENT '所属公司ID',
  `TITLE` varchar(50) NOT NULL COMMENT '职位名称',
  `LOCATION` varchar(50) NOT NULL COMMENT '工作地点',
  `EXPERIENCE_AGE` varchar(50) DEFAULT NULL COMMENT '要求工作年限',
  `JD` text COMMENT '职位描述',
  `REQUIREMENT` text COMMENT '职位需求',
  `SALARY_PACKAGE` varchar(50) DEFAULT NULL COMMENT '工资范围(年薪)',
  `TAG` varchar(200) DEFAULT NULL COMMENT '标签',
  `PUBLISH_USERID` varchar(50) NOT NULL COMMENT '发布人ID',
  `IF_INTERVIEW` tinyint(1) NOT NULL COMMENT '是否提供面试',
  `INTERVIEW_CHARGE` int(11) DEFAULT NULL COMMENT '面试费用',
  `IF_TRAINING` tinyint(1) DEFAULT NULL COMMENT '是否提供培训',
  `START_DATE` date DEFAULT NULL COMMENT '有效期起始日期',
  `EXPIRED_DATE` date NOT NULL COMMENT '有效期截止日期',
  `CREATE_USERID` varchar(50) NOT NULL COMMENT '创建人ID',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建日期时间',
  `LAST_UPDATE_USERID` varchar(50) NOT NULL COMMENT '最后更新人ID',
  `LAST_UPDATE_DATE` datetime NOT NULL COMMENT '最后更新日期时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_POSITION`
--

LOCK TABLES `TB_POSITION` WRITE;
/*!40000 ALTER TABLE `TB_POSITION` DISABLE KEYS */;
INSERT INTO `TB_POSITION` VALUES ('8a282a224f7f1fcc014f7f2249670004','8a282a224f7f1fcc014f7f21555a0003','外派摩根Java开发工程师','上海','3年','外派到摩根办公室','core java精通，算法精通，数据库','20k',NULL,'8a282a224f7f1fcc014f7f2108f80002',1,50,NULL,NULL,'2017-08-01','8a282a224f7f1fcc014f7f2108f80002','2015-08-30 23:03:17','8a282a224f7f1fcc014f7f2108f80002','2015-08-30 23:03:17'),('8a282a224fdb6f67014fdb987ead0005','8a282a224f7f1fcc014f7f21555a0003','外派摩根士丹利Java顾问','上海','3-7年','客户onsite 开发，与摩根士丹利全球团队合作开发维护内部信息系统。','精通core java，比如多线程，集合类，垃圾回收，JVM调优，熟悉常用算法，比如排序搜索，熟悉数据库设计建模以及开发相关知识。','15k-25k','Core Java精通,多线程并行计算精通,英语精通,','8a282a224fdb6f67014fdb854c860004',1,50,NULL,NULL,'2017-09-01','8a282a224fdb6f67014fdb854c860004','2015-09-17 21:57:28','8a282a224fdb6f67014fdb854c860004','2015-09-22 23:21:21'),('8a282a224fdb6f67014fdb9acece0006','8a282a224f7f1fcc014f7f21555a0003','外派摩根史丹利C  顾问','上海','3-8年','客户onsite 参与摩根内部交易系统的开发维护，与各金融机构后台信息系统维护人员沟通协作，完成接入，问题解决','精通C  ，熟悉linux下的shell 以及perl脚本，熟悉基础数据结构以及算法','15k-28k',NULL,'8a282a224fdb6f67014fdb854c860004',1,50,NULL,NULL,'2017-09-01','8a282a224fdb6f67014fdb854c860004','2015-09-17 21:59:59','8a282a224fdb6f67014fdb854c860004','2015-09-17 21:59:59'),('8a282a224fdb6f67014fdba9d6a60007','8a282a224f7f1fcc014f7f21555a0003','外派摩根史丹利C#顾问','上海','3-8年','客户onsite，与摩根士丹利团队协作开发维护内部信息系统。','精通面向对象。\n精通C#，熟悉WPF。\n熟悉DB2或者Sybase。\n英语口语熟练能沟通','15k-25k',NULL,'8a282a224fdb6f67014fdb854c860004',1,50,NULL,NULL,'2017-09-01','8a282a224fdb6f67014fdb854c860004','2015-09-17 22:16:24','8a282a224fdb6f67014fdb854c860004','2015-09-17 22:16:24'),('8a282a224fdb6f67014fdbad1fd40008','8a282a224f7f1fcc014f7f21555a0003','外派东方证券C#','上海','3-8年','外派到东方证券现场开发，负责设计开发内部测试平台系统，职位是开发职位，只不过开发的系统是给内部用于自动化测试用的，因为证券公司跟其他金融机构有很多外部数据报文，经常变动，因此导致需要回归测试。自动化测试平台基于.Net平台开发','熟练掌握面向对象概念，熟练掌握C#,.Net framework, 熟悉Mysql设计开发','15k-25k',NULL,'8a282a224fdb6f67014fdb854c860004',1,50,NULL,NULL,'2015-11-01','8a282a224fdb6f67014fdb854c860004','2015-09-17 22:20:00','8a282a224fdb6f67014fdb854c860004','2015-09-17 22:20:00'),('8a282a22500f38c701501477a1cb0002','8a282a224fe62801014feb0b1c89000a','Java Senior Developer','上海','3年以上','The Strategic Asset Servicing Program at Citi is a multi-year program of work to replace multiple regional legacy systems with a global architecture. The program consists of a number of streams of work supported by a n-tier component based architecture.\n \nGiven the global nature of the program, requirements are expected to be complex and diverse. Strong individuals with relevant experience are required to enhance the existing team in London and work closely with the global team.','Min 2 years IT experience required, with strong Java\nDesign skills: UML Design patterns Strong analysis/documentation skills\nBachelor’s degree Computing or Engineering, or equivalent IT/Java experience\nPrior hands on experience with the following required:\nLanguages: Java 7, SQL\nDB: JMS/EMS Oracle\nFrameworks: Hibernate preferred, but will consider strong experience with JBPM \nWeblogic IBM Websphere\nO/S: Unix','15k-25k','Core Java精通,Java框架精通,英语精通,','8a282a224f7f1fcc014f7f2108f80002',1,50,NULL,NULL,'2015-12-01','8a282a224f7f1fcc014f7f2108f80002','2015-09-28 22:59:55','8a282a224f7f1fcc014f7f2108f80002','2015-09-28 22:59:55'),('8a282a22500f38c70150197eda9b0003','8a282a224fe62801014feb0b1c89000a','Applications Development Programmer Analyst','上海','3年以上','This position will be a senior DB/Java developer for Account Master Central (AMC) within ISG which provides the authoritative source of institutional account and entity reference data through service-oriented operations teams and state-of-the art technologies, which facilitate the collection, storage, analysis and distribution.\nResponsibilities\nCommunicate with clients on requirement and design; deliver creative and innovative projects with good quality and productivity.\nDevelop all areas of Middle-Tier and Back-end system programming especially DB development, designing and coding, testing and troubleshooting, supporting. \nProvides strong technical solution and comprehensive system design and proposal to global team.\nConduct code review\nHelp and guide junior team members.\nHelp TL to manage development lifecycle including development process, program progress, software quality, program release and application supporting.\nOpportunities\nUnderstand reference data using in the global financial market.\nWork together with global team\nEducation\nAt least bachelor degree.\nMajor in computer science related\nWith Financial knowledge or background is a good plus.','Skill required\nNo less than 3 years J2EE development experience.\nWith strong DB knowledge, be familiar with Oracle/Sybase [Preferred], MS SQL DB2, postgres, mysql, etc.\nStrong experiences in SQL, SP and JDBC is a must JDBC, be familiar with OR-Mapping tools.\nExperience in designing and architecture.\nBe skilled at Core Java and J2EE technologies such as JMS, JMX, SOAP/Restful web service, design pattern and so on.\nRich experience on performance tuning and multi-threading.\nBe familiar with XML and related technology.\nExperience in document generation via Java and open source libraries, such as iText (PDF), Apache POI (Word, Excel), etc.\nExperience on Large Document/File Upload handling; parse them into usable tokens for DB Loading or other processing\nBe skilled at Unix shell and command\nBe familiar with build script languages, like ant, maven.\nGood communication skills and English skills\nGood team player, strong responsibility, work under high pressure, result oriented.\nSkill Optional\nHas experience in working in the finance industry is a good plus.\nHas experience on web development is a good plus.\nExperience on EJB 2.0  / Image Manipulation in Java is a good plus.\nHas experience on c#/.NET development is a good plus.\nExperience on Autosys is a good plus.\nExperience on Perl is a good plus.\nHas experience on BPM is a plus\nHas experience in non-sql DB like mongo/hadoop is a plus. \nHas experience on Document/Imaging Databases such as Documentum is a plus.','10-17k','','8a282a224f7f1fcc014f7f2108f80002',1,50,NULL,NULL,'2015-12-01','8a282a224f7f1fcc014f7f2108f80002','2015-09-29 22:25:55','8a282a224f7f1fcc014f7f2108f80002','2015-09-29 22:25:55'),('8a282a22500f38c70150198668670005','8a282a224fe62801014feb0b1c89000a','IT Business Analyst','上海','3年以上','Work on ISG data distribution infrastructure which is the key channel for data distribution to downstream systems.\nThis role will join the technical design, construction and testing and take part in the performance tuning.\nJob Description:\nWorking as sub project sub leader on ISG DDI project.\nCoordinate with on shore manager and local team leader on project delivery.\nTake part in the system design and requirement analysis, and then take over construction in offshore till delivery.\nProviding L3 support.','Strong understanding of RDS design and data flow. \nGood communication skills with counter parties.\nJava programming skills and script skills, Oracle is preferred.\nGood English capability\nGood communication skills and coordination skills\nHard working and good team player','10-17k','','8a282a224f7f1fcc014f7f2108f80002',1,50,NULL,NULL,'2015-12-01','8a282a224f7f1fcc014f7f2108f80002','2015-09-29 22:34:10','8a282a224f7f1fcc014f7f2108f80002','2015-09-29 22:34:10'),('8a282a225025bed9015025c3b6160001','8a282a224fe62801014feb0b1c89000a','Testing Intermediate Analyst','上海','3年以上','In the Global Custody Technology organization, be part of a team of QA testers and test automation specialists, supporting SIT and in conjunction with business partners support UAT. We are looking for experienced and highly motivated individuals with a structured testing background and experience of testing on IBM mainframe batch and UI systems and wintel based applications. The team will create and perform QA, regression, testing automation and partner testing across IBM mainframe and MS Wintel environments for the Custody Business.\n \nAs a QA tester, you will be expected to plan testing activities such as: the design and execution of test scripts in HP Quality Centre, maintenance of existing scripts, produce regular testing progress/defect reports, proactively manage any defects encountered and perform other environmental checks as and when required. The quality of your work is expected to be consistently high, meeting all technology and business requirements/standards. You are responsible for meeting agreed delivery deadlines, escalating any issues and risks promptly. You should be prepared to share your skills and knowledge with your fellow team members.\n \nThis is a challenging role in a fast growing environment where the candidate will be required to deliver plan and execute tests against a complex system set that is deployed globally across Citi and in continuous use across global markets. The role will allow the candidate to develop their business and technical skills and in addition gain exposure to an application, which is at the forefront of business and technical change in MSST Custody Services. This team will work in partnership with other centres in London, Belfast, Brazil and Tampa on multi-year programmes driven by regulatory and market reform, product development and business and operational efficiency.\n \nJob Description\nAbility to communicate with non-technical people\nSelf motivation skills\nStrong knowledge of C# and T-SQL (MS SQL server)\nUnderstanding of modern development techniques: automated testing, agile, and continuous integration\nDesirable knowledge: CC  , F#, JavaScript, Team Foundation Server, and IBM MQ\nDesirable business knowledge: Securities ','Track record in QA or UAT testing on IBM mainframes and Windows based applications\nKnowledge of complex platform testing, including testing messaging systems and applications with complex interfaces\nExperience of testing in waterfall and agile development techniques\nRecent experience of HP Quality Centre and Quick Test Pro are required\nExcellent written and verbal communication\nFormal Testing qualifications (such as ITIL) are an advantage\nExperience of performance testing or benchmarking would be a differentiator','10-17k','英语精通,','8a282a224f7f1fcc014f7f2108f80002',1,50,NULL,NULL,'2015-12-01','8a282a224f7f1fcc014f7f2108f80002','2015-10-02 07:36:34','8a282a224f7f1fcc014f7f2108f80002','2015-10-02 07:36:34'),('8a282a22504808bc0150482659e20003','8a282a224fe62801014feb05543d0005','Web Service/API高级工程师','上海','5年以上','1、开发实现高并发高响应7×24的Web Service/API；\n2、 架构设计、详细设计和代码实现；\n3、单元测试、集成测试、性能测试和压力测试；\n4、发布上线和生产故障处理；\n5、持续优化、改进、重构既有系统；\n6、文档撰写；\n7、训练和培养其他同事。','1、全日制大学大专及以上学历，计算机及相关专业毕业；\n2、4年以上软件开发工作经验，2年以上互联网工作经验；\n3、熟悉Java/Http Web Service/SOA/XML/Json；\n4、熟悉SQL SERVER、Oracle、MySQL等数据库之一的开发；\n5、熟悉NoSQL、消息队列、分布式内存、流式计算等技术；\n6、熟悉常用的数据结构， 算法， 设计模式；\n7、熟悉数据序列化技术，熟悉常见序列化格式如XML, JSON, Proto-buf等；\n8、熟悉并发和多线程编程；\n9、熟悉Linux基本操作命令和代码部署到Linux环境的应用服务器；\n10、熟悉任意一种应用服务器Tomcat、Jetty或者web logic、Apache的配置及其优化；\n11、具备极强的团队合作精神，对工作有热情，能够在一定压力下工作；\n12、有大型网站开发经验者优先。\n13、有良好的技术文档撰写能力和良好的技术专研能力。','20k-30k','多线程并行计算精通,Core Java精通,缓存精通,互联网开发经验,独立系统架构经验,','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2016-12-01','8a282a22504808bc0150481353050002','2015-10-08 23:51:24','8a282a22504808bc0150481353050002','2015-10-08 23:51:24'),('8a282a22504808bc0150482758ba0004','8a282a224fe62801014feb05543d0005','数据科学家/资深算法工程师','上海','5年以上','1、带领团队，负责机票，酒店，度假等业务部门专项数据分析项目需求确认，完成交付；\n2、通过数据挖掘建立模型和效果评估，后续监控和持续改进工作；\n3、与业务方，技术研发部门合作，对产品和业务提供建设性建议，跟踪模型的实施，定期优化算法和业务策略；\n4、带领团队成长，跨部门合作。','\n1、计算机，统计，应用数学相关专业；\n2、熟悉数据挖掘、机器学习、统计学的常用算法；\n3、扎实的编程基础，精通JavaC  Python任一语言，有R,Matlab，Hadoop编程经验者优先；\n4、有推荐系统，计算广告项目经验优先；\n5、良好的沟通协调能力，能够主动学习相关知识；\n6、热爱互联网及相关技术。','20k-30k','大数据计算框架精通,互联网开发经验,','8a282a22504808bc0150481353050002',0,0,NULL,NULL,'2016-12-01','8a282a22504808bc0150481353050002','2015-10-08 23:52:29','8a282a22504808bc0150481353050002','2015-10-08 23:52:29'),('8a282a22504808bc0150482859c10005','8a282a224fe62801014feb05543d0005','大数据工程师','上海','5年以上','1、互联网大数据ETL开发和优化、workflow job调度设计、存储过程开发、自定义函数开发、报表制作；\n2、生产运营：程序部署，配置管理，日常Workflow job异常处理；\n3、数据运营：数据查询、数据修复。','1、本科及以上学历。3年及以上相关工作经验；\n2、熟悉如下任意一种数据库Oracle/DB2/SQL Server/MySQL，熟悉SQL编程，有较好的SP性能优化经验；\n3、熟悉Java编程，对数据结构和算法设计有较为深刻的理解；\n4、有大数据处理经验，如hadoop map/reduce编程，Pig/Cascading/Hive/Mahout之一使用经验；\n5、热爱互联网，对技术研究和应用抱有浓厚的兴趣，有强烈的上进心和求知欲，善于学习和运用新知识；\n6、良好的逻辑思维能力，有较强的沟通能力和逻辑表达能力，具备良好的团队合作精神和主动意识；\n加分要求：\n7、熟悉任意一种ETL工具和报表工具优先；\n8、有Linux环境工作经验优先；\n9、熟悉任意一种脚本语言shell/perl/python/php优先','20k-35k','Core Java精通,JVM调优,多线程并行计算精通,大数据计算框架精通,缓存精通,互联网开发经验,独立系统架构经验,','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2016-12-01','8a282a22504808bc0150481353050002','2015-10-08 23:53:35','8a282a22504808bc0150481353050002','2015-10-08 23:53:35'),('8a282a22504808bc01504829bb190006','8a282a224fe62801014feb05543d0005','风控数据分析工程师','上海','2年以上','1、向信息安全部门提供ad-hoc数据支持；\n2、了解风控运营业务部门的需求，撰写和维护各种数据报表，满足业务需求；\n3、理解风控业务的方向和战略，产出有效的数据模型，形成分析报告，提供决策支持；\n4、能够应用统计建模方法，能实现对客户风险的深度分析理解；\n5、负责风控数据产品的研发、部署、监控、优化、维护等工作。','1、本科以上学历，统计学、计算机等相关专业；\n2、2年以上数据挖掘相关经验；\n3、熟练掌握复杂SQL语句编写；\n4、熟悉Excel、R或其他挖掘工具；\n5、了解大部分模型算法；\n6、工作认真负责，敬业，积极主动，对技术敏感而细致，善于思考。','10k-20k','互联网产品设计,','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-08 23:55:05','8a282a22504808bc0150481353050002','2015-10-08 23:55:05'),('8a282a22504808bc0150482aeacd0007','8a282a224fe62801014feb05543d0005','高级MySQL数据库管理工程师','上海','5年以上','1、负责携程数据库系统的运维与支持；\n2、对数据库相关的故障和性能问题能及时定位问题并解决问题；\n3、能发现目前运维系统中的不足并进行优化；\n4、与其他各部门良好沟通，推进跨部门技术支持事项的处理；\n5、善于学习其他人的经验，也能积极主动地进行技术分享，和团队共同成长；\n6、能对新的数据库产品或功能进行全方位的评测，提供专业的报告；\n7、善于推动重大问题的处理，提高客户满意度。','1、拥有五年以上MYSQL数据库管理、开发、设计及系统支持经验；\n2、有丰富的经验在故障排除和解决数据库的性能问题，阻塞和死锁问题等；\n3、精通SQL语法，有能力编写较复杂T-SQL脚本；\n4、精通MySQL的复制，了解至少一种HA方案；\n5、熟悉Linux系统的操作和基本排障方法；\n6、精通shell和Python中的至少一种语言；\n7、有强烈的的责任感和敬业精神，良好的沟通能力以及团队合作能力；\n8、了解SQL SERVER和Mongodb并有相关经验者优先。','20k-40k','','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-08 23:56:23','8a282a22504808bc0150481353050002','2015-10-08 23:56:23'),('8a282a22504808bc0150482be2710008','8a282a224fe62801014feb05543d0005','高级SQL Server数据库工程师','上海','3年以上',NULL,'1、具有三年以上SQL Server或MySQL数据库管理、开发、设计及系统支持经验，精通SQL语法，有能力编写较复杂T-SQL脚本；\n2、能够使用一种以上工具对数据库进行性能压力测试，较为了解数据统计方法；\n3、熟练使用PERFORMANCE DASHBOARD、SQL PROFILER和相关诊断工具；\n4、深入了解索引如何存储、BLOCKING AND DEADLOCKING产生原因；\n5、有丰富的数据库操作经验：备份还原、DBCC、数据库集群、镜像、复制分发等；\n6、在实施操作自动化上有丰富，熟练掌握常用的操作系统指令；\n7、有良好的数据模型概念和关系型数据库理论知识；\n8、细心认真负责，具有良好的沟通能力和团队合作精神。','15k-25k','','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-08 23:57:27','8a282a22504808bc0150481353050002','2015-10-08 23:57:27'),('8a282a22504808bc0150482d10da0009','8a282a224fe62801014feb05543d0005','DBA架构师','上海','5年以上','1、负责推进现有数据库系统的架构优化及改造；\n2、参与重大项目的数据库建模及架构设计，保证系统的可扩展性；\n3、负责对项目过程中数据库架构的实施和实现进行监督和把关；\n4、负责制订数据库架构的规范、数据生命周期及数据管理策略；\n5、其他数据库开发技术支持工作。','1、5年以上开发经验（.Net、Java、Python等）；\n2、3年以上SQL Server数据库建模、数据库架构设计经验，主持或参与过大型3、互联网应用系统的数据库架构设计；\n4、具有丰富的SQL Server数据库优化经验；\n5、具有扎实的数据模型概念和关系型数据库理论知识；\n6、具有良好的沟通能力和团队合作精神；\n7、具有SQL Server运维经验者优先；\n8、具有团队领导经验者优先。','25k-40k','','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-02-01','8a282a22504808bc0150481353050002','2015-10-08 23:58:44','8a282a22504808bc0150481353050002','2015-10-08 23:58:44'),('8a282a22504808bc0150482e0cce000a','8a282a224fe62801014feb05543d0005','高级数据产品经理','上海','3年以上','1、管理的整个产品线的生命周期，从战略规划，具体实施和后期维护；\n2、为我们的业务和技术的客户变得更加的数据驱动，提高他们的决策；\n3、评估和推动产品/项目管理流程，最大限度地提高产品的影响；\n4、识别有竞争力的产品定位为新产品的特性和功能的机会；\n5、与客户和内部团队紧密合作，确保成功的产品上线和使用；\n6、培训和演示的产品和功能给客户和合作伙伴。','1、本科及以上学历，计算机科学或工程学背景优先；\n2、5年以上的经验与先进的数据可视化技术/实践，大数据的数据仓库技术，分析经验；2年以上的管理软件产品经验；\n3、完全理解和产品生命周期和分析/数据仓库运营中的经验，通过产品生命周期的定义和执行创造产品价值；\n4、具备商业智能和业务分析领域的经验，有强大的数据仓库产品和运营经验；\n5、具备强大的计划和项目管理技能；\n6、具备优秀的书面和口头沟通和会议主持技巧，成熟的团队合作能力；\n7、具备成熟的超前思考，能预见潜在的风险，并制定计划，具备有效地消除或减轻潜在负面影响的能力。','15k-25k','互联网产品设计,','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-08 23:59:48','8a282a22504808bc0150481353050002','2015-10-08 23:59:48'),('8a282a22504808bc015048334a6e000d','8a282a224fe62801014feb0ea3c8000d','算法工程师','上海','3年以上','建立、维护与完善1号店的自动推荐系统；\n\n根据网站用户日志，进行数据挖掘分析。','计算机、数学、统计学相关专业本科以上学历；\n\n对统计分析，数据挖掘算法有深入理解并有实际应用经验。比如分类(classification)，聚类(clustering)，关联分析 (association rules)，逻辑回归(logistic regression)，时间序列分析(time series analysis),推荐系统(recommendation systems),等；\n\n具有3年以上专业数据分析或者开发的经验，具备独立的分析能力。','20k-30k','互联网开发经验,大数据计算框架精通,','8a282a22504808bc015048315aa9000c',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc015048315aa9000c','2015-10-09 00:05:32','8a282a22504808bc015048315aa9000c','2015-10-09 00:05:32'),('8a282a22504808bc01504ce8d7b2000e','8a282a224fe62801014feb05543d0005','首席架构师','上海','10年以上','1、对Web 服务API和服务集成有很深入的理解，在高分布式系统架构、多数据中心、SOA架构和应用架构上具备丰富经验，解决 SOA开发部署中各种系统架构问题；\n2、负责大数据应用前沿技术研究 ，并赋予实践，如分布式存储与计算、内存数据库应用、云计算应用，解决大数据应用中的技术难题；\n3、探索通过实践验证的开源技术产品，并将其成功地应用到电子商务、社交网站中；\n具备多数据中心部署配置管理、变更管理系统架构经验，对开发团队、架构团队给予技术指导；\n4、负责技术架构设计，重构、优化现有技术架构，根据业务规划, 制定技术规划, 制定相关的架构方案；\n5、解决重要项目中的关键架构问题和技术难题，负责项目中关键技术难点的攻关和预研，对开发团队进行技术指导和培训；\n6、具备很强的demo展示与沟通技巧，为技术团队提供可行的、富有成效的、前沿的架构方案；','1、具备计算机及相关领域学士或硕士学位；\n2、具备10-15年相关行业杰出技术和管理经验；\n3、具备高可用性、高性能性、高扩展系统设计经验，对亿级以上用户的系统架构设计有深刻理解；\n4、熟悉Java、.Net、XML、APIs和REST，具备RDMS和No-SQL数据库设计、数据切分和数据访问模式设计的经验；\n5、熟悉SOA, Web Services，熟悉云、弹性计算、IAAS，知晓如何实施云技术者为佳；\n6、具备大数据基础架构、分析平台经验，熟悉规则引擎者为佳；\n7、熟悉infoSecurity，能在信息安全与架构中做好平衡，而不是牺牲信息安全；\n8、具备世界级大型网站, 多数据中心架构经验者优先；\n9、熟悉呼叫中心架构优先，但不是必需条件。','45k ','独立系统架构经验,Nosql数据库架构,Mysql数据库架构,','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-09 22:02:19','8a282a22504808bc0150481353050002','2015-10-09 22:02:19'),('8a282a22504808bc01504cea362d000f','8a282a224fe62801014feb05543d0005','软件架构师','上海','8年以上','1、主导本领域的架构建设的推进，参与公司大型项目的规划以及建设路线图的制定；\n2、负责领域分析与建模；\n3、完成符合可伸缩性、安全性、可靠性、可扩展性、可维护性要求的架构设计，满足业务需求；\n4、优化现有架构，设计的新架构，解决现有技术架构的瓶颈；\n5、指导本领域的开发团队遵循设计和架构指导规范；\n6、提升本领域技术团队的技术分析与设计能力；\n7、协助解决本领域中升级事件的技术问题；\n8、研究业界的技术发展、评估外部技术与解决方案；\n9、推荐技术架构方案，提升本领域的技术架构。','1、具有8年以上互联网经验，5年以上大型电子商务网站和互联网公司核心系统业务系统架构设计经验，精通业务抽象和模型设计，掌握相关方法论；\n2、精通分布式、延展性、可扩性架构设计，具备大流量、大访问量、高容错性、高负载环境下的系统开发及优化经验；\n3、精通至少一种开发语言，如.NET. Java等；\n4、精通UML、OOA/OOP、设计模式；\n5、深厚的架构与规范文档撰写能力；\n6、有成熟的项目组织协调经验，良好的表达与宣讲能力，乐于接受挑战。','30k-40k','','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-09 22:03:49','8a282a22504808bc0150481353050002','2015-10-09 22:03:49'),('8a282a22504808bc01504cebab5d0010','8a282a224fe62801014feb05543d0005','多数据中心架构师','上海','10年以上','1、主导本领域的架构建设的推进，参与公司大型项目的规划以及建设路线图的制定；\n2、负责领域分析与建模；\n3、完成符合可伸缩性、安全性、可靠性、可扩展性、可维护性要求的架构设计，满足业务需求；\n4、优化现有架构，设计的新架构，解决现有技术架构的瓶颈；\n5、指导本领域的开发团队遵循设计和架构指导规范；\n6、提升本领域技术团队的技术分析与设计能力；\n7、协助解决本领域中升级事件的技术问题；\n8、研究业界的技术发展、评估外部技术与解决方案；\n9、推荐技术架构方案，提升本领域的技术架构。','1、8 ~ 10年软件行业或互联网行业技术经验，4 ~ 5年软件架构经验或网站运营架构或网站运营开发经验，2 ~ 3年多数据中心设计经验；\n2、熟悉多数据中心逻辑架构、物理架构、安全架构、etc.，至少主持或参与过一个中大型多数据中心（e.g.单数据中心至少500台服务器）项目设计和实施；\n3、熟悉多数据中心设计和实施相关技术，如有过同城和异地多数据中心服务架构设计经验，具有在一定的网络延时和较小带宽基础上解决多数据中心之间的服务统一调度和数据同步的问题的经验。','45k ','Java框架精通,多线程并行计算精通,独立系统架构经验,Nosql数据库架构,Mysql数据库架构,','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-09 22:05:24','8a282a22504808bc0150481353050002','2015-10-09 22:05:24'),('8a282a22504808bc01504ced2e080011','8a282a224fe62801014feb05543d0005','数据库架构师','上海','10年以上','1、主导本领域的架构建设的推进，参与公司大型项目的规划以及建设路线图的制定；\n2、负责领域分析与建模；\n3、完成符合可伸缩性、安全性、可靠性、可扩展性、可维护性要求的架构设计，满足业务需求；\n4、优化现有架构，设计的新架构，解决现有技术架构的瓶颈；\n5、指导本领域的开发团队遵循设计和架构指导规范；\n6、提升本领域技术团队的技术分析与设计能力；\n7、协助解决本领域中升级事件的技术问题；\n8、研究业界的技术发展、评估外部技术与解决方案；\n9、推荐技术架构方案，提升本领域的技术架构。','1、8 ~ 10年软件行业或互联网行业技术经验，5 ~ 8年软件架构经验或DBA相关经验，4 ~ 5年数据库设计经验，3 ~ 4年NoSQL设计经验；\n2、熟悉数据库/NoSQL逻辑架构、物理架构、] sharding架构、DB messaging、HDFS、Hbase架构，至少主持或参与过5个中大型网站（e.g.单数据中心至少500台服务器）数据库项目设计和实施，至少主持或参与过2个中大型网站（e.g.单数据中心至少500台服务器）NoSQL项目设计和实施；\n3、熟悉数据库/NoSQL设计和实施相关技术，如： binlog 复制和优化、MapReduce。','50k ','Nosql数据库架构,Nosql数据库调优,Mysql数据库架构,Mysql数据库调优,','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-09 22:07:03','8a282a22504808bc0150481353050002','2015-10-09 22:07:03'),('8a282a22504808bc01504ceea44a0012','8a282a224fe62801014feb05543d0005','数据架构师','上海','5年以上','1、管理某一业务领域的Datamodel设计；\n2、与应用架构师配合完成DB的partition、sharding等设计、架构工作；\n3、负责数据库架构优化、重构的设计工作；\n4、评审和指导项目的数据库设计达到最佳实践，并能应用到相同场景；\n5、和应用开发工程师进行良好沟通，为应用架构提供良好的数据架构支持。','1、计算机相关专业全日制本科以上学历，5年以上数据架构师经验；\n2、以数据架构师的角色参与过至少2个以上大型软件项目和10个以上一般性软件项目；\n3、在数据建模、数据治理、数据性能调优、数据库架构优化和数据访问层方面具有扎实的功底；\n4、具体良好的沟通能力，有如下经验者优先考虑：\n1）精通MS SQL和Mysql，熟悉Hbase等数据库者优先；\n2)在数据安全、存储方案、数据库虚拟化和复制等方面有一定的经验者优先；\n3）有互联网行业数据架构经验优先。','25k-35k','Nosql数据库架构,Mysql数据库架构,','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-09 22:08:39','8a282a22504808bc0150481353050002','2015-10-09 22:08:39'),('8a282a22504808bc01504cf224d60013','8a282a224fe62801014feb05543d0005','服务架构师','上海','10年以上','\n1、主导本领域的架构建设的推进，参与公司大型项目的规划以及建设路线图的制定；\n2、负责领域分析与建模；\n3、完成符合可伸缩性、安全性、可靠性、可扩展性、可维护性要求的架构设计，满足业务需求；\n4、优化现有架构，设计的新架构，解决现有技术架构的瓶颈；\n5、指导本领域的开发团队遵循设计和架构指导规范；\n6、提升本领域技术团队的技术分析与设计能力；\n7、协助解决本领域中升级事件的技术问题；\n8、研究业界的技术发展、评估外部技术与解决方案；\n9、推荐技术架构方案，提升本领域的技术架构。','1、8 ~ 10年软件行业或互联网行业技术经验，5 ~ 8年软件架构经验或SOA/API/ESB/Governance/Open Platform相关开发经验，4 ~ 5年SOA/API/ESB/Governance/Open Platform相关设计经验；\n2、熟悉SOA/API/ESB/Governance/Open Platform逻辑架构、物理架构、高性能序列化(serialization)，契约优先(Contract First)开发模型，RESTful/RPC调用风格，服务容错/限流(Rate Limiting)，服务SLA监控，至少主持或参与过3个中大型网站（e.g.单数据中心至少500台服务器）SOA/API/ESB/Governance/Open Platform项目设计和实施；\n3、熟悉SOA/API/ESB/Governance/Open Platform设计和实施相关技术，如：XML/JSON/binary(proto-buf, thrift)序列化，WCF/WebApi框架，服务网关(Gateway)，服务注册表(Registry)。','35k-45k','.Net架构,','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-09 22:12:29','8a282a22504808bc0150481353050002','2015-10-09 22:12:29'),('8a282a22504808bc01504cf3dab70014','8a282a224fe62801014feb05543d0005','数据访问层架构师','上海','8年以上','1、主导本领域的架构建设的推进，参与公司大型项目的规划以及建设路线图的制定；\n2、负责领域分析与建模；\n3、完成符合可伸缩性、安全性、可靠性、可扩展性、可维护性要求的架构设计，满足业务需求；\n4、优化现有架构，设计的新架构，解决现有技术架构的瓶颈；\n5、指导本领域的开发团队遵循设计和架构指导规范；\n6、提升本领域技术团队的技术分析与设计能力；\n7、协助解决本领域中升级事件的技术问题；\n8、研究业界的技术发展、评估外部技术与解决方案；\n9、推荐技术架构方案，提升本领域的技术架构。','\n1、8 ~ 10年软件行业或互联网行业技术经验，5 ~ 8年软件架构经验或DAL/Distributed DAL相关开发经验，4 ~ 5年DAL/Distributed DAL设计经验，2 ~ 3年NoSQL DAL设计经验；\n2、熟悉DAL/Distributed DAL/NoSQL DAL逻辑架构、物理架构、无缝嵌入SQL93标准的架构，至少主持或参与过5个中大型网站（e.g.单数据中心至少500台服务器）DAL/Distributed DAL/NoSQL DAL项目设计和实施；\n3、熟悉DAL/Distributed DAL/NoSQL DAL设计和实施相关技术，如： parse buffer pool 、Query merge、index buffer pool、SQL parser、route。','35k-45k','Nosql数据库架构,','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-09 22:14:21','8a282a22504808bc0150481353050002','2015-10-09 22:14:21'),('8a282a22504808bc01504cf571c10015','8a282a224fe62801014feb05543d0005','IAAS-python架构师','上海','5年以上','1、参与携程内部基础IAAS(Infrastructure As A Service)平台的架构与研发，实现资源动态调整，环境自动构建，新的Build/Release/Testing/Staging/Prod等系统、环境将会逐步迁移架设到IAAS平台上；\n2、负责系统架构设计及优化，指导初/高级工程师 ；\n3、调研前沿技术，并将合适的新技术应用到项目当中来 。','1、全日制大学本科及以上学历，计算机相关专业，良好的英文读写能力；\n2、精通面向对象程序设计，熟悉常用算法，至少精通Java/Python/C/C  之中的一门语言；\n3、有大规模分布式系统设计、架构经验；\n4、对云计算、虚拟化有深入理解与实践，对Openstack/CloudStack/EC2/cloudfoundary等云平台其中之一有实际经验；\n5、深入理解操作系统，熟悉Windows/Linux；\n6、熟悉开发流程，良好的团队协作，代码规范，有Scrum经验者优先；\n7、富有激情和创造力, 学习能力强；\n8、有IAAS开发经验者优先考虑，有以下任一实际能力优先考虑：\n1）Openstack/CloudStack/vmware/kvm/xen；\n2）DNS/LB/LDAP/AD As A Service ；\n3）Puppet/Chef ；\n4）精通Python开发 ；\n5）参与开源项目并有所贡献 。','25k-35k','','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-09 22:16:05','8a282a22504808bc0150481353050002','2015-10-09 22:16:05'),('8a282a22504808bc01504cf654460016','8a282a224fe62801014feb05543d0005','云平台架构师','上海','5年以上','1、负责携程私有云平台的架构设计，以支撑起分布在上海、南通、成都数据中心的所有开发、测试、生产环境；以及超过一万人的callcenter虚拟桌面基础设施；\n2、与运营、IT、以及内部用户沟通；不断优化现有平台架构，调研前沿技术，并应用到云平台当中；\n3、指导团队里的初、高级开发工程师。','\n1、全日制大学本科及以上学历，计算机相关专业，良好的英文读写能力， 五年以上工作经验，特别优秀者可以放宽限制；\n2、精通面向对象程序设计，熟悉常用算法， 精通 Python/C/Java其中一门语言；\n3、有大规模分布式系统架构设计、开发经验，深入理解操作系统和网络；\n4、对hypervisor/distributed storage/SDN 之一有深入理解与实践 ，熟悉开发流程，良好的团队协作，代码规范，有Scrum经验者优先 ；\n5、富有激情和创造力, 学习能力强，有以下任一经验者优先考虑:\n1）OpenStack 社区活跃开发者，熟悉Openstack的架构和设计；\n2）KVM/Spice源码剖析，深度优化经验；\n3）大规模虚拟桌面系统研发、架构设计经验；\n4）大规模OpenStack开发、部署经验( > 100台)。','25k-40k','','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-09 22:17:03','8a282a22504808bc0150481353050002','2015-10-09 22:17:03'),('8a282a22504808bc01504cf70d0f0017','8a282a224fe62801014feb05543d0005','风控架构师','上海','7年以上','1.负责设计公司风控系统架构；\n2.参与项目的系统设计和核心代码开发，指导和培训工程师。','1.本科及以上学历，计算机或相关专业，7年以上工作经验；\n2.3年以上的大规模高并发访问的Web应用架构设计和开发经验；\n3.有大型网站及分布式系统的实际开发经验以及复杂业务的分析和建模能力；\n4.熟悉大规模系统的负载均衡、缓存、网络存储、网络安全、数据库高可用设计及性能评估机制；\n5.具备金融风险控制和分析系统的技术设计经验，了解第三方支付，了解电子商务各种模式，对风控业务熟悉\n6.精通NO SQL数据库,规则引擎，大数据并发处理,hadoop','25k-35k','','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-09 22:17:50','8a282a22504808bc0150481353050002','2015-10-09 22:17:50'),('8a282a22504808bc01504cfea5df001a','8a282a224fe62801014feafc50ad0003','Application Developer','上海','5年以上','5 years related working experience, be familiar with C# .NET or Python / Ruby;\nGood to have leadership capability;\nStrong English skills (oral and written);\nGood communicate skill;\nWork location: Shanghai.\n','Bachelor\'s Degree\nAt least 5 years experience in C# .NET or Python / Ruby\nEnglish: Fluent\nChinese simplified: Fluent','15k-20k','','8a282a22504808bc01504cfa5f4e0019',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc01504cfa5f4e0019','2015-10-09 22:26:08','8a282a22504808bc01504cfa5f4e0019','2015-10-09 22:26:08'),('8a282a22504808bc01504d03b02b001b','8a282a224fe62801014feafc50ad0003','Application Developer-Mobile','上海','3年以上','1. HTML5 mobile/fore-end developer\n学历要求：本科及以上\n工作年限：2~3年以上\n职位描述：\n熟悉移动前端开发技术的一种或者几种：AngularJS, Backbone, Ionic\n熟悉一种或者几种移动开发框架：PhoneGap, Apache Cordova, Kony, Worklight\n熟练使用HTML5, CSS3以及客户端Script技术\n有Android或者iOS原生开发经验优先\n有移动互联网或者金融领域经验背景优先\n\n2. iOS/Android developer\n学历要求：本科及以上\n工作年限：2~3年以上\n职位描述：\n1、Android或IOS手机平台客户端软件或者后台服务器的设计、开发和维护； \n2、进行代码编写工作；   \n3、进行单元测试； \n4、根据要求完成文档编写。 \n招聘要求：\n1、本科及以上学历，3年以上开发经验，2年以上手机平台应用程序或者后台服务器开发经验。 \n2、熟悉android或IOS平台下的开发； \n3、熟悉算法思想，有较强的解决问题的能力，对OOD/OOP 有深刻的理解，具有良好的编程习惯； \n4、精通JAVA或C  /Objective C/Cocoa编程，熟练使用android SDK或iPhone/iPad SDK及相关开发工具； \n5、具备良好的沟通能力和团队合作精神； \n6、有移动互联网经验、有社交app经验、或者有移动银行业务经验者优先','Bachelor\'s Degree\nEnglish: Basic knowledge','15k-25k','','8a282a22504808bc01504cfa5f4e0019',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc01504cfa5f4e0019','2015-10-09 22:31:38','8a282a22504808bc01504cfa5f4e0019','2015-10-09 22:31:38'),('8a282a22504808bc01504d05b30f001c','8a282a224fe62801014feafc50ad0003','Application Developer - C - Japanese','上海','3年以上','1. Around 3-5 years\' C developer experience, designs, develops, and supports applications utilizing the C language, including use of C APIs and C Shell. 2. Working in C development work in recent 2 years in AIX/UNIX testing / development environment. 3. Japanese level-2 or above. 4. banking experience is plus.','Bachelor\'s Degree\nAt least 2 years experience in C developer\nEnglish: Basic knowledge\nJapanese: Fluent','10k-20k','','8a282a22504808bc01504cfa5f4e0019',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc01504cfa5f4e0019','2015-10-09 22:33:50','8a282a22504808bc01504cfa5f4e0019','2015-10-09 22:33:50'),('8a282a22504808bc01504d081b38001d','8a282a224fe62801014feafc50ad0003','Application Developer/Consultant/Architect-Mobile','上海','3年以上','以下二选一\nMobile开发JD:\n1. 一年及以上前端开发工作经验，一年以上手机前端开发经验。\n2. 熟悉HTML5，CSS3布局及响应式开发，\n3. 掌握核心DOM、JSON、Ajax以及事件处理机制等；\n4. 精通精通Jquery, JQM，AppFramework等，熟悉RequireJs，Backbone等框架更佳；\n5. 有PhoneGap开发经验优先。\n6. 有良好的学习能力和技术热情。\n\n安卓 Native开发JD:\n1. 两到三年及以上android开发经验, 熟悉安卓手机特性及常用控件；\n2. 2-3年以上Java开发经验，熟悉面向对象的程序设计方法，熟悉设计模式；\n3. 掌握Linux的基本命令和使用；\n4. 有PhoneGap开发经验。\n\niOS Native开发JD:\n1. 两年及以上iOS开发经验, 熟悉安卓手机特性及常用控件；\n2. 1年以上Java开发经验，熟悉面向对象的程序设计方法，熟悉设计模式。','Bachelor\'s Degree\nEnglish: Basic knowledge','15k-25k','','8a282a22504808bc01504cfa5f4e0019',1,30,NULL,NULL,'2015-12-01','8a282a22504808bc01504cfa5f4e0019','2015-10-09 22:36:28','8a282a22504808bc01504cfa5f4e0019','2015-10-09 22:36:28'),('8a282a22504d1eb601504d27208a0004','8a282a22504d1eb601504d25da900003','Java Web开发工程师','上海','3年以上','1. 负责互交式的Web前端开发；\n2. 配合产品人员完成网页页面的交互/视觉设计；\n3. 对于产品设计给出相应地UI方案并进行实施，持续改善用户交互体验；','1. 至少三年以上Web前端开发经验，熟悉DIV CSS排版设计，理解WEB标准和兼容性，能编写符合W3C标准、兼容多种浏览器的前端页面代码；\n2. 熟练掌握HTML5、CSS3.0、Javascript、XML、JSON、Ajax等web前端技术，能够自主编写javascript实现相关的前台功能；\n3. 熟练掌握JQuery和常用JQuery开源控件，具有良好的代码风格、接口设计与程序架构，并且有过相关开发经验； \n4. 熟练掌握Bootstrap，并且有过相关开发经验；\n5. 具有良好的敬业精神和团队合作精神，有上进心，责任感强，自我学习能力强，善于沟通。\n加分项：\n1. 有过互联网公司工作经验；\n2. 有过jsp,java,freemaker开发经验；','12-20k','前端开发经验,互联网开发经验,','8a282a22504d1eb601504d25214e0002',1,50,NULL,NULL,'2015-12-01','8a282a22504d1eb601504d25214e0002','2015-10-09 23:10:21','8a282a22504d1eb601504d25214e0002','2015-10-09 23:10:21'),('8a282a22504d1eb601504f26ce750008','8a282a22504d1eb601504f24a3d00007','Software Testing Engineer for STB middleware','上海','5年以上','Cisco Service Provider Software and Solution team is looking for a Software Testing Engineer to provide world class software services for China based customers. This position is based in Shanghai, China. The candidate’s main job includes, but not limited to, software requirements analysis, testing plan drafting, testing cases design and execution, test bed set up, documentation, and technical issue trouble shooting, in an agile fashion and under the scrum team structure. The candidate is expected to have rich experience and good knowledge in all the aspect of software product testing area. A successful candidate shall also be skillful at providing clear communications to internal teams at effective manner. ','• 5  year software design and development or testing experience \n• Bachelor or above degree in Computer Science or related discipline \n• Must have experience in verifying software of STB is a \n• Must have strong analytical skills at problem solving capabilities \n• Experience in STB middleware development is a big plus \n• Having practiced agile development process and familiar with scrum team based environment \n• Strong communication skills in English, both written and spoken \n• Knowledge of STB Hardware is a plus ','15k-25k','','8a282a22504d1eb601504f1dc8460006',1,30,NULL,NULL,'2015-12-01','8a282a22504d1eb601504f1dc8460006','2015-10-10 08:29:14','8a282a22504d1eb601504f1dc8460006','2015-10-10 08:29:14'),('8a282a22504d1eb601504f291bc10009','8a282a22504d1eb601504f24a3d00007','Software Engineer','上海','2年以上','The Business Entity \nThe Collaboration Technology Group (CTG) is bringing un-compromised collaboration to every room, desk, pocket, and application. It’s portfolio includes collaboration software, devices, infrastructure, and services that enable video collaboration, unified communications, conferencing, and mobility. \n\nThe Team \nYou will join a strong engineering team that designs and builds a world class, highly scalable cloud-based service. The successful candidate will have software development skills and is proficient with Java. We are looking for someone who is highly motivated, willing to accept increasing level of responsibility, and be adept at working in a fast paced agile environment. \n\nRole ',' 2 years  JAVA development experience \n• BS/MS in computer science/computer engineering or related fields \n• With Java coding capability, experience in java development, testing and build environments such as Eclipse, Intellij, Junit, Ant and Subversion/GIT \n• Experience in Java/J2EE, multithreading programming, Tomcat, Oracle \n• Good communication skills in verbal and written \n• Must be highly motivated, self starter and proactive \n• Understanding in Object Oriented Design concept, design patterns is plus \n• Development experience with SOAP, RESTFUL API, XML, HTML5 is plus \n• Experience with SaaS application development, cloud computing is plus ','10k-20k','','8a282a22504d1eb601504f1dc8460006',1,30,NULL,NULL,'2015-12-01','8a282a22504d1eb601504f1dc8460006','2015-10-10 08:31:45','8a282a22504d1eb601504f1dc8460006','2015-10-10 08:31:45'),('8a282a22504d1eb601504f2acc0c000a','8a282a22504d1eb601504f24a3d00007','Sr. Software Engineer for EPG development','上海','6年以上','Cisco Service Provider Software and Solution team is looking for a Sr. Software Engineer to design and develop EPG software for China based customers. This position is based in Shanghai, China. The candidate’s main job includes, but not limited to, software requirements analysis, software design and development, documentation, and technical issue trouble shooting, in an agile fashion and under the scrum team structure. The candidate is expected to have rich experience and good knowledge in all the aspect of software product development including QA and support. A successful candidate shall also be skillful at providing technical level communications to customers and Cisco cross functional teams at effective manner, in both Chinese and English language. The candidate must be self-motivated and act as a leading example to other team members. ','• 6  year software design and development experience \n• Strong knowledge in Java, JavaScript and HTML \n• Must have strong analytical skills at debugging complex problems on Real Time Operating Systems and on end to end systems \n• Experience in developing internet games or developing banking software a big plus \n• EPG development experience is a big plus \n• Experience in STB middleware development is a big plus \n• Must have experience at supporting customers \n• Having practiced agile development process and familiar with scrum team based environment \n• Strong communication skills in English, both written and spoken \n• Experience in Clearcase / ClearQuest /GIT, Cross compilers is a plus \n• Good Knowledge of OCAP / ATSC / MHP /DSMCC preferred \n• Knowledge of STB Hardware is a plus ','15k-25k','','8a282a22504d1eb601504f1dc8460006',1,50,NULL,NULL,'2015-12-01','8a282a22504d1eb601504f1dc8460006','2015-10-10 08:33:36','8a282a22504d1eb601504f1dc8460006','2015-10-10 08:33:36'),('8a282a22504d1eb601504f2e27bd000b','8a282a22504d1eb601504f24a3d00007','Software Engineer for STB middleware','上海','5年以上','Cisco Service Provider Software and Solution team is looking for a Software Engineer in the STB middleware area to design and develop STB software for China based customers. This position is based in Shanghai, China. The candidate’s main job includes, but not limited to, software requirements analysis, software design and development, documentation, and technical issue trouble shooting, in an agile fashion and under the scrum team structure. The candidate is expected to have rich experience and good knowledge in all the aspect of software product development including QA and support. A successful candidate shall also be skillful at providing clear communications to internal teams at effective manner. The candidate is expected to have prior experience in STB, MPEG2, TS, and DVB. \n Provide world class software design and development services to Cisco’s STB middleware customers \n• Analyze customer requirements, translate requirements into product features and user stories, develop software features, write technical documents, and trouble shoot software issues \n• Evaluate technologies and tools to be used as part of the software development cycles \n• Collaborate with other Cisco teams to provide the best support to Cisco STB middleware customers ','• 5  year software design and development experience \n• Must have excellent C, RTOS, and STB development knowledge \n• Must have strong analytical skills at debugging complex problems on Real Time Operating Systems and on end to end systems \n• Must have experience in STB middleware development \n• Must have experience of MPEG 2 TS, DVB \n• Must have experience at supporting customers \n• Having practiced agile development process and familiar with scrum team based environment \n• Strong communication skills in English, both written and spoken \n• Experience in Clearcase / ClearQuest /GIT, Cross compilers is a plus \n• Good Knowledge of OCAP / ATSC / MHP /DSMCC preferred \n• Knowledge of STB Hardware is a plus ','15k-25k','','8a282a22504d1eb601504f1dc8460006',1,50,NULL,NULL,'2015-12-01','8a282a22504d1eb601504f1dc8460006','2015-10-10 08:37:16','8a282a22504d1eb601504f1dc8460006','2015-10-10 08:37:16'),('8a282a22504d1eb601505a21ac1a0014','8a282a224ff5a3e00150037b4c030006','Senior Java Developer','上海','3 years','- Create and contribute to design/coding standards and improvements on the development process.\n- Contributes to project specific documentation.\n- Adheres to quality process and guidelines.\n- Follows coding standards and project plan.\n- Support / coach junior team members in technical issues.','- Banchelor degree in computer science or related discipline\n- MInimum 3 years experience in Software Development\n- Technical expertise in J2EE, Structs, Spring, Hibernate, Webservice, Oracle/DB2, WebSphere/Jboss/Weblogic.\n- Qualified English language skill in both written and spoken. CET6 above preferred.\n- Good communication, documentation and interpersonal skill. Positive, enthusiastic attitude, self-motivated.\n- Good team-work spirit. ','10K - 12K','Core Java精通,英语精通,前端开发经验,互联网开发经验,Java框架精通,','8a282a22504d1eb601505a0ad99e0013',1,0,NULL,NULL,'2015-12-31','8a282a22504d1eb601505a0ad99e0013','2015-10-12 11:39:27','8a282a22504d1eb601505a0ad99e0013','2015-10-12 11:41:24'),('8a282a22504d1eb601505c5c2e520019','8a282a22504d1eb601505c5a6d210018','前端UI工程师','上海','2年以上','负责公司产品的前端设计，开发，维护。','需要熟悉Html5，Css3，JavaScript，熟悉至少一种主流的H5框架比如bootstrap,angularjs等等。会切图，简单的定制图片。','10k-15k','前端开发经验,','8a282a22504d1eb601505c56e47b0017',1,30,NULL,NULL,'2015-12-01','8a282a22504d1eb601505c56e47b0017','2015-10-12 22:02:36','8a282a22504d1eb601505c56e47b0017','2015-10-12 22:02:36'),('8a282a22504d1eb601505ced62d0001a','8a282a224fe62801014feb0dc451000c','测试工程师','上海','3','测试用例\n黑盒测试\n白盒测试\n压力测试','3年测试经验，英语沟通良好。\n熟悉SAP系统的优先考虑。','10k','英语精通,','8a282a224fe62801014feafb4dc60002',0,0,NULL,NULL,'2015-12-31','8a282a224fe62801014feafb4dc60002','2015-10-13 00:41:12','8a282a224fe62801014feafb4dc60002','2015-10-13 00:41:12'),('8a282a22504d1eb601505e98710d001b','8a282a22504d1eb601504f24a3d00007','Software Test Engineer','上海','4年以上','The Business Entity \nThis Software test position is in support of Cisco’s Internet of Things (IoT) initiatives. This position will reside within the IoT Systems and Software Group (IoT SSG); however, the candidate will be required to work collaboratively across various technology organizations. \n\nThe Team \nAre you a hands-on, technical networking professional that is passionate about delivering high quality products and systems? You will be working with a world-class team of like-minded individuals, helping set the foundation for IoT Field Area Networking Products. \n\nRoles and Responsibilities: \nSpecific job responsibilities may include: \n\n• Participate and work closely with developers at various stages - System/Functional Specification, design reviews to develop testplans, tools, utilities. \n• Authoring of detail feature testplans, Design Test bed design, test topologies. \n• Develop scripts for automated testing. \n• Assist development engineers in product defect diagnosis. \n• Work with fellow test engineers in testing and script development efforts by performing code reviews and assisting in debugging efforts. ','Required Education: \nTypically requires MSEE/CS, or BSEE/CS combined with 4-5  years of hands-on experience in a network engineering or telecommunications environment. \n\nMinimum Qualifications: \n• Extensive hands on experience in L3 and application technologies (IPv6, multicast, DHCPv6, CSMP , etc) \n• Good hands on experience in security protocol IEEE 802.1X/802.11i \n• Solid background in programming languages like C, Python,Tcl and automation tools; \n• Hands on Experience with tools such as IXIA, BSS etc. \n• Cross functional team experience \n• Excellent verbal, written and presentation skills \n\nDesired Skills: \n• Hand on expertise in EEE standards such as 802.15.4e/g and PLC (1901.2) \n• Familiarity with Cisco Connected Grid Routers is a plus ','10-20k','','8a282a22504d1eb601504f1dc8460006',1,30,NULL,NULL,'2015-12-01','8a282a22504d1eb601504f1dc8460006','2015-10-13 08:27:40','8a282a22504d1eb601504f1dc8460006','2015-10-13 08:27:40'),('8a282a225061bf88015061c9aca00001','8a282a224fe62801014feb05543d0005','项目经理','上海','3年以上','岗位职责：\n1、带领项目团队在规定的时间、范围、成本内保质保量的完成项目任务。\n2、领导并参与各类项目的实施，确保项目目标达成；\n3、保持项目内外部的沟通和协调，对项目团队进行绩效考核；\n4、对项目上线后的经验和收益进行总结，并持续改进；','1、大学本科及以上学历，计算机及相关专业毕业；\n2、3年以上软件项目管理经验，1年以上大型项目管理经验，获得PMP或IPMP认证；\n3、具备出色的交流沟通能力,出色的协调和解决问题能力,较强的文档撰写能力；\n4、优秀的组织规划能力及计划执行能力，认真细致，有责任心，能承受一定的压力；\n5、有软件开发经验，熟悉CMMI、敏捷等软件工程方法的人员优先；\n6、熟悉互联网行业产品和运营。','20k-30k','互联网产品设计,互联网开发经验,','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-13 23:20:18','8a282a22504808bc0150481353050002','2015-10-13 23:20:18'),('8a282a225061bf88015061cf1eab0002','8a282a22504d1eb6015061a13ca60020','资深PHP程序员','上海','3年以上','岗位职责：\n1、负责网站功能模块的设计和开发工作；\n2、负责网站代码维护及优化，负责网站的日常后台维护、服务器维护等工作；\n3、按照开发流程编写相应模块的设计文档；','1、本科以上学历，3年以上PHP开发工作经验；\n2、精通PHP，具备在Linux或者Unix平台下使用PHP开发网站的经验，深入了解PHP的性能最优化和安全最大化，对常用开发框架有了解，有java/jsp开发经验尤佳；\n3、熟悉HTML/XHTML、CSS、ajax、XML、Javascript、JQuery等；\n4、良好的代码风格；熟悉linux操作系统，有安全运维、数据库管理等相关经验者优先考虑；\n5、熟悉TCP/IP、HTTP等原理，具有Mysql数据库开发经验及熟悉性能优化，熟练掌握SQL语言；\n6、熟练DIV CSS布局、对浏览器兼容有较深的理解；','15k-20k','互联网开发经验,前端开发经验,','8a282a22504d1eb60150619ec3ea001f',1,50,NULL,NULL,'2015-12-01','8a282a22504d1eb60150619ec3ea001f','2015-10-13 23:26:15','8a282a22504d1eb60150619ec3ea001f','2015-10-13 23:32:40'),('8a282a225063de80015066b1c73b0005','8a282a225063de80015066af57590004','高级Java工程师/专家','上海','3年以上','1.独立完成小型项目的系统分析. 设计，并主导完成详细设计和编码的任务，确保项目的进度和质量； \n2.能够在团队中完成Code Review的任务，确保相关代码的有效性和正确性，并能够通过Code Review提供相关性能以及安全的建议； \n3.独立完成部分较小规模系统的系统分析文档和详细设计文档的撰写； \n4.能够有效地对新人或普通开发工程师进行辅导，帮助其快速成长； \n5.维护和升级现有软件产品和系统，快速定位并修复现有软件缺陷。','1.计算机相关专业，本科及以上学历； \n2.三年以上java及WEB应用软件开发经验，一年以上系统设计经验，并熟知软件开发流程； \n3. 精通jsp，servlet，java bean，JMS，EJB，Jdbc，Flex开发，或者对相关的工具. 类库以及框架非常熟悉，如 Velocity，Spring，Hibernate，iBatis，OSGI等，对SOA的模式有较深的理解，对虚拟机. 以及Linux下的开发环境有 较深厚的开发经验； \n4.熟练使用oracle. sqlserver. mysql等常用的数据库系统，对数据库有较强的设计能力，同时对数据库连接池的使用，线程池技术等较为熟悉者优先考虑； \n5.熟悉maven项目配置管理工具，熟悉tomcat. jboss等应用服务器，同时对在高并发处理情况下的负载调优有相关经验者优先考虑； \n6.精通面向对象分析和设计技术，包括设计模式. UML建模等； \n7.熟悉网络编程，具有设计和开发对外API接口经验和能力，同时具备跨平台的API规范设计以及API高效调用设计能力者优先考虑； \n8.具有良好的沟通. 团队协作. 计划和创新的能力； \n9.具有电子商务. 金融行业. 银行业. 航空业经验背景的人优先。','25k-36k','Java框架精通,多线程并行计算精通,Core Java精通,互联网产品设计,','8a282a225063de80015066a9512e0003',1,50,NULL,NULL,'2015-12-01','8a282a225063de80015066a9512e0003','2015-10-14 22:12:18','8a282a225063de80015066a9512e0003','2015-10-14 22:12:18'),('8a282a225063de80015066b57cf80006','8a282a225063de80015066af57590004','资深技术服务工程师/专家','上海','5年以上','采用蚂蚁金服领先的产品及移动互联网、大数据、云计算等先进技术，为各行业客户包括：餐饮、商超、B2C、医疗、数娱、教育等线上线下商户，以及系统集成商和ISV等合作伙伴，提供方案架构设计、集成项目实施、售后技术保障等专业服务。 \n\n1、负责蚂蚁金服行业产品技术方案、接入、售后支持工作； \n2、对蚂蚁金服行业商户、ISV、集成商进行技术售前、接入、集成、测试、上线、验收等技术支持工作； \n3、对蚂蚁金服行业客户、ISV、集成商进行售后问题咨询、故障定位和故障排除支持工作； \n4、发掘客户需求和行业痛点，并形成建议报告，助力蚂蚁金服行业产品完善和优化；','1、全日制（计算机）本科及以上学历，3年以上技术开发、技术支持工作经验； \n2、熟悉JAVA或无线（IOS或Android）、SDK等相关开发经验，了解开放平台； \n3、有良好的文字表达和文档撰写能力，熟悉文档规范化工作； \n4、具备良好的项目管理、表达、沟通及协调能力； \n5、有良好的客户服务观念，工作责任心强，注重团队合作； \n6、具备售后实施能力； \n\n优先录用条件： \n1、电商、百货、餐饮、商超、公交、医疗、金融行业实施集成和维护工作经验； \n2、收银系统、金融POS、医院HIS等设计开发和维护经验； \n3、NFC、指纹技术研发和技术支持经验；','26k-36k','Core Java精通,互联网开发经验,IOS产品开发经验,安卓产品开发经验,Java框架精通,','8a282a225063de80015066a9512e0003',1,50,NULL,NULL,'2015-12-01','8a282a225063de80015066a9512e0003','2015-10-14 22:16:21','8a282a225063de80015066a9512e0003','2015-10-14 22:16:21'),('8a282a225063de80015066b761210007','8a282a225063de80015066af57590004','财富技术部-高级Java数据开发工程师','上海','3年以上','站在“互联网 金融”的风口，未来已来。在蚂蚁金服财富线拥有丰富的业务场景，让“大数据 人工智能”有更多的用武之地。这里有机会接触到最前沿的互联网金融产品，这里需要和数据进行深度接触，这里需要懂技术、懂数据、懂产品的技术牛一起来实现数据技术驱动普惠金融的梦想！ \n诚邀您与我们一起，利用数据技术改变世界，将高大上的金融服务带给普通大众。 \n\n1. 独立完成小型项目的系统分析. 设计，并主导完成详细设计和编码的任务，确保项目的进度和质量； \n2. 能够在团队中完成Code Review的任务，确保相关代码的有效性和正确性，并能够通过Code Review提供相关性能以及安全的建议； \n3. 独立完成部分较小规模系统的系统分析文档和详细设计文档的撰写； \n4. 能够有效地对新人或普通开发工程师进行辅导，帮助其快速成长； \n5. 维护和升级现有软件产品和系统，快速定位并修复现有软件缺陷。','1. 计算机、数学、统计或相关专业本科及以上学历，三年及以上java及WEB应用软件开发经验，一年以上系统设计经验，并熟知软件开发流程； \n2. 精通使用Java，熟悉常用的java类库以及框架，如 Velocity，Spring，iBatis，OSGI等，对SOA的模式有较深的理解，对虚拟机及Linux下的开发环境有较深厚的开发经验； \n3. 熟悉至少一种关系型数据库如Oracle、mysql等，熟悉Hadoop/Map-Reduce/Storm分布式计算框架，有高并发及海量数据实时处理经验者优先； \n4. 具有强烈的责任心、进取心、求知欲及团队合作精神； \n5. 具有实时数据处理、数据分析、数据挖掘经验优先； \n6. 具有金融数据、电子商务、金融行业的经验背景优先。','26-36k','Java框架精通,Core Java精通,数学，统计，算法,','8a282a225063de80015066a9512e0003',1,50,NULL,NULL,'2015-12-01','8a282a225063de80015066a9512e0003','2015-10-14 22:18:25','8a282a225063de80015066a9512e0003','2015-10-14 22:18:25'),('8a282a225063de80015066b944fd0008','8a282a225063de80015066af57590004','大数据平台架构师','上海','8年以上','1. 独立完成大型项目的系统分析设计，并负责核心模块研发； 负责完成系统Code Review的任务，确保相关代码的有效性和正确性，并能够通过Code Review提供相关性能以及安全的建议； \n2. 负责域系统的数据模型设计，并制定数据架构规范； \n3. 负责推进数据挖掘、智能分析推荐应用落地； \n4. 辅导团队，提升数据研发能力。','1. 计算机、数学、统计或相关专业硕士及以上学历，八年以上软件开发工作经验，数据挖掘和BI分析领域优先； \n2. 精通使用Java或C  ，熟悉常用的java类库以及框架，如 Velocity，Spring，Hibernate，iBatis，OSGI等，对SOA的模式有较深的理解，对虚拟机. 以及Linux下的开发环境有较深厚的开发经验； \n3. 熟练使用Python/Shell/Perl/R语言等其中一种语言优先； \n4. 熟悉回归分析模型、关联规则挖掘、分类和聚类算法、协同过滤算法等数据统计模型和挖掘算法，了解完整的数据挖掘过程方法论，并有独立完整的建模实践经验； \n5. 至少熟练使用SPSS、SAS、MatLab或其他一款数据分析和挖掘工具； \n6. 至少熟悉一种关系型数据库如Oracle、mysql等，熟练掌握Hive/SQL，熟悉Hadoop/Map-Reduce/MPI分布式计算框架，有海量数据处理经验者优先； \n7. 具有良好的商业敏感度和优秀的数据分析技能，能够开发创新而实际的分析方法以解决复杂的商业问题； \n8. 具有良好的沟通、团队协作、计划和创新的能力； 在数据业界有一定的影响力优先； \n9. 具有电子商务、金融行业、银行业、航空业经验背景的人优 先。','30k-45k','Core Java精通,JVM调优,数学，统计，算法,大数据计算框架精通,多线程并行计算精通,Java框架精通,互联网开发经验,独立系统架构经验,','8a282a225063de80015066a9512e0003',1,80,NULL,NULL,'2015-12-01','8a282a225063de80015066a9512e0003','2015-10-14 22:20:29','8a282a225063de80015066a9512e0003','2015-10-14 22:20:29'),('8a282a225063de80015066bb1bae0009','8a282a225063de80015066af57590004','阿里妈妈-前端开发工程师','上海','3年以上','1、用HTML，CSS，JavaScript与设计师、后台开发人员协作完成符合Web标准，高性能和体验的页面； \n2、从前端技术角度，根据业务逻辑开发最优交互方式；','1、精通各种Web前端技术，包括HTML /CSS/JavaScript； \n2、熟练使用Photoshop完成切图及HTML页面制作； \n3、熟悉Bootstrap，jQuery，AngularJS等框架 ； \n4、熟练手写符合W3C标准、兼容多种浏览器的前端页面代码； \n5、深刻理解Web标准，对可用性、可访问性等相关知识，有深入的了解和实践经验； \n6、个性乐观开朗，逻辑性强，善于和各种背景的人合作','25k-36k','互联网开发经验,前端开发经验,','8a282a225063de80015066a9512e0003',1,50,NULL,NULL,'2015-12-01','8a282a225063de80015066a9512e0003','2015-10-14 22:22:29','8a282a225063de80015066a9512e0003','2015-10-14 22:22:29'),('8a282a225063de80015066bd29ef000a','8a282a225063de80015066af57590004','高级JAVA开发工程师','上海','3年以上','1.负责设计、开发内部数据管理平台（系统）；	 2. 开发面向应用的数据应用工具或产品；	 3. 开发数据采集、数据处理等过程中所需要的工具。','1. 精通JavaScript、Ajax、JQuery等Web开发技术.	\n2. 精通模板引擎 ( Velocity/freemarker)等页面技术.	\n3. 对用过的开源框架，能了解到它的原理和机制；对Spring,ibatis,struts等开源框架熟悉.	\n4. 掌握Linux 操作系统和大型数据库MySql；对sql优化有丰富的经验.	\n5. JAVA基础扎实，理解io、多线程、集合等基础框架，对JVM原理有一定的了解.	\n6. 熟悉主流应用服务器如tomcat、反向代理服务器Nginx.	\n7. 参与过大型复杂分布式互联网 WEB 系统的设计开发者优先.	\n8. 三年以上工作经验，有地理信息行业经验者优先。','16-25k','Core Java精通,多线程并行计算精通,','8a282a225063de80015066a9512e0003',1,30,NULL,NULL,'2015-12-01','8a282a225063de80015066a9512e0003','2015-10-14 22:24:44','8a282a225063de80015066a9512e0003','2015-10-14 22:24:44'),('8a282a225063de80015066bf165b000b','8a282a225063de80015066af57590004','高级测试工程师-上海','上海','3年以上','1、搭建测试框架，维护框架，持续提高测试效率； \n2、具备较好的开发能力，能够熟练走读开发代码，和开发一起进行代码review； \n3、指导和帮助团队同学提升测试技能。','1、精通Java，C  或者C中任何一个； \n2、熟悉目前流行的web开发框架； \n3、有测试框架搭建和测试工具开发经验； \n4、良好的沟通能力和抗压能力； \n5、对测试技术有较深兴趣。','16k-20k','','8a282a225063de80015066a9512e0003',1,30,NULL,NULL,'2015-12-01','8a282a225063de80015066a9512e0003','2015-10-14 22:26:50','8a282a225063de80015066a9512e0003','2015-10-14 22:26:50'),('8a282a225063de8001506e13bf76000e','8a282a224fe62801014feb05543d0005','无线高级测试经理','上海','8年以上','1、负责无线测试团队日常管理工作；\n\n2、阅读PRD并梳理需求功能点，管理测试用例制定标准；\n\n3、参与项目开发各个阶段的评审工作，并对测试产品提出改进建议；、\n\n4、根据项目目标，制定测试计划和执行策略；\n\n5、监督测试的进展和完成情况，及时沟通解决重大测试问题，确保测试目标的达成；\n\n6、根据公司产品发展方向，及时追踪、收集软件测试新技术、新动态的资料，通过技术培训、交流等方式，建立测试团队，提高测试；\n\n7、优化和完善测试团队，建立符合部门需求的内部管理体制，并进行跨部门协调等工作。','1、8年以上测试工作经验，3年以上大型移动开发项目，20人以上的测试团队管理经验；\n\n2、熟悉移动平台各种测试技巧，了解移动设备兼容测试方法；\n\n3、精通客户端开发-发布流程，能够针对移动场景适当的调整测试策略；\n\n4、扎实的软件开发和测试技术，精通及具备自动化测试、性能测试、容量测试、兼容性测试、稳定性测试等专业知识和经验；\n\n5、熟悉互联网平台相关技术，和相关的测试工具、度量分析工具；\n\n6、擅于跨团队沟通和协作，对提高软件产品的测试效率和效果有强烈的激情；\n\n7、计算机类、理工科专业毕业，至少本科以上学历。','15-30k','','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-16 08:36:39','8a282a22504808bc0150481353050002','2015-10-16 08:36:39'),('8a282a225063de8001506e148879000f','8a282a224fe62801014feb05543d0005','高级自动化开发工程师','上海','3年以上','1. 对自动化产品的开发（包括自动化框架，自动化Portal，自动化CI，及自动化后台数据的创建与维护）；\n\n2. 在所开发项目中，负责查阅需求文档，设计产品功能，编写产品代码，测试产品，紧密的与自动化测试人员合作；\n\n3. 定义开发计划，设计产品详细功能，单元及集成测试来确保产品功能质量；\n\n4. 能够根据所开发的项目，编写单元测试代码，创建自动化测试脚本，以便更有效更快速的检验自动化产品的功能；\n\n5. 善于沟通与按时提交完整的开发成果。\n','1. 有三年以上开发测试经验，包括编写过自动化测试代码及掌握自动化理论方法，或开发过自动化产品及设计过自动化框架；\n\n2. 熟悉面向对象程序设计，熟悉常用算法，熟练使用JavaScript/Python/Java/Object C/C#之中的一门语言；\n\n3. 熟悉Mysql/SQL Server数据库，熟悉Linux 常用的命令；\n\n4. 对iOS/Android有了解，最好有开发移动手机端自动化经验；\n\n5. 有移动手机端自动化开发经验的，优先考虑；\n\n6. 对移动云计算、移动开发、Web站点自动化产品有了解，或者有兴趣，愿意从事该自动化开发方向；\n\n7. 有很强的问题分析能力与解决问题的能力；富有激情和创造力, 学习能力强。','10-25k','','8a282a22504808bc0150481353050002',1,30,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-16 08:37:30','8a282a22504808bc0150481353050002','2015-10-16 08:37:30'),('8a282a225063de8001506e1547330010','8a282a224fe62801014feb05543d0005','无线测试经理','上海','8年以上','1.负责整个产品线项目的资源安排和协调；\n\n2.根据需求文档，评估项目在该领域的商业价值和意义，给出项目的优先级建议；\n\n3.制定或review重大项目的测试计划、方案和策略 ；\n\n4.项目问题/的发现，跟进和解决，风险的预估,并提炼共性问题，形成改进的计划；\n\n5.跟进和指导产品测试责任人/项目测试负责人并对项目的数据进行统计和分析；\n\n6.现有流程,规范与模板的遵守和推广执行，并提出优化、创新的建议并实施;；\n\n7.将测试架构师或测试专家给出的技术方案落实到项目中去执行。','1、 计算机相关专业本科及以上学历，熟悉软件工程；\n\n2、 熟悉Java或C#中的某一种编程语言,8年左右测试或开发经验(测试经验不低于5年)；\n\n3、 具备良好的领导力、组织协调、沟通能力及推动跨团队合作能力、高执行力；\n\n4、 精通测试理论，流程与方法，熟悉主流的功能或自动化测试工具；\n\n5、 具有较强的业务分析，沟通表达能力和综合协调能力，工作积极主动；\n\n6、 具备优秀的互联网项目管理能力，按时并高质量交付项目，以结果为导向；\n\n7、 熟悉SqlServer/Mysql等至少一种数据库管理系统，能够熟练编写SQL语句；\n\n8、 曾经在中大型互联网公司或相关组织中带领测试团队开展测试工作经历的优先。','20k-30k','','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-16 08:38:19','8a282a22504808bc0150481353050002','2015-10-16 08:38:19'),('8a282a225063de8001506e15e9040011','8a282a224fe62801014feb05543d0005','高级无线软件测试工程师','上海','5年以上','1、参与项目的需求和迭代开发计划的讨论和评审；\n\n2、制定项目的测试计划并设计测试用例；\n\n3、产品测试用例库的维护及其对应的分层自动化脚本的实现或跟进；\n\n4、承担多模块项目的测试Owner并驱动联调测试用例的设计与执行；\n\n5、提炼项目测试的功能点到产品测试用例库、同步技术文档和自动化需求的提出；\n\n6、搭建测试环境、测试执行并和开发一起进行bug的定位和跟踪；\n\n7、及时同步推进产品的测试技术理解文档、UI自动化脚本等；\n\n8、承担项目的性能测试场景的设计、测试方案编写和评估及性能测试的执行工作。','1、计算机相关专业本科及以上学历，熟悉软件工程；\n\n2、熟悉Java或C#中的某一种编程语言,5年左右测试或开发经验(测试经验不低于三年)；\n\n3、精通测试理论，流程与方法，熟练使用主流的功能或性能测试工具；\n\n4、具有较强的业务分析，沟通表达能力和综合协调能力，工作积极主动；；\n\n5、熟悉SqlServer/Mysql等至少一种数据库管理系统，能够熟练编写SQL语句；\n\n6、具备较强的思考总结能力，自我驱动能力和一定的技术创新意识；\n\n7、对自动化测试框架理解较深，熟悉VB Script/JS/Perl/Python/Ruby中的某种脚本语言；\n\n8、有在互联网领域测试团队进行测试工作经历的优先。','15k-25k','','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-16 08:39:01','8a282a22504808bc0150481353050002','2015-10-16 08:39:01'),('8a282a225063de8001506e1693600012','8a282a224fe62801014feb05543d0005','高级测试工程师','上海','5年以上','1、负责无线测试团队日常管理工作；\n\n2、阅读PRD并梳理需求功能点，管理测试用例制定标准；\n\n3、参与项目开发各个阶段的评审工作，并对测试产品提出改进建议；\n\n4、根据项目目标，制定测试计划和执行策略；\n\n5、优化和完善测试团队，建立符合部门需求的内部管理体制，并进行跨部门协调等工作。','1、5年以上测试工作经验，2年以上移动平台测试经验，10人以上的测试团队管理经验；\n\n2、熟悉移动平台各种测试技巧，了解移动设备兼容测试方法；\n\n3、精通客户端开发-发布流程，能够针对移动场景适当的调整测试策略；\n\n4、熟悉互联网平台相关技术，和相关的测试工具、度量分析工具；\n\n5、计算机类、理工科专业毕业，至少本科以上学历。','15-30k','','8a282a22504808bc0150481353050002',1,50,NULL,NULL,'2015-12-01','8a282a22504808bc0150481353050002','2015-10-16 08:39:44','8a282a22504808bc0150481353050002','2015-10-16 08:39:44');
/*!40000 ALTER TABLE `TB_POSITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_SMS`
--

DROP TABLE IF EXISTS `TB_SMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_SMS` (
  `ID` varchar(50) NOT NULL COMMENT 'ID',
  `MOBILE_PHONE` varchar(20) NOT NULL COMMENT '发送至手机号',
  `SMS_TYPE` enum('verification','text') NOT NULL COMMENT '短信类型',
  `SMS_CONTENT` varchar(140) NOT NULL COMMENT '短信内容',
  `SEND_TIME` datetime NOT NULL COMMENT '发送日期时间',
  `STATUS` enum('not_send','sent') NOT NULL COMMENT '发送状态',
  PRIMARY KEY (`ID`),
  KEY `IDX_SMS_MOBILE` (`MOBILE_PHONE`),
  KEY `IDX_SMS_TYPE` (`SMS_TYPE`),
  KEY `IDX_SMS_STATUS` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信发送表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_SMS`
--

LOCK TABLES `TB_SMS` WRITE;
/*!40000 ALTER TABLE `TB_SMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_SMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_USER`
--

DROP TABLE IF EXISTS `TB_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_USER` (
  `ID` varchar(50) NOT NULL COMMENT '用户ID',
  `USERNAME` varchar(50) NOT NULL COMMENT '用户登录名',
  `PASSWORD` varchar(50) NOT NULL COMMENT '密码',
  `NICKNAME` varchar(50) DEFAULT NULL COMMENT '昵称',
  `ICON_URL` varchar(200) DEFAULT NULL COMMENT '头像图片地址',
  `CITY` varchar(20) DEFAULT NULL COMMENT '常住城市',
  `MOBILE_PHONE` varchar(20) DEFAULT NULL COMMENT '手机号',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `POINT` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `BIRTHDAY` date DEFAULT NULL COMMENT '出生日期',
  `EDUCATION_LEVEL` int(11) DEFAULT NULL COMMENT '教育程度  1 大专 2 本科  3 硕士 4 博士',
  `EXPERIENCE_AGE` int(11) DEFAULT NULL COMMENT '工作年限',
  `STRENGTH_SUMMARY` text COMMENT '能力综述',
  `EMPLOYER_ID` varchar(50) DEFAULT NULL COMMENT '目前雇主',
  `TITLE` varchar(50) DEFAULT NULL COMMENT '目前职务',
  `WORK_DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '目前工作描述',
  `CURRENT_SALARY` varchar(50) DEFAULT NULL COMMENT '目前年薪',
  `EXPECTED_SALARY` varchar(50) DEFAULT NULL COMMENT '期望年薪',
  `VISA` varchar(50) DEFAULT NULL COMMENT '持有签证',
  `VISA_EXPIRED_DATE` date DEFAULT NULL COMMENT '签证有效期截止日期',
  `PROFILE_URL_CN` varchar(200) DEFAULT NULL COMMENT '中文简历存放路径',
  `PROFILE_URL_EN` varchar(200) DEFAULT NULL COMMENT '英文简历存放路径',
  `CREATE_USERID` varchar(50) NOT NULL COMMENT '创建人ID',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建日期时间',
  `LAST_UPDATE_USERID` varchar(50) NOT NULL COMMENT '最后更新人ID',
  `LAST_UPDATE_DATE` datetime NOT NULL COMMENT '最后更新日期时间',
  `TAG` varchar(200) DEFAULT NULL COMMENT '标签',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  UNIQUE KEY `MOBILE_PHONE` (`MOBILE_PHONE`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_USER`
--

LOCK TABLES `TB_USER` WRITE;
/*!40000 ALTER TABLE `TB_USER` DISABLE KEYS */;
INSERT INTO `TB_USER` VALUES ('8a282a224f7f1fcc014f7f2108f80002','lk','d0fa06cd93335c8cae357ffe5cd1c4e9','lk',NULL,'北京','18501687767','ejbiva@163.com',0,'2015-09-02',1,2,'coding','8a282a224fe62801014feb0b1c89000a','Java程序员','codingcodingcoding','','',NULL,NULL,'8a282a224f7f1fcc014f7f2108f80002/file1.doc','8a282a224f7f1fcc014f7f2108f80002/file2.docx','system_admin','2015-08-30 23:01:55','8a282a224f7f1fcc014f7f2108f80002','2015-09-28 22:52:21',NULL),('8a282a224fd182c7014fd589bf160002','测试','e10adc3949ba59abbe56e057f20f883e','测试',NULL,NULL,'13801981586',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system_admin','2015-09-16 17:43:38','system_admin','2015-09-16 17:43:38',NULL),('8a282a224fdb6f67014fdb76ad1b0002','喻小么','6ad9666727827907b31476f65011c06e','喻小么',NULL,'上海','18501760846','yrily@live.cn',0,'1988-04-13',1,5,'Javascript，Html，Ajax, JQuery；Sharepoint；SQL, MySql,LINQ,MarkLogic。','8a282a224ff5a3e0014ffac34c480001','.Net软件工程师','系统开发，数据录入平台开发，系统整合。','10','15',NULL,NULL,NULL,NULL,'system_admin','2015-09-17 21:20:32','8a282a224fdb6f67014fdb76ad1b0002','2015-09-23 23:13:28',NULL),('8a282a224fdb6f67014fdb854c860004','name21','b89eeba58de39b191e8379b5649b87b1','name21',NULL,'上海','18501687610',NULL,0,'1979-09-01',1,13,'超过10年 java开发经验，多年系统架构经验，熟悉各种框架springmvc,hibernate,mybatis','8a282a224f7f1fcc014f7f21555a0003','技术经理','摩根史丹利项目技术培训师','300k','400k',NULL,NULL,'8a282a224fdb6f67014fdb854c860004/file1.doc','8a282a224fdb6f67014fdb854c860004/file2.docx','system_admin','2015-09-17 21:36:30','8a282a224fdb6f67014fdb854c860004','2015-09-19 23:24:01',NULL),('8a282a224fe62801014feafb4dc60002','modin','96e79218965eb72c92a549dd5a330112','modin',NULL,'上海','13564329403','modin@aa.bb',0,'1983-06-01',1,10,'aaaaaa','8a282a224fe62801014feb0dc451000c','STL','bbbbbbbbbb','30w','40w',NULL,NULL,'8a282a224fe62801014feafb4dc60002/file1.docx','8a282a224fe62801014feafb4dc60002/file2.docx','system_admin','2015-09-20 21:39:42','8a282a224fe62801014feafb4dc60002','2015-10-14 23:01:20','Core Java精通,Java框架精通,互联网产品设计,英语精通,'),('8a282a224ff5a3e0014fff9848a60003','xiaohei','e10adc3949ba59abbe56e057f20f883e','xiaohei',NULL,NULL,'18016412468',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system_admin','2015-09-24 21:43:34','system_admin','2015-09-24 21:43:34',NULL),('8a282a224ff5a3e00150037a801c0005','siwenkoss','4cd522aa55bf2781f7a822c40f5003c1','siwenkoss',NULL,NULL,'15221737106',NULL,0,NULL,NULL,NULL,NULL,'8a282a224ff5a3e00150037b4c030006',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system_admin','2015-09-25 15:49:31','system_admin','2015-09-25 15:49:31',NULL),('8a282a22504808bc0150481353050002','mike','18126e7bd3f84b3f3e4df094def5b7de','mike',NULL,'上海','18501689000','humozhi1@hotmail.com',0,'2015-10-07',1,10,'资深架构师','8a282a224fe62801014feb05543d0005','.net架构师','10年资深架构师，丰富互联网开发经验','','',NULL,NULL,NULL,NULL,'system_admin','2015-10-08 23:30:37','8a282a22504808bc0150481353050002','2015-10-08 23:49:11','缓存精通,英语精通,互联网开发经验,互联网产品设计,'),('8a282a22504808bc015048315aa9000c','roy','d4c285227493531d0577140a1ed03964','roy',NULL,'北京','18501689001','zhouchong@yhd.com',0,'2015-10-07',1,0,'java','8a282a224fe62801014feb0ea3c8000d','产品经理','产品经理，多年资深开发经验','','',NULL,NULL,NULL,NULL,'system_admin','2015-10-09 00:03:25','8a282a22504808bc015048315aa9000c','2015-10-09 00:04:30','互联网产品设计,互联网开发经验,'),('8a282a22504808bc01504cfa5f4e0019','joyce','19053d1f43416ad98dd9443425753488','joyce',NULL,'北京','18501689002','shlbyli@cn.ibm.com',0,'2015-10-07',1,0,'技术，英语俱佳','8a282a224fe62801014feafc50ad0003','测试工程师','测试经验丰富，白富美','','',NULL,NULL,'8a282a22504808bc01504cfa5f4e0019/file1.docx',NULL,'system_admin','2015-10-09 22:21:28','8a282a22504808bc01504cfa5f4e0019','2015-10-15 22:05:13',''),('8a282a22504d1eb601504d25214e0002','marisa','458ff389547c5068dc72cf9b79ebcebd','marisa',NULL,'上海','18501689003','marisa.liu@sumscope.com',0,'2015-10-07',1,8,'..........................','8a282a22504d1eb601504d25da900003','招聘专员','..........................','','',NULL,NULL,NULL,NULL,'system_admin','2015-10-09 23:08:10','8a282a22504d1eb601504d25214e0002','2015-10-09 23:16:06',''),('8a282a22504d1eb601504f1dc8460006','johnny','f4eb27cea7255cea4d1ffabf593372e8','johnny',NULL,'杭州','18501689004','stanley_liu@infosys.com',0,'2015-10-06',1,6,'.......................','8a282a22504d1eb601504f24a3d00007','Java高级程序员','.......................','','',NULL,NULL,NULL,NULL,'system_admin','2015-10-10 08:19:23','8a282a22504d1eb601504f1dc8460006','2015-10-10 08:41:46',''),('8a282a22504d1eb60150501ba48b000d','Jason Gao','6eea9b7ef19179a06954edd0f6c05ceb','Jason Gao',NULL,'杭州','13162679813','igaozhiqiang@163.com',0,'1989-02-14',1,5,'IT','8a282a22504d1eb60150502074af000e','IT','IT IT IT IT IT ','','',NULL,NULL,NULL,NULL,'system_admin','2015-10-10 12:56:40','8a282a22504d1eb60150501ba48b000d','2015-10-10 13:01:58','Core Java精通,Java框架精通,多线程并行计算精通,JVM调优,互联网产品设计,互联网开发经验,前端开发经验,大数据计算框架精通,缓存精通,Mysql数据库架构,Mysql数据库调优,数学，统计，算法,英语精通,'),('8a282a22504d1eb6015050534d620011','Linking job','046e142473eaba30c236a82b60bc1cf2','Linking job',NULL,NULL,'13122818902',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system_admin','2015-10-10 13:57:28','system_admin','2015-10-10 13:57:28',NULL),('8a282a22504d1eb601505a0ad99e0013','gary','03b083fd0aadc8883198881ba88111ab','gary',NULL,NULL,'18501689005',NULL,0,NULL,NULL,NULL,NULL,'8a282a224ff5a3e00150037b4c030006',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system_admin','2015-10-12 11:14:31','system_admin','2015-10-12 11:14:31',NULL),('8a282a22504d1eb601505c56e47b0017','Peter','51983878a2156e72b89f02685f4f327b','Peter',NULL,NULL,'18501689006',NULL,0,NULL,NULL,NULL,NULL,'8a282a22504d1eb601505c5a6d210018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system_admin','2015-10-12 21:56:49','system_admin','2015-10-12 21:56:49',NULL),('8a282a22504d1eb60150616cbde0001d','JasonLiao','7a30b44b74e4f543b7bbfe4465af62ed','JasonLiao',NULL,'上海','15000229169','liaozhijia@126.com',0,'1985-08-14',1,7,'BizTalk, WCF, WEB-API, ASP.NET, MVC, SQL Server','8a282a224f7f1fcc014f7f21555a0003','TA','系统分析，.Net程序开发，系统架构','','',NULL,NULL,'8a282a22504d1eb60150616cbde0001d/file1.docx',NULL,'system_admin','2015-10-13 21:38:47','8a282a22504d1eb60150616cbde0001d','2015-10-14 22:34:39','.Net架构,数学，统计，算法,'),('8a282a22504d1eb60150619ec3ea001f','jason','2b877b4b825b48a9a0950dd5bd1f264d','jason',NULL,'上海','18501689007','Jason29@163.com',0,'1978-10-01',1,15,'java 资深架构师','8a282a22504d1eb6015061a13ca60020','项目经理','项目经理，架构师，高级程序员','30k','',NULL,NULL,'8a282a22504d1eb60150619ec3ea001f/file1.docx',NULL,'system_admin','2015-10-13 22:33:26','8a282a22504d1eb60150619ec3ea001f','2015-10-14 22:53:25','Java框架精通,互联网开发经验,英语精通,'),('8a282a225063de80015066a9512e0003','terence','f56b2700382c1c9513a881d2c2af9f1b','terence',NULL,'杭州','18501689008','evilinwater@163.com',0,'2015-10-06',1,8,'还可以','8a282a225063de80015066af57590004','Java高级程序员','开发开发开发开发开发','','',NULL,NULL,NULL,NULL,'system_admin','2015-10-14 22:03:03','8a282a225063de80015066a9512e0003','2015-10-14 22:28:22',''),('8a282a225063de8001506ac0de07000d','Nicole','4e1d4335fec8605f82a0b3ca00d5c08f','Nicole',NULL,NULL,'13501935267',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system_admin','2015-10-15 17:07:16','system_admin','2015-10-15 17:07:16',NULL),('user_001','user001','97f3c717da19b4697ae9884e67aabce6',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system_admin','2015-08-30 14:15:13','system_admin','2015-08-30 14:15:13',NULL),('user_002','user002','8b63b2922634ffaeab2019e50f13dd20',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system_admin','2015-08-30 14:15:13','system_admin','2015-08-30 14:15:13',NULL);
/*!40000 ALTER TABLE `TB_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `V_APPLICATION`
--

DROP TABLE IF EXISTS `V_APPLICATION`;
/*!50001 DROP VIEW IF EXISTS `V_APPLICATION`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `V_APPLICATION` (
  `ID` tinyint NOT NULL,
  `POSITION_ID` tinyint NOT NULL,
  `APPLICANT_USERID` tinyint NOT NULL,
  `APPLY_DATE` tinyint NOT NULL,
  `IF_INTERVIEW` tinyint NOT NULL,
  `STATUS` tinyint NOT NULL,
  `TECH_RATE` tinyint NOT NULL,
  `FRAMEWORK_RATE` tinyint NOT NULL,
  `DATABASE_RATE` tinyint NOT NULL,
  `ENGLISH_RATE` tinyint NOT NULL,
  `COMMUNICATION_RATE` tinyint NOT NULL,
  `MANAGEMENT_RATE` tinyint NOT NULL,
  `INTERVIEWER_COMMENT` tinyint NOT NULL,
  `INTERVIEWER_COMMENT_DATE` tinyint NOT NULL,
  `APPLICANT_COMMENT` tinyint NOT NULL,
  `APPLICANT_COMMENT_DATE` tinyint NOT NULL,
  `APPLICANT_USERNAME` tinyint NOT NULL,
  `APPLICANT_EMAIL` tinyint NOT NULL,
  `EMPLOYER_ID` tinyint NOT NULL,
  `EMPLOYER_NAME` tinyint NOT NULL,
  `TITLE` tinyint NOT NULL,
  `LOCATION` tinyint NOT NULL,
  `EXPERIENCE_AGE` tinyint NOT NULL,
  `SALARY_PACKAGE` tinyint NOT NULL,
  `PUBLISH_USERID` tinyint NOT NULL,
  `PUBLISH_USERNAME` tinyint NOT NULL,
  `PUBLISHER_EMAIL` tinyint NOT NULL,
  `EXPIRED_DATE` tinyint NOT NULL,
  `IF_EFFECTIVE` tinyint NOT NULL,
  `INTERVIEW_CHARGE` tinyint NOT NULL,
  `IF_TRAINING` tinyint NOT NULL,
  `APPLICANT_COUNT` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `V_APPLICATION_AVG_RATES`
--

DROP TABLE IF EXISTS `V_APPLICATION_AVG_RATES`;
/*!50001 DROP VIEW IF EXISTS `V_APPLICATION_AVG_RATES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `V_APPLICATION_AVG_RATES` (
  `APPLICANT_USERID` tinyint NOT NULL,
  `AVG_TECH_RATE` tinyint NOT NULL,
  `AVG_FRAMEWORK_RATE` tinyint NOT NULL,
  `AVG_DATABASE_RATE` tinyint NOT NULL,
  `AVG_ENGLISH_RATE` tinyint NOT NULL,
  `AVG_COMMUNICATION_RATE` tinyint NOT NULL,
  `AVG_MANAGEMENT_RATE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `V_POSITION`
--

DROP TABLE IF EXISTS `V_POSITION`;
/*!50001 DROP VIEW IF EXISTS `V_POSITION`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `V_POSITION` (
  `ID` tinyint NOT NULL,
  `EMPLOYER_ID` tinyint NOT NULL,
  `TITLE` tinyint NOT NULL,
  `LOCATION` tinyint NOT NULL,
  `EXPERIENCE_AGE` tinyint NOT NULL,
  `JD` tinyint NOT NULL,
  `REQUIREMENT` tinyint NOT NULL,
  `SALARY_PACKAGE` tinyint NOT NULL,
  `TAG` tinyint NOT NULL,
  `PUBLISH_USERID` tinyint NOT NULL,
  `IF_INTERVIEW` tinyint NOT NULL,
  `INTERVIEW_CHARGE` tinyint NOT NULL,
  `IF_TRAINING` tinyint NOT NULL,
  `START_DATE` tinyint NOT NULL,
  `EXPIRED_DATE` tinyint NOT NULL,
  `CREATE_USERID` tinyint NOT NULL,
  `CREATE_DATE` tinyint NOT NULL,
  `LAST_UPDATE_USERID` tinyint NOT NULL,
  `LAST_UPDATE_DATE` tinyint NOT NULL,
  `IF_EFFECTIVE` tinyint NOT NULL,
  `PUBLISH_USERNAME` tinyint NOT NULL,
  `PUBLISHER_EMAIL` tinyint NOT NULL,
  `EMPLOYER_NAME` tinyint NOT NULL,
  `CATEGORY` tinyint NOT NULL,
  `SCALE` tinyint NOT NULL,
  `ADDRESS` tinyint NOT NULL,
  `BUSINESS_FOCUS` tinyint NOT NULL,
  `WELFARE` tinyint NOT NULL,
  `APPLICANT_COUNT` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `V_POSITION_COUNT`
--

DROP TABLE IF EXISTS `V_POSITION_COUNT`;
/*!50001 DROP VIEW IF EXISTS `V_POSITION_COUNT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `V_POSITION_COUNT` (
  `POSITION_ID` tinyint NOT NULL,
  `APPLICANT_COUNT` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `V_USER`
--

DROP TABLE IF EXISTS `V_USER`;
/*!50001 DROP VIEW IF EXISTS `V_USER`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `V_USER` (
  `ID` tinyint NOT NULL,
  `USERNAME` tinyint NOT NULL,
  `PASSWORD` tinyint NOT NULL,
  `NICKNAME` tinyint NOT NULL,
  `ICON_URL` tinyint NOT NULL,
  `CITY` tinyint NOT NULL,
  `MOBILE_PHONE` tinyint NOT NULL,
  `EMAIL` tinyint NOT NULL,
  `POINT` tinyint NOT NULL,
  `BIRTHDAY` tinyint NOT NULL,
  `EDUCATION_LEVEL` tinyint NOT NULL,
  `EXPERIENCE_AGE` tinyint NOT NULL,
  `STRENGTH_SUMMARY` tinyint NOT NULL,
  `EMPLOYER_ID` tinyint NOT NULL,
  `TITLE` tinyint NOT NULL,
  `WORK_DESCRIPTION` tinyint NOT NULL,
  `CURRENT_SALARY` tinyint NOT NULL,
  `EXPECTED_SALARY` tinyint NOT NULL,
  `VISA` tinyint NOT NULL,
  `VISA_EXPIRED_DATE` tinyint NOT NULL,
  `PROFILE_URL_CN` tinyint NOT NULL,
  `PROFILE_URL_EN` tinyint NOT NULL,
  `CREATE_USERID` tinyint NOT NULL,
  `CREATE_DATE` tinyint NOT NULL,
  `LAST_UPDATE_USERID` tinyint NOT NULL,
  `LAST_UPDATE_DATE` tinyint NOT NULL,
  `TAG` tinyint NOT NULL,
  `EMPLOYER_NAME` tinyint NOT NULL,
  `AGE` tinyint NOT NULL,
  `AVG_TECH_RATE` tinyint NOT NULL,
  `AVG_FRAMEWORK_RATE` tinyint NOT NULL,
  `AVG_DATABASE_RATE` tinyint NOT NULL,
  `AVG_ENGLISH_RATE` tinyint NOT NULL,
  `AVG_COMMUNICATION_RATE` tinyint NOT NULL,
  `AVG_MANAGEMENT_RATE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `V_APPLICATION`
--

/*!50001 DROP TABLE IF EXISTS `V_APPLICATION`*/;
/*!50001 DROP VIEW IF EXISTS `V_APPLICATION`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `V_APPLICATION` AS select `TB_APPLICATION`.`ID` AS `ID`,`TB_APPLICATION`.`POSITION_ID` AS `POSITION_ID`,`TB_APPLICATION`.`APPLICANT_USERID` AS `APPLICANT_USERID`,`TB_APPLICATION`.`APPLY_DATE` AS `APPLY_DATE`,`TB_APPLICATION`.`IF_INTERVIEW` AS `IF_INTERVIEW`,`TB_APPLICATION`.`STATUS` AS `STATUS`,`TB_APPLICATION`.`TECH_RATE` AS `TECH_RATE`,`TB_APPLICATION`.`FRAMEWORK_RATE` AS `FRAMEWORK_RATE`,`TB_APPLICATION`.`DATABASE_RATE` AS `DATABASE_RATE`,`TB_APPLICATION`.`ENGLISH_RATE` AS `ENGLISH_RATE`,`TB_APPLICATION`.`COMMUNICATION_RATE` AS `COMMUNICATION_RATE`,`TB_APPLICATION`.`MANAGEMENT_RATE` AS `MANAGEMENT_RATE`,`TB_APPLICATION`.`INTERVIEWER_COMMENT` AS `INTERVIEWER_COMMENT`,`TB_APPLICATION`.`INTERVIEWER_COMMENT_DATE` AS `INTERVIEWER_COMMENT_DATE`,`TB_APPLICATION`.`APPLICANT_COMMENT` AS `APPLICANT_COMMENT`,`TB_APPLICATION`.`APPLICANT_COMMENT_DATE` AS `APPLICANT_COMMENT_DATE`,`TB_USER`.`NICKNAME` AS `APPLICANT_USERNAME`,`TB_USER`.`EMAIL` AS `APPLICANT_EMAIL`,`V_POSITION`.`EMPLOYER_ID` AS `EMPLOYER_ID`,`V_POSITION`.`EMPLOYER_NAME` AS `EMPLOYER_NAME`,`V_POSITION`.`TITLE` AS `TITLE`,`V_POSITION`.`LOCATION` AS `LOCATION`,`V_POSITION`.`EXPERIENCE_AGE` AS `EXPERIENCE_AGE`,`V_POSITION`.`SALARY_PACKAGE` AS `SALARY_PACKAGE`,`V_POSITION`.`PUBLISH_USERID` AS `PUBLISH_USERID`,`V_POSITION`.`PUBLISH_USERNAME` AS `PUBLISH_USERNAME`,`V_POSITION`.`PUBLISHER_EMAIL` AS `PUBLISHER_EMAIL`,`V_POSITION`.`EXPIRED_DATE` AS `EXPIRED_DATE`,`V_POSITION`.`IF_EFFECTIVE` AS `IF_EFFECTIVE`,`V_POSITION`.`INTERVIEW_CHARGE` AS `INTERVIEW_CHARGE`,`V_POSITION`.`IF_TRAINING` AS `IF_TRAINING`,`V_POSITION`.`APPLICANT_COUNT` AS `APPLICANT_COUNT` from ((`TB_APPLICATION` left join `TB_USER` on((`TB_APPLICATION`.`APPLICANT_USERID` = `TB_USER`.`ID`))) left join `V_POSITION` on((`TB_APPLICATION`.`POSITION_ID` = `V_POSITION`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `V_APPLICATION_AVG_RATES`
--

/*!50001 DROP TABLE IF EXISTS `V_APPLICATION_AVG_RATES`*/;
/*!50001 DROP VIEW IF EXISTS `V_APPLICATION_AVG_RATES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `V_APPLICATION_AVG_RATES` AS select `TB_APPLICATION`.`APPLICANT_USERID` AS `APPLICANT_USERID`,round(avg(`TB_APPLICATION`.`TECH_RATE`),0) AS `AVG_TECH_RATE`,round(avg(`TB_APPLICATION`.`FRAMEWORK_RATE`),0) AS `AVG_FRAMEWORK_RATE`,round(avg(`TB_APPLICATION`.`DATABASE_RATE`),0) AS `AVG_DATABASE_RATE`,round(avg(`TB_APPLICATION`.`ENGLISH_RATE`),0) AS `AVG_ENGLISH_RATE`,round(avg(`TB_APPLICATION`.`COMMUNICATION_RATE`),0) AS `AVG_COMMUNICATION_RATE`,round(avg(`TB_APPLICATION`.`MANAGEMENT_RATE`),0) AS `AVG_MANAGEMENT_RATE` from `TB_APPLICATION` group by `TB_APPLICATION`.`APPLICANT_USERID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `V_POSITION`
--

/*!50001 DROP TABLE IF EXISTS `V_POSITION`*/;
/*!50001 DROP VIEW IF EXISTS `V_POSITION`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `V_POSITION` AS select `TB_POSITION`.`ID` AS `ID`,`TB_POSITION`.`EMPLOYER_ID` AS `EMPLOYER_ID`,`TB_POSITION`.`TITLE` AS `TITLE`,`TB_POSITION`.`LOCATION` AS `LOCATION`,`TB_POSITION`.`EXPERIENCE_AGE` AS `EXPERIENCE_AGE`,`TB_POSITION`.`JD` AS `JD`,`TB_POSITION`.`REQUIREMENT` AS `REQUIREMENT`,`TB_POSITION`.`SALARY_PACKAGE` AS `SALARY_PACKAGE`,`TB_POSITION`.`TAG` AS `TAG`,`TB_POSITION`.`PUBLISH_USERID` AS `PUBLISH_USERID`,`TB_POSITION`.`IF_INTERVIEW` AS `IF_INTERVIEW`,`TB_POSITION`.`INTERVIEW_CHARGE` AS `INTERVIEW_CHARGE`,`TB_POSITION`.`IF_TRAINING` AS `IF_TRAINING`,`TB_POSITION`.`START_DATE` AS `START_DATE`,`TB_POSITION`.`EXPIRED_DATE` AS `EXPIRED_DATE`,`TB_POSITION`.`CREATE_USERID` AS `CREATE_USERID`,`TB_POSITION`.`CREATE_DATE` AS `CREATE_DATE`,`TB_POSITION`.`LAST_UPDATE_USERID` AS `LAST_UPDATE_USERID`,`TB_POSITION`.`LAST_UPDATE_DATE` AS `LAST_UPDATE_DATE`,(curdate() <= `TB_POSITION`.`EXPIRED_DATE`) AS `IF_EFFECTIVE`,`TB_USER`.`NICKNAME` AS `PUBLISH_USERNAME`,`TB_USER`.`EMAIL` AS `PUBLISHER_EMAIL`,`TB_EMPLOYER`.`EMPLOYER_NAME` AS `EMPLOYER_NAME`,`TB_EMPLOYER`.`CATEGORY` AS `CATEGORY`,`TB_EMPLOYER`.`SCALE` AS `SCALE`,`TB_EMPLOYER`.`ADDRESS` AS `ADDRESS`,`TB_EMPLOYER`.`BUSINESS_FOCUS` AS `BUSINESS_FOCUS`,`TB_EMPLOYER`.`WELFARE` AS `WELFARE`,(case when isnull(`V_POSITION_COUNT`.`APPLICANT_COUNT`) then 0 else `V_POSITION_COUNT`.`APPLICANT_COUNT` end) AS `APPLICANT_COUNT` from (((`TB_POSITION` left join `TB_USER` on((`TB_POSITION`.`PUBLISH_USERID` = `TB_USER`.`ID`))) left join `TB_EMPLOYER` on((`TB_POSITION`.`EMPLOYER_ID` = `TB_EMPLOYER`.`ID`))) left join `V_POSITION_COUNT` on((`TB_POSITION`.`ID` = `V_POSITION_COUNT`.`POSITION_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `V_POSITION_COUNT`
--

/*!50001 DROP TABLE IF EXISTS `V_POSITION_COUNT`*/;
/*!50001 DROP VIEW IF EXISTS `V_POSITION_COUNT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `V_POSITION_COUNT` AS select `TB_APPLICATION`.`POSITION_ID` AS `POSITION_ID`,count(`TB_APPLICATION`.`APPLICANT_USERID`) AS `APPLICANT_COUNT` from `TB_APPLICATION` group by `TB_APPLICATION`.`POSITION_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `V_USER`
--

/*!50001 DROP TABLE IF EXISTS `V_USER`*/;
/*!50001 DROP VIEW IF EXISTS `V_USER`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `V_USER` AS select `TB_USER`.`ID` AS `ID`,`TB_USER`.`USERNAME` AS `USERNAME`,`TB_USER`.`PASSWORD` AS `PASSWORD`,`TB_USER`.`NICKNAME` AS `NICKNAME`,`TB_USER`.`ICON_URL` AS `ICON_URL`,`TB_USER`.`CITY` AS `CITY`,`TB_USER`.`MOBILE_PHONE` AS `MOBILE_PHONE`,`TB_USER`.`EMAIL` AS `EMAIL`,`TB_USER`.`POINT` AS `POINT`,`TB_USER`.`BIRTHDAY` AS `BIRTHDAY`,`TB_USER`.`EDUCATION_LEVEL` AS `EDUCATION_LEVEL`,`TB_USER`.`EXPERIENCE_AGE` AS `EXPERIENCE_AGE`,`TB_USER`.`STRENGTH_SUMMARY` AS `STRENGTH_SUMMARY`,`TB_USER`.`EMPLOYER_ID` AS `EMPLOYER_ID`,`TB_USER`.`TITLE` AS `TITLE`,`TB_USER`.`WORK_DESCRIPTION` AS `WORK_DESCRIPTION`,`TB_USER`.`CURRENT_SALARY` AS `CURRENT_SALARY`,`TB_USER`.`EXPECTED_SALARY` AS `EXPECTED_SALARY`,`TB_USER`.`VISA` AS `VISA`,`TB_USER`.`VISA_EXPIRED_DATE` AS `VISA_EXPIRED_DATE`,`TB_USER`.`PROFILE_URL_CN` AS `PROFILE_URL_CN`,`TB_USER`.`PROFILE_URL_EN` AS `PROFILE_URL_EN`,`TB_USER`.`CREATE_USERID` AS `CREATE_USERID`,`TB_USER`.`CREATE_DATE` AS `CREATE_DATE`,`TB_USER`.`LAST_UPDATE_USERID` AS `LAST_UPDATE_USERID`,`TB_USER`.`LAST_UPDATE_DATE` AS `LAST_UPDATE_DATE`,`TB_USER`.`TAG` AS `TAG`,`TB_EMPLOYER`.`EMPLOYER_NAME` AS `EMPLOYER_NAME`,(year(curdate()) - year(`TB_USER`.`BIRTHDAY`)) AS `AGE`,`AVG_RATES`.`AVG_TECH_RATE` AS `AVG_TECH_RATE`,`AVG_RATES`.`AVG_FRAMEWORK_RATE` AS `AVG_FRAMEWORK_RATE`,`AVG_RATES`.`AVG_DATABASE_RATE` AS `AVG_DATABASE_RATE`,`AVG_RATES`.`AVG_ENGLISH_RATE` AS `AVG_ENGLISH_RATE`,`AVG_RATES`.`AVG_COMMUNICATION_RATE` AS `AVG_COMMUNICATION_RATE`,`AVG_RATES`.`AVG_MANAGEMENT_RATE` AS `AVG_MANAGEMENT_RATE` from ((`TB_USER` left join `TB_EMPLOYER` on((`TB_USER`.`EMPLOYER_ID` = `TB_EMPLOYER`.`ID`))) left join `V_APPLICATION_AVG_RATES` `AVG_RATES` on((`TB_USER`.`ID` = `AVG_RATES`.`APPLICANT_USERID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-19 23:33:26
