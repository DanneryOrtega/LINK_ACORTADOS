-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.5.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para url
CREATE DATABASE IF NOT EXISTS `url` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `url`;

-- Volcando estructura para tabla url.url
CREATE TABLE IF NOT EXISTS `url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url_recortada` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `usuario_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_url_usuario` (`usuario_id`),
  CONSTRAINT `fk_url_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla url.url: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `url` DISABLE KEYS */;
INSERT INTO `url` (`id`, `url_recortada`, `url`, `usuario_id`) VALUES
	(1, 'dik5', 'https://m.youtube.com/watch?v=MvmXyYAoQYI', NULL),
	(2, '6tz1', 'https://m.youtube.com/watch?v=MvmXyYAoQYI', NULL),
	(3, 'y6vo', 'https://es.scribd.com/document/97870756/Fuentes-Dependientes', NULL),
	(4, '64x2', 'https://es.scribd.com/doc/92515006/Resistencias-en-Serie-y-en-Paralelo', NULL),
	(5, 'myfy', 'https://es.scribd.com/doc/248738432/El-Libro-Negro-Del-Emprendedor', NULL),
	(6, 'oñ5r', 'https://m.youtube.com/watch?v=MvmXyYAoQYI', NULL),
	(9, '77k2', 'https://es.scribd.com/doc/248738432/El-Libro-Negro-Del-Emprendedor', 4),
	(10, 'du42', 'https://virtual.itp.edu.co/login/index.php', 2),
	(11, 'u0añ', 'https://www.diagrams.net/', 2);
/*!40000 ALTER TABLE `url` ENABLE KEYS */;

-- Volcando estructura para tabla url.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `confirmacion` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla url.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `confirmacion`) VALUES
	(2, 'Nayeli Ortega', 'dannery19ortega18@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1),
	(3, 'Nayeli Ortega', 'arnoldo68@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL),
	(4, 'Nayeli Ortega', 'musicadejustin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
