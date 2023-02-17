-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 192.168.0.200
-- Létrehozás ideje: 2023. Feb 10. 15:03
-- Kiszolgáló verziója: 10.5.17-MariaDB-log
-- PHP verzió: 8.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `s48_db`
--
CREATE DATABASE IF NOT EXISTS `s48_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `s48_db`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `adatok`
--

CREATE TABLE `adatok` (
  `adatok_id` int(11) NOT NULL,
  `adatok_telefonszam` varchar(100) NOT NULL,
  `adatok_emailcim` varchar(100) NOT NULL,
  `adatok_uzenet` varchar(100) NOT NULL,
  `adatok_kutyaid` int(11) NOT NULL,
  `adatok_datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `adatok`
--

INSERT INTO `adatok` (`adatok_id`, `adatok_telefonszam`, `adatok_emailcim`, `adatok_uzenet`, `adatok_kutyaid`, `adatok_datum`) VALUES
(1, '06-30-475-2725', 'peter.bara29@gmail.com', 'Helló! Ez az én kutyám', 1, '2023-01-25'),
(4, '0620555555', 'A@a.a', 'Pulik irant erdeklodnek!', 1, '2023-02-10');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kutya`
--

CREATE TABLE `kutya` (
  `kutya_id` int(11) NOT NULL,
  `kutya_fajtaid` int(11) NOT NULL,
  `kutya_neme` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `kutya_kep` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `kutya_datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kutya`
--

INSERT INTO `kutya` (`kutya_id`, `kutya_fajtaid`, `kutya_neme`, `kutya_kep`, `kutya_datum`) VALUES
(1, 1, 'szuka', '1.jpg', '2022-11-01'),
(2, 2, 'kan', '2.jpg', '2022-11-02'),
(3, 3, 'kan', '3.jpg', '2022-11-11'),
(4, 4, 'szuka', '4.jpg', '2022-11-13'),
(5, 5, 'szuka', '5.jpg', '2022-11-13'),
(6, 6, 'kan', '6.jpg', '2022-11-11'),
(7, 7, 'szuka', '7.jpg', '0000-00-00'),
(8, 8, 'kan', '8.jpg', '0000-00-00'),
(9, 9, 'kan', '9.jpg', '0000-00-00'),
(10, 10, 'szuka', '10.jpg', '0000-00-00'),
(11, 11, 'szuka', '11.jpg', '0000-00-00'),
(12, 12, 'kan', '12.jpg', '0000-00-00'),
(13, 13, 'szuka', '13.jpg', '0000-00-00'),
(14, 14, 'kan', '14.jpg', '0000-00-00'),
(24, 15, 'szuka', '15.jpg', '2023-01-02'),
(25, 16, 'kan', '16.jpg', '2023-01-06'),
(26, 1, 'kan', '2.png', '2023-12-01'),
(27, 1, 'kan', '2.png', '2023-01-20'),
(37, 1, '2', '30.jpg', '2023-01-27'),
(38, 1, '2', '30.jpg', '2023-01-27'),
(39, 4, 'Kan', '40.jpg', '2023-01-27'),
(44, 7, 'Kan', 'A.jpg', '2023-02-10');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tipus`
--

CREATE TABLE `tipus` (
  `tipus_id` int(11) NOT NULL,
  `tipus_nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tipus`
--

INSERT INTO `tipus` (`tipus_id`, `tipus_nev`) VALUES
(1, 'Csivava'),
(2, 'Mopsz'),
(3, 'Németjuhász'),
(4, 'Skótjuhász'),
(5, 'Spániel'),
(6, 'Doberman'),
(7, 'Puli'),
(8, 'Keverék'),
(9, 'Tacskó'),
(10, 'Bulldog'),
(11, 'Palotapincsi'),
(12, 'Husky'),
(13, 'Akita Inu'),
(14, 'Agár'),
(15, 'Bichon Bolognese'),
(16, 'Pitbull');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `adatok`
--
ALTER TABLE `adatok`
  ADD PRIMARY KEY (`adatok_id`),
  ADD KEY `adatok_kutyaid` (`adatok_kutyaid`);

--
-- A tábla indexei `kutya`
--
ALTER TABLE `kutya`
  ADD PRIMARY KEY (`kutya_id`),
  ADD KEY `kutya_fajtaid` (`kutya_fajtaid`);

--
-- A tábla indexei `tipus`
--
ALTER TABLE `tipus`
  ADD PRIMARY KEY (`tipus_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `adatok`
--
ALTER TABLE `adatok`
  MODIFY `adatok_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `kutya`
--
ALTER TABLE `kutya`
  MODIFY `kutya_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT a táblához `tipus`
--
ALTER TABLE `tipus`
  MODIFY `tipus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `adatok`
--
ALTER TABLE `adatok`
  ADD CONSTRAINT `adatok_ibfk_1` FOREIGN KEY (`adatok_kutyaid`) REFERENCES `kutya` (`kutya_id`);

--
-- Megkötések a táblához `kutya`
--
ALTER TABLE `kutya`
  ADD CONSTRAINT `kutya_ibfk_1` FOREIGN KEY (`kutya_fajtaid`) REFERENCES `tipus` (`tipus_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
