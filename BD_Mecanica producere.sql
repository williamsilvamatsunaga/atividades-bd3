CREATE DATABASE  IF NOT EXISTS `bd_mecanica_9` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_mecanica_9`;

-- William da Silva Matsunaga


-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_mecanica_9
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixa` (
  `id_cai` int NOT NULL AUTO_INCREMENT,
  `data_abertura_cai` date NOT NULL,
  `data_fechamento_cai` date DEFAULT NULL,
  `saldo_inicial_cai` double NOT NULL,
  `troco_cai` double DEFAULT NULL,
  `valor_creditos_cai` double DEFAULT NULL,
  `valor_debitos_cai` double DEFAULT NULL,
  `saldo_final_cai` double DEFAULT NULL,
  `status_cai` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cai`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (1,'2023-08-19','2023-08-20',0,100,500,0,600,'fechado'),(2,'2023-08-20','2023-08-21',0,120,480,0,600,'fechado'),(3,'2023-08-21','2023-08-22',0,150,550,0,700,'fechado'),(4,'2023-08-22','2023-08-23',0,180,600,0,780,'fechado'),(5,'2023-08-23','2023-08-24',0,200,700,0,900,'fechado'),(6,'2023-08-24','2023-08-25',0,250,800,0,1050,'fechado'),(7,'2023-08-25','2023-08-26',0,280,900,0,1180,'fechado'),(8,'2023-08-26','2023-08-27',0,300,1000,0,1300,'fechado'),(9,'2023-08-27','2023-08-28',0,320,1100,0,1420,'fechado'),(10,'2023-08-28','2023-08-29',0,350,1200,0,1550,'fechado'),(11,'2023-08-29','2023-08-30',0,380,1300,0,1680,'fechado'),(12,'2023-08-30','2023-08-31',0,400,1400,0,1800,'fechado'),(13,'2023-08-31','2023-09-01',0,420,1500,0,1920,'fechado'),(14,'2023-09-01','2023-09-02',0,450,1600,0,2050,'fechado'),(15,'2023-09-02','2023-09-03',0,480,1700,0,2180,'fechado'),(16,'2023-09-03','2023-09-04',0,500,1800,0,2300,'fechado'),(17,'2023-09-04','2023-09-05',0,520,1900,0,2420,'fechado'),(18,'2023-09-05','2023-09-06',0,550,2000,0,2550,'fechado'),(19,'2023-09-06','2023-09-07',0,580,2100,0,2680,'fechado'),(20,'2023-09-07','2023-09-08',0,600,2200,0,2800,'fechado'),(21,'2023-08-19','2023-08-20',0,100,500,0,600,'fechado'),(22,'2023-08-20',NULL,0,0,0,0,0,'aberto');
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_carg` int NOT NULL AUTO_INCREMENT,
  `nome_carg` varchar(300) DEFAULT NULL,
  `atribuicoes_carg` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_carg`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'gerente','gestao operacional da empresa.'),(2,'vendedor(a)','vender produtos e servicos.'),(3,'mecanico','consertar veiculos.'),(4,'assistente de caixa','receber vendas no caixa.'),(5,'entregador(a)','entregar produtos conforme vendas.');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro` (
  `id_car` int NOT NULL AUTO_INCREMENT,
  `modelo_car` varchar(100) NOT NULL,
  `cor_car` varchar(50) NOT NULL,
  `portas_car` varchar(50) DEFAULT NULL,
  `placa_car` varchar(50) NOT NULL,
  `marca_car` varchar(50) NOT NULL,
  `id_cli_fk` int NOT NULL,
  PRIMARY KEY (`id_car`),
  KEY `id_cli_fk` (`id_cli_fk`),
  CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`id_cli_fk`) REFERENCES `cliente` (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES (1,'gol 1.0','preto','4 portas','ndr 2815','volkswagen',1),(2,'palio 1.0','branco','4 portas','nea 1231','fiat',2),(3,'gol 1.0','preto','4 portas','wat 1254','volkswagen',3),(4,'s-10','prata','2 portas','eae 2815','gm',4),(5,'celta spirit 1.0','branco','4 portas','ndd 2815','gm',5),(6,'celta life 1.0','vermelho','2 portas','mra 1288','gm',6),(7,'hilux 2.4','prata','4 portas','rtu 3498','toyota',7),(8,'prisma ltz','branco','4 portas','oip 1231','gm',8),(9,'hilux 2.4','branco','4 portas','asd 1234','toyota',9),(10,'hb-20','preto','4 portas','ndt 1155','hunday',10),(11,'hilux 2.4','prata','4 portas','noo 2010','toyota',1),(12,'gol 1.6','branco','4 portas','nnd 2066','volkswagen',7),(13,'cruze ltz 1.8','preto','4 portas','ndm 2819','gm',11),(14,'cruze ltz 1.8','branco','4 portas','nra 2233','gm',5),(15,'celta spirit 1.0','branco','4 portas','ndr 2233','gm',12),(16,'onix 1.0','azul','4 portas','abc 4567','gm',3),(17,'uno 1.4','vermelho','4 portas','xyz 7890','fiat',4),(18,'corolla 2.0','prata','4 portas','qwe 2345','toyota',2),(19,'sandero 1.6','preto','4 portas','poi 9876','renault',6),(20,'fox 1.0','amarelo','4 portas','lkj 3456','volkswagen',8),(21,'etios 1.5','verde','4 portas','zxc 6789','toyota',9),(22,'uno 1.0','azul','4 portas','qaz 1234','fiat',10),(23,'siena 1.4','prata','4 portas','wsx 5678','fiat',1),(24,'onix 1.6','preto','4 portas','edc 4321','gm',7),(25,'hb-20 1.0','branco','4 portas','rfv 8765','hunday',5),(26,'fiesta 1.0','azul','4 portas','abc 4567','ford',3),(27,'sandero 1.4','vermelho','4 portas','xyz 7890','renault',4),(28,'civic 2.0','prata','4 portas','qwe 2345','honda',2),(29,'hb-20 1.6','preto','4 portas','poi 9876','hunday',6),(30,'fusca 1.6','amarelo','2 portas','lkj 3456','volkswagen',8),(31,'ranger 2.5','verde','4 portas','zxc 6789','ford',9),(32,'uno 1.0','azul','4 portas','qaz 1234','fiat',10),(33,'siena 1.4','prata','4 portas','wsx 5678','fiat',1),(34,'onix 1.6','preto','4 portas','edc 4321','gm',7),(35,'etios 1.5','branco','4 portas','rfv 8765','toyota',5),(36,'golf 1.0','azul','4 portas','abc 9876','volkswagen',3),(37,'corolla 1.8','vermelho','4 portas','xyz 2345','toyota',4),(38,'prisma 1.4','prata','4 portas','qwe 7890','gm',2),(39,'ka 1.0','preto','4 portas','poi 2345','ford',6),(40,'s-10 2.8','amarelo','2 portas','lkj 8765','gm',8),(41,'fiat 500 1.0','verde','2 portas','zxc 4321','fiat',9),(42,'celta 1.0','azul','4 portas','qaz 5678','gm',10),(43,'voyage 1.6','prata','4 portas','wsx 1234','volkswagen',1),(44,'fit 1.5','preto','4 portas','edc 5678','honda',7),(45,'uno 1.4','branco','4 portas','rfv 8765','fiat',5);
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `id_cid` int NOT NULL AUTO_INCREMENT,
  `nome_cid` varchar(200) NOT NULL,
  `id_est_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_cid`),
  KEY `id_est_fk` (`id_est_fk`),
  CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`id_est_fk`) REFERENCES `estado` (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'ji-paraná',22),(2,'porto velho',22),(3,'vilhena',22),(4,'ariquemes',22),(5,'jaru',22),(6,'guajará-mirim ',22),(7,'colorado do oeste',22),(8,'ouro preto do oeste',22),(9,'pimenta bueno',22),(10,'Rio Branco',1),(11,'Cruzeiro do Sul',1),(12,'Feijó',1),(13,'Tarauacá',1),(14,'Sena Madureira',1),(15,'Maceió',2),(16,'Arapiraca',2),(17,'Palmeira dos Índios',2),(18,'Rio Largo',2),(19,'União dos Palmares',2),(20,'Macapá',3),(21,'Santana',3),(22,'Laranjal do Jari',3),(23,'Oiapoque',3),(24,'Porto Grande',3),(25,'Manaus',4),(26,'Parintins',4),(27,'Itacoatiara',4),(28,'Manacapuru',4),(29,'Coari',4),(30,'Salvador',5),(31,'Feira de Santana',5),(32,'Vitória da Conquista',5),(33,'Camaçari',5),(34,'Itabuna',5),(35,'Fortaleza',6),(36,'Caucaia',6),(37,'Juazeiro do Norte',6),(38,'Maracanaú',6),(39,'Sobral',6),(40,'Brasília',7),(41,'Vitória',8),(42,'Vila Velha',8),(43,'Cariacica',8),(44,'Serra',8),(45,'Linhares',8),(46,'Goiânia',9),(47,'Aparecida de Goiânia',9),(48,'Anápolis',9),(49,'Rio Verde',9),(50,'Luziânia',9),(51,'São Luís',10),(52,'Imperatriz',10),(53,'São José de Ribamar',10),(54,'Caxias',10),(55,'Timon',10),(56,'Cuiabá',11),(57,'Várzea Grande',11),(58,'Rondonópolis',11),(59,'Sinop',11),(60,'Tangará da Serra',11),(61,'Campo Grande',12),(62,'Dourados',12),(63,'Três Lagoas',12),(64,'Corumbá',12),(65,'Ponta Porã',12),(66,'Belo Horizonte',13),(67,'Uberlândia',13),(68,'Contagem',13),(69,'Juiz de Fora',13),(70,'Betim',13),(71,'Belém',14),(72,'Ananindeua',14),(73,'Santarém',14),(74,'Marabá',14),(75,'Castanhal',14),(76,'João Pessoa',15),(77,'Campina Grande',15),(78,'Santa Rita',15),(79,'Patos',15),(80,'Bayeux',15),(81,'Cuiabá',11),(82,'Várzea Grande',11),(83,'Rondonópolis',11),(84,'Sinop',11),(85,'Tangará da Serra',11),(86,'Campo Grande',12),(87,'Dourados',12),(88,'Três Lagoas',12),(89,'Corumbá',12),(90,'Ponta Porã',12),(91,'Belo Horizonte',13),(92,'Uberlândia',13),(93,'Contagem',13),(94,'Juiz de Fora',13),(95,'Betim',13),(96,'Belém',14),(97,'Ananindeua',14),(98,'Santarém',14),(99,'Marabá',14),(100,'Castanhal',14),(101,'João Pessoa',15),(102,'Campina Grande',15),(103,'Santa Rita',15),(104,'Patos',15),(105,'Bayeux',15),(106,'Curitiba',16),(107,'Londrina',16),(108,'Maringá',16),(109,'Ponta Grossa',16),(110,'Cascavel',16),(111,'Recife',17),(112,'Jaboatão dos Guararapes',17),(113,'Olinda',17),(114,'Caruaru',17),(115,'Paulista',17),(116,'Teresina',18),(117,'Parnaíba',18),(118,'Picos',18),(119,'Campo Maior',18),(120,'Floriano',18),(121,'Rio de Janeiro',19),(122,'São Gonçalo',19),(123,'Duque de Caxias',19),(124,'Nova Iguaçu',19),(125,'Niterói',19),(126,'Natal',20),(127,'Mossoró',20),(128,'Parnamirim',20),(129,'São Gonçalo do Amarante',20),(130,'Ceará-Mirim',20),(131,'Porto Alegre',21),(132,'Caxias do Sul',21),(133,'Pelotas',21),(134,'Santa Maria',21),(135,'Canoas',21),(136,'Boa Vista',23),(137,'Rorainópolis',23),(138,'Caracaraí',23),(139,'Mucajaí',23),(140,'São João da Baliza',23),(141,'Florianópolis',24),(142,'Joinville',24),(143,'Blumenau',24),(144,'São José',24),(145,'Lages',24),(146,'São Paulo',25),(147,'Guarulhos',25),(148,'Campinas',25),(149,'São Bernardo do Campo',25),(150,'Santo André',25),(151,'Aracaju',26),(152,'Nossa Senhora do Socorro',26),(153,'Lagarto',26),(154,'Itabaiana',26),(155,'São Cristóvão',26),(156,'Palmas',27),(157,'Araguaína',27),(158,'Gurupi',27),(159,'Porto Nacional',27),(160,'Paraíso do Tocantins',27);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cli` int NOT NULL AUTO_INCREMENT,
  `nome_cli` varchar(200) NOT NULL,
  `estado_civil_cli` varchar(50) DEFAULT NULL,
  `cpf_cli` varchar(20) NOT NULL,
  `rg_cli` varchar(30) DEFAULT NULL,
  `data_nascimento_cli` date DEFAULT NULL,
  `renda_familiar_cli` float DEFAULT NULL,
  `telefone_cli` varchar(50) DEFAULT NULL,
  `celular_cli` varchar(50) NOT NULL,
  `id_sex_fk` int NOT NULL,
  `id_end_fk` int NOT NULL,
  PRIMARY KEY (`id_cli`),
  KEY `id_sex_fk` (`id_sex_fk`),
  KEY `id_end_fk` (`id_end_fk`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_sex_fk`) REFERENCES `sexo` (`id_sex`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`id_end_fk`) REFERENCES `endereco` (`id_end`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'rodrigo hilbert','casado','111.111.111-11','54654 sesdec','1987-06-30',10000,'69 84085712','69 84111111',1,3),(2,'tiago lacerda','casado','111.111.111-22','54654 sesdec','1965-01-01',456454,'','',1,8),(3,'tom cruise','solteiro','111.111.111-33','48877 sesdec','1950-05-30',0,'11 454546511','',1,1),(4,'josé pereiro da silva','casado','222.222.222-88','8888888 spp','1990-11-12',900,'69 88998899','69 4444 4444',1,4),(5,'maria de jesus dos santos','solteira','554.454.444-99','99999 sesdec','1993-06-21',3000,'69 3421 5511','69 99111111',2,3),(6,'camila de oliveira','casada','987.123.654-55','8889999 sesdec','2000-12-12',5450,'69 3421 1122','69 9999 7788',2,10),(7,'marcos araujo de souza','casado','654.789.123-88','998877 sesdec','1970-01-01',6845,'69 84085712','69 84111111',1,9),(8,'cleiton batista ferraz','solteiro','321.111.222-44','1234312 sesdec','1982-07-30',4199,'69 3421 2211','69 84118811',1,2),(9,'eliana da cruz','solteira','988.235.654-54','12345 sesdec','1978-11-11',3250,'69 3421 9999','69 84118811',2,5),(10,'igor garcia da silva','solteiro','123.445.888-99','999992 sesdec','1989-12-30',9600,'69 3421 1123','69 84118811',1,11),(11,'jackson henrique da silva bezerra','casado','529.562.612-15','880075 sesdec','1987-06-30',11000,'','69 84085712',1,3),(12,'jaqueline leão pereira','casada','522.222.153-15','12315 sesdec','1993-06-21',11000,NULL,'69 984210921',2,3),(13,'gleicy borgio','casada','126.777.888-99',NULL,NULL,5000,NULL,'69 84888899',2,11),(14,'diego da silva bezerra','solteiro','111.987.123-55',NULL,NULL,3999.99,NULL,'69 88997722',1,15),(15,'murilo benicio','casado','321.123.321-55',NULL,NULL,2450.8,NULL,'11 2121 1111',1,8),(16,'ana clara oliveira','solteira','111.222.333-44','12345 sesdec','1995-03-15',7800,'69 3421 3344','69 98888 7766',2,6),(17,'ana clara oliveira','solteira','111.222.333-44','12345 sesdec','1995-03-15',7800,'69 3421 3344','69 98888 7766',2,6),(18,'pedro henrique almeida','casado','555.666.777-88','998877 sesdec','1980-08-22',6500,'69 3421 5566','69 84123 9876',1,9),(19,'isabela pereira','solteira','987.654.321-01','12345 sesdec','1992-05-10',4200,'69 3421 8899','69 99222 3344',2,5),(20,'lucas souza','solteiro','123.456.789-10','54321 sesdec','1988-11-03',8900,'69 3421 2233','69 87654 3210',2,7),(21,'gabriela silva','casada','987.654.321-98','8889999 sesdec','1997-02-20',5500,'69 3421 7788','69 84123 5678',1,10),(22,'ricardo martins','solteiro','123.987.456-32','87654 sesdec','1985-09-17',7600,'69 3421 1122','69 99000 1122',2,4),(23,'carla santos','casada','654.987.321-45','876543 sesdec','1975-12-01',4800,'69 3421 5566','69 84123 3333',1,8),(24,'roberto mendes','solteiro','159.357.852-46','998877 sesdec','1991-04-12',6200,'69 3421 8899','69 99222 3344',2,6),(25,'marina costa','casada','987.654.321-00','12345 sesdec','1983-07-25',7100,'69 3421 3344','69 98888 7766',1,5),(26,'felipe rocha','solteiro','258.369.147-00','54321 sesdec','1994-10-08',5800,'69 3421 5566','69 84123 9876',2,3),(27,'lara alves','casada','852.963.741-22','87654 sesdec','1986-02-14',6800,'69 3421 2233','69 87654 3210',1,9),(28,'pedro martins','solteiro','123.456.789-10','54321 sesdec','1998-05-27',8100,'69 3421 8899','69 99222 3344',2,7),(29,'larissa rodrigues','solteira','987.654.321-98','8889999 sesdec','1984-09-30',5900,'69 3421 7788','69 84123 5678',1,10),(30,'rafael pereira','casado','123.987.456-32','87654 sesdec','1996-12-11',7200,'69 3421 1122','69 99000 1122',2,4),(31,'amanda santos','solteira','654.987.321-45','876543 sesdec','1972-03-05',5000,'69 3421 5566','69 84123 3333',1,8),(32,'vinicius mendes','casado','159.357.852-46','998877 sesdec','1999-06-18',6700,'69 3421 8899','69 99222 3344',2,6),(33,'thais costa','solteira','987.654.321-00','12345 sesdec','1981-08-21',4900,'69 3421 3344','69 98888 7766',1,5),(34,'bruno rocha','casado','258.369.147-00','54321 sesdec','1990-11-14',6400,'69 3421 5566','69 84123 9876',2,3),(35,'mariana alves','solteira','852.963.741-22','87654 sesdec','1979-02-28',7500,'69 3421 2233','69 87654 3210',1,9),(36,'eduardo martins','solteiro','123.456.789-10','54321 sesdec','1987-05-12',9200,'69 3421 8899','69 99222 3344',2,7),(37,'carol rodrigues','casada','987.654.321-98','8889999 sesdec','1995-08-25',6300,'69 3421 7788','69 84123 5678',1,10),(38,'andre pereira','solteiro','123.987.456-32','87654 sesdec','1982-11-06',7900,'69 3421 1122','69 99000 1122',2,4),(39,'luana santos','casada','654.987.321-45','876543 sesdec','1993-02-19',5300,'69 3421 5566','69 84123 3333',1,8),(40,'rodrigo mendes','solteiro','159.357.852-46','998877 sesdec','1988-05-03',7100,'69 3421 8899','69 99222 3344',2,6),(41,'ana costa','casada','987.654.321-00','12345 sesdec','1977-08-16',6800,'69 3421 3344','69 98888 7766',1,5),(42,'pedro rocha','solteiro','258.369.147-00','54321 sesdec','1992-11-29',5900,'69 3421 5566','69 84123 9876',2,3),(43,'isabela alves','casada','852.963.741-22','87654 sesdec','1974-04-10',7500,'69 3421 2233','69 87654 3210',1,9),(44,'lucas martins','solteiro','123.456.789-10','54321 sesdec','1989-07-23',8400,'69 3421 8899','69 99222 3344',2,7),(45,'gabriela rodrigues','solteira','987.654.321-98','8889999 sesdec','1996-10-06',6200,'69 3421 7788','69 84123 5678',1,10),(46,'ricardo pereira','casado','123.987.456-32','87654 sesdec','1976-01-18',7800,'69 3421 1122','69 99000 1122',2,4),(47,'carla alves','solteira','654.987.321-45','876543 sesdec','1990-04-01',5300,'69 3421 5566','69 84123 3333',1,8),(48,'roberto rocha','casado','159.357.852-46','998877 sesdec','1983-07-14',6900,'69 3421 8899','69 99222 3344',2,6),(49,'marina rodrigues','solteira','987.654.321-00','12345 sesdec','1978-10-27',5000,'69 3421 3344','69 98888 7766',1,5),(50,'felipe almeida','casado','258.369.147-00','54321 sesdec','1995-01-09',6400,'69 3421 5566','69 84123 9876',2,3),(51,'lara martins','solteira','852.963.741-22','87654 sesdec','1980-04-22',7700,'69 3421 2233','69 87654 3210',1,9),(52,'pedro mendes','solteiro','123.456.789-10','54321 sesdec','1998-07-05',9200,'69 3421 8899','69 99222 3344',2,7),(53,'larissa pereira','casada','987.654.321-98','8889999 sesdec','1985-10-18',6900,'69 3421 7788','69 84123 5678',1,10),(54,'rafael alves','solteiro','123.987.456-32','87654 sesdec','1997-01-30',8300,'69 3421 1122','69 99000 1122',2,4),(55,'amanda rocha','casada','654.987.321-45','876543 sesdec','1971-05-12',5600,'69 3421 5566','69 84123 3333',1,8),(56,'vinicius rocha','solteiro','159.357.852-46','998877 sesdec','1994-08-25',7200,'69 3421 8899','69 99222 3344',2,6),(57,'thais pereira','solteira','987.654.321-00','12345 sesdec','1982-11-07',5500,'69 3421 3344','69 98888 7766',1,5),(58,'bruno almeida','casado','258.369.147-00','54321 sesdec','1991-02-20',6700,'69 3421 5566','69 84123 9876',2,3),(59,'mariana martins','solteira','852.963.741-22','87654 sesdec','1973-05-04',7400,'69 3421 2233','69 87654 3210',1,9),(60,'eduardo mendes','solteiro','123.456.789-10','54321 sesdec','1986-08-17',9100,'69 3421 8899','69 99222 3344',2,7),(61,'carol alves','casada','987.654.321-98','8889999 sesdec','1999-11-30',5900,'69 3421 7788','69 84123 5678',1,10),(62,'andre rocha','solteiro','123.987.456-32','87654 sesdec','1975-02-12',7600,'69 3421 1122','69 99000 1122',2,4),(63,'luana alves','casada','654.987.321-45','876543 sesdec','1992-05-25',5200,'69 3421 5566','69 84123 3333',1,8),(64,'rodrigo rocha','solteiro','159.357.852-46','998877 sesdec','1987-08-08',6800,'69 3421 8899','69 99222 3344',2,6),(65,'ana rodrigues','casada','987.654.321-00','12345 sesdec','1979-11-21',7500,'69 3421 3344','69 98888 7766',1,5),(66,'pedro almeida','solteiro','258.369.147-00','54321 sesdec','1994-02-03',6200,'69 3421 5566','69 84123 9876',2,3);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_comp` int NOT NULL AUTO_INCREMENT,
  `data_comp` date DEFAULT NULL,
  `valor_total_comp` double DEFAULT NULL,
  `forma_pagamento_comp` varchar(100) DEFAULT NULL,
  `id_func_fk` int NOT NULL,
  `id_forn_fk` int NOT NULL,
  PRIMARY KEY (`id_comp`),
  KEY `id_func_fk` (`id_func_fk`),
  KEY `id_forn_fk` (`id_forn_fk`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_func_fk`) REFERENCES `funcionario` (`id_func`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_forn_fk`) REFERENCES `fornecedor` (`id_forn`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2021-01-23',4654.5,'30 dias',1,1),(2,'2021-02-10',45464,'30 dias',1,2),(3,'2022-06-30',5045.9,'vista',1,3),(4,'2022-09-23',2154.79,'60 dias',1,4),(5,'2023-03-01',6543.2,'vista',1,5),(6,'2023-03-15',12345.67,'30 dias',3,1),(7,'2023-03-25',7890.5,'60 dias',4,2),(8,'2023-04-10',4321.89,'vista',5,3),(9,'2023-04-20',9876.3,'30 dias',6,4);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id_dep` int NOT NULL AUTO_INCREMENT,
  `nome_dep` varchar(100) DEFAULT NULL,
  `descricao_dep` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_dep`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'vendas','venda de peças e serviços'),(2,'financeiro','controle financeiro e caixa'),(3,'entrega','entregar peças'),(4,'mecânica','realizar manutenção em veículos'),(5,'administração','gestão da empresa');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesa`
--

DROP TABLE IF EXISTS `despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despesa` (
  `id_desp` int NOT NULL AUTO_INCREMENT,
  `descricao_desp` varchar(200) DEFAULT NULL,
  `valor_desp` double DEFAULT NULL,
  `data_desp` date DEFAULT NULL,
  `numero_documento_desp` varchar(300) DEFAULT NULL,
  `id_forn_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_desp`),
  KEY `id_forn_fk` (`id_forn_fk`),
  CONSTRAINT `despesa_ibfk_1` FOREIGN KEY (`id_forn_fk`) REFERENCES `fornecedor` (`id_forn`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa`
--

LOCK TABLES `despesa` WRITE;
/*!40000 ALTER TABLE `despesa` DISABLE KEYS */;
INSERT INTO `despesa` VALUES (1,'conta de agua de janeiro/2017',150.5,'2023-01-31','212312131311',7),(2,'conta de luz de janeiro/2017',550.9,'2023-02-25','485445646777',6),(3,'Conta de água de abril/2021',180.5,'2023-04-30','321548754845',2),(4,'Conta de luz de abril/2021',620.9,'2023-04-30','454578798787',3),(5,'Compra de material de escritório',300,'2023-04-15','879847458478',4),(6,'Manutenção de veículo da empresa',1200,'2023-04-22','987887788787',5),(7,'Compra de uniformes para funcionários',450,'2023-04-10','123456789987',6);
/*!40000 ALTER TABLE `despesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id_end` int NOT NULL AUTO_INCREMENT,
  `rua_end` varchar(300) DEFAULT NULL,
  `numero_end` int DEFAULT NULL,
  `bairro_end` varchar(100) DEFAULT NULL,
  `id_cid_fk` int NOT NULL,
  PRIMARY KEY (`id_end`),
  KEY `id_cid_fk` (`id_cid_fk`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_cid_fk`) REFERENCES `cidade` (`id_cid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'av. brasil',111,'nova brasília',1),(2,'av. marechal rondon',1245,'centro',1),(3,'rua dr. telma rios',1174,'colina park i',1),(4,'av. aracaju',911,'bnh',1),(5,'rua 07 de setembro',121,'centro',1),(6,'rua mato grosso',887,'dom bosco',1),(7,'av. jorge teixeira',1589,'centro',2),(8,'av. paulista',989,'centro',11),(9,'travessa dos mineiros',456,'centro',4),(10,'av. monte castelo',555,'jardim dos migrantes',1),(11,'av. aracaju',5111,'nova brasilia',1),(12,'av. monte castelo',9999,'jardim dos migrantes',1),(13,'rua x',12,'jardim dos migrantes',1),(14,'k-0',522,'são francisco',1),(15,'av. monte castelo',11229,'jardim dos migrantes',1),(16,'rua das flores',456,'jardim das flores',2),(17,'av. dos ipês',789,'parque das árvores',3),(18,'travessa dos cravos',231,'jardim das rosas',4),(19,'rua das violetas',876,'parque floral',5),(20,'av. das begônias',543,'jardim primavera',6),(21,'travessa das orquídeas',112,'parque das tulipas',7),(22,'rua dos lírios',789,'jardim das margaridas',8),(23,'av. das dálias',456,'parque das hortênsias',9),(24,'travessa das azaleias',231,'jardim das camélias',10),(25,'rua dos girassóis',876,'parque dos girassóis',11),(26,'av. das acácias',543,'jardim das palmeiras',12),(27,'travessa dos manacás',112,'parque dos manacás',13),(28,'rua das bromélias',789,'jardim das bromélias',14),(29,'av. das laranjeiras',456,'parque das laranjeiras',15),(30,'travessa das goiabeiras',231,'jardim das goiabeiras',16),(31,'rua dos abacaxis',876,'parque dos abacaxis',17),(32,'av. das pitangas',543,'jardim das pitangas',18),(33,'travessa dos cajueiros',112,'parque dos cajueiros',19),(34,'rua das mangueiras',789,'jardim das mangueiras',20),(35,'av. das jabuticabeiras',456,'parque das jabuticabeiras',21);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id_est` int NOT NULL AUTO_INCREMENT,
  `nome_est` varchar(200) NOT NULL,
  `sigla_est` varchar(2) NOT NULL,
  `regiao_est` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Acre','AC','Norte'),(2,'Alagoas','AL','Nordeste'),(3,'Amapá','AP','Norte'),(4,'Amazonas','AM','Norte'),(5,'Bahia','BA','Nordeste'),(6,'Ceará','CE','Nordeste'),(7,'Distrito Federal','DF','Centro-Oeste'),(8,'Espírito Santo','ES','Sudeste'),(9,'Goiás','GO','Centro-Oeste'),(10,'Maranhão','MA','Nordeste'),(11,'Mato Grosso','MT','Centro-Oeste'),(12,'Mato Grosso do Sul','MS','Centro-Oeste'),(13,'Minas Gerais','MG','Sudeste'),(14,'Pará','PA','Norte'),(15,'Paraíba','PB','Nordeste'),(16,'Paraná','PR','Sul'),(17,'Pernambuco','PE','Nordeste'),(18,'Piauí','PI','Nordeste'),(19,'Rio de Janeiro','RJ','Sudeste'),(20,'Rio Grande do Norte','RN','Nordeste'),(21,'Rio Grande do Sul','RS','Sul'),(22,'Rondônia','RO','Norte'),(23,'Roraima','RR','Norte'),(24,'Santa Catarina','SC','Sul'),(25,'São Paulo','SP','Sudeste'),(26,'Sergipe','SE','Nordeste'),(27,'Tocantins','TO','Norte');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_forn` int NOT NULL AUTO_INCREMENT,
  `razao_social_forn` varchar(200) DEFAULT NULL,
  `nome_fantasia_forn` varchar(100) DEFAULT NULL,
  `representante_forn` varchar(100) DEFAULT NULL,
  `contato_forn` varchar(300) DEFAULT NULL,
  `id_end_fk` int NOT NULL,
  PRIMARY KEY (`id_forn`),
  KEY `id_end_fk` (`id_end_fk`),
  CONSTRAINT `fornecedor_ibfk_1` FOREIGN KEY (`id_end_fk`) REFERENCES `endereco` (`id_end`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'gm motors ltda','chevrolet gm','tony',NULL,5),(2,'fiat ltda','fiat','fabio','3421 5588',1),(3,'toyota ltda','toyota','marcos','3422 7246',2),(4,'volkswagen ltda','volkswagem','nilson',NULL,3),(5,'hunday ltda','hynday','marcos','3421 7897',3),(6,'eletrobrás brasil','ceron','governo','3423 1234',10),(7,'companhia de agua e esgoto de rondonia','caerd','maria',NULL,11),(8,'nissan motores s.a.','nissan','andre','3422 4455',4),(9,'ford parts ltda','ford','carlos','3421 3366',5),(10,'honda parts s.a.','honda','joão','3422 9988',2),(11,'peugeot components ltda','peugeot','lucas',NULL,1),(12,'renault auto parts s.a.','renault','roberto','3421 1122',3),(13,'volvo parts ltda','volvo','jose','3422 2233',4),(14,'kia motors s.a.','kia','fernando','3421 7788',5),(15,'mercedes parts ltda','mercedes-benz','carla','3422 3344',1),(16,'mitsubishi components s.a.','mitsubishi','rafael','3421 8899',2),(17,'subaru motors s.a.','subaru','ana',NULL,3),(18,'jaguar parts ltda','jaguar','maria','3422 5566',4),(19,'land rover ltda','land rover','andreia','3421 6655',5),(20,'porsche parts s.a.','porsche','ricardo','3422 3344',1),(21,'bugatti motors s.a.','bugatti','gustavo','3421 9988',2),(22,'lamborghini ltda','lamborghini','leticia',NULL,3),(23,'aston martin parts s.a.','aston martin','pedro','3422 4455',4),(24,'maserati ltda','maserati','camila','3421 7788',5),(25,'rolls-royce motors s.a.','rolls-royce','joana','3422 3344',1),(26,'lotus parts ltda','lotus','eduardo','3421 8899',2),(27,'suzuki motors s.a.','suzuki','luis',NULL,3);
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id_func` int NOT NULL AUTO_INCREMENT,
  `nome_func` varchar(200) NOT NULL,
  `cpf_func` varchar(20) NOT NULL,
  `rg_func` varchar(20) DEFAULT NULL,
  `data_nascimento_func` date DEFAULT NULL,
  `salario_func` double NOT NULL,
  `telefone_func` varchar(50) DEFAULT NULL,
  `celular_func` varchar(50) NOT NULL,
  `id_carg_fk` int NOT NULL,
  `id_sex_fk` int NOT NULL,
  `id_dep_fk` int NOT NULL,
  `id_end_fk` int NOT NULL,
  PRIMARY KEY (`id_func`),
  KEY `id_carg_fk` (`id_carg_fk`),
  KEY `id_sex_fk` (`id_sex_fk`),
  KEY `id_dep_fk` (`id_dep_fk`),
  KEY `id_end_fk` (`id_end_fk`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_carg_fk`) REFERENCES `cargo` (`id_carg`),
  CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`id_sex_fk`) REFERENCES `sexo` (`id_sex`),
  CONSTRAINT `funcionario_ibfk_3` FOREIGN KEY (`id_dep_fk`) REFERENCES `departamento` (`id_dep`),
  CONSTRAINT `funcionario_ibfk_4` FOREIGN KEY (`id_end_fk`) REFERENCES `endereco` (`id_end`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'joão batista','123.544.311-99','22222 sesdec','1988-10-30',5000,'','69 84111155',1,1,5,3),(2,'marcos garcia souza','565.888.988-88','64444 sesdec','1965-01-20',45000,'','',2,1,1,8),(3,'leticia de jesus','998.999.789-55','46666 sesdec','1990-05-23',1500,'11 454546511','',2,2,1,10),(4,'mateus solano ','522.222.232-08','65655 spp','1990-11-30',900,'69 8855 5544','69 5555 4444',3,1,4,4),(5,'roger da silva','123.589.978-77',NULL,'1987-11-11',1100,NULL,'69 9988 7788',3,1,4,11),(6,'ana pereira silva','987.987.788-88',NULL,'1985-11-22',1000.5,NULL,'69 8888 7777',4,2,2,1),(7,'isaias queiroz','123.121.321-88','87788 sesdec','1980-11-30',2000,NULL,'69 8877 88881',5,1,3,7),(8,'ana clara oliveira','543.987.654-99','77777 spp','1995-07-15',3000,'69 8888 1234','69 9999 5678',1,2,5,9),(9,'pedro henrique santos','876.543.210-11','12345 spp','1982-02-18',6000,'69 8765 4321','69 9876 5432',2,1,3,2),(10,'carla fernandes','654.321.098-77','11111 spp','1998-06-09',2500,'69 8765 4321','69 9876 5432',3,2,1,5),(11,'lucas oliveira santos','987.654.321-00','99999 spp','1993-12-05',4000,'69 8877 1234','69 9999 5678',4,1,2,12),(12,'camila pereira','123.456.789-01','55555 spp','1991-04-20',3500,'69 8765 4321','69 9876 5432',5,2,4,6),(13,'vitor da silva','987.654.123-33','44444 spp','1988-09-28',2800,'69 8877 1234','69 9999 5678',1,1,3,3),(14,'amanda santos','111.222.333-44','66666 spp','1980-03-15',3200,'69 8765 4321','69 9876 5432',2,2,2,9),(15,'leonardo souza','555.888.777-00','77777 spp','1987-07-01',4200,'69 8877 1234','69 9999 5678',3,1,5,4),(16,'caroline oliveira','444.555.666-99','12345 spp','1997-11-10',2700,'69 8765 4321','69 9876 5432',4,2,1,8),(17,'gustavo rodrigues','777.888.999-11','33333 spp','1989-05-30',3800,'69 8877 1234','69 9999 5678',5,1,4,11);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_compra`
--

DROP TABLE IF EXISTS `itens_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_compra` (
  `id_itc` int NOT NULL AUTO_INCREMENT,
  `quant_itc` int NOT NULL,
  `valor_itc` float NOT NULL,
  `id_prod_fk` int NOT NULL,
  `id_comp_fk` int NOT NULL,
  PRIMARY KEY (`id_itc`),
  KEY `id_prod_fk` (`id_prod_fk`),
  KEY `id_comp_fk` (`id_comp_fk`),
  CONSTRAINT `itens_compra_ibfk_1` FOREIGN KEY (`id_prod_fk`) REFERENCES `produto` (`id_prod`),
  CONSTRAINT `itens_compra_ibfk_2` FOREIGN KEY (`id_comp_fk`) REFERENCES `compra` (`id_comp`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_compra`
