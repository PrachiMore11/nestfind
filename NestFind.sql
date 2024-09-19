CREATE DATABASE  IF NOT EXISTS `nestfind` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nestfind`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: nestfind
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `amenities_id` int NOT NULL AUTO_INCREMENT,
  `amenities_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`amenities_id`),
  UNIQUE KEY `amenities_name_UNIQUE` (`amenities_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (5,'Children Play Area'),(6,'Senior Citizen Park'),(4,'Swimming Pool');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `area_id` int NOT NULL AUTO_INCREMENT,
  `area_name` varchar(100) NOT NULL,
  `pin_code` int NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `pin_code_UNIQUE` (`pin_code`),
  KEY `fk_city_id_idx` (`city_id`),
  CONSTRAINT `fk_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'katraj',411046,2),(2,'Dhankawadi',411043,2),(3,'Bhosari',411039,2),(4,'Swargate',411042,2);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `b_date` datetime(6) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `rent_price` double NOT NULL,
  `deposit` double NOT NULL,
  `pay_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `booking_id_UNIQUE` (`booking_id`),
  KEY `fk_prop_id_idx` (`property_id`),
  KEY `fk_pay_id_idx` (`pay_id`),
  KEY `fk_user_id_idx` (`user_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_pay_id` FOREIGN KEY (`pay_id`) REFERENCES `payment` (`pay_id`),
  CONSTRAINT `fk_prop_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `state_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_state_id_idx` (`state_id`),
  CONSTRAINT `fk_state_id` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (2,27,'Pune'),(3,27,'Mumbai'),(4,27,'Nashik');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `area_id` int NOT NULL,
  `property_id` int NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `fk_area_id_idx` (`area_id`),
  KEY `fk_property_id_idx` (`property_id`),
  CONSTRAINT `fk_area_id` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`),
  CONSTRAINT `fk_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `pay_id` int NOT NULL AUTO_INCREMENT,
  `pay_mode` varchar(255) DEFAULT NULL,
  `pay_date` datetime(6) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `FKqewrl4xrv9eiad6eab3aoja65` (`booking_id`),
  CONSTRAINT `FKqewrl4xrv9eiad6eab3aoja65` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `photo_id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `images` longblob,
  PRIMARY KEY (`photo_id`),
  KEY `fk_property_id_idx` (`property_id`),
  CONSTRAINT `fk_property_photo_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (7,36,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0		\n\n	\r\r\r \"\" $(4,$&1\'-=-157:::#+?D?8C49:7\n\n\n\r\r\Z\Z7%%77777777777777777777777777777777777777777777777777ÿÀ\0\0”\0˜\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0F\0\n\0\0\0!1\"AQaq2‘¡\Ñ#BR±Á3CDbr²\Â\Ò\áğSsƒ¢4U’£ñ$ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0$\0\0\0\0\0\0\0\0\0\01!A2a\"Qbqÿ\Ú\0\0\0?\0†\0†<ƒ+\ÆÕ¦°’F„È¥±¿g\\gŠ†\Ö/Š¸YŸ¥wcƒ\Ğsj•ô‹öT\î\Ìró\Îó´W\r¦\Ğ\ç$ºn’\Ş®\ã\Ê\Êf£˜“‹¨Çµ)vŠØ²\ÅK¥,2 8#“œô{\Ğ\Ú\ãOÓ¥±m6Ü³0-4xb\Ø\Î\Èô?]Uµm*ı/\ZM?Im»\nŒ‚9\êMtl¨“ŒŠôK<2mšH\Ìj¤l\ÎG>g\"Œ–b]¤¶”©U\ã\×Ò†µ\ÑuVº‹±¾Œ\'\"#\É\Î\"¤\Ze\à|yS\0r|#\í5Ÿ¢¥*\à\ê\Úójú¬N‘\ÄPAu‰\ÃÀ\Ï#šoc¥\Í\ÚNĞ½Î—n«m…\î&ı$oÀ\Îy9\Éû:b¦\ìÿ\0d$¸µŠÿ\0µw:uºş†&ln\É\ÏOr|ºùy\Z²\Ë;^Ä¶v0›-5ÕŠ4\Ødù\ã ö¢\åHhcm›Ix–ñ‹=!šiQr^\Èwp==O½’9i7;¿,\ï’I÷¦VÖ‘Û¨UÂ\î\ïN\Å=\0?P5l\êI!5²O¤\Ü÷ö£\Â\ßN<p\Õx\ÒuH§·VS˜ºT>†«\ïF\nŸª ¶yt\éÌ°Tı4 \á‡\ãJ¦ñ±\ÜT\Ğ~¡©|n\ì±-³`e‡dı¢ªº…\ä“\êK%\Äcld\0§\'`¥^´ÿ\0‚I[R·\ã_L0?gğª\Çi,;ë–½†@ö·\"m`6zqU—\î\Äç¦2+Yû\é\İJ\ì‚²3d:\í:™~\"\ì][\É6\ám$l„zuÀùRmV\Ã\ácŠ0ZWlnEú8#€r=\Å4±3Dª\É Y¤P \08À\İ\× Tÿ\0«ôióOk…A’b¤e°qû\\\äş­n\ä\Ò/–\è§\á\×\Ä9À\ã§J»é¶·:U\Ô[Â³†$Œ\ç$y1\ÅR%¶\ßX»‡S³-5¸S\Z\Ã\áI9f\Ï‚y£¥QÆ’b4W‹UC=\Äb\0²2l*Wcy<\Æ5”%®µe0»“oÂ¶ôÂ¦ı²2õ\ç\0ôÁúóYOõ\"¾D¦U{‰>¯0V\Ş\Ëdùğ\ã’T}C“\Å9\ï<\\Œyu¥ÿ\0“1\ß\Ş^\É¾\Éc²Œn\É\Ï?`«n³ü\r\Âüó¿¾µS\ÏÕŠ\å\ÛY¸X\Óx\Ó©%ğ\Ä{\Z\Ø\àœm\é\çD\çS^O\Ò\Ü{DS÷\Z–\Îë«•‹ó\\ø¤8şı)Ô“ğgºdq©w>P94\Í\âµ\Ñ#Iu\ß\\\È3ª‘÷ú|ÿ\0}{w©[i¬ö\Ú,k-\Ùğ\É6	/a\ëòûhK[	C=\Û4“I\â299o¶©TI»5+q©\Ì\'¿`p|)#Ş§Ş™C\0Nñò­£\\/–>cğ­Â@>A\Z^˜Y\Ú-y´6³E³e–\"\ÌYÊsõĞº/k`\Õ\îÍ»i\â6¼»„\ÙQœt¡{uu½Şš%wp\Äx7q’?hR^\È4O®³¤ûÁ³˜m(ÀıÏ\Ú«[§n´w\0\Éev€ŒğTÕŒwW\ĞO\0p“F$‡8ò®Ik\İ*›«aµ1\Än3\Ïö+«\é¡2\é€\á¿şU\ë\ãZTÑ½L–\Îg³›*vOH?\ï5¾¯`%‹\ãt\à	<\É\Z¾\ãŞ¼\î\Æ>>Xş¥¶¹{W\ã%QÉ®]¾›üq\İyÒ©<óeZ-\Å÷\ï\çSÌ‰s{+˜&H3»\Ü}~^‚\ë:w9¾ÓŠ®|R)\È><ıESµ«qQyñ¹\Ú\Å²zú\Z»\×\ïG;\Ù>\Ó\\4q¤²+E…X‘@\İ\Éú³Bö\İ$¼¿[ÄŒ¾\ì²\Æ¼FqÇ¡\'\í\æ«:l«¨biã‹»b\ÈK\î\éöyu§\Z­\ÚE{\ÔW2E°4y\ï@ £\0/\ÑÁ9\Æ:”\ê{GRu^‚À\×f³ ˜f‘W\n›úğ}zVTú1g¿š[K›KˆYs t$\ê6Ÿ\Ù\è:sŠ\ÊE\n	GƒS¸K•U’\æ)\ŞU\Æv7L{\×m”f	\É\Ã\Éı\ã_>\é\â\æóU²EC#Î‡»L³\â»Ö¡}k§[£\ß\Î\\\Çı)2I§œ.H\'QaJ©±¦™\Ö+ti\àR{­J\ãSqe¥,Ù“‚ø\Ã\Ëø¾¡‚\rK´“¬—#¸·C\à…G?\ÌhÙµ[-36\Z3C5\Şpò—\"ö>§ÚŒcH¤¥l\Ùm,t#’\ëkNs\İ[Ff?/\ãÒ³L\×dº–Kmj\Ş+ewı‘“…ôúûô4»\äk™§\ï®“!~~¯ÂŠ–×¿B®«ƒ<\ëJÙ”lcsÛ¾’§£g­C‘ûC\í…Eazöğš‚™-1µd\êcô\Û÷Pz\êj\Úswö·&k\'\Æ\×\Ø	_cø\Ñ^™ª\í~‹}«=„¶6\Ë8\"¬w(\Ç\'Š_Ù\Ïjv\Z“Is§˜\Ğ\ÛH›†\ÉR1Á¢F±¨uv…›ò\Ål5½Aq„„\0sô\ãLJ·gu¸\í¶Í£\\«`øDdùü\ë¦\Ø\Ç$Z>™Š\È\ënVH—´w\éü\Ì\'Œñ¸\Z\ßş#œó5ª±õ\ŞM-vX3\Ç$}\ÃøTOƒú\Ëõ‘I—´\Ó\àÔi\Ø†· S\ÖÕ‡ı\ïô©8”N¸:´¹6\ÏûHO+\Æ)/kû8/T\êºJ–\Ín‡\àó+\ï\í\ç^şz…¿£\Ëõ:ŸßŠÏ´	‡d”\'•ğş5´<qEù9µ¼\ïq,‘D‰j\ì\È¤8!°I<ş¯¥FöS\Ü_AyN\ä¢d“‘œıı*\İ\Û\İ*\ÛY‰u=.\é»õP%¶<Tg¡\ÛT{˜g¶’\ã‚\ê6K	X’À¶\Ò‡¥u\Â1~£Ïš”]P\Ê\èË¥\İ=øİ“«&9¿şó^Um\çºŠ.\ÉÚ§s6\àxµ\íŠ-Ø›³ \é:‘\Ù\Ñ\"\Ó[\Éc2&;\Ù¹>½qÒ’kG\Õ\'¼»\ï\ZYB\ï»\àdúP\Z/qªIuª+IpA\áÏ­/\Öl.E\íÑ‚G²°T<¯_J;½N¥\ÚE‘/´\ÕVoe‹t¡O¯¨x\ì´0Gr\ê˜éµ¢üh{\ç\ì‚\Ë:tPe\Õqú\ŞXª…\â\éúb[şq¾¸†I²€¤Œg~§À>K\Ú\Úi§;ea\æpcÿ\05lllßƒpyõ@s\Î\Z/ş\ë/ÿ\0\n.ûO¸‰\ÔA4\ìRœu \ç]C(7\Æ_†g\å+ÿ\0L\Ñ\ÖSIajm­\ï·9\Ìm	p3\ä2r´‚ùƒ<²JF\Îx\æ¬\r§¤]Š}NDi&Nxb	ñc­e$ß†jIzZ\Ò”™‰ò;C™­NG\Â\Ïó\Î~\ã\\\Æ\ÓS™\çH\á[ˆ÷67	‰­d\×5\Øeq§tª\â\ÏE\é&\è\é\Í-®0`œtsş\nŒ\Íf:G)ù£ÿ\0’¹¬]¦\×ò\áµ[«7Q\ä>U\í\åõæ•¢i3X\Ï4o+\ívB	oEfe&Â¾&\Ìu\Ş>£üV´76 \ç¡ù­Q‡iu­û¡pXqƒ\Z~5\×k;C¦5¼cõ¡\\ş\êÊŸ\È\\š\é\Ğ~2À~¸÷P\ZÁdNwÿ\0ö!ÿ\0Pÿ\0\â½m#F’\áI`ò	\çõU¾+‹™;&®\Ò!»¹KD¸,c”˜i\Ô-GGo¨ş\ï\çct\Øô\Æk\İö«T‰‡Á¶I\Û\ng¦ê··@ µ\ë\Õa\Å	x¬;¶\è¸?Á\İ.Ù YG˜’\0ß¼W”´øÁ*ª}†++–Y¥~‹%®1\É/s\Çóƒğ¯&\î…\İ\Ñuô\Çû\ß\é@iws\ÜNV\ãnCÅŒ.?_5¾ O\Å^`ñŞ¿\ï5g\âQ=$ZnŒ_˜£(\î\Â \Ç\Ù\\··\r:––\ì\â56n3·?¯]\"n;¤z\ïW,ü¢\àÏ¤dEo\ïS\Ç\Í„ç– \ëù_\İY\Ïe,ku–*¡U£\ëƒ\ëŠ\ê–&\Î­»\å^D\çû\Å*§sc¦kª\ê%Œ\Ê\"/¡úœ	¤M\Ûm\ê\ÇMnş;;qm@`\ÖÚ”&Òƒµ\Ó\Éşr’ÛI\Éõ§z­\ÄşO\Ö	_1Ú \ç\ÇSÅGl¦l‰¤Y \ÙBu›0.!|\Ì\07=}©\İõ’üMÀ\ãùFò÷ ¬a†\ÎUš‰\"9\ï=ÊŠ’\é\ŞF\Şû¤s’O“Un\ÙÊ²¨¢(,UUmª.	<\Å^?)\Ú\è:0•²;ğ ù·ı*„÷„!˜¶>:\n–]NkÄn%’a\Ûp_–k;Ì“ \ÛÔ˜, —Z7VÓ£Jx\Î\Å==ª8¯c™š\Ò\İ\ßvK´@ú\Ôs\êOq!yˆ$ø@\Æ1K\ÓY\â\Ğ>«l±\Ço·şW>\Ç5{\Ó\×w\ä\ÆLc\è7_ú¦¨¦\è\È\0\n¥Bô$¶Š‡Z¼\Ğ\ÛG6mXór§Ï§ÎŠ^Šóª ¿a¥Ôğ©`=3\Å>µS\\\ìP09À\ãÊ—\ÚJV(\Ò8\ã[b(\0\Zpˆ\n\ÒO”;vk¸“\Å{R¬`\n\Ê\çcS\Zvn\âCyp‚\Ğ\Øô\ÍK}ÿ\0ª»\ÉÀ\ïŸ?i¥:-ú¥Ï‰b\Ê:ÿ\0Z˜Şº½\Õ\Ò\çù\Ù7`g\'š\í„j4=İ¡õ\İ\ä0ön¿Fyú\Õ\Ëÿ\0(E4ºKDû”\Ú1SŒdn÷®Ÿ?u` \ns\ÇJ«+kmu Iâ³—º\\+N¹Àô\Z}õv#ƒ’£•©\È\Èó\Åu\ÍP\"N\àwÿ\0\ÄTsh¶-6\é\Éı‹r\ÃR\ëÿ\081¾pûˆ…\Æ(K\"q\ãp*ˆŠµ\×²Ò¡ıT…‰\Ç^d<ı\Ô=Í ğ\É:\ÎbT\ÂW\Ë\çJn\Ş\éV/Œ—yeyÏ‡ı“J.IxA;=º\ì\ïU€HŒ\Zˆ`6H7O\ß^Î±*.:ciã©¨\'\Â€\Ë\ëY­›\í•Á^ñT	$õ­pc‹.Ã“ô¼¼ª)GMŸG%‰ÿ\0cÎµ \Ê\áw\0??\\Ó€œN\Ê\n\ï#9>g&µi]öª\0w\Ë† ’5I#ÓŸZ&(®Jø2}¨:FV\È\Èw$nLuIİ³\í±0z\Ô/\ËÃ®G‘ó©­cGeËù\å@\éZşPiğy¦¡Bs3\çO\ã`š[h©`ñšœÍs\ÅBoÓ¢!\'¦+( \Ùl\ÖW;e\Úu½\Ï\Åî‚€ûö¯{QÒ­öº•…ó\İ®%f\ä‰J\ã\Å\É\è)U²\Ç$Q\í\Îp1\ä=\êK™a$ñ>\î\09\ÅwôHø]8h“\éğCwu7wp@\êIº\í\àc#\ì+ [’\"K¬¹f\Ï\ß\\\Ò+¹\ÂH\á\İ[w²œôt±k«\ëD¹µ²€\î\ã,£Ê•\Ë\âŠciø87\Ú(şf\àÿ\0i¿Ö¡}cFN~w\Ì\ÔIg©7[[ \Ç8\Ål\Ú~¤e%\n£ú£ğ¥¶V‘Ú¶ša%t\èq\î\â¨]¦¸‚şu[k#“…*xUtV\Ó/dB\è§\ØRıC³úŒ\æ\ŞXŒ[÷~~•¶bN)£Ÿÿ\0\Â\ë Ü·.’\ç¼ Œ}”-Æ‘:\Ìjg„Ÿ¢<\'\Ün9\ÇLô\éV¹t\ícN\r%\æ\\1\Äkn\åğ\ÕA|\\\ê».£h[\'ôL§8\ã‘õ\Ò\'4BPE^M\åY¤·ğ@\\\î Œ\ÔO¥\Ş$\ê±B\Ì\Èr6€9«Z_@°oÒ²¾W#zg÷ıÕ¼\Ï±÷sg#-ƒ~b›y	¢)Kgx²‚\" 7\Ò\ã<šicg2Y\r1OR\ÚÜŒ[?¬Gû\Æ+>\Z%bwúšL\Éø4`\Ù+z\Ğñ\ØwReFÊxG\ç‡<®j++)ªM+\Æ0Ÿ•mle|sÆ‡õ\0ùT8\Úxªnš¾›3l¬¯G#‘šÊÆº¼\ï£\\wzŒoo!•]pHöõ\ë\åLô[[mF=\×\Õ\\rcğ“ó=h\íZ\àkpw3\Ã£“Å°úJó³İ›º\ÜJİ¬Iú\Ê[8¼Wzœjª,Vì½´ö›#G³\é$G¨\'š¸öf\Ü\Ûi\ĞÀ\Î\0\Îò95\Zöj&Xäº»¸¸\Ü(;ıB¦Cd6C\0\é–\Î>U9MG£\Æ)pyÀú«e#v:ûc¥&µ¿i§\Ç8ö¦sHcBs\Æ3È¬¦š±\Éd–5Zö).Bƒ\ë\Í%øˆ”*§p HÁÏ¨­	\ìü36!1\å\î(K›k)AC“Ÿ¦ \Ñ©`N|¹ª\î§y$\'×ŠÒ\îû)¢]‚Ÿ#,:D0\ê\éKg\ìª©Wm$–. –úé†›|Ò€y)\Òx“\Çš\Ñj@\Õ\Ö\ìT‘ÿ\0MÊ›cæ…º\ìü\ÑxU¿ñ\Å_X÷qø\Ï iMı\Ì#\É\r$\à˜uH¥I¥\Ë;˜\äyP2«Fy«-õ\ÌXÊ·–:\Õfúp\í\á<ThP»Kx\æH\æŠ\ZHe\'-J¬®L2Od‚öˆ\0Ø­RĞŠkCÁ×´\ÎvWo5\å\n…\Ö\ÆW\ÜQ’3Ö™\ÚI,.®e9õ\Ü~úOiw°’¨9ò\Å\Ì\Ä\r„\rÜœü\ê¯\Î	^\àÕ…Õ¦J\Úp@\àf–O\ã$ò3@Y\ŞM\"õŒiŒ²	0rjrn](‰tx\î8>Â]«4{7p\Ü\ã\Ó\Û5jÈŠ[¼_q\Ğ\Ó\'MËœz\0|\ë£*&±\íÁ\Æ\0\Î9§\Ñ8‘#pò\Ä]FUG$£Î¼Š4„w\Ë\ÈtĞ†¡|&=Ú«*q»²i6¡lŒ¬|\'\Ğ\æ\Ô.(q\Ştdd\Õj\ãR\ïŸb}H¥\ÈĞ¨š\Â\îRGŸÅŒ\0|úyU~)ö®MnÚª‚¼@©°’A\Z\êcS‚q´ø³Ö¨\Z\İ\ä†\\,„uó§z–±ÁXtª\Ô\Ï4Œ[¹\'|ƒ<\ßI‰ú\ë^¦½5\ê­M\n\Ñ\åMŒ¸y\ĞV+xºV\0\ê\Æ3(À\ëYQ\é“a=\Í{N¨kY bÄ“´Qc\ÜQ\ÇÂ·QYYN\É!\Ü1,m\á\æŒ\ï™+Œñ\ÍeeEô·Ád\Ònd\"\ÜgùU\İGNJ\ÂH\'5••Ö¾\Ó.XL\ÌË|D|\ê{°»QŠ‚\ËĞš\Ê\Ê\Ñ\à\Ò\éQ\Õ\î\åk3\È\ã\ĞRbrMeerÏ¦}¹=\ßZ¯j28“†=k++1$	\Ş9,MhzW••0¢3Ö¥A\Åee:3=\"µ\ÅYYX@\ëC†••”Bÿ\Ù');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `property_id` int NOT NULL AUTO_INCREMENT,
  `property_type_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rent_price` double NOT NULL,
  `deposit` double NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `UK_sn1xxusegr4g7jjpx68ce5dt1` (`location_id`),
  KEY `fk_property_type_id_idx` (`property_type_id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `FK2ites4e9383wf41m3xlyyr3sb` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_property_type_id` FOREIGN KEY (`property_type_id`) REFERENCES `property_type` (`property_type_id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (36,3,39,20000,25000,'A-104, Raj Tower Building, Katraj',NULL),(37,3,53,25000,35000,'A-205, Prtiksha Bungalow',NULL);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_amenities`
--

DROP TABLE IF EXISTS `property_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_amenities` (
  `property_amenities_id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `amenities_id` int DEFAULT NULL,
  PRIMARY KEY (`property_amenities_id`),
  KEY `fk_property_id_idx` (`property_id`),
  KEY `fk_amenities_id_idx` (`amenities_id`),
  CONSTRAINT `fk_amenities_id` FOREIGN KEY (`amenities_id`) REFERENCES `amenities` (`amenities_id`),
  CONSTRAINT `fk_propertyid` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_amenities`
--

LOCK TABLES `property_amenities` WRITE;
/*!40000 ALTER TABLE `property_amenities` DISABLE KEYS */;
INSERT INTO `property_amenities` VALUES (47,36,NULL),(48,36,NULL),(49,37,NULL),(50,37,NULL),(51,37,NULL);
/*!40000 ALTER TABLE `property_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_amenities_amenities`
--

DROP TABLE IF EXISTS `property_amenities_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_amenities_amenities` (
  `property_amenities_id` int NOT NULL,
  `amenities_id` int NOT NULL,
  PRIMARY KEY (`property_amenities_id`,`amenities_id`),
  KEY `FK7sfna1pdojhcy04qmpjdlqtfb` (`amenities_id`),
  CONSTRAINT `FK7sfna1pdojhcy04qmpjdlqtfb` FOREIGN KEY (`amenities_id`) REFERENCES `amenities` (`amenities_id`),
  CONSTRAINT `FKcaqoe777vla3e95qmmkh66qfj` FOREIGN KEY (`property_amenities_id`) REFERENCES `property_amenities` (`property_amenities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_amenities_amenities`
--

LOCK TABLES `property_amenities_amenities` WRITE;
/*!40000 ALTER TABLE `property_amenities_amenities` DISABLE KEYS */;
INSERT INTO `property_amenities_amenities` VALUES (47,4),(50,4),(48,5),(51,5),(49,6);
/*!40000 ALTER TABLE `property_amenities_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_type`
--

DROP TABLE IF EXISTS `property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_type` (
  `property_type_id` int NOT NULL AUTO_INCREMENT,
  `property_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`property_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_type`
--

LOCK TABLES `property_type` WRITE;
/*!40000 ALTER TABLE `property_type` DISABLE KEYS */;
INSERT INTO `property_type` VALUES (2,'1RK'),(3,'1BHK');
/*!40000 ALTER TABLE `property_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (2,'Renter'),(3,'Landlord'),(4,'Admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `state_id` int NOT NULL,
  `state_name` varchar(255) NOT NULL,
  PRIMARY KEY (`state_id`),
  UNIQUE KEY `state_id_UNIQUE` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (27,'Maharashtra');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `adhar_no` varchar(12) NOT NULL,
  `pan_no` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `pan_no_UNIQUE` (`pan_no`),
  UNIQUE KEY `mobile_UNIQUE` (`mobile`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `adhar_no_UNIQUE` (`adhar_no`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_role_id_idx` (`role_id`),
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (33,'Prachi','More',3,'prachir@gmail.com','875496987452','JDKTD2564G','9857648974','Prachi123','$2a$11$YKT8emHjCYJNUdV/sbokUuVBT7cR.QNod3NNhQHAiCieZcBGi3XVW'),(39,'Mayur','More',3,'mayur@gmail.com','879546987451','LKIDG2548L','8795487954','Mayur123','$2a$11$q7sETY.vXk3BPfYs2ijVVugUYIo0KgV8KYB30KrPeE3fHcNh.MJSS'),(46,'Prachi','More',4,'prachimore@gmail.com','897845651232','PRACH6954R','8975976895','More123','$2a$11$JtyJfKeUJ5LeBdsgUh9SBuF9JzUpLQcJ2eY.Ha35lS0zFv3qyORhu'),(48,'Mandar ','Kondhalkar',2,'mandar@gmail.com','785941236594','MANDR5874K','7845123562','Mandar123','$2a$11$obOu.lzNhbJDocP.C/xSi.13jzyvUT9.AG5BYyC.0kEPNrKAEIupW'),(51,'Anuja','Deshmukh',2,'anuja@gmail.com','754896253412','ANUJA2548K','7854926358','Anuja123','$2a$11$oTajsI3oZz.buQ1/7Oe/EeGRJnad/cqh2W7AWE4UHEMWyGe28cCoi'),(52,'Pratiksha','Kale',3,'pratiksha@gmail.com','789564128596','PRATI5875P','7845986541','Pratiksha123','$2a$11$1X3375jfOfA4b9zyujz1/uX0Im2j19Yyf9nPhh4AglUCjbK2M8/y2'),(53,'Pratiksha','Kale',3,'kale@gmail.com','564897253694','PRATI2578K','8956789632','Kale123','$2a$11$OqovbTdpF9hN3U382lRp/OMbokBjxxlZhwx.Zm6FSUMrScnjlGMSS');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 16:19:34
