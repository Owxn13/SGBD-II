-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-11-2024 a las 13:52:53
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cadena_hoteles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cadena_hotelera`
--

CREATE TABLE `cadena_hotelera` (
  `id_cadena` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `sede_central` varchar(200) DEFAULT NULL,
  `anio_fundacion` int DEFAULT NULL,
  `sitio_web` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cadena_hotelera`
--

INSERT INTO `cadena_hotelera` (`id_cadena`, `nombre`, `sede_central`, `anio_fundacion`, `sitio_web`, `telefono`) VALUES
(1, 'Marriott International', 'Bethesda, Maryland, USA', 1927, 'www.marriott.com', '+1-301-380-1000'),
(2, 'Hilton Worldwide', 'McLean, Virginia, USA', 1919, 'www.hilton.com', '+1-703-883-2000'),
(3, 'Hyatt Hotels Corporation', 'Chicago, Illinois, USA', 1957, 'www.hyatt.com', '+1-312-750-3000'),
(4, 'InterContinental Hotels Group', 'Londres, Reino Unido', 1777, 'www.ihg.com', '+44-1895-512000'),
(5, 'AccorHotels', 'París, Francia', 1967, 'www.accor.com', '+33-1-45-38-5000'),
(6, 'NH Hotel Group', 'Madrid, España', 1978, 'www.nh-hotels.com', '+34-91-451-8000'),
(7, 'Meliá Hotels International', 'Palma de Mallorca, España', 1956, 'www.melia.com', '+34-971-224-9000'),
(8, 'Barceló Hotel Group', 'Palma de Mallorca, España', 1931, 'www.barcelo.com', '+34-971-771-700'),
(9, 'RIU Hotels & Resorts', 'Palma de Mallorca, España', 1953, 'www.riu.com', '+34-971-743-030'),
(10, 'Mandarin Oriental Hotel Group', 'Hong Kong, China', 1963, 'www.mandarinoriental.com', '+852-2522-0111'),
(11, 'Four Seasons Hotels', 'Toronto, Canadá', 1960, 'www.fourseasons.com', '+1-416-449-1750'),
(12, 'Rosewood Hotels', 'Hong Kong, China', 1979, 'www.rosewoodhotels.com', '+852-2138-2222'),
(13, 'Peninsula Hotels', 'Hong Kong, China', 1928, 'www.peninsula.com', '+852-2920-2888'),
(14, 'Shangri-La Hotels', 'Hong Kong, China', 1971, 'www.shangri-la.com', '+852-2877-2999'),
(15, 'Kempinski Hotels', 'Ginebra, Suiza', 1897, 'www.kempinski.com', '+41-22-809-5000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `email`, `telefono`, `direccion`, `nacionalidad`) VALUES
(1, 'Juan', 'Pérez García', 'juan.perez@email.com', '+51-995-123-001', 'Av. Arequipa 123, Lima', 'Peruana'),
(2, 'María', 'González López', 'maria.gonzalez@email.com', '+51-995-123-002', 'Jr. de la Unión 456, Lima', 'Peruana'),
(3, 'John', 'Smith Brown', 'john.smith@email.com', '+1-212-555-001', '123 Main St, New York', 'Estadounidense'),
(4, 'Emma', 'Wilson Taylor', 'emma.wilson@email.com', '+44-20-7123-001', '45 London Road, London', 'Británica'),
(5, 'Carlos', 'López Mendoza', 'carlos.lopez@email.com', '+51-995-123-003', 'Calle Real 789, Cusco', 'Peruana'),
(6, 'Ana', 'Torres Vega', 'ana.torres@email.com', '+51-995-123-004', 'Av. La Marina 567, Lima', 'Peruana'),
(7, 'Luis', 'Rodríguez Castro', 'luis.rodriguez@email.com', '+51-995-123-005', 'Jr. Huallaga 321, Lima', 'Peruana'),
(8, 'Sophie', 'Martin Bernard', 'sophie.martin@email.com', '+33-1-4040-001', '15 Rue de Paris, París', 'Francesa'),
(9, 'Hans', 'Mueller Weber', 'hans.mueller@email.com', '+49-30-2020-001', 'Berliner Str. 100, Berlín', 'Alemana'),
(10, 'Akiko', 'Tanaka Sato', 'akiko.tanaka@email.com', '+81-3-5555-001', '1-1 Shibuya, Tokyo', 'Japonesa'),
(11, 'Roberto', 'Silva Santos', 'roberto.silva@email.com', '+55-11-3030-001', 'Rua Augusta 789, São Paulo', 'Brasileña'),
(12, 'Elena', 'Popov Ivanova', 'elena.popov@email.com', '+7-495-4040-001', 'Tverskaya St 10, Moscú', 'Rusa'),
(13, 'Mohammed', 'Al-Sayed', 'mohammed.alsayed@email.com', '+971-4-5050-001', 'Sheikh Zayed Rd, Dubai', 'Emiratí'),
(14, 'Isabella', 'Rossi Conti', 'isabella.rossi@email.com', '+39-06-6060-001', 'Via Roma 123, Roma', 'Italiana'),
(15, 'Diego', 'Martínez Ruiz', 'diego.martinez@email.com', '+34-91-7070-001', 'Calle Mayor 45, Madrid', 'Española');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `id_habitacion` int NOT NULL,
  `id_hotel` int DEFAULT NULL,
  `id_tipo` int DEFAULT NULL,
  `codigo_habitacion` varchar(10) NOT NULL,
  `piso` int DEFAULT NULL,
  `estado_actual` enum('disponible','ocupada','mantenimiento') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`id_habitacion`, `id_hotel`, `id_tipo`, `codigo_habitacion`, `piso`, `estado_actual`) VALUES