--

LOCK TABLES `itens_compra` WRITE;
/*!40000 ALTER TABLE `itens_compra` DISABLE KEYS */;
INSERT INTO `itens_compra` VALUES (1,5,5.55,1,1),(2,12,10.8,2,1),(3,9,19.99,3,1),(4,2,6.55,4,1),(5,10,10,5,1),(6,5,5,6,2),(7,20,20.5,7,2),(8,15,18.9,8,2),(9,5,30.6,9,2),(10,30,7.99,10,2),(11,10,12.9,11,3),(12,20,18.9,12,3),(13,5,120,13,3),(14,2,220.8,14,3),(15,8,127.7,15,3),(16,10,11.8,16,4),(17,5,124.9,17,4),(18,22,12.9,18,4),(19,15,34.8,19,4),(20,12,48,20,4),(21,8,15.9,21,5),(22,15,10.5,22,5),(23,10,25.75,23,5),(24,5,8.2,24,5),(25,12,12.4,25,5),(26,10,18.6,26,6),(27,5,35.9,27,6),(28,8,9.99,28,6),(29,20,5.5,29,6),(30,15,20,30,6),(31,7,22.3,31,7),(32,15,17.8,32,7),(33,10,13.25,33,7),(34,5,9.5,34,7),(35,18,8.9,35,7),(36,12,32.5,36,8),(37,8,45.8,37,8),(38,5,27.7,38,8),(39,20,13.9,39,8),(40,15,18,40,8);
/*!40000 ALTER TABLE `itens_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_venda`
--

DROP TABLE IF EXISTS `itens_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_venda` (
  `id_itv` int NOT NULL AUTO_INCREMENT,
  `quant_itv` int NOT NULL,
  `valor_itv` float NOT NULL,
  `id_prod_fk` int NOT NULL,
  `id_vend_fk` int NOT NULL,
  PRIMARY KEY (`id_itv`),
  KEY `id_prod_fk` (`id_prod_fk`),
  KEY `id_vend_fk` (`id_vend_fk`),
  CONSTRAINT `itens_venda_ibfk_1` FOREIGN KEY (`id_prod_fk`) REFERENCES `produto` (`id_prod`),
  CONSTRAINT `itens_venda_ibfk_2` FOREIGN KEY (`id_vend_fk`) REFERENCES `venda` (`id_vend`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_venda`
--

LOCK TABLES `itens_venda` WRITE;
/*!40000 ALTER TABLE `itens_venda` DISABLE KEYS */;
INSERT INTO `itens_venda` VALUES (1,2,12.5,1,1),(2,1,45.45,3,1),(3,1,89.77,5,1),(4,3,456.75,4,1),(5,1,45.05,10,2),(6,4,45.77,4,2),(7,3,99.87,7,2),(8,9,50.46,1,2),(9,10,78.77,9,3),(10,2,65.79,2,3),(11,3,20.57,8,3),(12,1,789.77,1,3),(13,3,25.6,16,1),(14,5,18.9,17,1),(15,2,30.8,18,1),(16,4,15.5,19,1),(17,1,40,20,2),(18,6,10.5,21,2),(19,4,22.3,22,2),(20,8,8.9,23,2),(21,7,15.9,24,3),(22,3,20.5,25,3),(23,2,50,26,3),(24,5,12.8,27,3),(25,10,18.6,28,4),(26,4,30.9,29,4),(27,2,12.4,30,4),(28,6,8,31,4);
/*!40000 ALTER TABLE `itens_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pag` int NOT NULL AUTO_INCREMENT,
  `data_vencimento_pag` date DEFAULT NULL,
  `valor_pag` float DEFAULT NULL,
  `parcela_pag` varchar(100) DEFAULT NULL,
  `status_pag` varchar(100) DEFAULT NULL,
  `forma_pagamento_pag` varchar(100) DEFAULT NULL,
  `data_pagamento_pag` date DEFAULT NULL,
  `id_func_fk` int DEFAULT NULL,
  `id_cai_fk` int DEFAULT NULL,
  `id_desp_fk` int DEFAULT NULL,
  `id_comp_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_pag`),
  KEY `id_func_fk` (`id_func_fk`),
  KEY `id_cai_fk` (`id_cai_fk`),
  KEY `id_desp_fk` (`id_desp_fk`),
  KEY `id_comp_fk` (`id_comp_fk`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_func_fk`) REFERENCES `funcionario` (`id_func`),
  CONSTRAINT `pagamento_ibfk_2` FOREIGN KEY (`id_cai_fk`) REFERENCES `caixa` (`id_cai`),
  CONSTRAINT `pagamento_ibfk_3` FOREIGN KEY (`id_desp_fk`) REFERENCES `despesa` (`id_desp`),
  CONSTRAINT `pagamento_ibfk_4` FOREIGN KEY (`id_comp_fk`) REFERENCES `compra` (`id_comp`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,'2022-09-01',4544.77,'1/1','Pago','dinheiro','2022-10-01',6,1,NULL,1),(2,'2022-09-01',787.99,'1/1','Pago','dinheiro','2022-10-01',6,2,NULL,2),(3,'2022-09-01',477.99,'1/1','Pago','dinheiro','2022-10-01',6,1,NULL,3),(4,'2022-09-01',1234.99,'1/1','Pago','dinheiro','2022-10-01',6,2,NULL,4),(5,'2022-09-01',45.77,'1/1','Pago','débito conta','2022-10-01',6,2,1,NULL),(6,'2022-09-01',100.9,'1/1','Pago','débito conta','2022-10-01',6,2,2,NULL),(7,'2023-04-05',200,'1/1','Pago','dinheiro','2023-04-05',1,1,1,NULL),(8,'2023-04-10',400,'1/1','Pago','cartão','2023-04-10',2,2,2,NULL),(9,'2023-04-15',100,'1/1','Pago','cheque','2023-04-15',3,3,3,NULL),(10,'2023-04-22',800,'1/1','Pago','dinheiro','2023-04-22',4,4,4,NULL),(11,'2023-04-30',150,'1/1','Pago','cartão','2023-04-30',5,5,5,NULL),(12,'2023-04-30',400,'1/1','Pago','cheque','2023-04-30',6,6,NULL,5);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_prod` int NOT NULL AUTO_INCREMENT,
  `descricao_prod` varchar(50) NOT NULL,
  `marca_prod` varchar(50) DEFAULT NULL,
  `quant_prod` int DEFAULT NULL,
  `valor_prod` double DEFAULT NULL,
  `tamanho_prod` varchar(50) DEFAULT NULL,
  `tipo_prod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'farol civic 2020 ld','honda',5,3500,'médio','led'),(2,'pneu aro 17 225/45','pirelli',20,999,'médio','borracha'),(3,'farol gol g7 2020 le','volkswagen',10,1500.99,'médio','vidro'),(4,'farol gol g7 2020 ld','ford',10,1500.99,'médio','vidro'),(5,'capô uno 2018','fiat',5,900,'grande','metal'),(6,'volante sportivo cruze 2021','chevrolet',3,4000,'médio','borracha'),(7,'difusor ar condicionado celta 2011 le','chevrolet',10,50,'médio','plastico'),(8,'parachoque s10 2020','chevrolet',10,2500,'médio','fibra'),(9,'parachoque celta 2020','chevrolet',10,1000,'médio','fibra'),(10,'roda aro 15','fiat',4,1000,'médio','metal'),(11,'porta hillux 2021 ld','toyota',4,5000,'médio','metal'),(12,'escape gol 2021','volkswagen',10,500,'médio','metal'),(13,'bico injetor motor 1.6 uno 2020','fiat',5,500,'médio','metal'),(14,'lanterna s10 2020 ld','chevrolet',10,1800,'médio','plastico'),(15,'lanterna s10 2020 le','chevrolet',10,1800,'médio','plastico'),(16,'escape cela 2008','chevrolet',10,500,'médio','metal'),(17,'difusor ar condicionado celta 2011 ld','chevrolet',10,50,'médio','plastico'),(18,'farol civic 2020 le','honda',5,3500,'médio','led'),(19,'grade difusora civic 2021','honda',3,3200,'médio','metal'),(20,'motor 1.8 cruze 2021','chevrolet',1,18500,'grande','metal'),(21,'amortecedor dianteiro gol g6','volkswagen',15,350,'pequeno','metal'),(22,'filtro de ar esportivo uno','fiat',8,120,'pequeno','papel'),(23,'sensor de estacionamento universal','universal',25,80,'pequeno','plástico'),(24,'jogo de tapetes de borracha','universal',20,50,'médio','borracha'),(25,'kit de embreagem celta 2015','chevrolet',5,550,'médio','metal'),(26,'filtro de óleo eco sport','ford',10,25,'pequeno','papel'),(27,'vela de ignição focus 2018','ford',12,12,'pequeno','metal'),(28,'kit correia dentada e tensor','universal',8,180,'médio','borracha'),(29,'retrovisor externo universal','universal',18,90,'médio','plástico'),(30,'calota aro 14','universal',30,15,'pequeno','plástico'),(31,'jogo de tapetes de carpete','universal',25,40,'médio','tecido'),(32,'bateria moura 60Ah','universal',7,280,'médio','metal'),(33,'sensor de oxigênio uno 2019','fiat',10,180,'pequeno','metal'),(34,'pára-brisa gol g5','volkswagen',5,400,'grande','vidro'),(35,'kit de freio a disco dianteiro','universal',8,350,'médio','metal'),(36,'lâmpada halógena h4','universal',15,10,'pequeno','vidro'),(37,'jogo de velas fox 2017','volkswagen',12,50,'pequeno','metal'),(38,'calota aro 15','universal',20,20,'médio','plástico'),(39,'kit de suspensão dianteira','universal',5,600,'médio','metal'),(40,'farol de milha palio 2016','fiat',7,120,'pequeno','vidro'),(41,'sensor de temperatura universal','universal',18,30,'pequeno','metal'),(42,'filtro de combustível civic 2019','honda',10,18,'pequeno','plástico'),(43,'jogo de tapetes de borracha','fiat',15,35,'médio','borracha'),(44,'kit de embreagem focus 2015','ford',8,480,'médio','metal'),(45,'lâmpada LED H7','universal',25,25,'pequeno','led'),(46,'kit de amortecedores traseiros','universal',5,250,'médio','metal'),(47,'bomba dágua uno 2017','fiat',6,60,'pequeno','metal'),(48,'calota aro 13','universal',25,18,'pequeno','plástico'),(49,'parafuso antifurto de roda','universal',20,10,'pequeno','metal'),(50,'filtro de ar condicionado','universal',30,15,'pequeno','plástico');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recebimento`
--

DROP TABLE IF EXISTS `recebimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recebimento` (
  `id_rec` int NOT NULL AUTO_INCREMENT,
  `data_vencimento_rec` date DEFAULT NULL,
  `valor_rec` double DEFAULT NULL,
  `parcela_rec` varchar(100) DEFAULT NULL,
  `status_rec` varchar(100) DEFAULT NULL,
  `forma_recebimento_rec` varchar(100) DEFAULT NULL,
  `data_recebimento_rec` date DEFAULT NULL,
  `id_func_fk` int DEFAULT NULL,
  `id_cai_fk` int DEFAULT NULL,
  `id_vend_fk` int NOT NULL,
  PRIMARY KEY (`id_rec`),
  KEY `id_func_fk` (`id_func_fk`),
  KEY `id_cai_fk` (`id_cai_fk`),
  KEY `id_vend_fk` (`id_vend_fk`),
  CONSTRAINT `recebimento_ibfk_1` FOREIGN KEY (`id_func_fk`) REFERENCES `funcionario` (`id_func`),
  CONSTRAINT `recebimento_ibfk_2` FOREIGN KEY (`id_cai_fk`) REFERENCES `caixa` (`id_cai`),
  CONSTRAINT `recebimento_ibfk_3` FOREIGN KEY (`id_vend_fk`) REFERENCES `venda` (`id_vend`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento`
--

LOCK TABLES `recebimento` WRITE;
/*!40000 ALTER TABLE `recebimento` DISABLE KEYS */;
INSERT INTO `recebimento` VALUES (1,'2022-01-14',454,'1/1','Pago','Dinheiro','2023-02-14',6,1,1),(2,'2022-01-20',4546,'1/2','Pago','Dinheiro','2023-02-20',6,1,2),(3,'2022-01-30',1234.79,'2/2','Pago','Cartão de Crédito','2023-03-30',6,1,3),(4,'2023-03-15',456.7,'1/1','Pago','cartão','2023-03-15',2,1,3),(5,'2023-03-25',789.5,'1/1','Pago','dinheiro','2023-03-25',3,2,1),(6,'2023-04-05',123.45,'1/1','Pago','boleto','2023-04-05',4,3,7),(7,'2023-04-20',654.8,'1/2','Pago','cartão','2023-04-20',5,4,2),(8,'2023-04-30',987.6,'2/2','Pago','dinheiro','2023-04-30',6,5,8);
/*!40000 ALTER TABLE `recebimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `id_serv` int NOT NULL AUTO_INCREMENT,
  `descricao_serv` varchar(300) DEFAULT NULL,
  `tipo_serv` varchar(100) DEFAULT NULL,
  `valor_serv` float NOT NULL,
  `tempo_serv` time DEFAULT NULL,
  PRIMARY KEY (`id_serv`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'funilaria de parachoque traseiro','conserto',350,'04:00:00'),(2,'rebaixar suspensao dianteira carro','estética',400.5,'01:10:00'),(3,'envelopar veiculo com pelicula preto fosco','pintura',1900,'08:00:00'),(4,'trocar volante','conserto',49.99,'00:50:00'),(5,'instalacao de acessório interno','estética',49.99,'00:50:00'),(6,'trocar pneu traseiro','conserto',30.8,'00:30:00'),(7,'instalar jogo de rodas','conserto',100,'00:30:00'),(8,'pintar veículo sedan','pintura',5000,'12:00:00'),(9,'substituição de suspensão dianteira','conserto',299.9,'03:00:00'),(10,'funilaria de parachoque dianteiro','conserto',350,'04:00:00');
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `id_sex` int NOT NULL AUTO_INCREMENT,
  `nome_sex` varchar(100) NOT NULL,
  PRIMARY KEY (`id_sex`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'masculino'),(2,'feminino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id_vend` int NOT NULL AUTO_INCREMENT,
  `data_vend` date DEFAULT NULL,
  `valor_total_vend` double NOT NULL,
  `desconto_vend` double DEFAULT NULL,
  `forma_recebimento_vend` varchar(50) DEFAULT NULL,
  `parcelas_vend` int DEFAULT NULL,
  `id_func_fk` int NOT NULL,
  `id_cli_fk` int NOT NULL,
  PRIMARY KEY (`id_vend`),
  KEY `id_func_fk` (`id_func_fk`),
  KEY `id_cli_fk` (`id_cli_fk`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`id_func_fk`) REFERENCES `funcionario` (`id_func`),
  CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`id_cli_fk`) REFERENCES `cliente` (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,'2019-01-30',454.99,0,'vista',1,2,1),(2,'2019-11-30',4564.99,10.5,'vista',1,2,2),(3,'2022-09-23',500.8,5.8,'vista',1,3,8),(4,'2023-03-05',456.7,10.2,'cartão',1,1,3),(5,'2023-03-18',789.5,5,'dinheiro',1,2,1),(6,'2023-03-28',123.45,8.3,'boleto',1,3,7),(7,'2023-04-12',654.8,15.9,'cartão',2,4,2),(8,'2023-04-22',987.6,7.8,'dinheiro',1,5,8);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-08 11:26:47

-- Exercícios

-- 1. Crie e teste um procedimento para cadastrar um novo Produto e garanta que nenhum produto
-- seja inserido com nome repetido;

delimiter $$
	create procedure novo_produto (nome varchar (300), marca varchar (300), 
	quantidade int, valor double, tamanho varchar (300), tipo varchar (300))
	begin
		declare teste varchar (300);
		set teste = (select descricao_prod from produto where (descricao_prod = nome));
		
		if (teste = '') or (teste is null) then
			insert into produto values (null, nome, marca, quantidade, valor, tamanho, tipo);
			select 'O produto foi salvo com sucesso!' as Confirmacao;
		else
			select 'O produto informado JÁ EXISTE!' as Alerta;
		end if;

	end;$$ 
delimiter ;
call novo_produto('Gol G3', 'VW', 1, 500.50, 'Médio', 'Farol');

-- 2. Crie e teste um procedimento para inserir um novo Cliente e garanta que as chaves estrangeiras
-- informadas realmente existam nas tabelas de origem.
 /*
delimiter $$
create procedure novo_cliente (nome varchar (300), civil varchar (300), cpf varchar (300),
rg varchar (300), nascimento date, renda double, telefone varchar (300), celular varchar (300),
id_sexo int, id_endereco int)
begin
	declare teste_sexo, teste_endereco int;
    declare teste_cpf varchar (300);
    
    set teste_sexo = (select id_sex from sexo where (id_sex = id_sexo));
    set teste_endereco = (select id_end from endereco where (id_end = id_endereco));
    set teste_cpf = (select cpf_cli from cliente where (cpf_cli = cpf));
    
    if (teste_sexo is not null) then
		if (teste_endereco is not null) then
			if (teste_cpf = '') or (teste_cpf is null) then
				insert into cliente values (null, nome, civil, cpf, rg, nascimento, renda, telefone, celular, id_sexo, id_endereco);
				select concat('O cliente ', nome, ' foi salvo com sucesso!') as Confirmacao;
			else
				select 'O CPF informado JÁ EXSITE!'	as Alerta;
			end if;
		else
			select 'O ID de endereço informado NÃO EXISTE!' as Alerta;
		end if;
	else
		select 'O ID de sexo informado NÃO EXISTE!' as Alerta;
	end if;		
end;$$ delimiter ;
*/

