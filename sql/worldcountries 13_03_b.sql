-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2025 at 03:37 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `worldcountries`
--

-- --------------------------------------------------------

--
-- Table structure for table `continent`
--

CREATE TABLE `continent` (
  `continent_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `area` decimal(10,2) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `continent`
--

INSERT INTO `continent` (`continent_id`, `name`, `area`, `description`) VALUES
(1, 'Asia', '43.40', 'The largest continent, located in the Eastern Hemisphere. It is characterized by a variety of terrain, including the highest mountain ranges in the world (the Himalayas, Tibet), vast plains and deserts'),
(2, 'Africa', '30.30', 'The second largest continent, located mainly in the Eastern Hemisphere. It has a hot climate, vast deserts (Sahara) and savannas, as well as rich wildlife'),
(3, 'North America', '24.71', 'The third largest continent, stretching from the Arctic to the tropics. It includes a variety of landscapes: from tundra to tropical forests, with large mountain ranges (Cordillera) and vast plains'),
(4, 'South America', '17.84', 'The fourth largest continent, characterized by the Andes in the west, vast plains (pampas) and the worlds largest tropical forest (Amazonia). The length from north to south is 7,500 km'),
(5, 'Europe', '10.00', 'The western part of Eurasia, characterized by a diverse relief, including mountain ranges (Alps, Carpathians) and vast plains. It has a highly indented coastline'),
(6, 'Australia+Oceania', '8.52', 'Australia is an inland country occupying the entire territory, as well as the island of Tasmania and adjacent islands. Situated in the southern and eastern hemispheres, it is washed by the seas of the Pacific and Indian Oceans. It is characterized by a diverse climate: from subequatorial in the north to moderate in the south. Oceania is the worlds largest cluster of islands in the southwestern and central parts of the Pacific Ocean. It includes thousands of islands and atolls scattered across beautiful waters. The islands of Oceania are located exclusively in equatorial, subequatorial and tropical latitudes.'),
(7, 'Antarctica', '14.10', 'The southernmost continent, almost entirely covered by an ice sheet (about 98% of the surface). The average thickness of the ice is about 1.9 km, reaching 4.8 km in some places. The continent contains about 90% of the worlds ice and 70% of the Earths fresh water. There are no permanent settlements or states on the territory of Antarctica. The continent is used exclusively for peaceful purposes, mainly for scientific research. The territorial claims of some countries to parts of Antarctica are frozen, and the continent is de facto divided into zones of scientific interest of various states that maintain research stations there.');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  `capital` varchar(50) DEFAULT NULL,
  `population` decimal(10,2) DEFAULT NULL,
  `country_area` decimal(10,2) DEFAULT NULL,
  `country_date` date DEFAULT NULL,
  `official_language` varchar(50) DEFAULT NULL,
  `continent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`, `capital`, `population`, `country_area`, `country_date`, `official_language`, `continent_id`) VALUES
(37, 'Afghanistan', 'Kabul', '38.93', '0.65', '1919-08-19', 'Pashto, Dari', 1),
(38, 'Albania', 'Tirana', '2.88', '0.03', '1912-11-28', 'Albanian', 5),
(39, 'Algeria', 'Algiers', '44.62', '2.38', '1962-07-05', 'Arabic', 2),
(40, 'Andorra', 'Andorra la Vella', '0.08', '0.00', '1278-09-08', 'Catalan', 5),
(41, 'Angola', 'Luanda', '32.87', '1.25', '1975-11-11', 'Portuguese', 2),
(42, 'Antigua and Barbuda', 'Saint John\'s', '0.10', '0.00', '1981-11-01', 'English', 3),
(43, 'Argentina', 'Buenos Aires', '45.38', '2.78', '1816-07-09', 'Spanish', 4),
(44, 'Armenia', 'Yerevan', '2.96', '0.03', '1991-09-21', 'Armenian', 1),
(45, 'Australia', 'Canberra', '25.69', '7.69', '1901-01-01', 'English', 6),
(46, 'Austria', 'Vienna', '9.01', '0.08', '1955-10-26', 'German', 5),
(47, 'Azerbaijan', 'Baku', '10.14', '0.09', '1991-08-30', 'Azerbaijani', 1),
(48, 'Bahamas', 'Nassau', '0.39', '0.01', '1973-07-10', 'English', 3),
(49, 'Bahrain', 'Manama', '1.70', '0.00', '1971-08-15', 'Arabic', 1),
(50, 'Bangladesh', 'Dhaka', '164.69', '0.15', '1971-03-26', 'Bengali', 1),
(51, 'Barbados', 'Bridgetown', '0.29', '0.00', '1966-11-30', 'English', 3),
(52, 'Belarus', 'Minsk', '9.40', '0.21', '1991-08-25', 'Belarusian, Russian', 5),
(53, 'Belgium', 'Brussels', '11.59', '0.03', '1830-10-04', 'Dutch, French, German', 5),
(54, 'Belize', 'Belmopan', '0.40', '0.02', '1981-09-21', 'English', 3),
(55, 'Benin', 'Porto-Novo', '12.12', '0.11', '1960-08-01', 'French', 2),
(56, 'Bhutan', 'Thimphu', '0.77', '0.04', '1907-12-17', 'Dzongkha', 1),
(57, 'Bolivia', 'Sucre', '11.67', '1.10', '1825-08-06', 'Spanish', 4),
(58, 'Bosnia and Herzegovina', 'Sarajevo', '3.28', '0.05', '1992-03-01', 'Bosnian, Croatian, Serbian', 5),
(59, 'Botswana', 'Gaborone', '2.35', '0.58', '1966-09-30', 'English, Tswana', 2),
(60, 'Brazil', 'Brasília', '212.56', '8.52', '1822-09-07', 'Portuguese', 4),
(61, 'Brunei', 'Bandar Seri Begawan', '0.44', '0.01', '1984-01-01', 'Malay', 1),
(62, 'Bulgaria', 'Sofia', '6.95', '0.11', '1908-09-22', 'Bulgarian', 5),
(63, 'Burkina Faso', 'Ouagadougou', '20.90', '0.27', '1960-08-05', 'French', 2),
(64, 'Burundi', 'Gitega', '11.89', '0.03', '1962-07-01', 'Kirundi, French', 2),
(65, 'Cambodia', 'Phnom Penh', '16.72', '0.18', '1953-11-09', 'Khmer', 1),
(66, 'Cameroon', 'Yaounde', '26.55', '0.48', '1960-01-01', 'French, English', 2),
(67, 'Canada', 'Ottawa', '37.74', '9.99', '1867-07-01', 'English, French', 3),
(68, 'Cape Verde', 'Praia', '0.56', '0.00', '1975-07-05', 'Portuguese', 2),
(69, 'Central African Republic', 'Bangui', '4.83', '0.62', '1960-08-13', 'Sango, French', 2),
(70, 'Chad', 'N\'Djamena', '16.43', '1.28', '1960-08-11', 'Arabic, French', 2),
(71, 'Chile', 'Santiago', '19.12', '0.76', '1810-09-18', 'Spanish', 4),
(72, 'China', 'Beijing', '1439.32', '9.60', '1949-10-01', 'Chinese', 1),
(73, 'Colombia', 'Bogotá', '50.88', '1.14', '1810-07-20', 'Spanish', 4),
(74, 'Comoros', 'Moroni', '0.87', '0.00', '1975-07-06', 'Comorian, Arabic, French', 2),
(75, 'Congo', 'Brazzaville', '5.52', '0.34', '1960-08-15', 'French', 2),
(76, 'Costa Rica', 'San José', '5.09', '0.05', '1821-09-15', 'Spanish', 3),
(77, 'Croatia', 'Zagreb', '4.05', '0.06', '1991-06-25', 'Croatian', 5),
(78, 'Cuba', 'Havana', '11.33', '0.11', '1902-05-20', 'Spanish', 3),
(79, 'Cyprus', 'Nicosia', '1.21', '0.01', '1960-08-16', 'Greek, Turkish', 5),
(80, 'Czech Republic', 'Prague', '10.71', '0.08', '1993-01-01', 'Czech', 5),
(81, 'Democratic Republic of the Congo', 'Kinshasa', '89.56', '2.35', '1960-06-30', 'French', 2),
(82, 'Denmark', 'Copenhagen', '5.79', '0.04', '0965-12-25', 'Danish', 5),
(83, 'Djibouti', 'Djibouti', '0.99', '0.02', '1977-06-27', 'Arabic, French', 2),
(84, 'Dominica', 'Roseau', '0.07', '0.00', '1978-11-03', 'English', 3),
(85, 'Dominican Republic', 'Santo Domingo', '10.85', '0.05', '1844-02-27', 'Spanish', 3),
(86, 'East Timor', 'Dili', '1.32', '0.02', '2002-05-20', 'Tetum, Portuguese', 1),
(87, 'Ecuador', 'Quito', '17.64', '0.28', '1809-08-10', 'Spanish', 4),
(88, 'Egypt', 'Cairo', '102.33', '1.00', '1922-02-28', 'Arabic', 2),
(89, 'El Salvador', 'San Salvador', '6.49', '0.02', '1821-09-15', 'Spanish', 3),
(90, 'Equatorial Guinea', 'Malabo', '1.40', '0.03', '1968-10-12', 'Spanish, French, Portuguese', 2),
(91, 'Eritrea', 'Asmara', '3.55', '0.12', '1993-05-24', 'Tigrinya, Arabic, English', 2),
(92, 'Estonia', 'Tallinn', '1.33', '0.05', '1991-08-20', 'Estonian', 5),
(93, 'Eswatini', 'Mbabane', '1.16', '0.02', '1968-09-06', 'Swazi, English', 2),
(94, 'Ethiopia', 'Addis Ababa', '114.96', '1.10', '1941-05-05', 'Amharic', 2),
(95, 'Fiji', 'Suva', '0.90', '0.02', '1970-10-10', 'English, Fijian, Fiji Hindi', 6),
(96, 'Finland', 'Helsinki', '5.53', '0.34', '1917-12-06', 'Finnish, Swedish', 5),
(97, 'France', 'Paris', '67.39', '0.64', '0843-08-10', 'French', 5),
(98, 'Gabon', 'Libreville', '2.23', '0.27', '1960-08-17', 'French', 2),
(99, 'Gambia', 'Banjul', '2.42', '0.01', '1965-02-18', 'English', 2),
(100, 'Georgia', 'Tbilisi', '3.99', '0.07', '1991-04-09', 'Georgian', 1),
(101, 'Germany', 'Berlin', '83.78', '0.36', '1990-10-03', 'German', 5),
(102, 'Ghana', 'Accra', '31.07', '0.24', '1957-03-06', 'English', 2),
(103, 'Greece', 'Athens', '10.42', '0.13', '1821-03-25', 'Greek', 5),
(104, 'Grenada', 'St. George\'s', '0.11', '0.00', '1974-02-07', 'English', 3),
(105, 'Guatemala', 'Guatemala City', '17.91', '0.11', '1821-09-15', 'Spanish', 3),
(106, 'Guinea', 'Conakry', '13.13', '0.25', '1958-10-02', 'French', 2),
(107, 'Guinea-Bissau', 'Bissau', '1.97', '0.04', '1973-09-24', 'Portuguese', 2),
(108, 'Guyana', 'Georgetown', '0.79', '0.22', '1966-05-26', 'English', 4),
(109, 'Haiti', 'Port-au-Prince', '11.40', '0.03', '1804-01-01', 'Haitian Creole, French', 3),
(110, 'Honduras', 'Tegucigalpa', '9.90', '0.11', '1821-09-15', 'Spanish', 3),
(111, 'Hungary', 'Budapest', '9.66', '0.09', '1000-12-25', 'Hungarian', 5),
(112, 'Iceland', 'Reykjavík', '0.36', '0.10', '1944-06-17', 'Icelandic', 5),
(113, 'India', 'New Delhi', '1380.00', '3.29', '1947-08-15', 'Hindi, English', 1),
(114, 'Indonesia', 'Jakarta', '273.52', '1.91', '1945-08-17', 'Indonesian', 1),
(115, 'Iran', 'Tehran', '84.00', '1.65', '1979-04-01', 'Persian', 1),
(116, 'Iraq', 'Baghdad', '40.22', '0.44', '1932-10-03', 'Arabic, Kurdish', 1),
(117, 'Ireland', 'Dublin', '4.94', '0.07', '1921-12-07', 'Irish, English', 5),
(118, 'Israel', 'Jerusalem', '9.22', '0.02', '1948-05-14', 'Hebrew', 1),
(119, 'Italy', 'Rome', '60.36', '0.30', '1861-03-17', 'Italian', 5),
(120, 'Ivory Coast', 'Yamoussoukro', '26.38', '0.32', '1960-08-07', 'French', 2),
(121, 'Jamaica', 'Kingston', '2.96', '0.01', '1962-08-06', 'English', 3),
(122, 'Japan', 'Tokyo', '126.48', '0.38', '0660-02-11', 'Japanese', 1),
(123, 'Jordan', 'Amman', '10.20', '0.09', '1946-05-25', 'Arabic', 1),
(124, 'Kazakhstan', 'Nur-Sultan', '18.78', '2.73', '1991-12-16', 'Kazakh, Russian', 1),
(125, 'Kenya', 'Nairobi', '53.77', '0.58', '1963-12-12', 'Swahili, English', 2),
(126, 'Kiribati', 'Tarawa', '0.12', '0.00', '1979-07-12', 'English, Gilbertese', 6),
(127, 'Kuwait', 'Kuwait City', '4.27', '0.02', '1961-06-19', 'Arabic', 1),
(128, 'Kyrgyzstan', 'Bishkek', '6.52', '0.20', '1991-08-31', 'Kyrgyz, Russian', 1),
(129, 'Laos', 'Vientiane', '7.28', '0.24', '1953-10-22', 'Lao', 1),
(130, 'Latvia', 'Riga', '1.91', '0.06', '1991-05-04', 'Latvian', 5),
(131, 'Lebanon', 'Beirut', '6.83', '0.01', '1943-11-22', 'Arabic', 1),
(132, 'Lesotho', 'Maseru', '2.14', '0.03', '1966-10-04', 'Sesotho, English', 2),
(133, 'Liberia', 'Monrovia', '5.06', '0.11', '1847-07-26', 'English', 2),
(134, 'Libya', 'Tripoli', '6.87', '1.76', '1951-12-24', 'Arabic', 2),
(135, 'Liechtenstein', 'Vaduz', '0.04', '0.00', '1806-07-12', 'German', 5),
(136, 'Lithuania', 'Vilnius', '2.72', '0.07', '1990-03-11', 'Lithuanian', 5),
(137, 'Luxembourg', 'Luxembourg City', '0.63', '0.00', '1839-04-19', 'Luxembourgish, French, German', 5),
(138, 'Madagascar', 'Antananarivo', '27.69', '0.59', '1960-06-26', 'Malagasy, French', 2),
(139, 'Malawi', 'Lilongwe', '19.13', '0.12', '1964-07-06', 'English, Chichewa', 2),
(140, 'Malaysia', 'Kuala Lumpur', '32.37', '0.33', '1957-08-31', 'Malay', 1),
(141, 'Maldives', 'Male', '0.54', '0.00', '1965-07-26', 'Dhivehi', 1),
(142, 'Mali', 'Bamako', '20.25', '1.24', '1960-09-22', 'French', 2),
(143, 'Malta', 'Valletta', '0.44', '0.00', '1964-09-21', 'Maltese, English', 5),
(144, 'Marshall Islands', 'Majuro', '0.06', '0.00', '1986-10-21', 'Marshallese, English', 6),
(145, 'Mauritania', 'Nouakchott', '4.65', '1.03', '1960-11-28', 'Arabic', 2),
(146, 'Mauritius', 'Port Louis', '1.27', '0.00', '1968-03-12', 'English', 2),
(147, 'Mexico', 'Mexico City', '128.93', '1.96', '1810-09-16', 'Spanish', 3),
(148, 'Micronesia', 'Palikir', '0.11', '0.00', '1986-11-03', 'English', 6),
(149, 'Moldova', 'Kishinev', '4.03', '0.03', '1991-08-27', 'Romanian', 5),
(150, 'Monaco', 'Monaco', '0.04', '0.00', '1297-01-08', 'French', 5),
(151, 'Mongolia', 'Ulaanbaatar', '3.28', '1.56', '1921-07-11', 'Mongolian', 1),
(152, 'Montenegro', 'Podgorica', '0.62', '0.01', '2006-06-03', 'Montenegrin', 5),
(153, 'Morocco', 'Rabat', '36.91', '0.45', '1956-03-02', 'Arabic, Berber', 2),
(154, 'Mozambique', 'Maputo', '31.26', '0.79', '1975-06-25', 'Portuguese', 2),
(155, 'Myanmar', 'Naypyidaw', '54.41', '0.68', '1948-01-04', 'Burmese', 1),
(156, 'Namibia', 'Windhoek', '2.54', '0.83', '1990-03-21', 'English', 2),
(157, 'Nauru', 'Yaren', '0.01', '0.00', '1968-01-31', 'Nauruan, English', 6),
(158, 'Nepal', 'Kathmandu', '29.14', '0.15', '1768-09-25', 'Nepali', 1),
(159, 'Netherlands', 'Amsterdam', '17.13', '0.04', '1581-07-26', 'Dutch', 5),
(160, 'New Zealand', 'Wellington', '4.82', '0.27', '1907-09-26', 'English, M?ori', 6),
(161, 'Nicaragua', 'Managua', '6.62', '0.13', '1821-09-15', 'Spanish', 3),
(162, 'Niger', 'Niamey', '24.21', '1.27', '1960-08-03', 'French', 2),
(163, 'Nigeria', 'Abuja', '206.14', '0.92', '1960-10-01', 'English', 2),
(164, 'North Korea', 'Pyongyang', '25.78', '0.12', '1948-09-09', 'Korean', 1),
(165, 'North Macedonia', 'Skopje', '2.08', '0.03', '1991-09-08', 'Macedonian', 5),
(166, 'Norway', 'Oslo', '5.38', '0.39', '1905-06-07', 'Norwegian', 5),
(167, 'Oman', 'Muscat', '5.11', '0.31', '1650-11-18', 'Arabic', 1),
(168, 'Pakistan', 'Islamabad', '220.89', '0.88', '1947-08-14', 'Urdu, English', 1),
(169, 'Palau', 'Ngerulmud', '0.02', '0.00', '1994-10-01', 'Palauan, English', 6),
(170, 'Palestine', 'Ramallah', '5.10', '0.01', '1988-11-15', 'Arabic', 1),
(171, 'Panama', 'Panama City', '4.31', '0.08', '1903-11-03', 'Spanish', 3),
(172, 'Papua New Guinea', 'Port Moresby', '8.95', '0.46', '1975-09-16', 'English, Tok Pisin, Hiri Motu', 6),
(173, 'Paraguay', 'Asunción', '7.13', '0.41', '1811-05-14', 'Spanish, Guaraní', 4),
(174, 'Peru', 'Lima', '32.97', '1.29', '1821-07-28', 'Spanish', 4),
(175, 'Philippines', 'Manila', '109.58', '0.30', '1946-07-04', 'Filipino, English', 1),
(176, 'Poland', 'Warsaw', '37.85', '0.31', '1918-11-11', 'Polish', 5),
(177, 'Portugal', 'Lisbon', '10.20', '0.09', '1143-10-05', 'Portuguese', 5),
(178, 'Qatar', 'Doha', '2.88', '0.01', '1971-09-03', 'Arabic', 1),
(179, 'Romania', 'Bucharest', '19.24', '0.24', '1877-05-09', 'Romanian', 5),
(180, 'Russia', 'Moscow', '145.93', '17.10', '1991-12-25', 'Russian', 5),
(181, 'Rwanda', 'Kigali', '12.95', '0.03', '1962-07-01', 'Kinyarwanda, English, French', 2),
(182, 'Saint Kitts and Nevis', 'Basseterre', '0.05', '0.00', '1983-09-19', 'English', 3),
(183, 'Saint Lucia', 'Castries', '0.18', '0.00', '1979-02-22', 'English', 3),
(184, 'Saint Vincent and the Grenadines', 'Kingstown', '0.11', '0.00', '1979-10-27', 'English', 3),
(185, 'Samoa', 'Apia', '0.20', '0.00', '1962-01-01', 'Samoan, English', 6),
(186, 'San Marino', 'San Marino', '0.03', '0.00', '0301-09-03', 'Italian', 5),
(187, 'Sao Tome and Principe', 'São Tomé', '0.22', '0.00', '1975-07-12', 'Portuguese', 2),
(188, 'Saudi Arabia', 'Riyadh', '34.81', '2.15', '1932-09-23', 'Arabic', 1),
(189, 'Senegal', 'Dakar', '16.74', '0.20', '1960-04-04', 'French', 2),
(190, 'Serbia', 'Belgrade', '6.91', '0.09', '2006-06-05', 'Serbian', 5),
(191, 'Seychelles', 'Victoria', '0.10', '0.00', '1976-06-29', 'English, French, Seychellois Creole', 2),
(192, 'Sierra Leone', 'Freetown', '7.98', '0.07', '1961-04-27', 'English', 2),
(193, 'Singapore', 'Singapore', '5.85', '0.00', '1965-08-09', 'English, Malay, Chinese, Tamil', 1),
(194, 'Slovakia', 'Bratislava', '5.46', '0.05', '1993-01-01', 'Slovak', 5),
(195, 'Slovenia', 'Ljubljana', '2.08', '0.02', '1991-06-25', 'Slovene', 5),
(196, 'Solomon Islands', 'Honiara', '0.69', '0.03', '1978-07-07', 'English', 6),
(197, 'Somalia', 'Mogadishu', '15.89', '0.64', '1960-07-01', 'Somali, Arabic', 2),
(198, 'South Africa', 'Pretoria', '59.31', '1.22', '1961-05-31', 'Afrikaans, English, and 9 others', 2),
(199, 'South Korea', 'Seoul', '51.27', '0.10', '1945-08-15', 'Korean', 1),
(200, 'South Sudan', 'Juba', '11.19', '0.62', '2011-07-09', 'English', 2),
(201, 'Spain', 'Madrid', '47.35', '0.51', '1492-01-02', 'Spanish', 5),
(202, 'Sri Lanka', 'Sri Jayawardenepura Kotte', '21.41', '0.07', '1948-02-04', 'Sinhala, Tamil', 1),
(203, 'Sudan', 'Khartoum', '43.85', '1.86', '1956-01-01', 'Arabic, English', 2),
(204, 'Suriname', 'Paramaribo', '0.59', '0.16', '1975-11-25', 'Dutch', 4),
(205, 'Sweden', 'Stockholm', '10.10', '0.45', '1523-06-06', 'Swedish', 5),
(206, 'Switzerland', 'Bern', '8.57', '0.04', '1291-08-01', 'German, French, Italian, Romansh', 5),
(207, 'Syria', 'Damascus', '17.50', '0.19', '1946-04-17', 'Arabic', 1),
(208, 'Tajikistan', 'Dushanbe', '9.54', '0.14', '1991-09-09', 'Tajik', 1),
(209, 'Tanzania', 'Dodoma', '59.73', '0.95', '1961-12-09', 'Swahili, English', 2),
(210, 'Thailand', 'Bangkok', '69.80', '0.51', '1238-04-06', 'Thai', 1),
(211, 'Togo', 'Lomé', '8.28', '0.06', '1960-04-27', 'French', 2),
(212, 'Tonga', 'Nuku\'alofa', '0.11', '0.00', '1970-06-04', 'Tongan, English', 6),
(213, 'Trinidad and Tobago', 'Port of Spain', '1.40', '0.01', '1962-08-31', 'English', 3),
(214, 'Tunisia', 'Tunis', '11.82', '0.16', '1956-03-20', 'Arabic', 2),
(215, 'Turkey', 'Ankara', '84.34', '0.78', '1923-10-29', 'Turkish', 1),
(216, 'Turkmenistan', 'Ashgabat', '6.03', '0.49', '1991-10-27', 'Turkmen', 1),
(217, 'Tuvalu', 'Funafuti', '0.01', '0.00', '1978-10-01', 'Tuvaluan, English', 6),
(218, 'Uganda1', 'Kampala', '45.74', '0.24', '1962-10-09', 'English, Swahili', 2),
(219, 'Ukraine', 'Kyiv', '44.13', '0.60', '1991-08-24', 'Ukrainian', 5),
(220, 'United Arab Emirates', 'Abu Dhabi', '9.89', '0.08', '1971-12-02', 'Arabic', 1),
(221, 'United Kingdom', 'London', '67.89', '0.24', '1922-12-06', 'English', 5),
(222, 'United States', 'Washington, D.C.', '331.00', '9.83', '1776-07-04', 'English', 3),
(223, 'Uruguay', 'Montevideo', '3.47', '0.18', '1825-08-25', 'Spanish', 4),
(224, 'Uzbekistan', 'Tashkent', '33.47', '0.45', '1991-09-01', 'Uzbek', 1),
(225, 'Vanuatu', 'Port Vila', '0.31', '0.01', '1980-07-30', 'Bislama, English, French', 6),
(226, 'Vatican City', 'Vatican City', '0.00', '0.00', '1929-02-11', 'Italian', 5),
(227, 'Venezuela', 'Caracas', '28.44', '0.92', '1811-07-05', 'Spanish', 4),
(228, 'Vietnam', 'Hanoi', '97.34', '0.33', '1945-09-02', 'Vietnamese', 1),
(229, 'Yemen', 'Sana\'a', '29.83', '0.53', '1990-05-22', 'Arabic', 1),
(230, 'Zambia', 'Lusaka', '18.38', '0.75', '1964-10-24', 'English', 2),
(231, 'Zimbabwe', 'Harare', '14.86', '0.39', '1980-04-18', 'English', 2),
(232, 'Antarctica', '', '0.00', '13.66', '2021-04-29', 'English', 7);

-- --------------------------------------------------------

--
-- Table structure for table `countrynotes`
--

CREATE TABLE `countrynotes` (
  `countrynotes_id` int(11) NOT NULL,
  `titlenotes` varchar(50) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `link_img` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countrynotes`
--

INSERT INTO `countrynotes` (`countrynotes_id`, `titlenotes`, `description`, `link_img`, `link`, `country_id`) VALUES
(1, 'Storm Eowyn', 'Limerick Live Reporter24 Jan 2025 AN EIGHTY year weather record which belonged to Limerick has been smashed this morning, Met Eireann have said. Provisional figures recorded by the forecaster overnight suggest Storm Eowyn is the strongest-ever storm to pass over Ireland. Senior forecaster Gerry Murphy said the previous wind speed records - dating back to 1945 at Foynes in Limerick - have been broken. \"Storm Eowyn is an extreme storm and it has already broken records for the all-time mean wind speed and all-time gust speed for Ireland. At 4am, at Mace Head (County Galway) we had a mean speed of135km/h which breaks the previous record of 131 and at 5am, at Mace Head as well, we had a gust of 183km/h which breaks the previous record of 182\"', '../img/stories/Storm-Eowyn.jpg', 'https://www.limerickleader.ie/news/weather/1711117/breaking-ireland-s-80-year-old-gust-record-recorded-in-limerick-is-broken-during-storm-eowyn.html', 117),
(4, 'River Nile', 'The Nile River is called the â€œlifeblood of Egypt.â€ It has shaped Egyptâ€™s history and growth. The Nileâ€™s story involves human creativity, cultural change, and the deep connection between people and nature. Key Takeaways The Nile River was key to ancient Egyptian life.', '../img/stories/Nile River.jpg', 'https://www.history.com/news/ancient-egypt-nile-river', 88),
(6, 'Vyshyvanka', 'Ukraine has a rich and centuries-old cultural history. Situated at the crossroads of Europe and Asia, it has been influenced by various civilizations, which is reflected in its traditions, art, music and literature.\r\n\r\nOne of the key elements of Ukrainian culture is the vyshyvanka, an embroidered shirt that is considered a national symbol and amulet. Vyshyvankas have different patterns and colors that depend on the region and symbolize different aspects of life, nature and history.', '../img/stories/vish.jpg', 'https://en.wikipedia.org/wiki/Vyshyvanka', 219),
(7, 'THE HISTORY OF SPAIN', 'In Hispania before the Romans, the Spanish peninsula was inhabited by several tribes which were divided between Celts and Iberos.\r\nThe Fenitians and Greeks started to arrive and founded Gades and Ampurias. By the way, the name of Iberia was given by the Greeks because of the river Ebro, which in Greek is Iber. After them came the Cartaginenses from Africa and founded Cartagena...', '../img/stories/logo-600-300[1].png', 'https://historyofspain.es/en/video/the-history-of-spain/', 201),
(8, 'St. Patricks Day', 'Saint Patrick\'s Day, also known as the Feast of Saint Patrick, is a religious and cultural holiday celebrated on March 17. It commemorates the patron saint of Ireland, Saint Patrick, who is credited with advancing Christianity throughout the island.', '../img/stories/gettyimages-1239264332[1].jpg', 'https://www.history.com/news/is-st-patricks-day-celebrated-in-ireland', 117);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `continent`
--
ALTER TABLE `continent`
  ADD PRIMARY KEY (`continent_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`),
  ADD KEY `continent_id` (`continent_id`);

--
-- Indexes for table `countrynotes`
--
ALTER TABLE `countrynotes`
  ADD PRIMARY KEY (`countrynotes_id`),
  ADD KEY `country_id` (`country_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `continent`
--
ALTER TABLE `continent`
  MODIFY `continent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `countrynotes`
--
ALTER TABLE `countrynotes`
  MODIFY `countrynotes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `country_ibfk_1` FOREIGN KEY (`continent_id`) REFERENCES `continent` (`continent_id`);

--
-- Constraints for table `countrynotes`
--
ALTER TABLE `countrynotes`
  ADD CONSTRAINT `countrynotes_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