(1, 1, 1, 'MLM-101', 1, 'disponible'),
(2, 1, 2, 'MLM-102', 1, 'ocupada'),
(3, 1, 3, 'MLM-103', 1, 'disponible'),
(4, 2, 1, 'MCU-101', 1, 'disponible'),
(5, 2, 2, 'MCU-102', 1, 'ocupada'),
(6, 2, 3, 'MCU-103', 1, 'mantenimiento'),
(7, 3, 1, 'HLM-101', 1, 'disponible'),
(8, 3, 2, 'HLM-102', 1, 'ocupada'),
(9, 3, 3, 'HLM-103', 1, 'disponible'),
(10, 4, 1, 'HAQ-101', 1, 'disponible'),
(11, 4, 2, 'HAQ-102', 1, 'ocupada'),
(12, 4, 3, 'HAQ-103', 1, 'disponible'),
(13, 5, 1, 'HCL-101', 1, 'mantenimiento'),
(14, 5, 2, 'HCL-102', 1, 'disponible'),
(15, 5, 3, 'HCL-103', 1, 'ocupada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int NOT NULL,
  `id_cadena` int DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id_hotel`, `id_cadena`, `nombre`, `direccion`, `ciudad`, `telefono`, `email`) VALUES
(1, 1, 'Marriott Lima Miraflores', 'Malecón de la Reserva 615', 'Lima', '+51-1-217-7000', 'lima.miraflores@marriott.com'),
(2, 1, 'Marriott Cusco', 'Plazoleta Santo Domingo 259', 'Cusco', '+51-84-582-200', 'cusco@marriott.com'),
(3, 2, 'Hilton Lima', 'Av. La Paz 1099', 'Lima', '+51-1-200-8000', 'lima@hilton.com'),
(4, 2, 'Hilton Arequipa', 'Av. Bolognesi 355', 'Arequipa', '+51-54-381-200', 'arequipa@hilton.com'),
(5, 3, 'Hyatt Centric Lima', 'Av. Jorge Basadre 367', 'Lima', '+51-1-611-1234', 'lima.centric@hyatt.com'),
(6, 3, 'Hyatt Trujillo', 'Jr. Pizarro 978', 'Trujillo', '+51-44-611-1234', 'trujillo@hyatt.com'),
(7, 4, 'InterContinental Lima', 'Av. Javier Prado Este 750', 'Lima', '+51-1-319-1000', 'lima@intercontinental.com'),
(8, 4, 'InterContinental Piura', 'Av. Loreto 940', 'Piura', '+51-73-319-1000', 'piura@intercontinental.com'),
(9, 5, 'Novotel Lima', 'Av. Victor Andrés Belaúnde 198', 'Lima', '+51-1-315-9999', 'lima@novotel.com'),
(10, 5, 'Novotel Cusco', 'San Agustín 239', 'Cusco', '+51-84-315-9999', 'cusco@novotel.com'),
(11, 6, 'NH Lima', 'Av. 28 de Julio 511', 'Lima', '+51-1-640-1200', 'lima@nh-hotels.com'),
(12, 6, 'NH Trujillo', 'Jr. Independencia 485', 'Trujillo', '+51-44-640-1200', 'trujillo@nh-hotels.com'),
(13, 7, 'Meliá Lima', 'Av. Salaverry 2599', 'Lima', '+51-1-411-9000', 'lima@melia.com'),
(14, 7, 'Meliá Arequipa', 'Plaza Mayor 100', 'Arequipa', '+51-54-411-9000', 'arequipa@melia.com'),
(15, 8, 'Barceló Lima', 'Av. 28 de Julio 151', 'Lima', '+51-1-615-8000', 'lima@barcelo.com'),
(16, 8, 'Barceló Iquitos', 'Jr. Próspero 632', 'Iquitos', '+51-65-615-8000', 'iquitos@barcelo.com'),
(17, 9, 'RIU Plaza Lima', 'Av. Larco 1275', 'Lima', '+51-1-213-9400', 'lima@riu.com'),
(18, 9, 'RIU Cusco', 'Av. Infancia 279', 'Cusco', '+51-84-213-9400', 'cusco@riu.com'),
(19, 10, 'Mandarin Oriental Lima', 'Calle Los Libertadores 490', 'Lima', '+51-1-630-3800', 'lima@mandarinoriental.com'),
(20, 10, 'Mandarin Oriental Paracas', 'Av. Paracas 1223', 'Paracas', '+51-56-630-3800', 'paracas@mandarinoriental.com'),
(21, 11, 'Four Seasons Lima', 'Av. Pedro de Osma 123', 'Lima', '+51-1-630-3500', 'lima@fourseasons.com'),
(22, 11, 'Four Seasons Sacred Valley', 'Carretera Urubamba-Ollantaytambo Km. 5', 'Urubamba', '+51-84-630-3500', 'sacredvalley@fourseasons.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_base`
--

CREATE TABLE `precio_base` (
  `id_precio` int NOT NULL,
  `id_hotel` int NOT NULL,
  `id_tipo` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_vigencia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `precio_base`
--

INSERT INTO `precio_base` (`id_precio`, `id_hotel`, `id_tipo`, `precio`, `fecha_vigencia`) VALUES
(1, 1, 1, 150.00, '2024-01-01'),
(2, 1, 2, 250.00, '2024-01-01'),
(3, 1, 3, 450.00, '2024-01-01'),
(4, 2, 1, 130.00, '2024-01-01'),
(5, 2, 2, 230.00, '2024-01-01'),
(6, 2, 3, 430.00, '2024-01-01'),
(7, 3, 1, 140.00, '2024-01-01'),
(8, 3, 2, 240.00, '2024-01-01'),
(9, 3, 3, 440.00, '2024-01-01'),
(10, 4, 1, 120.00, '2024-01-01'),
(11, 4, 2, 220.00, '2024-01-01'),
(12, 4, 3, 420.00, '2024-01-01'),
(13, 5, 1, 160.00, '2024-01-01'),
(14, 5, 2, 260.00, '2024-01-01'),
(15, 5, 3, 460.00, '2024-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacion`
--

CREATE TABLE `reservacion` (
  `id_reservacion` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_habitacion` int DEFAULT NULL,
  `fecha_entrada` date DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `estado` enum('confirmada','cancelada','completada') DEFAULT NULL,
  `numero_huespedes` int DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `fecha_reservacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reservacion`
--

INSERT INTO `reservacion` (`id_reservacion`, `id_cliente`, `id_habitacion`, `fecha_entrada`, `fecha_salida`, `estado`, `numero_huespedes`, `metodo_pago`, `fecha_reservacion`) VALUES
(1, 1, 2, '2024-03-15', '2024-03-20', 'confirmada', 2, 'tarjeta', '2024-02-15'),
(2, 2, 5, '2024-03-18', '2024-03-22', 'confirmada', 2, 'efectivo', '2024-02-20'),
(3, 3, 8, '2024-03-20', '2024-03-25', 'completada', 2, 'tarjeta', '2024-02-25'),
(4, 4, 11, '2024-04-01', '2024-04-05', 'confirmada', 1, 'tarjeta', '2024-03-01'),
(5, 5, 14, '2024-04-10', '2024-04-15', 'cancelada', 2, 'transferencia', '2024-03-05'),
(6, 6, 2, '2024-04-20', '2024-04-22', 'confirmada', 2, 'tarjeta', '2024-03-10'),
(7, 7, 5, '2024-05-01', '2024-05-05', 'confirmada', 2, 'efectivo', '2024-03-15'),
(8, 8, 8, '2024-05-10', '2024-05-15', 'confirmada', 1, 'tarjeta', '2024-03-20'),
(9, 9, 11, '2024-05-20', '2024-05-25', 'confirmada', 2, 'transferencia', '2024-03-25'),
(10, 10, 14, '2024-06-01', '2024-06-05', 'cancelada', 2, 'tarjeta', '2024-04-01'),
(11, 11, 2, '2024-06-10', '2024-06-15', 'confirmada', 2, 'efectivo', '2024-04-05'),
(12, 12, 5, '2024-06-20', '2024-06-25', 'confirmada', 1, 'tarjeta', '2024-04-10'),
(13, 13, 8, '2024-07-01', '2024-07-05', 'confirmada', 2, 'transferencia', '2024-04-15'),
(14, 14, 11, '2024-07-10', '2024-07-15', 'cancelada', 2, 'tarjeta', '2024-04-20'),
(15, 15, 14, '2024-07-20', '2024-07-25', 'confirmada', 2, 'efectivo', '2024-04-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_habitacion`
--

CREATE TABLE `tipo_habitacion` (
  `id_tipo` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `capacidad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo_habitacion`
--

INSERT INTO `tipo_habitacion` (`id_tipo`, `nombre`, `descripcion`, `capacidad`) VALUES
(1, 'Individual', 'Habitación con una cama individual, baño privado, TV, wifi y servicios básicos', 1),
(2, 'Doble', 'Habitación con una cama matrimonial o dos individuales, baño privado, TV, wifi y servicios estándar', 2),
(3, 'Suite', 'Suite de lujo con sala de estar, dormitorio separado, baño premium y servicios exclusivos', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cadena_hotelera`
--
ALTER TABLE `cadena_hotelera`
  ADD PRIMARY KEY (`id_cadena`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`id_habitacion`),
  ADD UNIQUE KEY `habitacion_unica` (`id_hotel`,`codigo_habitacion`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_hotel`),
  ADD KEY `id_cadena` (`id_cadena`);

--
-- Indices de la tabla `precio_base`
--
ALTER TABLE `precio_base`
  ADD PRIMARY KEY (`id_precio`),
  ADD UNIQUE KEY `precio_unico` (`id_hotel`,`id_tipo`,`fecha_vigencia`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD PRIMARY KEY (`id_reservacion`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- Indices de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cadena_hotelera`
--
ALTER TABLE `cadena_hotelera`
  MODIFY `id_cadena` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  MODIFY `id_habitacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id_hotel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `precio_base`
--
ALTER TABLE `precio_base`
  MODIFY `id_precio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `reservacion`
--
ALTER TABLE `reservacion`
  MODIFY `id_reservacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  MODIFY `id_tipo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`),
  ADD CONSTRAINT `habitacion_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_habitacion` (`id_tipo`);

--
-- Filtros para la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`id_cadena`) REFERENCES `cadena_hotelera` (`id_cadena`);

--
-- Filtros para la tabla `precio_base`
--
ALTER TABLE `precio_base`
  ADD CONSTRAINT `precio_base_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`),
  ADD CONSTRAINT `precio_base_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_habitacion` (`id_tipo`);

--
-- Filtros para la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `reservacion_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id_habitacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