call novo_cliente ('Joao Pereira', 'Solteiro', '123.421.111-00
', '123123', '1990-05-01', 5000, 
null, '69 98411 6456', 1, 10);

-- 3. Crie e teste um procedimento para atualizar os dados de um Carro existente, garantindo que todos
-- os atributos sejam preenchidos.

delimiter $$

	create procedure atualizarCarro (id int, modelo varchar(100), cor varchar(100), portas varchar(100), placa varchar(100), marca varchar(100))

	begin 
		if (modelo is not null) and (cor is not null) and (portas is not null) and (placa is not null) and (marca is not null) then
			update carro set modelo_car = modelo, cor_car = cor, portas_car = portas, placa_car = placa, marca_car = marca where id_car = id;
			select 'Carro atualizado' as Confirmacao;
		else
			select 'Algum campo não preenchido'	as Alerta;
		end if;

	end;$$ 
delimiter ;

CALL atualizarCarro(1, 'gol G3 1.6 AP', 'Cinza', '4 portas', 'ABC 1234', 'VW');
CALL atualizarCarro(2, null, 'Cinza', '4 portas', 'ABC 1234', 'VW');

-- 4. Crie e teste um procedimento que retorne por uma variável de saída o número total de 
-- Clientes cadastrados no sistema do mecânica;

