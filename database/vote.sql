-- MySQL dump 10.13  Distrib 5.6.17, for debian6.0 (x86_64)
--
-- Host: localhost    Database: vote
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `users`
--
CREATE DATABASE IF NOT EXISTS `vote`;
use vote;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `realname` varchar(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voteinfo`
--

DROP TABLE IF EXISTS `voteinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voteinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `usertype` int(11) NOT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `votetime` varchar(20) NOT NULL,
  `votemark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemid_idx` (`itemid`),
  CONSTRAINT `itemid` FOREIGN KEY (`itemid`) REFERENCES `voteitem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voteinfo`
--

LOCK TABLES `voteinfo` WRITE;
/*!40000 ALTER TABLE `voteinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `voteinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voteitem`
--

DROP TABLE IF EXISTS `voteitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voteitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `themeid` int(11) NOT NULL,
  `content` varchar(100) NOT NULL,
  `voternum` int(11) DEFAULT '0',
  `votennum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `themeid_idx` (`themeid`),
  CONSTRAINT `themeid` FOREIGN KEY (`themeid`) REFERENCES `votetheme` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voteitem`
--

LOCK TABLES `voteitem` WRITE;
/*!40000 ALTER TABLE `voteitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `voteitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votetheme`
--

DROP TABLE IF EXISTS `votetheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votetheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `votenum` int(11) DEFAULT NULL,
  `votemin` int(11) DEFAULT NULL,
  `votemax` int(11) DEFAULT NULL,
  `createtime` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votetheme`
--

LOCK TABLES `votetheme` WRITE;
/*!40000 ALTER TABLE `votetheme` DISABLE KEYS */;
/*!40000 ALTER TABLE `votetheme` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-10 15:16:56
