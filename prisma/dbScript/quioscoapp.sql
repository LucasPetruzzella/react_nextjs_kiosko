-- -------------------------------------------------------------
-- TablePlus 5.3.8(500)
--
-- https://tableplus.com/
--
-- Database: quioscoapp
-- Generation Time: 2023-05-31 00:41:38.5370
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `_prisma_migrations`;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Categoria`;
CREATE TABLE `Categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icono` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Orden`;
CREATE TABLE `Orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `pedido` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`pedido`)),
  `completa` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Producto`;
CREATE TABLE `Producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `imagen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoriaId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Producto_categoriaId_fkey` (`categoriaId`),
  CONSTRAINT `Producto_categoriaId_fkey` FOREIGN KEY (`categoriaId`) REFERENCES `Categoria` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('53031a4d-38d2-45ae-a07d-c2e3e2ced429', '2e59e889d9ff498a0ffac67bf5c48830583e7633f18eea79c79621560ac9d45c', '2023-05-31 02:49:32.146', '20230531024931_nueva_col_en_orden', NULL, NULL, '2023-05-31 02:49:31.869', 1),
('862b692c-e07f-48d5-aa1b-521caf331622', '682c4e999835df9e26306d2175b372721d3a2c2f13e3872d40ec693df082ff70', '2023-05-30 03:58:30.460', '20230530035438_ordenes', NULL, NULL, '2023-05-30 03:58:30.358', 1),
('a83aa27a-621b-4d70-beb7-8a43ecde16af', '8b97eb7de68bf067436cc902116c262b0e9a056023c06f5aa7b4a75e1e27b239', '2023-05-30 03:58:30.357', '20230530035226_productos_categorias', NULL, NULL, '2023-05-30 03:58:29.939', 1);

INSERT INTO `Categoria` (`id`, `nombre`, `icono`) VALUES
(1, 'Café', 'cafe'),
(2, 'Hamburguesas', 'hamburguesa'),
(3, 'Pizzas', 'pizza'),
(4, 'Donas', 'dona'),
(5, 'Pasteles', 'pastel'),
(6, 'Galletas', 'galletas'),
(7, 'Café', 'cafe'),
(8, 'Hamburguesas', 'hamburguesa'),
(9, 'Pizzas', 'pizza'),
(10, 'Donas', 'dona'),
(11, 'Pasteles', 'pastel'),
(12, 'Galletas', 'galletas');

INSERT INTO `Orden` (`id`, `nombre`, `fecha`, `total`, `pedido`, `completa`) VALUES
(1, 'lucas', '1685499712672', 1797, '[{\"id\":3,\"nombre\":\"Latte Frio con Chocolate Grande\",\"precio\":549,\"imagen\":\"cafe_03\",\"cantidad\":2},{\"id\":49,\"nombre\":\"Pizza Spicy con Doble Queso\",\"precio\":699,\"imagen\":\"pizzas_01\",\"cantidad\":1}]', 0),
(2, 'Lucas', '1685499771232', 1797, '[{\"id\":3,\"nombre\":\"Latte Frio con Chocolate Grande\",\"precio\":549,\"imagen\":\"cafe_03\",\"cantidad\":2},{\"id\":49,\"nombre\":\"Pizza Spicy con Doble Queso\",\"precio\":699,\"imagen\":\"pizzas_01\",\"cantidad\":1}]', 0),
(3, 'Matias', '1685500113683', 1797, '[{\"id\":3,\"nombre\":\"Latte Frio con Chocolate Grande\",\"precio\":549,\"imagen\":\"cafe_03\",\"cantidad\":2},{\"id\":49,\"nombre\":\"Pizza Spicy con Doble Queso\",\"precio\":699,\"imagen\":\"pizzas_01\",\"cantidad\":1}]', 0);

INSERT INTO `Producto` (`id`, `nombre`, `precio`, `imagen`, `categoriaId`) VALUES
(1, 'Café Caramel con Chocolate', 599, 'cafe_01', 1),
(2, 'Café Frio con Chocolate Grande', 499, 'cafe_02', 1),
(3, 'Latte Frio con Chocolate Grande', 549, 'cafe_03', 1),
(4, 'Latte Frio con Chocolate Grande', 549, 'cafe_04', 1),
(5, 'Malteada Fria con Chocolate Grande', 549, 'cafe_05', 1),
(6, 'Café Mocha Caliente Chico', 399, 'cafe_06', 1),
(7, 'Café Mocha Caliente Grande con Chocolate', 599, 'cafe_07', 1),
(8, 'Café Caliente Capuchino Grande', 599, 'cafe_08', 1),
(9, 'Café Mocha Caliente Mediano', 499, 'cafe_09', 1),
(10, 'Café Mocha Frio con Caramelo Mediano', 499, 'cafe_10', 1),
(11, 'Café Mocha Frio con Chocolate Mediano', 499, 'cafe_11', 1),
(12, 'Café Espresso', 299, 'cafe_12', 1),
(13, 'Café Capuchino Grande con Caramelo', 599, 'cafe_13', 1),
(14, 'Café Caramelo Grande', 599, 'cafe_14', 1),
(15, 'Paquete de 3 donas de Chocolate', 399, 'donas_01', 4),
(16, 'Paquete de 3 donas Glaseadas', 399, 'donas_02', 4),
(17, 'Dona de Fresa ', 199, 'donas_03', 4),
(18, 'Dona con Galleta de Chocolate ', 199, 'donas_04', 4),
(19, 'Dona glass con Chispas Sabor Fresa ', 199, 'donas_05', 4),
(20, 'Dona glass con Chocolate ', 199, 'donas_06', 4),
(21, 'Dona de Chocolate con MÁS Chocolate ', 199, 'donas_07', 4),
(22, 'Paquete de 3 donas de Chocolate ', 399, 'donas_08', 4),
(23, 'Paquete de 3 donas con Vainilla y Chocolate ', 399, 'donas_09', 4),
(24, 'Paquete de 6 Donas', 699, 'donas_10', 4),
(25, 'Paquete de 3 Variadas', 399, 'donas_11', 4),
(26, 'Dona Natural con Chocolate', 199, 'donas_12', 4),
(27, 'Paquete de 3 Donas de Chocolate con Chispas', 399, 'donas_13', 4),
(28, 'Dona Chocolate y Coco', 199, 'donas_14', 4),
(29, 'Paquete Galletas de Chocolate', 299, 'galletas_01', 6),
(30, 'Paquete Galletas de Chocolate y Avena', 399, 'galletas_02', 6),
(31, 'Paquete de Muffins de Vainilla', 399, 'galletas_03', 6),
(32, 'Paquete de 4 Galletas de Avena', 249, 'galletas_04', 6),
(33, 'Galletas de Mantequilla Variadas', 399, 'galletas_05', 6),
(34, 'Galletas de sabores frutales', 399, 'galletas_06', 6),
(35, 'Hamburguesa Sencilla', 599, 'hamburguesas_01', 2),
(36, 'Hamburguesa de Pollo', 599, 'hamburguesas_02', 2),
(37, 'Hamburguesa de Pollo y Chili', 599, 'hamburguesas_03', 2),
(38, 'Hamburguesa Queso y Pepinos', 599, 'hamburguesas_04', 2),
(39, 'Hamburguesa Cuarto de Libra', 599, 'hamburguesas_05', 2),
(40, 'Hamburguesa Doble Queso', 699, 'hamburguesas_06', 2),
(41, 'Hot Dog Especial', 499, 'hamburguesas_07', 2),
(42, 'Paquete 2 Hot Dogs', 699, 'hamburguesas_08', 2),
(43, '4 Rebanadas de Pay de Queso', 699, 'pastel_01', 5),
(44, 'Waffle Especial', 499, 'pastel_02', 5),
(45, 'Croissants De la casa', 399, 'pastel_03', 5),
(46, 'Pay de Queso', 199, 'pastel_04', 5),
(47, 'Pastel de Chocolate', 299, 'pastel_05', 5),
(48, 'Rebanada Pastel de Chocolate', 299, 'pastel_06', 5),
(49, 'Pizza Spicy con Doble Queso', 699, 'pizzas_01', 3),
(50, 'Pizza Jamón y Queso', 699, 'pizzas_02', 3),
(51, 'Pizza Doble Queso', 699, 'pizzas_03', 3),
(52, 'Pizza Especial de la Casa', 699, 'pizzas_04', 3),
(53, 'Pizza Chorizo', 699, 'pizzas_05', 3),
(54, 'Pizza Hawaiana', 699, 'pizzas_06', 3),
(55, 'Pizza Tocino', 699, 'pizzas_07', 3),
(56, 'Pizza Vegetales y Queso', 699, 'pizzas_08', 3),
(57, 'Pizza Pepperoni y Queso', 699, 'pizzas_09', 3),
(58, 'Pizza Aceitunas y Queso', 699, 'pizzas_10', 3),
(59, 'Pizza Queso, Jamón y Champiñones', 699, 'pizzas_11', 3),
(60, 'Café Caramel con Chocolate', 599, 'cafe_01', 1),
(61, 'Café Frio con Chocolate Grande', 499, 'cafe_02', 1),
(62, 'Latte Frio con Chocolate Grande', 549, 'cafe_03', 1),
(63, 'Latte Frio con Chocolate Grande', 549, 'cafe_04', 1),
(64, 'Malteada Fria con Chocolate Grande', 549, 'cafe_05', 1),
(65, 'Café Mocha Caliente Chico', 399, 'cafe_06', 1),
(66, 'Café Mocha Caliente Grande con Chocolate', 599, 'cafe_07', 1),
(67, 'Café Caliente Capuchino Grande', 599, 'cafe_08', 1),
(68, 'Café Mocha Caliente Mediano', 499, 'cafe_09', 1),
(69, 'Café Mocha Frio con Caramelo Mediano', 499, 'cafe_10', 1),
(70, 'Café Mocha Frio con Chocolate Mediano', 499, 'cafe_11', 1),
(71, 'Café Espresso', 299, 'cafe_12', 1),
(72, 'Café Capuchino Grande con Caramelo', 599, 'cafe_13', 1),
(73, 'Café Caramelo Grande', 599, 'cafe_14', 1),
(74, 'Paquete de 3 donas de Chocolate', 399, 'donas_01', 4),
(75, 'Paquete de 3 donas Glaseadas', 399, 'donas_02', 4),
(76, 'Dona de Fresa ', 199, 'donas_03', 4),
(77, 'Dona con Galleta de Chocolate ', 199, 'donas_04', 4),
(78, 'Dona glass con Chispas Sabor Fresa ', 199, 'donas_05', 4),
(79, 'Dona glass con Chocolate ', 199, 'donas_06', 4),
(80, 'Dona de Chocolate con MÁS Chocolate ', 199, 'donas_07', 4),
(81, 'Paquete de 3 donas de Chocolate ', 399, 'donas_08', 4),
(82, 'Paquete de 3 donas con Vainilla y Chocolate ', 399, 'donas_09', 4),
(83, 'Paquete de 6 Donas', 699, 'donas_10', 4),
(84, 'Paquete de 3 Variadas', 399, 'donas_11', 4),
(85, 'Dona Natural con Chocolate', 199, 'donas_12', 4),
(86, 'Paquete de 3 Donas de Chocolate con Chispas', 399, 'donas_13', 4),
(87, 'Dona Chocolate y Coco', 199, 'donas_14', 4),
(88, 'Paquete Galletas de Chocolate', 299, 'galletas_01', 6),
(89, 'Paquete Galletas de Chocolate y Avena', 399, 'galletas_02', 6),
(90, 'Paquete de Muffins de Vainilla', 399, 'galletas_03', 6),
(91, 'Paquete de 4 Galletas de Avena', 249, 'galletas_04', 6),
(92, 'Galletas de Mantequilla Variadas', 399, 'galletas_05', 6),
(93, 'Galletas de sabores frutales', 399, 'galletas_06', 6),
(94, 'Hamburguesa Sencilla', 599, 'hamburguesas_01', 2),
(95, 'Hamburguesa de Pollo', 599, 'hamburguesas_02', 2),
(96, 'Hamburguesa de Pollo y Chili', 599, 'hamburguesas_03', 2),
(97, 'Hamburguesa Queso y Pepinos', 599, 'hamburguesas_04', 2),
(98, 'Hamburguesa Cuarto de Libra', 599, 'hamburguesas_05', 2),
(99, 'Hamburguesa Doble Queso', 699, 'hamburguesas_06', 2),
(100, 'Hot Dog Especial', 499, 'hamburguesas_07', 2),
(101, 'Paquete 2 Hot Dogs', 699, 'hamburguesas_08', 2),
(102, '4 Rebanadas de Pay de Queso', 699, 'pastel_01', 5),
(103, 'Waffle Especial', 499, 'pastel_02', 5),
(104, 'Croissants De la casa', 399, 'pastel_03', 5),
(105, 'Pay de Queso', 199, 'pastel_04', 5),
(106, 'Pastel de Chocolate', 299, 'pastel_05', 5),
(107, 'Rebanada Pastel de Chocolate', 299, 'pastel_06', 5),
(108, 'Pizza Spicy con Doble Queso', 699, 'pizzas_01', 3),
(109, 'Pizza Jamón y Queso', 699, 'pizzas_02', 3),
(110, 'Pizza Doble Queso', 699, 'pizzas_03', 3),
(111, 'Pizza Especial de la Casa', 699, 'pizzas_04', 3),
(112, 'Pizza Chorizo', 699, 'pizzas_05', 3),
(113, 'Pizza Hawaiana', 699, 'pizzas_06', 3),
(114, 'Pizza Tocino', 699, 'pizzas_07', 3),
(115, 'Pizza Vegetales y Queso', 699, 'pizzas_08', 3),
(116, 'Pizza Pepperoni y Queso', 699, 'pizzas_09', 3),
(117, 'Pizza Aceitunas y Queso', 699, 'pizzas_10', 3),
(118, 'Pizza Queso, Jamón y Champiñones', 699, 'pizzas_11', 3);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;