delimiter $$
create procedure totalClintes (out total int)
begin
	select count(id_cli) into total from cliente;
end$$
delimiter ; 

CALL totalClintes(@resultado);
SELECT @resultado AS TotalClientes;

-- 5. Crie e teste um procedimento para inserir um novo item da venda. Porém só permita a inserção 
-- se houver estoque no produto de acordo com a quantidade a ser inserida. 

delimiter $$
create procedure inserirItemVenda (quantidade int, valor double, id_produto int, id_venda int)
begin
    declare estoque int;
    
    select quant_prod into estoque 
    from produto 
    where id_prod = id_produto;
    
    if (estoque is null) then
        select 'Produto não encontrado.' as Alerta;
        
    elseif (quantidade > estoque) then
        select CONCAT('Estoque insuficiente! Estoque atual: ', estoque) as Alerta;
        
    else
        insert into itens_venda values (null, quantidade, valor, id_produto, id_venda);
        
        update produto 
        set quant_prod = quant_prod - quantidade
        where id_prod = id_produto;
        
        select 'Item inserido com sucesso!' as Confirmacao;
    end if;
end $$
delimiter ;

-- com estoque suficiente
CALL inserirItemVenda(2, 50.00, 1, 1);

-- sem estoque suficiente
CALL inserirItemVenda(999, 50.00, 1, 1);
-- produto inexistente
CALL inserirItemVenda(1, 50.00, 999, 1);

