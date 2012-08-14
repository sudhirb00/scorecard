-- MySQL dump 10.13  Distrib 5.5.25a, for osx10.7 (i386)
--
-- Host: localhost    Database: timescity_live_test
-- ------------------------------------------------------
-- Server version	5.5.25a

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
-- Table structure for table `author_content_report`
--

DROP TABLE IF EXISTS `author_content_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_content_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `content_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `content_id` int(11) NOT NULL,
  `action` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_content_report`
--

LOCK TABLES `author_content_report` WRITE;
/*!40000 ALTER TABLE `author_content_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_content_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citymaster`
--

DROP TABLE IF EXISTS `citymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citymaster` (
  `iCityId` int(11) NOT NULL AUTO_INCREMENT,
  `cCityName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iCityParentId` int(11) NOT NULL,
  `iStateId` int(11) NOT NULL,
  `dInsertDatetime` datetime NOT NULL,
  `iStatus` int(11) NOT NULL,
  PRIMARY KEY (`iCityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citymaster`
--

LOCK TABLES `citymaster` WRITE;
/*!40000 ALTER TABLE `citymaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `citymaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_variables`
--

DROP TABLE IF EXISTS `config_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_variables` (
  `variable_name` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`variable_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_variables`
--

LOCK TABLES `config_variables` WRITE;
/*!40000 ALTER TABLE `config_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `est_hotsearch`
--

DROP TABLE IF EXISTS `est_hotsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `est_hotsearch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `est_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_which_type_id` tinyint(4) DEFAULT '0',
  `est_which_type_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewcount` bigint(20) DEFAULT '0',
  `est_found_flag` tinyint(4) DEFAULT '0',
  `insertdate` datetime DEFAULT NULL,
  `guid` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_city_id` int(11) DEFAULT NULL,
  `bylocation` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `est_hotsearch`
--

LOCK TABLES `est_hotsearch` WRITE;
/*!40000 ALTER TABLE `est_hotsearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `est_hotsearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `est_hotsearches`
--

DROP TABLE IF EXISTS `est_hotsearches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `est_hotsearches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `est_hotsearches`
--

LOCK TABLES `est_hotsearches` WRITE;
/*!40000 ALTER TABLE `est_hotsearches` DISABLE KEYS */;
/*!40000 ALTER TABLE `est_hotsearches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estpriority`
--

DROP TABLE IF EXISTS `estpriority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estpriority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `est_id` bigint(20) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estpriority`
--

LOCK TABLES `estpriority` WRITE;
/*!40000 ALTER TABLE `estpriority` DISABLE KEYS */;
/*!40000 ALTER TABLE `estpriority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estviewcount`
--

DROP TABLE IF EXISTS `estviewcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estviewcount` (
  `vCntId` int(11) NOT NULL AUTO_INCREMENT,
  `vCntEstId` bigint(20) NOT NULL,
  `vCntBrowser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vCount` bigint(20) NOT NULL DEFAULT '0',
  `vCntInsDay` date NOT NULL,
  PRIMARY KEY (`vCntId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estviewcount`
--

LOCK TABLES `estviewcount` WRITE;
/*!40000 ALTER TABLE `estviewcount` DISABLE KEYS */;
/*!40000 ALTER TABLE `estviewcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grids`
--

DROP TABLE IF EXISTS `grids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grids_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `landmark` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grids`
--

LOCK TABLES `grids` WRITE;
/*!40000 ALTER TABLE `grids` DISABLE KEYS */;
/*!40000 ALTER TABLE `grids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_to_city_mapping`
--

DROP TABLE IF EXISTS `ip_to_city_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_to_city_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locID` int(11) NOT NULL,
  `country` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `regionId` int(11) NOT NULL,
  `city_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `postalCode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `metrocode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `areacode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_to_city_mapping`
--

LOCK TABLES `ip_to_city_mapping` WRITE;
/*!40000 ALTER TABLE `ip_to_city_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_to_city_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_to_location_mapping`
--

DROP TABLE IF EXISTS `ip_to_location_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_to_location_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startIpNum` bigint(20) NOT NULL,
  `endIpNum` bigint(20) NOT NULL,
  `locID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_to_location_mapping`
--

LOCK TABLES `ip_to_location_mapping` WRITE;
/*!40000 ALTER TABLE `ip_to_location_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_to_location_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languagemaster`
--

DROP TABLE IF EXISTS `languagemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languagemaster` (
  `iLaunguageID` int(11) NOT NULL AUTO_INCREMENT,
  `cLanguageName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cLanguageCode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dInsertDatetime` datetime NOT NULL,
  `iStatus` int(11) NOT NULL,
  PRIMARY KEY (`iLaunguageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languagemaster`
--

LOCK TABLES `languagemaster` WRITE;
/*!40000 ALTER TABLE `languagemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `languagemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_access`
--

DROP TABLE IF EXISTS `log_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_access` (
  `entity_id` int(11) DEFAULT NULL,
  `entity_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_access`
--

LOCK TABLES `log_access` WRITE;
/*!40000 ALTER TABLE `log_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapmyindia_poi`
--

DROP TABLE IF EXISTS `mapmyindia_poi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapmyindia_poi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `un_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `est_id` int(11) NOT NULL,
  `poi_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapmyindia_poi`
--

LOCK TABLES `mapmyindia_poi` WRITE;
/*!40000 ALTER TABLE `mapmyindia_poi` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapmyindia_poi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcp_calls`
--

DROP TABLE IF EXISTS `mcp_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcp_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cdrid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `caller` int(11) NOT NULL,
  `dnis` int(11) NOT NULL,
  `operator` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `circle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `languages` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `called_to` bigint(20) NOT NULL,
  `call_start_time` datetime NOT NULL,
  `call_patch_starttime` datetime NOT NULL,
  `connect_time` datetime NOT NULL,
  `call_end_time` datetime NOT NULL,
  `call_status` tinyint(4) NOT NULL,
  `conf_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `no_of_retry` int(11) NOT NULL,
  `callduration` int(11) NOT NULL,
  `conf_duration` int(11) NOT NULL,
  `did_duration` int(11) NOT NULL,
  `marchant_id` int(11) NOT NULL,
  `switching_handle` int(11) NOT NULL,
  `outcallfunc_returncode` int(11) NOT NULL,
  `smsalert` tinyint(4) NOT NULL,
  `emailalert` tinyint(4) NOT NULL,
  `recordfile` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `outcallfunc_isdnreason` int(11) NOT NULL,
  `rec_flag` tinyint(4) NOT NULL,
  `vmn` bigint(20) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `est_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcp_calls`
--

LOCK TABLES `mcp_calls` WRITE;
/*!40000 ALTER TABLE `mcp_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcp_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mishti_entry`
--

DROP TABLE IF EXISTS `mishti_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mishti_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mishti_outletname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `mishti_location` text COLLATE utf8_unicode_ci NOT NULL,
  `mishti_category` int(11) NOT NULL,
  `readersname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mishti_entry`
--

LOCK TABLES `mishti_entry` WRITE;
/*!40000 ALTER TABLE `mishti_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `mishti_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moviemaster`
--

DROP TABLE IF EXISTS `moviemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moviemaster` (
  `iMovieId` int(11) NOT NULL AUTO_INCREMENT,
  `cMovieName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cCast` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `cSynopsis` text COLLATE utf8_unicode_ci NOT NULL,
  `cImage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iLaunguageID` int(11) NOT NULL,
  `cParentalGuidance` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iStarRating` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dReleaseDate` datetime NOT NULL,
  `dInsertDatetime` datetime NOT NULL,
  `iStatus` int(11) NOT NULL,
  PRIMARY KEY (`iMovieId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviemaster`
--

LOCK TABLES `moviemaster` WRITE;
/*!40000 ALTER TABLE `moviemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `moviemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movietheatermap`
--

DROP TABLE IF EXISTS `movietheatermap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movietheatermap` (
  `iMtmId` int(11) NOT NULL AUTO_INCREMENT,
  `iMovieId` bigint(20) NOT NULL,
  `iTheaterId` bigint(20) NOT NULL,
  `iLaunguageID` int(11) NOT NULL,
  `iCityId` int(11) NOT NULL,
  `dStartDatetime` datetime NOT NULL,
  `dEndDatetime` datetime NOT NULL,
  `cShowTime` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `dInsertDatetime` datetime NOT NULL,
  `tc_cityid` int(11) NOT NULL DEFAULT '0',
  `iStatus` int(11) NOT NULL,
  PRIMARY KEY (`iMtmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movietheatermap`
--

LOCK TABLES `movietheatermap` WRITE;
/*!40000 ALTER TABLE `movietheatermap` DISABLE KEYS */;
/*!40000 ALTER TABLE `movietheatermap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_virtual_numbers`
--

DROP TABLE IF EXISTS `new_virtual_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_virtual_numbers` (
  `Est_ID` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `New_Virtual_No` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Old_Virtual_No` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_virtual_numbers`
--

LOCK TABLES `new_virtual_numbers` WRITE;
/*!40000 ALTER TABLE `new_virtual_numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_virtual_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pav_wow_contest`
--

DROP TABLE IF EXISTS `pav_wow_contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pav_wow_contest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vadapavjoin` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `areavadapavjoin` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewvadapavjoin` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pavbhajijoin` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `areapavbhajijoin` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewpavbhajijoin` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `contest_flag` tinyint(4) NOT NULL,
  `contest_category` int(11) NOT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `contest_for_which_city` varchar(200) COLLATE utf8_unicode_ci DEFAULT 'Mumbai',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pav_wow_contest`
--

LOCK TABLES `pav_wow_contest` WRITE;
/*!40000 ALTER TABLE `pav_wow_contest` DISABLE KEYS */;
/*!40000 ALTER TABLE `pav_wow_contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_award_vote`
--

DROP TABLE IF EXISTS `people_award_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people_award_vote` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `awd_est_id` bigint(20) NOT NULL,
  `awd_org_est_id` bigint(20) DEFAULT '0',
  `awd_est_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `awd_est_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `awd_cat_id` int(11) DEFAULT NULL,
  `awd_cat_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `awd_city_id` int(11) NOT NULL,
  `awd_user_id` bigint(20) NOT NULL,
  `awd_user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `awd_type_id` tinyint(1) NOT NULL DEFAULT '1',
  `awd_cat_est_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `awd_zone_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniquedate` datetime DEFAULT NULL,
  `insertdate` datetime DEFAULT NULL,
  `ip` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`vote_id`),
  KEY `pwv_main` (`awd_type_id`,`awd_city_id`,`awd_cat_id`,`awd_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_award_vote`
--

LOCK TABLES `people_award_vote` WRITE;
/*!40000 ALTER TABLE `people_award_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `people_award_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source`
--

LOCK TABLES `source` WRITE;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
/*!40000 ALTER TABLE `source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_admin_action_log`
--

DROP TABLE IF EXISTS `tc_admin_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_admin_action_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULENAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEADLINE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `INSERTDATE` datetime NOT NULL,
  `QUERY` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `FLAG` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_admin_action_log`
--

LOCK TABLES `tc_admin_action_log` WRITE;
/*!40000 ALTER TABLE `tc_admin_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_admin_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_advertiser_comments`
--

DROP TABLE IF EXISTS `tc_advertiser_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_advertiser_comments` (
  `adc_id` int(11) NOT NULL AUTO_INCREMENT,
  `adc_listing_id` int(11) NOT NULL,
  `adc_order_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `adc_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `adc_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `adc_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `adc_mobile` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `IP` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`adc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_advertiser_comments`
--

LOCK TABLES `tc_advertiser_comments` WRITE;
/*!40000 ALTER TABLE `tc_advertiser_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_advertiser_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_advertiser_feedback`
--

DROP TABLE IF EXISTS `tc_advertiser_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_advertiser_feedback` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_listing_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ad_listing_category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ad_desc_text` text COLLATE utf8_unicode_ci NOT NULL,
  `ad_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ad_respond_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ad_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ad_contact` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `ad_istouch` tinyint(4) NOT NULL DEFAULT '0',
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `IP` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_advertiser_feedback`
--

LOCK TABLES `tc_advertiser_feedback` WRITE;
/*!40000 ALTER TABLE `tc_advertiser_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_advertiser_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_agree`
--

DROP TABLE IF EXISTS `tc_agree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_agree` (
  `agree_id` int(11) NOT NULL AUTO_INCREMENT,
  `agree_user_id` bigint(20) NOT NULL,
  `agree_user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `agree_est_id` bigint(20) NOT NULL,
  `agree_rev_id` bigint(20) NOT NULL,
  `agree_type` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1',
  `IP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`agree_id`),
  KEY `agree_est_id` (`agree_est_id`),
  KEY `agree_rev_id` (`agree_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_agree`
--

LOCK TABLES `tc_agree` WRITE;
/*!40000 ALTER TABLE `tc_agree` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_agree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_author_master`
--

DROP TABLE IF EXISTS `tc_author_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_author_master` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `author_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `author_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `author_password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `author_rights` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `author_thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_blogger` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `author_expert` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `METATITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METAKEYWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METADESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_id` bigint(20) NOT NULL DEFAULT '0',
  `author_twitterhandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_facebookurl` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_status` tinyint(1) NOT NULL,
  `author_insertdate` datetime NOT NULL,
  `author_lastvisit` datetime NOT NULL,
  `author_cmsmodules_id` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_mobileno` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_verifier_id` int(11) NOT NULL,
  `movie_cityid` int(11) NOT NULL DEFAULT '0',
  `pwd_changed_date` date NOT NULL,
  `is_locked` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `username` (`author_username`),
  KEY `name` (`author_name`),
  KEY `status` (`author_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_author_master`
--

LOCK TABLES `tc_author_master` WRITE;
/*!40000 ALTER TABLE `tc_author_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_author_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_author_master_new`
--

DROP TABLE IF EXISTS `tc_author_master_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_author_master_new` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mobileno` varchar(100) COLLATE utf8_unicode_ci DEFAULT '0',
  `USERNAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RIGHTS` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `THUMBNAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BLOGGER` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `EXPERT` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `METATITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METAKEYWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METADESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_id` bigint(20) NOT NULL DEFAULT '0',
  `TWITTERHANDLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FACEBOOKURL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS` tinyint(1) NOT NULL,
  `INSERTDATE` datetime NOT NULL,
  `LASTVISIT` datetime NOT NULL,
  `CMSMODULES_ID` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_ID` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_FG` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`USERNAME`),
  KEY `name` (`NAME`),
  KEY `status` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_author_master_new`
--

LOCK TABLES `tc_author_master_new` WRITE;
/*!40000 ALTER TABLE `tc_author_master_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_author_master_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_awards_category`
--

DROP TABLE IF EXISTS `tc_awards_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_awards_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cat_awa_m_id` int(11) NOT NULL,
  `cat_city_id` int(11) DEFAULT '0',
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_fg` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_awards_category`
--

LOCK TABLES `tc_awards_category` WRITE;
/*!40000 ALTER TABLE `tc_awards_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_awards_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_awards_contest`
--

DROP TABLE IF EXISTS `tc_awards_contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_awards_contest` (
  `awc_id` int(11) NOT NULL AUTO_INCREMENT,
  `awc_master_id` int(11) NOT NULL,
  `awc_category_id` int(11) NOT NULL,
  `awc_city` int(11) NOT NULL,
  `awc_est_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `awc_est_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `IP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  PRIMARY KEY (`awc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_awards_contest`
--

LOCK TABLES `tc_awards_contest` WRITE;
/*!40000 ALTER TABLE `tc_awards_contest` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_awards_contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_awards_details`
--

DROP TABLE IF EXISTS `tc_awards_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_awards_details` (
  `awards_id` int(11) NOT NULL AUTO_INCREMENT,
  `award_main_cat` int(11) NOT NULL,
  `award_sub_cat` int(11) NOT NULL,
  `award_city_id` tinyint(4) NOT NULL,
  `award_est_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `award_est_address` text COLLATE utf8_unicode_ci NOT NULL,
  `award_est_url` text COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`awards_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_awards_details`
--

LOCK TABLES `tc_awards_details` WRITE;
/*!40000 ALTER TABLE `tc_awards_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_awards_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_awards_gallery`
--

DROP TABLE IF EXISTS `tc_awards_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_awards_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `image_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `image_title` tinytext COLLATE utf8_unicode_ci,
  `listorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aw_year_main` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_awards_gallery`
--

LOCK TABLES `tc_awards_gallery` WRITE;
/*!40000 ALTER TABLE `tc_awards_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_awards_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_awards_main`
--

DROP TABLE IF EXISTS `tc_awards_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_awards_main` (
  `awa_id` int(11) NOT NULL AUTO_INCREMENT,
  `awards_est_id` bigint(20) NOT NULL,
  `awards_est_whichtype` tinyint(1) DEFAULT '0',
  `awards_name_year_id` int(11) NOT NULL,
  `awards_category_id` int(11) NOT NULL,
  `awards_vote_cnt` bigint(20) DEFAULT '0',
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_awarded` smallint(6) NOT NULL DEFAULT '1',
  `cityID` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `est_zone_id` int(11) DEFAULT '0',
  `est_loc_id` int(11) DEFAULT '0',
  `ip` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`awa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_awards_main`
--

LOCK TABLES `tc_awards_main` WRITE;
/*!40000 ALTER TABLE `tc_awards_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_awards_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_awards_master`
--

DROP TABLE IF EXISTS `tc_awards_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_awards_master` (
  `mas_id` int(11) NOT NULL AUTO_INCREMENT,
  `mas_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mas_year` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mas_logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_fg` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_awards_master`
--

LOCK TABLES `tc_awards_master` WRITE;
/*!40000 ALTER TABLE `tc_awards_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_awards_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_awrads_vote`
--

DROP TABLE IF EXISTS `tc_awrads_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_awrads_vote` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_id` bigint(20) DEFAULT NULL,
  `est_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `awd_master_id` bigint(20) DEFAULT NULL,
  `awd_master_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `awd_id` bigint(20) DEFAULT NULL,
  `awd_catid` bigint(20) DEFAULT NULL,
  `awd_catname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `awd_typeflag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insertdate` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_awrads_vote`
--

LOCK TABLES `tc_awrads_vote` WRITE;
/*!40000 ALTER TABLE `tc_awrads_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_awrads_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_banner`
--

DROP TABLE IF EXISTS `tc_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_city_id` int(11) DEFAULT NULL,
  `banner_loc` tinyint(1) DEFAULT '1',
  `banner_position` tinyint(1) DEFAULT '1',
  `banner_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner_jscode` text COLLATE utf8_unicode_ci,
  `banner_targetloc` tinyint(1) DEFAULT '1',
  `banner_isalltime` tinyint(1) DEFAULT '1',
  `banner_startdate` datetime DEFAULT NULL,
  `banner_enddate` datetime DEFAULT NULL,
  `banner_insertdate` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ind_sta_city` (`status`,`banner_city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_banner`
--

LOCK TABLES `tc_banner` WRITE;
/*!40000 ALTER TABLE `tc_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_brands`
--

DROP TABLE IF EXISTS `tc_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_id` int(11) NOT NULL DEFAULT '0',
  `insertdate` datetime DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_brands`
--

LOCK TABLES `tc_brands` WRITE;
/*!40000 ALTER TABLE `tc_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_camp`
--

DROP TABLE IF EXISTS `tc_camp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_camp` (
  `slug_id` int(11) NOT NULL AUTO_INCREMENT,
  `slug_city_id` bigint(20) NOT NULL,
  `slug_zone_id` int(11) NOT NULL,
  `slug_locality_id` int(11) NOT NULL,
  `slug_est_id` bigint(20) NOT NULL,
  `slug_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug_index` tinyint(1) NOT NULL DEFAULT '0',
  `slug_rest_section` tinyint(1) NOT NULL DEFAULT '0',
  `slug_bar_section` tinyint(1) NOT NULL DEFAULT '0',
  `slug_serach` tinyint(1) NOT NULL DEFAULT '0',
  `slug_event` tinyint(1) NOT NULL DEFAULT '0',
  `slug_startdate` datetime NOT NULL,
  `slug_enddate` datetime NOT NULL,
  `slug_imgcnt` int(11) NOT NULL DEFAULT '0',
  `slug_textcnt` int(11) NOT NULL DEFAULT '0',
  `insertdate` datetime NOT NULL,
  `is_featured` tinyint(4) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_camp`
--

LOCK TABLES `tc_camp` WRITE;
/*!40000 ALTER TABLE `tc_camp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_camp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_chef`
--

DROP TABLE IF EXISTS `tc_chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_chef` (
  `chef_id` int(11) NOT NULL AUTO_INCREMENT,
  `chef_est_id` bigint(20) NOT NULL,
  `chef_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `chef_profile` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `chef_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `chef_status` tinyint(4) NOT NULL,
  `insert_date` datetime NOT NULL,
  PRIMARY KEY (`chef_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_chef`
--

LOCK TABLES `tc_chef` WRITE;
/*!40000 ALTER TABLE `tc_chef` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_city`
--

DROP TABLE IF EXISTS `tc_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `state_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_std_code` int(11) NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_fg` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) DEFAULT '0',
  PRIMARY KEY (`city_id`),
  KEY `NewIndex1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_city`
--

LOCK TABLES `tc_city` WRITE;
/*!40000 ALTER TABLE `tc_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_classified_category`
--

DROP TABLE IF EXISTS `tc_classified_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_classified_category` (
  `category` int(11) NOT NULL AUTO_INCREMENT,
  `category_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_level` int(11) NOT NULL,
  `parent_category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '-1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `insertdate` datetime NOT NULL,
  `IP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_classified_category`
--

LOCK TABLES `tc_classified_category` WRITE;
/*!40000 ALTER TABLE `tc_classified_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_classified_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_classified_category_old`
--

DROP TABLE IF EXISTS `tc_classified_category_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_classified_category_old` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cat_short_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `cat_p_id` int(11) NOT NULL,
  `insertdate` datetime NOT NULL,
  `priority` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `IP` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_classified_category_old`
--

LOCK TABLES `tc_classified_category_old` WRITE;
/*!40000 ALTER TABLE `tc_classified_category_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_classified_category_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_classified_comments`
--

DROP TABLE IF EXISTS `tc_classified_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_classified_comments` (
  `cd_id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_response_id` int(11) NOT NULL,
  `cd_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cd_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cd_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `cd_city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cd_mobile` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `IP` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_classified_comments`
--

LOCK TABLES `tc_classified_comments` WRITE;
/*!40000 ALTER TABLE `tc_classified_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_classified_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_classified_data`
--

DROP TABLE IF EXISTS `tc_classified_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_classified_data` (
  `cd_id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_category_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cd_category_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cd_top_level_category_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cd_top_level_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cd_order_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cd_item_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cd_sales_city` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cd_image_path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cd_email_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cd_mobile` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `cd_ad_text` text COLLATE utf8_unicode_ci NOT NULL,
  `cd_design_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cd_rating` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(4) NOT NULL DEFAULT '0',
  `cd_scheme_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cd_pub_start_date` date NOT NULL,
  `cd_pub_end_date` date NOT NULL,
  `cd_paid_start_date` date NOT NULL,
  `cd_paid_end_date` date NOT NULL,
  `priority` int(11) NOT NULL,
  `insertdate` datetime NOT NULL,
  `IP` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_classified_data`
--

LOCK TABLES `tc_classified_data` WRITE;
/*!40000 ALTER TABLE `tc_classified_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_classified_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_classified_data_old`
--

DROP TABLE IF EXISTS `tc_classified_data_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_classified_data_old` (
  `cd_id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_p_cat_id` int(11) NOT NULL,
  `cd_p_cat_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cd_p_cat_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cd_order_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cd_item_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cd_sales_org` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cd_image_path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cd_email_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cd_mobile` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `cd_ad_text` text COLLATE utf8_unicode_ci NOT NULL,
  `cd_design_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cd_header_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cd_header_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cd_raiting` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(4) NOT NULL DEFAULT '0',
  `cd_scheme_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cd_pub_start_date` date NOT NULL,
  `cd_pub_end_date` date NOT NULL,
  `cd_paid_start_date` date NOT NULL,
  `cd_paid_end_date` date NOT NULL,
  `insertdate` datetime NOT NULL,
  `IP` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_classified_data_old`
--

LOCK TABLES `tc_classified_data_old` WRITE;
/*!40000 ALTER TABLE `tc_classified_data_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_classified_data_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_client_estdetails`
--

DROP TABLE IF EXISTS `tc_client_estdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_client_estdetails` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_est_id` bigint(20) NOT NULL,
  `client_client_id` bigint(20) NOT NULL,
  `client_est_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_est_address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `client_est_landmark` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_est_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_est_website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_est_email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `client_est_price` int(11) NOT NULL,
  `client_description` text COLLATE utf8_unicode_ci NOT NULL,
  `client_est_cuisine` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `client_est_features` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `client_est_services` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `client_est_gps` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `client_est_music_id` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_est_music_str` text COLLATE utf8_unicode_ci,
  `client_est_is_menu` tinyint(1) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_client_estdetails`
--

LOCK TABLES `tc_client_estdetails` WRITE;
/*!40000 ALTER TABLE `tc_client_estdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_client_estdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_cmslog`
--

DROP TABLE IF EXISTS `tc_cmslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_cmslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_cmslog`
--

LOCK TABLES `tc_cmslog` WRITE;
/*!40000 ALTER TABLE `tc_cmslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_cmslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_cmsmodules`
--

DROP TABLE IF EXISTS `tc_cmsmodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_cmsmodules` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAYNAME` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_PID` tinyint(4) NOT NULL DEFAULT '0',
  `IS_FG` tinyint(1) NOT NULL DEFAULT '0',
  `priorty` int(11) NOT NULL,
  `module_for` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'timescity',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_cmsmodules`
--

LOCK TABLES `tc_cmsmodules` WRITE;
/*!40000 ALTER TABLE `tc_cmsmodules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_cmsmodules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_coming_soon_register`
--

DROP TABLE IF EXISTS `tc_coming_soon_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_coming_soon_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `ip` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_coming_soon_register`
--

LOCK TABLES `tc_coming_soon_register` WRITE;
/*!40000 ALTER TABLE `tc_coming_soon_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_coming_soon_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_comment`
--

DROP TABLE IF EXISTS `tc_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_userid` bigint(20) DEFAULT NULL,
  `comment_username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment_useremail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `editcomment` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci,
  `comment_estid` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `IP` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `content_id` (`comment_estid`),
  KEY `flag` (`flag`),
  KEY `publish` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_comment`
--

LOCK TABLES `tc_comment` WRITE;
/*!40000 ALTER TABLE `tc_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_commentfilter`
--

DROP TABLE IF EXISTS `tc_commentfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_commentfilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_commentfilter`
--

LOCK TABLES `tc_commentfilter` WRITE;
/*!40000 ALTER TABLE `tc_commentfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_commentfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_contact_us`
--

DROP TABLE IF EXISTS `tc_contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_contact_us` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT '0',
  `USER_EMAIL` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_QUERY` text COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` tinyint(1) NOT NULL DEFAULT '1',
  `contact_flag` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'contact',
  `INSERTDATE` datetime NOT NULL,
  `IP` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_contact_us`
--

LOCK TABLES `tc_contact_us` WRITE;
/*!40000 ALTER TABLE `tc_contact_us` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_country`
--

DROP TABLE IF EXISTS `tc_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `insertdate` datetime NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_country`
--

LOCK TABLES `tc_country` WRITE;
/*!40000 ALTER TABLE `tc_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_crowd_nightlife`
--

DROP TABLE IF EXISTS `tc_crowd_nightlife`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_crowd_nightlife` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crowd_type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insertdate` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_crowd_nightlife`
--

LOCK TABLES `tc_crowd_nightlife` WRITE;
/*!40000 ALTER TABLE `tc_crowd_nightlife` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_crowd_nightlife` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_deal_discount`
--

DROP TABLE IF EXISTS `tc_deal_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_deal_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id` int(11) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '1',
  `fk_flag` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'est',
  `price` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dd_desc` text COLLATE utf8_unicode_ci,
  `dd_start_date` datetime DEFAULT NULL,
  `dd_end_date` datetime DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenshot` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `non_ending` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `insertdate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `flag1` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_deal_discount`
--

LOCK TABLES `tc_deal_discount` WRITE;
/*!40000 ALTER TABLE `tc_deal_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_deal_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_deal_events`
--

DROP TABLE IF EXISTS `tc_deal_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_deal_events` (
  `dde_id` int(11) NOT NULL AUTO_INCREMENT,
  `dde_est_id` bigint(20) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `events_teaser` tinytext COLLATE utf8_unicode_ci,
  `cat_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dde_flag` tinyint(1) NOT NULL,
  `dde_userid` bigint(20) NOT NULL DEFAULT '0',
  `dde_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dde_desc` mediumtext COLLATE utf8_unicode_ci,
  `city_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_landmark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_pincode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_gps` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `toll_no` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_mobile` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_contact_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_shopurl` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_lat` float DEFAULT NULL,
  `dde_long` float DEFAULT NULL,
  `dde_discount_percentage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_start_date` datetime DEFAULT NULL,
  `dde_end_date` datetime DEFAULT NULL,
  `dde_start_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_end_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_price` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_viewcount` bigint(20) NOT NULL DEFAULT '0',
  `dde_commentcount` bigint(20) NOT NULL DEFAULT '0',
  `dde_attendeecount` bigint(20) NOT NULL DEFAULT '0',
  `insert_date` datetime NOT NULL,
  `IP` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `dde_is_recommended` tinyint(1) NOT NULL DEFAULT '0',
  `dde_is_recommended_insertdate` datetime NOT NULL,
  `dde_event_ids` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dde_priority` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `moderated_by` int(11) DEFAULT NULL,
  `moderation_status` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_videos` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_image_homepage` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_image_listing` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_image_nth` tinyint(1) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `recursion_data` mediumtext COLLATE utf8_unicode_ci,
  `is_est_venue` tinyint(1) NOT NULL DEFAULT '0',
  `oldguid` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guid` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `deleted_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `last_modified_author_id` int(11) DEFAULT NULL,
  `multiple_timings` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `health_status` tinyint(4) NOT NULL DEFAULT '0',
  `is_editable` tinyint(1) NOT NULL DEFAULT '1',
  `assigned_to` int(11) NOT NULL,
  `weekdays_checklist` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_remarks` text COLLATE utf8_unicode_ci,
  `event_type` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dde_id`),
  KEY `ind_city_sta_flg_sd_ed` (`city_id`,`status`,`dde_flag`,`dde_start_date`,`dde_end_date`),
  KEY `dde_est_id` (`dde_est_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_deal_events`
--

LOCK TABLES `tc_deal_events` WRITE;
/*!40000 ALTER TABLE `tc_deal_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_deal_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_deal_events_category_master`
--

DROP TABLE IF EXISTS `tc_deal_events_category_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_deal_events_category_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `section_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_id` int(11) NOT NULL DEFAULT '0',
  `insertdate` datetime NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_deal_events_category_master`
--

LOCK TABLES `tc_deal_events_category_master` WRITE;
/*!40000 ALTER TABLE `tc_deal_events_category_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_deal_events_category_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_deal_events_copy`
--

DROP TABLE IF EXISTS `tc_deal_events_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_deal_events_copy` (
  `dde_id` int(11) NOT NULL AUTO_INCREMENT,
  `dde_est_id` bigint(20) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `dde_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dde_flag` tinyint(1) NOT NULL,
  `dde_userid` bigint(20) NOT NULL DEFAULT '0',
  `dde_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dde_desc` mediumtext COLLATE utf8_unicode_ci,
  `city_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_landmark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_pincode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_gps` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_contact_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_shopurl` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_discount_percentage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_start_date` datetime DEFAULT NULL,
  `dde_end_date` datetime DEFAULT NULL,
  `dde_start_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_end_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_price` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_viewcount` bigint(20) NOT NULL DEFAULT '0',
  `dde_commentcount` bigint(20) NOT NULL DEFAULT '0',
  `dde_attendeecount` bigint(20) NOT NULL DEFAULT '0',
  `insert_date` datetime NOT NULL,
  `IP` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `dde_is_recommended` tinyint(1) NOT NULL DEFAULT '0',
  `dde_is_recommended_insertdate` datetime NOT NULL,
  `dde_event_ids` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dde_priority` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `recursion_data` mediumtext COLLATE utf8_unicode_ci,
  `guid` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dde_id`),
  KEY `dde_est_id` (`dde_est_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_deal_events_copy`
--

LOCK TABLES `tc_deal_events_copy` WRITE;
/*!40000 ALTER TABLE `tc_deal_events_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_deal_events_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_deal_events_tmp`
--

DROP TABLE IF EXISTS `tc_deal_events_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_deal_events_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dde_id` bigint(20) NOT NULL,
  `dde_est_id` bigint(20) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `events_teaser` tinytext COLLATE utf8_unicode_ci,
  `cat_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dde_flag` tinyint(1) NOT NULL,
  `dde_userid` bigint(20) NOT NULL DEFAULT '0',
  `dde_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dde_desc` mediumtext COLLATE utf8_unicode_ci,
  `city_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_landmark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_pincode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_gps` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `toll_no` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_mobile` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_contact_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_shopurl` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_lat` float DEFAULT NULL,
  `dde_long` float DEFAULT NULL,
  `dde_discount_percentage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_start_date` datetime DEFAULT NULL,
  `dde_end_date` datetime DEFAULT NULL,
  `dde_start_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_end_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_price` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dde_viewcount` bigint(20) NOT NULL DEFAULT '0',
  `dde_commentcount` bigint(20) NOT NULL DEFAULT '0',
  `dde_attendeecount` bigint(20) NOT NULL DEFAULT '0',
  `insert_date` datetime NOT NULL,
  `IP` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `dde_is_recommended` tinyint(1) NOT NULL DEFAULT '0',
  `dde_is_recommended_insertdate` datetime NOT NULL,
  `dde_event_ids` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dde_priority` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `moderated_by` int(11) DEFAULT NULL,
  `moderation_status` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_videos` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_image_homepage` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_image_listing` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_image_nth` tinyint(1) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `recursion_data` mediumtext COLLATE utf8_unicode_ci,
  `is_est_venue` tinyint(1) NOT NULL DEFAULT '0',
  `guid` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `last_modified_author_id` int(11) DEFAULT NULL,
  `multiple_timings` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `health_status` tinyint(4) NOT NULL DEFAULT '0',
  `is_editable` tinyint(1) NOT NULL DEFAULT '1',
  `assigned_to` int(11) NOT NULL,
  `last_remarks` text COLLATE utf8_unicode_ci,
  `weekdays_checklist` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_type` tinyint(1) NOT NULL DEFAULT '1',
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dde_est_id` (`dde_est_id`),
  KEY `dde_id` (`dde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_deal_events_tmp`
--

LOCK TABLES `tc_deal_events_tmp` WRITE;
/*!40000 ALTER TABLE `tc_deal_events_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_deal_events_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_dishes`
--

DROP TABLE IF EXISTS `tc_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_dishes` (
  `dish_id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dish_type` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dish',
  `dish_ref` tinyint(1) DEFAULT NULL,
  `dish_status` tinyint(1) NOT NULL DEFAULT '1',
  `IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_date` datetime NOT NULL,
  PRIMARY KEY (`dish_id`),
  KEY `dish_status` (`dish_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_dishes`
--

LOCK TABLES `tc_dishes` WRITE;
/*!40000 ALTER TABLE `tc_dishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_est_category`
--

DROP TABLE IF EXISTS `tc_est_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_est_category` (
  `est_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_cat_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `est_cat_parentid` int(11) NOT NULL,
  `is_fg` tinyint(1) NOT NULL DEFAULT '0',
  `is_event` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`est_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_est_category`
--

LOCK TABLES `tc_est_category` WRITE;
/*!40000 ALTER TABLE `tc_est_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_est_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_est_cuisines`
--

DROP TABLE IF EXISTS `tc_est_cuisines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_est_cuisines` (
  `cui_id` int(11) NOT NULL AUTO_INCREMENT,
  `cuisines_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cuisines_desc` text COLLATE utf8_unicode_ci,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_fg` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cui_id`),
  KEY `NewIndex1` (`cui_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_est_cuisines`
--

LOCK TABLES `tc_est_cuisines` WRITE;
/*!40000 ALTER TABLE `tc_est_cuisines` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_est_cuisines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_est_event_deamapping`
--

DROP TABLE IF EXISTS `tc_est_event_deamapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_est_event_deamapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type` tinyint(1) DEFAULT '0',
  `city_id` tinyint(4) NOT NULL,
  `content_id` int(11) DEFAULT '0',
  `content_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `deal_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_est_event_deamapping`
--

LOCK TABLES `tc_est_event_deamapping` WRITE;
/*!40000 ALTER TABLE `tc_est_event_deamapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_est_event_deamapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_est_features`
--

DROP TABLE IF EXISTS `tc_est_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_est_features` (
  `feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `est_venue_flag` tinyint(4) DEFAULT '0',
  `feature_thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`feature_id`),
  KEY `NewIndex1` (`feature_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_est_features`
--

LOCK TABLES `tc_est_features` WRITE;
/*!40000 ALTER TABLE `tc_est_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_est_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_est_groups`
--

DROP TABLE IF EXISTS `tc_est_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_est_groups` (
  `est_grp_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_grp_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `est_grp_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `est_grp_category` int(11) DEFAULT NULL,
  `logo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`est_grp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_est_groups`
--

LOCK TABLES `tc_est_groups` WRITE;
/*!40000 ALTER TABLE `tc_est_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_est_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_est_media`
--

DROP TABLE IF EXISTS `tc_est_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_est_media` (
  `est_media_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_media_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `est_media_caption` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_id` int(11) NOT NULL DEFAULT '0',
  `est_flag` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_priority` int(11) DEFAULT '0',
  `est_by` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'editor',
  `est_media_userid` bigint(20) DEFAULT NULL,
  `est_media_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`est_media_id`),
  KEY `NewIndex1` (`est_id`,`est_flag`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_est_media`
--

LOCK TABLES `tc_est_media` WRITE;
/*!40000 ALTER TABLE `tc_est_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_est_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_est_payments`
--

DROP TABLE IF EXISTS `tc_est_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_est_payments` (
  `est_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_payment_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`est_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_est_payments`
--

LOCK TABLES `tc_est_payments` WRITE;
/*!40000 ALTER TABLE `tc_est_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_est_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_est_types`
--

DROP TABLE IF EXISTS `tc_est_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_est_types` (
  `est_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_type_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`est_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_est_types`
--

LOCK TABLES `tc_est_types` WRITE;
/*!40000 ALTER TABLE `tc_est_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_est_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_est_usp`
--

DROP TABLE IF EXISTS `tc_est_usp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_est_usp` (
  `est_usp_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_usp_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`est_usp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_est_usp`
--

LOCK TABLES `tc_est_usp` WRITE;
/*!40000 ALTER TABLE `tc_est_usp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_est_usp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_est_video`
--

DROP TABLE IF EXISTS `tc_est_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_est_video` (
  `est_video_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_video_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `est_video_code` text COLLATE utf8_unicode_ci,
  `est_id` int(11) NOT NULL DEFAULT '0',
  `est_video_source` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_video_url` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_video_views` int(11) DEFAULT '0',
  `est_by` tinyint(1) NOT NULL DEFAULT '1',
  `est_priority` int(11) DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `insertdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `assigned_to` int(11) NOT NULL,
  PRIMARY KEY (`est_video_id`),
  KEY `ind_est_flag_sta` (`est_id`,`flag`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_est_video`
--

LOCK TABLES `tc_est_video` WRITE;
/*!40000 ALTER TABLE `tc_est_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_est_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tc_establishments`
--

DROP TABLE IF EXISTS `tc_establishments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tc_establishments` (
  `est_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `est_description` tinytext COLLATE utf8_unicode_ci,
  `est_desc` mediumtext COLLATE utf8_unicode_ci,
  `est_informal_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_name_why` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `est_prev_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_est_grp_id` int(11) NOT NULL,
  `est_add1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `est_add2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_landmark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_loc_id` bigint(20) NOT NULL,
  `est_loc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_city_id` int(11) NOT NULL,
  `est_city_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_zone_id` int(11) NOT NULL,
  `est_zone_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `est_pin_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `est_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_phone_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_gps_cood` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_nr_bus_stop` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_nr_train_station` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_owner_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_owner_review` mediumtext COLLATE utf8_unicode_ci,
  `est_manager_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_hotel_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_timings` mediumtext COLLATE utf8_unicode_ci,
  `est_break` tinyint(1) DEFAULT '0',
  `est_breakdays` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_lunch` tinyint(1) DEFAULT '0',
  `est_lunchdays` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_eve` tinyint(1) DEFAULT '0',
  `est_dinner` tinyint(1) DEFAULT '0',
  `est_dinnerdays` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_two_price` int(11) DEFAULT '0',
  `est_feature_date` datetime DEFAULT NULL,
  `est_launch_date` datetime DEFAULT NULL,
  `est_capacity` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_types` mediumtext COLLATE utf8_unicode_ci,
  `est_types_id` mediumtext COLLATE utf8_unicode_ci,
  `est_services_id` mediumtext COLLATE utf8_unicode_ci,
  `est_features_id` mediumtext COLLATE utf8_unicode_ci,
  `est_payment_id` mediumtext COLLATE utf8_unicode_ci,
  `est_usp_id` mediumtext COLLATE utf8_unicode_ci,
  `est_cuisines` mediumtext COLLATE utf8_unicode_ci,
  `est_services` mediumtext COLLATE utf8_unicode_ci,
  `est_features` mediumtext COLLATE utf8_unicode_ci,
  `est_pay_options` mediumtext COLLATE utf8_unicode_ci,
  `est_cover_charge` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_entry_fee` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_ladies_fee` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_happy_hours` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_tips` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_specialities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_famous_for` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_usp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_editor_review` text COLLATE utf8_unicode_ci,
  `est_crowd_ids` mediumtext COLLATE utf8_unicode_ci,
  `est_music_ids` mediumtext COLLATE utf8_unicode_ci,
  `est_which_type` tinytext COLLATE utf8_unicode_ci,
  `est_which_type_id` tinyint(1) DEFAULT '0',
  `est_music_str` text COLLATE utf8_unicode_ci,
  `est_crowd_str` text COLLATE utf8_unicode_ci,
  `est_is_featured` tinyint(1) DEFAULT '0',
  `est_food_rating` float DEFAULT '0',
  `est_service_rating` float DEFAULT '0',
  `est_decor_rating` float DEFAULT '0',
  `est_buzz_rating` float DEFAULT NULL,
  `est_src_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_src_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_tags` mediumtext COLLATE utf8_unicode_ci,
  `oldguid` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_guid` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `est_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `est_package` tinyint(1) NOT NULL DEFAULT '0',
  `est_review_cnt` bigint(20) NOT NULL DEFAULT '0',
  `est_viewcount` bigint(20) NOT NULL DEFAULT '0',
  `est_event_viewcount` bigint(20) NOT NULL DEFAULT '0',
  `est_rate_cnt` bigint(20) DEFAULT '0',
  `est_cat_id` int(11) DEFAULT NULL,
  `est_client_id` bigint(20) NOT NULL DEFAULT '0',
  `created_by` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `moderated_by` int(11) NOT NULL DEFAULT '0',
  `deleted_by` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `moderation_status` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_fg` tinyint(1) NOT NULL DEFAULT '0',
  `metatitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `metakeyword` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `metadescription` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `est_embed_code` text COLLATE utf8_unicode_ci,
  `is_new_awards` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_videos` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_images` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_menu` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_deal` tinyint(1) NOT NULL DEFAULT '0',
  `tc_est_health_status` tinyint(4) NOT NULL DEFAULT '0',
  `is_editable` tinyint(1) NOT NULL DEFAULT '1',
  `assigned_to` int(11) NOT NULL,
  `est_facebook_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_avg_rate` float NOT NULL,
  `tc_whats_new` int(11) DEFAULT '0',
  `tmp_est_landline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tmp_est_mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_toll_free` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_byline` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`est_id`),
  KEY `ind_city_sta` (`est_city_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tc_establishments`
--

LOCK TABLES `tc_establishments` WRITE;
/*!40000 ALTER TABLE `tc_establishments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tc_establishments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-12 18:40:00
