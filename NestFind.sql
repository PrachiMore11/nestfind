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
INSERT INTO `photos` VALUES (7,36,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0		\n\n	\r\r\r \"\" $(4,$&1\'-=-157:::#+?D?8C49:7\n\n\n\r\r\Z\Z7%%77777777777777777777777777777777777777777777777777��\0\0�\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0F\0\n\0\0\0!1\"AQaq2���\�#BR��3CDbr�\�\�\��Ss��4U���$�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0$\0\0\0\0\0\0\0\0\0\01!A2a\"Qbq�\�\0\0\0?\0�\0�<��+\�զ��F�ȥ��g\\g��\�/��Y��wc�\�s�j���T\�\�r�\��W\r�\�\�$��n�\��\�\�\�f�������ǵ)v�ز\�K�,2�8#���{\�\�\�Oӥ�m6ܳ0-4xb\�\�\��?]U�m*�/\ZM?Im�\n��9\�Mtl�����K<2m�H\�j�l\�G>g\"��b]����U\�\�҆�\�uV�����\'\"#\�\�\"�\Ze\�|yS\0r|#\�5���*\�\�\��j��N�\�PAu�\��\�#�oc�\�\�NнΗn�m�\�&�$o�\�y9\��:b�\��\0d$����\0�w:u���&ln\�\�Or|��y\Z�\�;^Ķv0�-5Պ4\�d�\���\�Hhcm�Ix��=!�iQr^\�wp==O��9i7;�,\�I��V֑ۨU\�\�N\�=\0?P5l\�I!5�O�\����\�\�N<p\�x\�uH��VS��T>��\�F\n����yt\�̰T�4 \�\�J��\�T\�~��|n\�-�`e�d�����\�\�K%\�cld\0�\'`�^��\0�I[R�\�_L�0?g�\�i,;떽�@��\"m`6zqU�\�\�禝2+Y�\�\�J\���3d:\�:�~\"\�][\�6\�m$l�zu��RmV\�\�c�0ZWlnE�8#�r=\�4�3D�\� Y�P��\08�\�\� T�\0��i�Ok�A�b�e�q�\\\���n\�\�/�\�\�\�\�9�\�J�鶷:U\�[³�$�\�$y�1\�R%��\�X��S�-5�S\Z\�\�I9f\��y��Qƒb�4W�UC=\�b\0�2l*Wcy<\�5�%��e0��o¶�¦��2�\�\0����YO�\"�D�U{�>�0V\�\�d��\�T}C�\�9\�<\\�yu��\0�1\�\�^\��\�c���n\�\�?`�n��\r\���󿾵S\�Պ\�\�Y��X\�x\��%�\�{\Z\�\��m\�\�D\�S^O\�\�{DS�\Z�\�뫕���\\��8��)ԓ�g�dq�w>P94\�\�\�#Iu\�\\\�3����|�\0}{w�[i��\�,k-\��\�6	�/a\���hK[	C=\�4�I\�299o��TI�5+q�\�\'�`p|)#ާޙC\0N��\\/�>c�@>A\Z^�Y\�-y�6�E��e�\"\�Yʐs�к/k`\�\�ͻi\�6���\�Q�t�{uu�ޚ%wp\�x7q�?hR^\�4O�������m(��ϝ\��[�n�w\0\�ev���TՌwW\�O\0p�F$�8�Ik\�*��a�1\�n3\��+�\�2\�\��U\�\�ZTѽL�\�g��*vO�H?\�5��`%�\�t\�	<\�\Z��\�޼\�\�>�>X����{W\�%Qɮ]���q\�yҩ<�eZ-\��\�\�S̏�s{+��&H3�\�}~^��\�:w9�ӊ�|R)\�><�ES���qQy�\�\��z�\Z�\�\�G;\�>\�\\4q��+E�X�@\�\���B�\�$��[Č�\�\��Fqǡ\'\�\�:l��bi㋻b\�K\�\��yu�\Z�\�E{\�W2E�4y\�@ �\0/\��9\�:�\�{GRu^��\�f���f�W\n���}zVT�1g��[K�K�Ys t$\�6�\�\�:s�\�E\n	G�S�K�U�\�)\�U\�v7L{\�m�f	\�\�\��\�_>\�\�\��U�E�C#·�L�\�֡}k�[�\�\�\\\��)2I��.H\'QaJ����\�+ti\�R{�J\�Sqe�,�ٓ��\�\�����\rK����#��C\��G�?\�hٵ[-36\Z3C5\�p�\"�>�ڌcH��l\�m,t#�\�kNs\�[Ff?/\�ҳL\�d��Kmj\�+ew��������4�\�k��\��!~~��׿B����<\�Jٔlcs۾���g�C��C\��Eaz�𚂙-1�d\�c�\��Pz\�j\�sw��&k\'\�\�\�	_c�\�^��\�~�}�=��6\�8�\"�w(\�\'�_ٞ\�jv\Z�Is��\�\�H��\�R1��F��uv���\�l5�Aq��\0s�\�LJ��gu�\�ͣ\\�`�Dd��\�\�\�$Z>��\�\�nVH��w\��\�\'��\Z\��#��5���\�M-vX3\�$}\��TO��\���I���\�\�ԏi\����S\�Շ�\���8�N�:��6\��HO+\�)/k�8/T\�J��\�n�\��+\�\�\�^�z���\��:�ߊ�ϴ	�d�\'���5�<q�E�9��\�q,�D�j\�\��8!�I<���F�S\�_AyN\�d�����*\�\�\�*\�Y�u=.\��P%�<Tg��\�T{�g��\�\�6�K	X���\���u\�1~�Ϛ�]P\�\�˥\�=��ݓ�&9���^Um\��.\�ڧs6\�x�\��-؛��\�:��\�\�\"\�[\�c2&;\��>�qҍ�kG\�\'��\�\ZYB\��\�d�P\Z/q�Iu�+IpA\�ϭ/\�l.E\�тG��T<�_J;�N��\�E�/�\�V�oe��t�O��x\�0Gr\�鵢�h{�\�\�\�:tPe\�q�\�X��\�\��b[�q���I�����g~��>K\�\�i�;ea\�pc�\05lll߃py�@�s�\�\Z/�\�/�\0\n.�O��\�A4\�R�u�\�]C(7\�_��g\�+�\0L\�\�SIajm�\��9\�m	p3\�2r����<�JF\�x\�\r��]�}NDi&Nxb	�c�e$߆jIzZ\�����;C��NG\�\��\�~\�\\\�\�S�\�H\�[��67	��d\�5\�eq�t��\�\�E\�&\�\�\�-�0`�ts�\n�\�f:G)���\0���]�\��\�[��7Q\�>U\�\��敢i3X\�4o+\�vB	o�Efe&¾&\�u\�>��V�76 \���Q�iu���pXq�\Z~5\�k;C�5�c��\\�\�ʟ\�\\�\�\�~2�~��P\Z�dNw�\0�!�\0P�\0\�m#F�\�I`�	\��U�+��;&�\�!��KD�,c���i\�-GGo��\�\�ct\��\�k�\���T����I\�\ng�귷@��\�\�a\�	x�;�\�?�\�.٠YG��\0߼W����*�}�++�Y�~�%�1\�/s\���&\�\�\�u�\��\�\�@iws\�NV\�nCŌ.?_5��O\�^`�޿\�5g\�Q=$Zn�_���(\�\� \�\�\\��\r:��\�\�56n3�?�]\"n;�z\�W,��\�ϤdEo\�S\�\��疠\��_\�Y\�e,ku�*�U�\�\�\�&\���\�^D\��\�*�sc�k�\�%�\�\"�/���	��M�\�m\�\�Mn�;;qm@`\�ڔ&҃�\�\��r�ێI\���z�\��O\�	_1ڠ\�\�SŏGl�l���Y�\�Bu�0.!|\�\07=}�\����M�\��F����a�\�U��\"9\�=ʊ�\�\�F\���s�O�Un\�ʲ��(,U�Um�.	<\�^?)\�\�:0��;����*���!��>�:\n�]Nkčn%�a\�p_�k;̓ \�Ԙ,��Z7VӣJx\�\�==�8�c���\�\�\�vK�@�\�s\�Oq!y�$�@\�1K\�Y\�\�>�l�\�o��W>\�5{\�\�w\�\�Lc\�7_����\�\�\0\n�B�$���Z��\�\�G6mX�r�ϧΊ^�� �a�Ԟ�`=3\�>�S\\\�P09�\�ʗ\�JV(\�8\�[b(\0\Zp�\n\�O�;vk��\�{R�`\n\�\�cS\Zvn\�Cyp�\�\��\�K}�\0��\��\�?i�:-��ω�b\�:�\0Z�޺�\�\�\��\�7`g\'�\�j4=ݡ�\�\�0�n�Fy�\�\��\0(E4�KD��\�1S�dn���?u` \ns\�J�+kmu Iⳗ�\\+N���\Z}�v#�����\�\��\�u\�P\"N\�w�\0\�Tsh�-6\�\���r\�R\��\081�p���\�(K\"�q\�p*���\��ҡ�T��\�^d<�\�=͎��\�:\�bT\�W\�\�Jn\�\�V/��yeyχ��J.IxA;=�\�\�U�H�\Z�`6H7�O\�^α*.:ci㩨\'\��\�\�Y��\��^�T	$��pc�.Ó����)GM�G%��\0cε \�\�w\0??\\Ӏ�N\�\n\�#9>g&�i]��\0w\����5I#�ӟZ&(�J��2}�:FV\�\�w$nLuIݳ\���0z\�/\�îG��cGeˍ�\�@\�Z�Pi�y��Bs�3\�O\�`�[h�`�͞s\�BoӢ!�\'�+( \�l\�W;e\�u�\�\�����{Qҭ������\��%f\�J\�\�\�\�)U�\�$Q\�\�p1\�=\�K�a$�>\�\09\�w�H�]8h�\��Cwu7wp@\�I�\�\�c#\�+�[�\"K���f\�\�\\\�+�\�H\�\�[w���t�k�\�D����\�\�,�ʕ\�\�ci�87\�(�f\��\0i�֡}cFN~w\�\�Ig�7[[ \�8\�l\�~�e%\n����V�ڶ�a%t\�q\�\�]����u[k#��*xUtV\�/dB\�\�R�C����\�\�X��[�~~��bN)���\0\�\� ܷ.�\� �}�-Ƒ:\�jg���<\'\�n9\�L�\�V�t\�cN\r%\�\\1\�kn\��\�A|\\\�.�h[\'�L�8\��\�\'4BPE^M\�Y���@\\\� �\�O�\�$\�B\�\�r6�9�Z_@�oҲ�W#zg��ռ\���sg#-��~b�y	�)Kgx��\" 7\�\�<�icg2Y\r�1OR\�܌�[?�G�\�+>\Z%bw���L\��4`�\�+�z\��\�wReFʝxG\�<�j++)�M+\�0��mle|sƇ�\0�T8\�x�n���3l��G#��ʐƺ�\�\\wz�oo!�]pH��\�\�L�[[mF=\�\�\\rc��=h\�Z\�kpw3\���Ű��J�ݛ�\�JݬI�\�[8�Wz�j��,V콝���#G�\�$��G�\'���f\�\�i\��\�\0\��95\Z�j&X亻��\�(;�B�Cd6C\0\�\�>U9MG�\�)py���e#v:�c�&��i�\�8��sHcBs\�3Ȭ���\�d�5Z�).B�\�\�%����*��p H�Ϩ�	\��36!1\�\�(K�k)AC����\��`N|��\�y$\'׊ҝ�\��)�]��#,:D0\�\�Kg\���Wm$�.���醛|Ҏ�y)\�x�\��\�j@\�\�\�T��\0Mʎ�c慺\��\�xU��\�_X�q�\� �iM�\�#\��\r$\��uH�I�\�;�\�yP2�Fy�-�\�Xʷ�:\�f�p\�\�<ThP�Kx\�H\�\ZHe\'-J��L2Od���\0حRЊkC�״\�vWo5\�\n�\�\�W\�Q�3֙\�I,.�e9��\�~�Oiw���9�\�\�\�\r�\rܜ�\�\�	^\�ՅզJ\�p@\�f�O\�$�3@Y\�M\"���i��	0rjrn](�tx\�8>]�4{7p\�\�\�\�5�jȊ[�_q\�\�\'M˜z\0|\�*&�\��\�\0\�9�\�8�#p�\�]FUG$�μ�4�w\�\�tІ�|&=ګ*q���i6�l��|\'\�\�\�.(q\�tdd\�j\�R\�b}H�\�Ш�\�\�RG�Ō\0|�yU~)��Mnڪ��@���A\Z\�cS�q���֨\Z\�\�\\,�u�z����Xt��\�\�4�[�\'|�<�\�I��\�^��5\�M\n\�\�M���y\�V+x�V\0\�\�3(�\�YQ\�a�=\�{N�kY�bē��Qc\�Q\�·QYYN\�!\�1,m\�\�\�+��\�eeE���d\�nd\"\�g�U�\�GNJ\�H\'5��־\�.�XL\�˞|D|\�{��Q��\�К\�\�\�\�\�\�Q\�\�\�k3\�\�\�RbrMeerϦ}�=\�Z�j28��=k++1$	\�9,MhzW��0�3֥A\�ee:3=\"�\�YYX@\�C����B�\�');
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