-- 6. Crie e teste um procedimento para inserir um novo item na compra. Porém você deverá atualizar 
-- o estoque do produto após a inserção. Também deverá atualizar o valor do produto, utilizando como
-- base o valor de compra com um adicional de 75%.

delimiter $$
create procedure inserirItemCompra (quantidade int, valor double, id_produto int, id_compra int)

begin
	declare estoque int;
    declare produto_existe int;
    
    select count(id_prod) into produto_existe from produto where id_prod = id_produto;
    
    if (produto_existe = 0) then
		select 'Erro! Produto não encontrado.' as Alerta;
	else
		insert into itens_compra values (null, quantidade, valor, id_produto, id_compra);
        
        update produto set quant_prod = quant_prod * quantidade
        where id_prod = id_produto;
        
        update produto set valor_prod = valor * 1.75
        where id_prod = id_produto;
        
        SELECT 'Item de compra inserido com sucesso!' AS Confirmacao;
	end if;
end $$
delimiter ;

-- existente
CALL inserirItemCompra(10, 50.00, 1, 1);
-- inexistente
CALL inserirItemCompra(10, 50.00, 999, 1);

-- 7. Crie e teste um procedimento para inserir um novo recebimento. Garanta que somente funcionários
--  do departamento financeira faça o recebimento. Você também deverá adicionar o valor do recebimento
-- ao valor de créditos do caixa e atualizar o saldo final do caixa.

