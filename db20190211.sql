-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tasks
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'MariaWL','Testando como isso aqui vai se comportar nessa parada muito louca'),(2,'Angreh','Ut et faucibus nuanc. Sed leo nisl, mollis at felis ac, gravida fermentum lectus. Bão neah?<br><br>Cras fauasdasdas das das dacibus porttitor fermentum. Sed nec libero purus. Nam et condimentum justo. Curabitur bibendum a elit in porttitor. Vestibulum malesuada commodo tristique. Maecenas rutrum neque eu vealit dictum condimentum. Nulla <br><br>auehUhae asdw as<br><br>weeeeee teste ha<br><br>Bacana isso neah'),(6,'Regina','Essa é uma história toda diferente doihiuwher  que pode acontecer quando a parada fica muito louca. Não sei o que se passa aqui.'),(8,'Sisardo','Não faço a menor idéia do que anda acontecendo, mas ... auhsd uahd uad uah sduah s duha sudh ahd ausd uhasd haishd aisd iausd iahsd iauh sdiduha sidhu aishd iashd iasd iahsd iauhsd iahusd iuas idha iud hais dhd iaud '),(10,'Ponci','Só testando coisas nova para estudo e tals'),(30,'Element','滚动条在使用上需要注意的地方比较多，之后也可能面临着用法的改变，所以不建议用户使用。如果一定要使用，可以参考官网的代码。'),(31,'Maria','Carla?');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `fk_project_1_idx` (`client`),
  CONSTRAINT `fk_project_1` FOREIGN KEY (`client`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (2,2,'Projeto 01','Projeto 01, deveria ser 0001<br><br>ok?'),(3,2,'Projeto 02',NULL),(6,2,'Projeto cheio de tasks','Entendi como funciona isso aew<br><br>só  tenstando os retornos de linhas<br><br>ass<br>as<br>weeee'),(8,8,'Adoção',NULL),(9,8,'We Love Festivals',NULL),(11,10,'Tentando Projetos',NULL),(12,10,'Testando',NULL),(13,1,'Regina Matuck',NULL),(23,30,'Projeto 001',NULL),(24,30,'Projeto 02',NULL),(25,6,'opa',NULL),(29,6,'Aloha',NULL),(30,31,'Projeto',NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_comment`
--

DROP TABLE IF EXISTS `project_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `project` int(10) unsigned NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_comment`
--

LOCK TABLES `project_comment` WRITE;
/*!40000 ALTER TABLE `project_comment` DISABLE KEYS */;
INSERT INTO `project_comment` VALUES (1,1,6,'Weee que legal'),(2,1,6,'opa'),(3,0,6,'Comentando aqui'),(4,0,6,'asodijaosidjoa as dasd asda'),(5,0,2,'Comnetar aqui'),(6,0,2,'Comentário'),(7,0,3,'Altos comentários nas'),(8,0,3,'Que bacana isso'),(9,0,6,'Comentei'),(10,0,6,'Faço a menor idéia'),(11,0,6,'Testando essa paradinha'),(12,0,2,'Novo comentário'),(13,0,2,'Testando novas features'),(14,0,24,'Qualquer comentário ..'),(15,0,24,'Testando as paradas.'),(16,0,23,'weeee'),(17,0,23,'Só testando essa paradinha'),(18,0,9,'Creio que não vai ter nada aqui.');
/*!40000 ALTER TABLE `project_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_user_client`
--

DROP TABLE IF EXISTS `rel_user_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_user_client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `client` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rel_user_client_1_idx` (`user`),
  KEY `fk_rel_user_client_2_idx` (`client`),
  CONSTRAINT `fk_rel_user_client_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rel_user_client_2` FOREIGN KEY (`client`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_user_client`
--

LOCK TABLES `rel_user_client` WRITE;
/*!40000 ALTER TABLE `rel_user_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_user_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_user_project`
--

DROP TABLE IF EXISTS `rel_user_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_user_project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `project` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rel_user_project_1_idx` (`user`),
  KEY `fk_rel_user_project_2_idx` (`project`),
  CONSTRAINT `fk_rel_user_project_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rel_user_project_2` FOREIGN KEY (`project`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_user_project`
--

LOCK TABLES `rel_user_project` WRITE;
/*!40000 ALTER TABLE `rel_user_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_user_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_user_task`
--

DROP TABLE IF EXISTS `rel_user_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_user_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `task` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rel_user_task_1_idx` (`user`),
  KEY `fk_rel_user_task_3_idx` (`task`),
  CONSTRAINT `fk_rel_user_task_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rel_user_task_3` FOREIGN KEY (`task`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_user_task`
--

LOCK TABLES `rel_user_task` WRITE;
/*!40000 ALTER TABLE `rel_user_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_user_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_status_1_idx` (`project`),
  CONSTRAINT `fk_status_1` FOREIGN KEY (`project`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,6,'open');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_task`
--

DROP TABLE IF EXISTS `sub_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sub_task_1_idx` (`task`),
  CONSTRAINT `fk_sub_task_1` FOREIGN KEY (`task`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_task`
--

LOCK TABLES `sub_task` WRITE;
/*!40000 ALTER TABLE `sub_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_1_idx` (`project`),
  KEY `fk_task_2_idx` (`status`),
  CONSTRAINT `fk_task_1` FOREIGN KEY (`project`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_2` FOREIGN KEY (`status`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (2,6,'Task 01',1,NULL),(3,6,'Task 02',1,NULL),(4,6,'Task 03',1,NULL),(5,6,'Task 04',1,NULL),(6,6,'Task 05',1,NULL),(8,6,'Task 07',1,NULL),(9,6,'Task 08',1,NULL),(10,6,'Task 09',1,NULL),(11,6,'Task 10',1,NULL),(16,9,'Cancelar Projeto',1,NULL),(17,8,'Levantar requisitos',1,NULL),(19,6,'Olha que essa é a task mais legal',1,NULL),(20,12,'Uma task nova',1,NULL),(21,12,'Talvez uma segunda task',1,NULL),(22,6,'Nova task',1,NULL),(24,13,'Testar task manager',1,NULL),(33,11,'Uma nova tarefa',1,NULL),(49,23,'Task 01',1,NULL),(50,23,'Tarefa  02',1,NULL),(54,23,'Task 03',1,NULL),(55,24,'Tarefa 08',1,NULL),(57,3,'yyayy',1,NULL),(59,25,'weeee',1,NULL),(60,2,'Terminar essa bragaça',1,NULL),(65,29,'Tarfe 01',1,NULL),(66,29,'Tarefa 02',1,NULL),(67,30,'Task',1,NULL);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_comment`
--

DROP TABLE IF EXISTS `task_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `comment` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_comment_1_idx` (`task`),
  CONSTRAINT `fk_task_comment_1` FOREIGN KEY (`task`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_comment`
--

LOCK TABLES `task_comment` WRITE;
/*!40000 ALTER TABLE `task_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_log`
--

DROP TABLE IF EXISTS `task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task` int(10) unsigned NOT NULL,
  `action` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_log_3_idx` (`task`),
  CONSTRAINT `fk_task_log_3` FOREIGN KEY (`task`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_log`
--

LOCK TABLES `task_log` WRITE;
/*!40000 ALTER TABLE `task_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo`
--

DROP TABLE IF EXISTS `todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_todo_1_idx` (`user`),
  CONSTRAINT `fk_todo_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo`
--

LOCK TABLES `todo` WRITE;
/*!40000 ALTER TABLE `todo` DISABLE KEYS */;
/*!40000 ALTER TABLE `todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_1_idx` (`category`),
  CONSTRAINT `fk_user_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tasks'
--

--
-- Dumping routines for database 'tasks'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-11  8:50:32
