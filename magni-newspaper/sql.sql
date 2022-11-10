-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.17-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- tablo yapısı dökülüyor magniv1.magni_newspaper
CREATE TABLE IF NOT EXISTS `magni_newspaper` (
  `firstpage_header` mediumtext DEFAULT NULL,
  `firstpage` mediumtext DEFAULT NULL,
  `firstpagephoto` mediumtext DEFAULT NULL,
  `secondpage_header` mediumtext DEFAULT NULL,
  `secondpage` mediumtext DEFAULT NULL,
  `secondpagephoto` mediumtext DEFAULT NULL,
  `thirdpage_header` mediumtext DEFAULT NULL,
  `thirdpage` mediumtext DEFAULT NULL,
  `thirdpagephoto` mediumtext DEFAULT NULL,
  `time` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- magniv1.magni_newspaper: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `magni_newspaper` DISABLE KEYS */;
INSERT INTO `magni_newspaper` (`firstpage_header`, `firstpage`, `firstpagephoto`, `secondpage_header`, `secondpage`, `secondpagephoto`, `thirdpage_header`, `thirdpage`, `thirdpagephoto`, `time`) VALUES
	('News Header', 'Header Det Header Detail', '', 'News Header', 'Header Det Header Detail', '', 'News Header', 'Header Det Header Detail', '', '6/30/2022');
/*!40000 ALTER TABLE `magni_newspaper` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