select * from recebimento;

delimiter $$
	create procedure inserirRecebimento (data_vencimento date, valor double, parcela varchar(100), status_ varchar(100),
    forma_recebimento varchar(100), data_recebimento date, id_funcionario int, id_caixa int, id_venda int)
begin
	declare departamento_func int;
    
    select id_dep_fk into departamento_func from funcionario
    where id_func = id_funcionario;
    
    if (departamento_func id null) then
		select 'Erro. Funcionario não encontrado.' as Alerta;
        
	elseif (departamento_func <> 2) then
		select 'Erro! Somente funcionário do departamento financeiro podem realizar recebiemntos.' as Alerta;
	
    else
		insert into recebimento values (null, data_vencimento, valor, parcela, status_, forma_recebimento, data_recebimento,
		id_funcionario, id_caixa, id_venda);
		
        update caixa set valor_creditos_cai = valor_creditos_cai + valor
        where id_cai = id_caixa;
        
		update caixa set saldo_final_cai = saldo_final_cai + valor
        where id_cai = id_caixa;
        
        select 'Recebimento inserido com sucesso!' as Confirmacao;
	end if;
end $$
delimiter ;

call inserirRecebimento('2023-05-01', 500.00, '1/1', 'Pago', 'dinheiro', '2023-05-01', 6, 1, 1);

-- funcionário de outro departamento
call inserirRecebimento('2023-05-01', 500.00, '1/1', 'Pago', 'dinheiro', '2023-05-01', 4, 1, 1);

-- funcionário inexistente
call inserirRecebimento('2023-05-01', 500.00, '1/1', 'Pago', 'dinheiro', '2023-05-01', 999, 1, 1);