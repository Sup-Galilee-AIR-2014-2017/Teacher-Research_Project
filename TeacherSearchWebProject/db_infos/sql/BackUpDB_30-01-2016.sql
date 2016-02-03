-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: projetiweb
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

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
-- Table structure for table `laboratory`
--

DROP TABLE IF EXISTS `laboratory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratory` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `descripition` varchar(500) DEFAULT NULL,
  `university_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`university_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_laboratory_university1_idx` (`university_id`),
  CONSTRAINT `fk_laboratory_university1` FOREIGN KEY (`university_id`) REFERENCES `university` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory`
--

LOCK TABLES `laboratory` WRITE;
/*!40000 ALTER TABLE `laboratory` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projet`
--

DROP TABLE IF EXISTS `projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projet` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `url` varchar(45) DEFAULT NULL,
  `date_publicaton` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projet`
--

LOCK TABLES `projet` WRITE;
/*!40000 ALTER TABLE `projet` DISABLE KEYS */;
/*!40000 ALTER TABLE `projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(45) DEFAULT NULL,
  `date_publication` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

LOCK TABLES `publication` WRITE;
/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(500) NOT NULL,
  `laboratory_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`laboratory_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_team_laboratory1_idx` (`laboratory_id`),
  CONSTRAINT `fk_team_laboratory1` FOREIGN KEY (`laboratory_id`) REFERENCES `laboratory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `university` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL,
  `first_name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `last_name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `age` int(11) DEFAULT NULL,
  `url_site` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `telephone` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `bureau` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `profession` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (100,'Leila','ABIDI',0,'http://www-lipn.univ-paris13.fr/~abidi/','36 60','abidi@lipn.univ-paris13.fr','B 311','Ingénieur de recherche'),(101,'Jean','ASTRUC',0,'http://www-l2ti.univ-paris13.fr/~astruc/','40 60','pierre.astruc@univ-paris13.fr','E 211','Professeur'),(200,'Laurent','ALFANDARI',0,'http://www-lipn.univ-paris13.fr/~alfandari/','40 73','alfandari@lipn.univ-paris13.fr','A 103','Professeur'),(201,'Azeddine','BEGHDADI',0,'http://www-l2ti.univ-paris13.fr/~beghdadi/','40 57','beghdadi@univ-paris13.fr','E 213','Professeur, Directeur, Responsable d\'équipe'),(300,'Pegah','ALIZADEH',0,'http://www-lipn.univ-paris13.fr/~alizadeh/','35 78','alizadeh@lipn.univ-paris13.fr','B 305','Doctorant'),(301,'Daniel','BERNARDES',0,'http://www-l2ti.univ-paris13.fr/~bernardes/','28 24','daniel.bernardes@univ-paris13.fr','E 206','Post Doctorant'),(400,'Erick','ALPHONSE',0,'http://www-lipn.univ-paris13.fr/~alphonse/','','alphonse@lipn.univ-paris13.fr','','Maître de conférences'),(401,'CESPEDES','CONDE',0,'http://www-l2ti.univ-paris13.fr/~conde/','28 24','pattycondec@yahoo.fr','E 206','Post Doctorant'),(500,'Etienne','ANDRE',0,'http://www-lipn.univ-paris13.fr/~andre/','28 61','andre@lipn.univ-paris13.fr','A 204','Maître de conférences'),(501,'BORHEN','DAKKAR',0,'http://www-l2ti.univ-paris13.fr/~dakkar/','28 23','dakkarborheneddine@gmail.com','E 214','Doctorant'),(600,'Laurent','AUDIBERT',0,'http://www-lipn.univ-paris13.fr/~audibert/','36 12','audibert@lipn.univ-paris13.fr','B 304','Maître de conférences'),(601,'Gabriel','DAUPHIN',0,'http://www-l2ti.univ-paris13.fr/~dauphin/','28 29','gabriel.dauphin@univ-paris13.fr','E 216','Maître de conférences'),(700,'Hanene','AZZAG',0,'http://www-lipn.univ-paris13.fr/~azzag/','38 94','azzag@lipn.univ-paris13.fr','B 301','Maître de conférences'),(701,'WILKO','GUILLY',0,'http://www-l2ti.univ-paris13.fr/~guilly/','28 23','guilly@l2ti.univ-paris13.fr','E 214','Doctorant'),(800,'Axel','BACHER',0,'http://www-lipn.univ-paris13.fr/~bacher/','40 71','bacher@lipn.univ-paris13.fr','A 209','Post Doctorant'),(801,'Mounir','KAANICHE',0,'http://www-l2ti.univ-paris13.fr/~kaaniche/','40 61','mounir.kaaniche@univ-paris13.fr','E 210','Maître de conférences'),(900,'Cyril','BANDERIER',0,'http://www-lipn.univ-paris13.fr/~banderier/','40 69','cb@lipn.univ-paris13.fr','A 106','Chercheur CNRS'),(901,'Aysha','KADAIKAR',0,'http://www-l2ti.univ-paris13.fr/~kadaikar/','44 55','kadaikar@univ-paris13.fr','E 221','Doctorant'),(1000,'Ines','BANNOUR',0,'http://www-lipn.univ-paris13.fr/~bannour/','40 81','ines@lipn.univ-paris13.fr','B 214','Doctorant'),(1001,'IVAN','KELLER',0,'http://www-l2ti.univ-paris13.fr/~keller/','28 24','ivan.keller@univ-paris13.fr','E 206','Ingénieur de recherche'),(1100,'Sondes','BANNOUR',0,'http://www-lipn.univ-paris13.fr/~bannour/','40 82','bannour@lipn.univ-paris13.fr','','Membre associé'),(1101,'Marie','LUONG',0,'http://www-l2ti.univ-paris13.fr/~luong/','40 64','marie.luong@univ-paris13.fr','E 220','Maître de conférences'),(1200,'Michele','BARBATO',0,'http://www-lipn.univ-paris13.fr/~barbato/','36 60','barbato@lipn.univ-paris13.fr','B 311','Doctorant'),(1201,'Anissa','MOKRAOUI',0,'http://www-l2ti.univ-paris13.fr/~mokraoui/','40 60','anissa.mokraoui@univ-paris13.fr','E 211','Professeur'),(1300,'Frédérique','BASSINO',0,'http://www-lipn.univ-paris13.fr/~bassino/','40 84','bassino@lipn.univ-paris13.fr','A 104','Professeur, Responsable d\'équipe'),(1301,'Laurent','OUDRE',0,'http://www-l2ti.univ-paris13.fr/~oudre/','40 61','laurent.oudre@univ-paris13.fr','E 210','Maître de conférences'),(1400,'Aimé','BAYONGA',0,'http://www-lipn.univ-paris13.fr/~bayonga/','28 41','bayonga@lipn.univ-paris13.fr','B 314','Personnel administratif'),(1401,'Bilel','SDIRI',0,'http://www-l2ti.univ-paris13.fr/~sdiri/','28 30','bilel.sdiri@univ-paris13.fr','E 208','Doctorant'),(1500,'Gaël','BECK',0,'http://www-lipn.univ-paris13.fr/~beck/','','beck@lipn.univ-paris13.fr','',''),(1501,'Wided','SOUIDENE',0,'http://www-l2ti.univ-paris13.fr/~souidene/','40 58','wided.souidene@univ-paris13.fr','E 203','Maître de conférences'),(1600,'SALEM','BEN',0,'http://www-lipn.univ-paris13.fr/~ben/','','bensalem@lipn.univ-paris13.fr','','Membre associé'),(1601,'Ba','THAI',0,'http://www-l2ti.univ-paris13.fr/~thai/','44 55','thaibachien@gmail.com','E 221','Doctorant'),(1700,'Mohamed','BENMOUSSA',0,'http://www-lipn.univ-paris13.fr/~benmoussa/','','benmoussa@lipn.univ-paris13.fr','A 205','Doctorant'),(1701,'DAI','TRAN',0,'http://www-l2ti.univ-paris13.fr/~tran/','40 64','dvietvp07@yahoo.com','E 220','Doctorant'),(1800,'Younès','BENNANI',0,'http://www-lipn.univ-paris13.fr/~bennani/','36 07','younes@lipn.univ-paris13.fr','B 209','Professeur'),(1801,'Emmanuel','VIENNET',0,'http://www-l2ti.univ-paris13.fr/~viennet/','20 30','emmanuel.viennet@univ-paris13.fr','E 209','Professeur'),(1900,'Olivier','BODINI',0,'http://www-lipn.univ-paris13.fr/~bodini/','36 86','bodini@lipn.univ-paris13.fr','A 111','Professeur'),(1901,'','Nom',0,'http://www-l2ti.univ-paris13.fr/~nom/','Téléphone','','Bureau','Statut'),(2000,'Valentin','BONZOM',0,'http://www-lipn.univ-paris13.fr/~bonzom/','','bonzom@lipn.univ-paris13.fr','A 111','Maître de conférences'),(2001,'Marwen','ABDENNEBI',0,'http://www-l2ti.univ-paris13.fr/~abdennebi/','28 29','marwen.abdennebi@univ-paris13.fr','E 216','Maître de conférences'),(2100,'Sylvie','BORNE',0,'http://www-lipn.univ-paris13.fr/~borne/','40 73','borne@lipn.univ-paris13.fr','A 103','Maître de conférences'),(2101,'Nadjib','ACHIR',0,'http://www-l2ti.univ-paris13.fr/~achir/','40 62','achir@l2ti.univ-paris13.fr','E 218','Maître de conférences'),(2200,'Pierre','BOUDES',0,'http://www-lipn.univ-paris13.fr/~boudes/','40 67','boudes@lipn.univ-paris13.fr','A 205','Maître de conférences'),(2201,'J.','AVOCANH',0,'http://www-l2ti.univ-paris13.fr/~avocanh/','44 55','jean.avocanh@univ-paris13.fr','E 202','Doctorant'),(2300,'Faouzi','BOUFARÈS',0,'http://www-lipn.univ-paris13.fr/~boufares/','40 71','boufares@lipn.univ-paris13.fr','A 109','Maître de conférences'),(2301,'Mustapha','BEKHTI',0,'http://www-l2ti.univ-paris13.fr/~bekhti/','28 30','bekhti@l2ti.univ-paris13.fr','E 208','Doctorant'),(2400,'Dominique','BOUTHINON',0,'http://www-lipn.univ-paris13.fr/~bouthinon/','36 17','db@lipn.univ-paris13.fr','B 303','Maître de conférences'),(2401,'FAYSSAL','BENDAOUD',0,'http://www-l2ti.univ-paris13.fr/~bendaoud/','44 55','faysal.bendaoud@gmail.com','E 202','Doctorant'),(2500,'Van','BUI',0,'http://www-lipn.univ-paris13.fr/~bui/','','bui@lipn.univ-paris13.fr','B 207','Doctorant'),(2501,'Saadi','BOUDJIT',0,'http://www-l2ti.univ-paris13.fr/~boudjit/','28 29','boudjit@univ-paris13.fr','E 216','Maître de conférences'),(2600,'Davide','BUSCALDI',0,'http://www-lipn.univ-paris13.fr/~buscaldi/','28 31','buscaldi@lipn.univ-paris13.fr','B 211','Maître de conférences'),(2601,'Khaled','BOUSSETTA',0,'http://www-l2ti.univ-paris13.fr/~boussetta/','40 62','khaled.boussetta@univ-paris13.fr','E 218','Maître de conférences'),(2700,'Franck','BUTELLE',0,'http://www-lipn.univ-paris13.fr/~butelle/','35 73','butelle@lipn.univ-paris13.fr','A 112','Maître de conférences'),(2701,'Ken','CHEN',0,'http://www-l2ti.univ-paris13.fr/~chen/','32 19','ken.chen@univ-paris13.fr','E 219','Professeur, Responsable d\'équipe'),(2800,'Guénaël','CABANES',0,'http://www-lipn.univ-paris13.fr/~cabanes/','28 47','cabanes@lipn.univ-paris13.fr','B 213','Maître de conférences'),(2801,'Gladys','DIAZ',0,'http://www-l2ti.univ-paris13.fr/~diaz/','40 62','gladys.diaz@univ-paris13.fr','E 218','Maître de conférences'),(2900,'Emmanuel','CARTIER',0,'http://www-lipn.univ-paris13.fr/~cartier/','28 32','cartier@lipn.univ-paris13.fr','B 207','Maître de conférences'),(2901,'CHERIF','HAMZA',0,'http://www-l2ti.univ-paris13.fr/~hamza/','44 55','Hc.arslan90@gmail.com','E 221','Doctorant'),(3000,'Marco','CASAZZA',0,'http://www-lipn.univ-paris13.fr/~casazza/','','casazza@lipn.univ-paris13.fr','','Doctorant'),(3001,'Mohamed','KAFI',0,'http://www-l2ti.univ-paris13.fr/~kafi/','44 55','kafiamine@gmail.com','E 202','Doctorant'),(3100,'Hatim','CHAHDI',0,'http://www-lipn.univ-paris13.fr/~chahdi/','','chahdi@lipn.univ-paris13.fr','','Membre associé'),(3101,'ShuoPeng','LI',0,'http://www-l2ti.univ-paris13.fr/~li/','28 30','li.shuopeng@univ-paris13.fr','E 208','Doctorant'),(3200,'Amal','CHAMAKH',0,'http://www-lipn.univ-paris13.fr/~chamakh/','36 09','chamakh@lipn.univ-paris13.fr','B 309','Doctorant'),(3201,'Mohamed','MEJRI',0,'http://www-l2ti.univ-paris13.fr/~mejri/','44 55','mejri@univ-paris13.fr','E 202','Doctorant'),(3300,'Marc','CHAMPESME',0,'http://www-lipn.univ-paris13.fr/~champesme/','36 17','champ@lipn.univ-paris13.fr','B 303','Maître de conférences'),(3301,'Mohand','SAIDI',0,'http://www-l2ti.univ-paris13.fr/~saidi/','40 64','saidi@univ-paris13.fr','E 220','Maître de conférences'),(3400,'Thierry','CHARNOIS',0,'http://www-lipn.univ-paris13.fr/~charnois/','36 17','charnois@lipn.univ-paris13.fr','B 308','Professeur, Responsable d\'équipe'),(3500,'Ines','CHEBIL',0,'http://www-lipn.univ-paris13.fr/~chebil/','','chebil@lipn.univ-paris13.fr','','Membre associé'),(3600,'Yann','CHEVALEYRE',0,'http://www-lipn.univ-paris13.fr/~chevaleyre/','28 26','chevaleyre@lipn.univ-paris13.fr','B 307','Professeur, Responsable d\'équipe'),(3700,'Christine','CHOPPY',0,'http://www-lipn.univ-paris13.fr/~choppy/','36 62','cc@lipn.univ-paris13.fr','A 206','Professeur'),(3800,'Raphaël','COHEN',0,'http://www-lipn.univ-paris13.fr/~cohen/','36 60','cohen@lipn.univ-paris13.fr','B 311','Doctorant'),(3900,'Caio','CORRO',0,'http://www-lipn.univ-paris13.fr/~corro/','28 26','corro@lipn.univ-paris13.fr','B 307','Doctorant'),(4000,'Hervé','COSTANTINI',0,'http://www-lipn.univ-paris13.fr/~costantini/','36 84','costantini@lipn.univ-paris13.fr','A 207','Membre associé'),(4100,'Camille','COTI',0,'http://www-lipn.univ-paris13.fr/~coti/','','coti@lipn.univ-paris13.fr','B 110','Maître de conférences'),(4200,'Pascal','COUPEY',0,'http://www-lipn.univ-paris13.fr/~coupey/','28 61','pc@lipn.univ-paris13.fr','A 204','Professeur'),(4300,'Anthony','COUTANT',0,'http://www-lipn.univ-paris13.fr/~coutant/','36 09','coutant@lipn.univ-paris13.fr','B 309','Post Doctorant'),(4400,'Christophe','CÉRIN',0,'http://www-lipn.univ-paris13.fr/~cerin/','40 83','cerin@lipn.univ-paris13.fr','A 107','Professeur'),(4500,'Julien','DAVID',0,'http://www-lipn.univ-paris13.fr/~david/','32 13','david@lipn.univ-paris13.fr','A 101','Maître de conférences'),(4600,'MELO','DE',0,'http://www-lipn.univ-paris13.fr/~de/','','silva@lipn.univ-paris13.fr','B 302','Doctorant'),(4700,'MOURGUES','DE',0,'http://www-lipn.univ-paris13.fr/~de/','','demourgues@lipn.univ-paris13.fr','A 106','Doctorant'),(4800,'Nhat-Quang','DOAN',0,'http://www-lipn.univ-paris13.fr/~doan/','','doan@lipn.univ-paris13.fr','','Membre associé'),(4900,'Jean-Christophe','DUBACQ',0,'http://www-lipn.univ-paris13.fr/~dubacq/','40 83','jcdubacq@lipn.univ-paris13.fr','A 107','Maître de conférences'),(5000,'Gérard','DUCHAMP',0,'http://www-lipn.univ-paris13.fr/~duchamp/','','ghed@lipn.univ-paris13.fr','A 108','Professeur'),(5100,'Tarn','DUONG',0,'http://www-lipn.univ-paris13.fr/~duong/','36 60','duong@lipn.univ-paris13.fr','B 311','Post Doctorant'),(5200,'Sami','EVANGELISTA',0,'http://www-lipn.univ-paris13.fr/~evangelista/','','evangelista@lipn.univ-paris13.fr','B 110','Maître de conférences'),(5300,'Issam','FALIH',0,'http://www-lipn.univ-paris13.fr/~falih/','','falih@lipn.univ-paris13.fr','B 309','Doctorant'),(5400,'Thomas','FERNIQUE',0,'http://www-lipn.univ-paris13.fr/~fernique/','36 86','fernique@lipn.univ-paris13.fr','A 111','Chercheur CNRS'),(5500,'Lucian','FINTA',0,'http://www-lipn.univ-paris13.fr/~finta/','35 73','lf@lipn.univ-paris13.fr','A 112','Membre associé'),(5600,'Nazanin','FIROOZEH',0,'http://www-lipn.univ-paris13.fr/~firoozeh/','','firoozeh@lipn.univ-paris13.fr','','Doctorant'),(5700,'Marie','FONTANILLAS',0,'http://www-lipn.univ-paris13.fr/~fontanillas/','35 66','fontanillas@lipn.univ-paris13.fr','B 310','Personnel administratif'),(5800,'Michael','FORTIER',0,'http://www-lipn.univ-paris13.fr/~fortier/','35 43','fortier@lipn.univ-paris13.fr','A 308','Équipe système'),(5900,'Christophe','FOUQUERÉ',0,'http://www-lipn.univ-paris13.fr/~fouquere/','28 61','cf@lipn.univ-paris13.fr','A 204','Professeur'),(6000,'Kata','GABOR',0,'http://www-lipn.univ-paris13.fr/~gabor/','36 07','gabor@lipn.univ-paris13.fr','B 209','Post Doctorant'),(6100,'Aldo','GANGEMI',0,'http://www-lipn.univ-paris13.fr/~gangemi/','36 07','gangemi@lipn.univ-paris13.fr','B 209','Professeur'),(6200,'FLORES','GARCIA',0,'http://www-lipn.univ-paris13.fr/~garcia/','35 78','garciaflores@lipn.univ-paris13.fr','B 305','Ingénieur de recherche'),(6300,'MARQUEZ','GARRIDO',0,'http://www-lipn.univ-paris13.fr/~garrido/','','garridomarquez@lipn.univ-paris13.fr','B 103','Doctorant'),(6400,'Françoise','GAYRAL',0,'http://www-lipn.univ-paris13.fr/~gayral/','','fg@lipn.univ-paris13.fr','','Maître de conférences'),(6500,'Mohammed','GHESMOUNE',0,'http://www-lipn.univ-paris13.fr/~ghesmoune/','','ghesmoune@lipn.univ-paris13.fr','B 302','Doctorant'),(6600,'Paolo','GIANESSI',0,'http://www-lipn.univ-paris13.fr/~gianessi/','','gianessi@lipn.univ-paris13.fr','','Membre associé'),(6700,'Silvia','GOODENOUGH',0,'http://www-lipn.univ-paris13.fr/~goodenough/','','goodenough@lipn.univ-paris13.fr','A 108','Membre associé'),(6800,'Roland','GRAPPE',0,'http://www-lipn.univ-paris13.fr/~grappe/','32 13','grappe@lipn.univ-paris13.fr','A 101','Maître de conférences'),(6900,'Nicolas','GRENECHE',0,'http://www-lipn.univ-paris13.fr/~greneche/','40 35','greneche@lipn.univ-paris13.fr','A 003','Membre associé'),(7000,'Nistor','GROZAVU',0,'http://www-lipn.univ-paris13.fr/~grozavu/','28 47','nistor@lipn.univ-paris13.fr','B 213','Maître de conférences'),(7100,'Stefano','GUERRINI',0,'http://www-lipn.univ-paris13.fr/~guerrini/','28 05','guerrini@lipn.univ-paris13.fr','A 202','Professeur, Responsable d\'équipe'),(7200,'Sébastien','GUÉRIF',0,'http://www-lipn.univ-paris13.fr/~guerif/','31 16','guerif@lipn.univ-paris13.fr','B 212','Maître de conférences'),(7300,'Brigitte','GUÉVENEUX',0,'http://www-lipn.univ-paris13.fr/~gueveneux/','35 90','bg@lipn.univ-paris13.fr','A 210','Personnel administratif'),(7400,'Pierre','GÉRARD',0,'http://www-lipn.univ-paris13.fr/~gerard/','28 31','gerard@lipn.univ-paris13.fr','B 211','Maître de conférences'),(7500,'Ehab','HASSAN',0,'http://www-lipn.univ-paris13.fr/~hassan/','38 94','hassan@lipn.univ-paris13.fr','B 301','Doctorant'),(7600,'Simon','HERNANDEZ-PEREZ',0,'http://www-lipn.univ-paris13.fr/~hernandez-perez/','','hernandez-perez@lipn.univ-paris13.fr','B 103','Doctorant'),(7700,'Manel','HMIMIDA',0,'http://www-lipn.univ-paris13.fr/~hmimida/','','hmimida@lipn.univ-paris13.fr','','Membre associé'),(7800,'Pierre','HOLAT',0,'http://www-lipn.univ-paris13.fr/~holat/','28 26','holat@lipn.univ-paris13.fr','B 307','Doctorant'),(7900,'DE','JACOBÉ',0,'http://www-lipn.univ-paris13.fr/~jacobe/','44 43','denaurois@lipn.univ-paris13.fr','A 203','Chercheur CNRS'),(8000,'Rushed','KANAWATI',0,'http://www-lipn.univ-paris13.fr/~kanawati/','40 79','rk@lipn.univ-paris13.fr','B 306','Maître de conférences'),(8100,'Ladji','KANE',0,'http://www-lipn.univ-paris13.fr/~kane/','','kane@lipn.univ-paris13.fr','','Membre associé'),(8200,'Antoine','KASZCZYC',0,'http://www-lipn.univ-paris13.fr/~kaszczyc/','','kaszczyc@lipn.univ-paris13.fr','B 103','Doctorant'),(8300,'Omar','KEBLI',0,'http://www-lipn.univ-paris13.fr/~kebli/','36 92','kebli@lipn.univ-paris13.fr','B 210','Équipe système'),(8400,'Imad','KISSAMI',0,'http://www-lipn.univ-paris13.fr/~kissami/','','imad@lipn.univ-paris13.fr','B 214','Doctorant'),(8500,'Kais','KLAI',0,'http://www-lipn.univ-paris13.fr/~klai/','','klai@lipn.univ-paris13.fr','A 203','Maître de conférences'),(8600,'Thomas','KRAJEWSKI',0,'http://www-lipn.univ-paris13.fr/~krajewski/','','thomas.krajewski@cpt.univ-mrs.fr','','Membre associé'),(8700,'Mathieu','LACROIX',0,'http://www-lipn.univ-paris13.fr/~lacroix/','32 13','lacroix@lipn.univ-paris13.fr','A 101','Maître de conférences'),(8800,'Christian','LAVAULT',0,'http://www-lipn.univ-paris13.fr/~lavault/','','lavault@lipn.univ-paris13.fr','A 108','Membre associé'),(8900,'ROUX','LE',0,'http://www-lipn.univ-paris13.fr/~le/','','leroux@lipn.univ-paris13.fr','A 101','Maître de conférences'),(9000,'Mustapha','LEBBAH',0,'http://www-lipn.univ-paris13.fr/~lebbah/','38 94','lebbah@lipn.univ-paris13.fr','B 301','Maître de conférences'),(9100,'Jonathan','LEJEUNE',0,'http://www-lipn.univ-paris13.fr/~lejeune/','','jonathan.lejeune@lipn.univ-paris13.fr','A 107','Post Doctorant'),(9200,'Hugues','LEPRIEUR',0,'http://www-lipn.univ-paris13.fr/~leprieur/','44 43','leprieur@lipn.univ-paris13.fr','A 203','Ingénieur de recherche'),(9300,'Lucas','LETOCART',0,'http://www-lipn.univ-paris13.fr/~letocart/','35 95','letocart@lipn.univ-paris13.fr','A 110','Maître de conférences'),(9400,'Luca','LIONNI',0,'http://www-lipn.univ-paris13.fr/~lionni/','','lionni@lipn.univ-paris13.fr','B 103','Membre associé'),(9500,'Jean-Vincent','LODDO',0,'http://www-lipn.univ-paris13.fr/~loddo/','36 84','loddo@lipn.univ-paris13.fr','A 207','Maître de conférences'),(9600,'Hippolyte','LÉGER',0,'http://www-lipn.univ-paris13.fr/~leger/','','leger@lipn.univ-paris13.fr','B 103','Doctorant'),(9700,'François','LÉVY',0,'http://www-lipn.univ-paris13.fr/~levy/','36 17','fl@lipn.univ-paris13.fr','B 303','Professeur'),(9800,'Nelson','MACULAN',0,'http://www-lipn.univ-paris13.fr/~maculan/','','nm@lipn.univ-paris13.fr','','Membre associé'),(9900,'Giulio','MANZONETTO',0,'http://www-lipn.univ-paris13.fr/~manzonetto/','36 84','manzonetto@lipn.univ-paris13.fr','A 207','Maître de conférences'),(10000,'Basarab','MATEI',0,'http://www-lipn.univ-paris13.fr/~matei/','40 68','matei@lipn.univ-paris13.fr','B 214','Maître de conférences'),(10100,'Micaela','MAYERO',0,'http://www-lipn.univ-paris13.fr/~mayero/','36 91','mayero@lipn.univ-paris13.fr','A 209','Maître de conférences'),(10200,'Damiano','MAZZA',0,'http://www-lipn.univ-paris13.fr/~mazza/','40 67','mazza@lipn.univ-paris13.fr','A 205','Chercheur CNRS'),(10300,'Nada','MIMOUNI',0,'http://www-lipn.univ-paris13.fr/~mimouni/','','mimouni@lipn.univ-paris13.fr','','Post Doctorant'),(10400,'Virgile','MOGBIL',0,'http://www-lipn.univ-paris13.fr/~mogbil/','36 84','vm@lipn.univ-paris13.fr','A 207','Maître de conférences'),(10500,'Thierry','MONTEIL',0,'http://www-lipn.univ-paris13.fr/~monteil/','','monteil@lipn.univ-paris13.fr','A 105','Chercheur CNRS'),(10600,'Jean-Yves','MOYEN',0,'http://www-lipn.univ-paris13.fr/~moyen/','44 43','moyen@lipn.univ-paris13.fr','A 203','Maître de conférences'),(10700,'Adeline','NAZARENKO',0,'http://www-lipn.univ-paris13.fr/~nazarenko/','40 89','nazarenko@lipn.univ-paris13.fr','B 216','Professeur'),(10800,'Quoc','NGO',0,'http://www-lipn.univ-paris13.fr/~ngo/','','ngo@lipn.univ-paris13.fr','B 210','Doctorant'),(10900,'MINH','NGOC',0,'http://www-lipn.univ-paris13.fr/~ngoc/','','minh@lipn.univ-paris13.fr','A 108','Professeur'),(11000,'Yanik','NGOKO',0,'http://www-lipn.univ-paris13.fr/~ngoko/','','ngoko@lipn.univ-paris13.fr','','Membre associé'),(11100,'Thi','NGUYEN',0,'http://www-lipn.univ-paris13.fr/~nguyen/','','tnguyen@lipn.univ-paris13.fr','A 212','Doctorant'),(11200,'Hoang','NGUYEN',0,'http://www-lipn.univ-paris13.fr/~nguyen/','','hoanggia.nguyen@lipn.univ-paris13.fr','B 103','Doctorant'),(11300,'Pierre','NICODÈME',0,'http://www-lipn.univ-paris13.fr/~nicodeme/','40 69','nicodeme@lipn.univ-paris13.fr','A 106','Membre associé'),(11400,'Johan','NILSSON',0,'http://www-lipn.univ-paris13.fr/~nilsson/','44 43','nilsson@lipn.univ-paris13.fr','A 203','Post Doctorant'),(11500,'Hanène','OCHI',0,'http://www-lipn.univ-paris13.fr/~ochi/','36 09','ochi@lipn.univ-paris13.fr','B 309','Post Doctorant'),(11600,'Aomar','OSMANI',0,'http://www-lipn.univ-paris13.fr/~osmani/','','ao@lipn.univ-paris13.fr','','Maître de conférences'),(11700,'Stefania','PAN',0,'http://www-lipn.univ-paris13.fr/~pan/','','pan@lipn.univ-paris13.fr','B 103','Doctorant'),(11800,'Alice','PAVAUX',0,'http://www-lipn.univ-paris13.fr/~pavaux/','40 67','pavaux@lipn.univ-paris13.fr','A 205','Doctorant'),(11900,'Ferhan','PEKERGIN',0,'http://www-lipn.univ-paris13.fr/~pekergin/','','pekergin@lipn.univ-paris13.fr','A 105','Maître de conférences'),(12000,'Luc','PELLISSIER',0,'http://www-lipn.univ-paris13.fr/~pellissier/','40 82','pellissier@lipn.univ-paris13.fr','B 302','Doctorant'),(12100,'Laure','PETRUCCI',0,'http://www-lipn.univ-paris13.fr/~petrucci/','35 79','petrucci@lipn.univ-paris13.fr','A 208','Professeur, Directrice'),(12200,'Gérard','PLATEAU',0,'http://www-lipn.univ-paris13.fr/~plateau/','35 73','gp@lipn.univ-paris13.fr','A 112','Membre associé'),(12300,'Laurent','POINSOT',0,'http://www-lipn.univ-paris13.fr/~poinsot/','','poinsot@lipn.univ-paris13.fr','A 105','Maître de conférences'),(12400,'Andrew','POLONSKY',0,'http://www-lipn.univ-paris13.fr/~polonsky/','40 82','polonsky@lipn.univ-paris13.fr','B 302','Post Doctorant'),(12500,'Lionel','POURNIN',0,'http://www-lipn.univ-paris13.fr/~pournin/','','pournin@lipn.univ-paris13.fr','A 105','Professeur'),(12600,'Valentina','PRESUTTI',0,'http://www-lipn.univ-paris13.fr/~presutti/','','presutti@lipn.univ-paris13.fr','','Membre associé'),(12700,'Manisha','PUJARI',0,'http://www-lipn.univ-paris13.fr/~pujari/','36 09','pujari@lipn.univ-paris13.fr','','Membre associé'),(12800,'Tsinjo','RAKOTOARIMALALA',0,'http://www-lipn.univ-paris13.fr/~rakotoarimalala/','','rakotoarimalala@lipn.univ-paris13.fr','B 103','Doctorant'),(12900,'Parisa','RASTIN',0,'http://www-lipn.univ-paris13.fr/~rastin/','35 78','rastin@lipn.univ-paris13.fr','B 305','Doctorant'),(13000,'Catherine','RECANATI',0,'http://www-lipn.univ-paris13.fr/~recanati/','28 47','cathy@lipn.univ-paris13.fr','B 213','Maître de conférences'),(13100,'Ievgen','REDKO',0,'http://www-lipn.univ-paris13.fr/~redko/','36 60','redko@lipn.univ-paris13.fr','','Post Doctorant'),(13200,'Moufida','REHAB',0,'http://www-lipn.univ-paris13.fr/~rehab/','36 60','rehab@lipn.univ-paris13.fr','B 311','Doctorant'),(13300,'Mouna','RIFI',0,'http://www-lipn.univ-paris13.fr/~rifi/','36 09','rifi@lipn.univ-paris13.fr','B 309','Doctorant'),(13400,'Christophe','RODRIGUES',0,'http://www-lipn.univ-paris13.fr/~rodrigues/','36 12','rodrigues@lipn.univ-paris13.fr','B 304','Membre associé'),(13500,'Cesar','RODRIGUEZ',0,'http://www-lipn.univ-paris13.fr/~rodriguez/','28 05','rodriguez@lipn.univ-paris13.fr','A 202','Maître de conférences'),(13600,'Nicoleta','ROGOVSCHI',0,'http://www-lipn.univ-paris13.fr/~rogovschi/','','rogovschi@lipn.univ-paris13.fr','','Collaborateur'),(13700,'Nicolas','ROLIN',0,'http://www-lipn.univ-paris13.fr/~rolin/','','nicolas.rolin@lipn.univ-paris13.fr','A 106','Doctorant'),(13800,'Frédéric','ROUPIN',0,'http://www-lipn.univ-paris13.fr/~roupin/','35 95','roupin@lipn.univ-paris13.fr','A 110','Professeur'),(13900,'Céline','ROUVEIROL',0,'http://www-lipn.univ-paris13.fr/~rouveirol/','40 79','rouveirol@lipn.univ-paris13.fr','B 306','Professeur'),(14000,'Antoine','ROZENKNOP',0,'http://www-lipn.univ-paris13.fr/~rozenknop/','28 31','rozenknop@lipn.univ-paris13.fr','B 211','Maître de conférences'),(14100,'Thomas','RUBIANO',0,'http://www-lipn.univ-paris13.fr/~rubiano/','','rubiano@lipn.univ-paris13.fr','B 103','Doctorant'),(14200,'Domenico','RUOPPOLO',0,'http://www-lipn.univ-paris13.fr/~ruoppolo/','36 60','ruoppolo@lipn.univ-paris13.fr','','Doctorant'),(14300,'Sylvie','SALOTTI',0,'http://www-lipn.univ-paris13.fr/~salotti/','36 07','sylvie@lipn.univ-paris13.fr','B 209','Maître de conférences'),(14400,'Guillaume','SANTINI',0,'http://www-lipn.univ-paris13.fr/~santini/','28 26','santini@lipn.univ-paris13.fr','B 307','Maître de conférences'),(14500,'Tugdual','SARAZIN',0,'http://www-lipn.univ-paris13.fr/~sarazin/','36 09','tugdual@lipn.univ-paris13.fr','B 309','Doctorant'),(14600,'Sylviane','SCHWER',0,'http://www-lipn.univ-paris13.fr/~schwer/','36 08','schwer@lipn.univ-paris13.fr','A 212','Professeur'),(14700,'Sidi','SEDJELMACI',0,'http://www-lipn.univ-paris13.fr/~sedjelmaci/','35 95','sms@lipn.univ-paris13.fr','A 110','Membre associé'),(14800,'Olga','SEMINCK',0,'http://www-lipn.univ-paris13.fr/~seminck/','','olgaseminck@hotmail.com','','Membre associé'),(14900,'Henry','SOLDANO',0,'http://www-lipn.univ-paris13.fr/~soldano/','36 12','soldano@lipn.univ-paris13.fr','B 304','Maître de conférences'),(15000,'Marco','SOLIERI',0,'http://www-lipn.univ-paris13.fr/~solieri/','36 60','solieri2@lipn.univ-paris13.fr','','Doctorant'),(15100,'Mamadou','SOW',0,'http://www-lipn.univ-paris13.fr/~sow/','40 68','mamadou@lipn.univ-paris13.fr','A 310','Équipe système'),(15200,'Andrea','SPORTIELLO',0,'http://www-lipn.univ-paris13.fr/~sportiello/','40 84','sportiello@lipn.univ-paris13.fr','A 104','Chercheur CNRS'),(15300,'Jérémie','SUBLIME',0,'http://www-lipn.univ-paris13.fr/~sublime/','','sublime@lipn.univ-paris13.fr','B 301','Membre associé'),(15400,'Sylvie','SZULMAN',0,'http://www-lipn.univ-paris13.fr/~szulman/','28 32','ss@lipn.univ-paris13.fr','B 207','Maître de conférences'),(15500,'Alain','TAKOUDJOU',0,'http://www-lipn.univ-paris13.fr/~takoudjou/','32 13','takoudjou@lipn.univ-paris13.fr','','Membre associé'),(15600,'Nathalie','TAVARES',0,'http://www-lipn.univ-paris13.fr/~tavares/','35 66','tavares@lipn.univ-paris13.fr','B 310','Personnel administratif'),(15700,'Christophe','TOLLU',0,'http://www-lipn.univ-paris13.fr/~tollu/','36 91','ct@lipn.univ-paris13.fr','A 209','Maître de conférences'),(15800,'Nadi','TOMEH',0,'http://www-lipn.univ-paris13.fr/~tomeh/','','tomeh@lipn.univ-paris13.fr','B 308','Maître de conférences'),(15900,'Tayssir','TOUILI',0,'http://www-lipn.univ-paris13.fr/~touili/','36 62','touili@lipn.univ-paris13.fr','A 206','Directeur de recherches'),(16000,'Sophie','TOULOUSE',0,'http://www-lipn.univ-paris13.fr/~toulouse/','40 73','toulouse@lipn.univ-paris13.fr','A 103','Maître de conférences'),(16100,'Emiliano','TRAVERSI',0,'http://www-lipn.univ-paris13.fr/~traversi/','','traversi@lipn.univ-paris13.fr','A 109','Maître de conférences'),(16200,'Alexandra','UGOLNIKOVA',0,'http://www-lipn.univ-paris13.fr/~ugolnikova/','','ugolnikova@lipn.univ-paris13.fr','A 111','Doctorant'),(16300,'PABON','VALENCIA',0,'http://www-lipn.univ-paris13.fr/~valencia/','','valencia@lipn.univ-paris13.fr','A 112','Maître de conférences'),(16400,'MINH','VAN',0,'http://www-lipn.univ-paris13.fr/~van/','','vanminh@lipn.univ-paris13.fr','','Doctorant'),(16500,'Jacqueline','VAUZEILLES',0,'http://www-lipn.univ-paris13.fr/~vauzeilles/','36 08','jv@lipn.univ-paris13.fr','A 212','Professeur'),(16600,'Lise-Marie','VEILLON',0,'http://www-lipn.univ-paris13.fr/~veillon/','35 78','veillon@lipn.univ-paris13.fr','B 305','Doctorant'),(16700,'Pierre','VIAL',0,'http://www-lipn.univ-paris13.fr/~vial/','','vial@lipn.univ-paris13.fr','','Membre associé'),(16800,'Antonia','WILK',0,'http://www-lipn.univ-paris13.fr/~wilk/','36 87','wilk@lipn.univ-paris13.fr','B 316','Personnel administratif'),(16900,'Roberto','WOLFLER',0,'http://www-lipn.univ-paris13.fr/~wolfler/','40 71','wolfler@lipn.univ-paris13.fr','A 109','Professeur, Responsable d\'équipe'),(17000,'Thomas','WONG',0,'http://www-lipn.univ-paris13.fr/~wong/','36 91','wong@lipn.univ-paris13.fr','A 209','Post Doctorant'),(17100,'ALASSAN','YAHAYA',0,'http://www-lipn.univ-paris13.fr/~yahaya/','','yahayaalassan@lipn.univ-paris13.fr','B 103','Membre associé'),(17200,'Xin','YE',0,'http://www-lipn.univ-paris13.fr/~ye/','','xin@lipn.univ-paris13.fr','B 311','Doctorant'),(17300,'Haïfa','ZARGAYOUNA',0,'http://www-lipn.univ-paris13.fr/~zargayouna/','28 32','haifa@lipn.univ-paris13.fr','B 207','Maître de conférences');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_project`
--

DROP TABLE IF EXISTS `user_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_project` (
  `user_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`),
  KEY `fk_user_has_project_project1_idx` (`project_id`),
  KEY `fk_user_has_project_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_project_project1` FOREIGN KEY (`project_id`) REFERENCES `projet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_project_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_project`
--

LOCK TABLES `user_project` WRITE;
/*!40000 ALTER TABLE `user_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_publication`
--

DROP TABLE IF EXISTS `user_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_publication` (
  `user_id` int(10) unsigned NOT NULL,
  `publication_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`publication_id`),
  KEY `fk_user_has_publication_publication1_idx` (`publication_id`),
  KEY `fk_user_has_publication_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_publication_publication1` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_publication_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_publication`
--

LOCK TABLES `user_publication` WRITE;
/*!40000 ALTER TABLE `user_publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_team`
--

DROP TABLE IF EXISTS `user_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team` (
  `team_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`team_id`,`user_id`),
  KEY `fk_Team_has_user_user1_idx` (`user_id`),
  KEY `fk_Team_has_user_Team1_idx` (`team_id`),
  CONSTRAINT `fk_Team_has_user_Team1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Team_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_team`
--

LOCK TABLES `user_team` WRITE;
/*!40000 ALTER TABLE `user_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-30 21:27:21
