-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 16 Haz 2024, 22:34:09
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `db`
--

--
-- Tablo döküm verisi `address`
--

INSERT INTO `address` (`ID`, `COUNTRYID`, `CITYID`, `TOWNID`, `DISTRICTID`, `POSTALCODE`, `ADDRESSTEXT`, `USERID`) VALUES
(1, 1, 1, 1, 1, '34710', 'Example Address 1', 1),
(2, 1, 1, 1, 2, '34720', 'Example Address 2', 2),
(3, 1, 1, 2, 1, '34730', 'Example Address 3', 3),
(4, 2, 2, 2, 2, '11211', 'Example Address 4', 4),
(5, 2, 2, 2, 1, '11222', 'Example Address 5', 5),
(11, 1, 1, 1, 1, '34710', 'ADRESS DENEMEE 1', 11),
(12, 1, 1, 1, 2, '34720', 'ADDRESS DENEME DDENE 2', 12);

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`ID`, `ROLE`) VALUES
(6, 'Manager'),
(7, 'Supervisor'),
(8, 'Admin');

--
-- Tablo döküm verisi `basket`
--

INSERT INTO `basket` (`ID`, `USERID`, `CREATEDDATE`, `LASTMODIFIEDDATE`, `ITEMCOUNT`, `TOTALPRICE`, `STATUS_`) VALUES
(1, 1, '2024-06-16 23:20:12', '2024-06-16 23:20:12', 2, 50, 1),
(2, 2, '2024-06-16 23:20:12', '2024-06-16 23:20:12', 1, 50, 1),
(3, 3, '2024-06-16 23:20:12', '2024-06-16 23:20:12', 3, 150, 1),
(4, 4, '2024-06-16 23:20:12', '2024-06-16 23:20:12', 4, 300, 1),
(5, 5, '2024-06-16 23:20:12', '2024-06-16 23:20:12', 5, 500, 1),
(6, 1, '2024-06-16 23:24:54', '2024-06-16 23:24:54', 1, 10, 1),
(100, NULL, NULL, NULL, NULL, NULL, 2);

--
-- Tablo döküm verisi `basketdetail`
--

INSERT INTO `basketdetail` (`ID`, `BASKETID`, `ITEMID`, `AMOUNT`, `PRICE`, `TOTALPRICE`, `DATE_`) VALUES
(1, 1, 1, 2, 25, 50, '2024-06-16 23:20:12'),
(2, 2, 2, 1, 50, 50, '2024-06-16 23:20:12'),
(3, 3, 3, 1, 75, 75, '2024-06-16 23:20:12'),
(4, 3, 4, 2, 50, 100, '2024-06-16 23:20:12'),
(5, 4, 5, 2, 125, 250, '2024-06-16 23:20:12'),
(6, 4, 6, 2, 150, 300, '2024-06-16 23:20:12'),
(7, 5, 7, 1, 175, 175, '2024-06-16 23:20:12'),
(8, 5, 8, 1, 200, 200, '2024-06-16 23:20:12'),
(9, 5, 9, 1, 225, 225, '2024-06-16 23:20:12'),
(10, 6, 11, 2, 5, 10, '2024-06-16 23:24:54'),
(12, NULL, 51, 3, 15, NULL, NULL);

--
-- Tablo döküm verisi `city`
--

INSERT INTO `city` (`ID`, `CITY`) VALUES
(1, 'Istanbul'),
(2, 'New York');

--
-- Tablo döküm verisi `country`
--

INSERT INTO `country` (`ID`, `COUNTRY`) VALUES
(1, 'Turkey'),
(2, 'USA');

--
-- Tablo döküm verisi `customer`
--

INSERT INTO `customer` (`ID`, `LOYALTYPOINTS`) VALUES
(1, 200),
(2, 200),
(3, 300),
(4, 400),
(5, 500);

--
-- Tablo döküm verisi `district`
--

INSERT INTO `district` (`ID`, `DISTRICT`) VALUES
(1, 'Moda'),
(2, 'Williamsburg');

--
-- Tablo döküm verisi `invoice`
--

INSERT INTO `invoice` (`ID`, `ORDERID`, `INVOICENO`, `DATE_`, `CARGOFICHENO`, `STATUS_`) VALUES
(1, 1, 'INV001', '2024-06-16 23:20:12', 'CF001', 1),
(2, 2, 'INV002', '2024-06-16 23:20:12', 'CF002', 1),
(3, 3, 'INV003', '2024-06-16 23:20:12', 'CF003', 1),
(4, 4, 'INV004', '2024-06-16 23:20:12', 'CF004', 1),
(5, 5, 'INV005', '2024-06-16 23:20:12', 'CF005', 1);

--
-- Tablo döküm verisi `invoicedetail`
--

INSERT INTO `invoicedetail` (`ID`, `INVOICEID`, `ORDERDETAILID`, `ITEMID`, `PRICE`, `AMOUNT`) VALUES
(1, 1, 1, 1, 25, 2),
(2, 2, 2, 2, 50, 1),
(3, 3, 3, 3, 75, 1),
(4, 4, 4, 4, 50, 2),
(5, 5, 5, 5, 125, 2),
(6, 5, 6, 6, 150, 2),
(7, 5, 7, 7, 175, 1),
(8, 5, 8, 8, 200, 1),
(9, 5, 9, 9, 225, 1);

--
-- Tablo döküm verisi `item`
--

INSERT INTO `item` (`ID`, `ITEMCODE`, `ITEMNAME`, `PRICE`, `CATEGORY1`, `CATEGORY2`, `CATEGORY3`) VALUES
(1, 'ITEM001', 'Sample Item 1', 25, 'Category1', 'Category2', 'Category3'),
(2, 'ITEM002', 'Sample Item 2', 50, 'Category1', 'Category2', 'Category3'),
(3, 'ITEM003', 'Sample Item 3', 75, 'Category1', 'Category2', 'Category3'),
(4, 'ITEM004', 'Sample Item 4', 100, 'Category1', 'Category2', 'Category3'),
(5, 'ITEM005', 'Sample Item 5', 125, 'Category1', 'Category2', 'Category3'),
(6, 'ITEM006', 'Sample Item 6', 150, 'Category1', 'Category2', 'Category3'),
(7, 'ITEM007', 'Sample Item 7', 175, 'Category1', 'Category2', 'Category3'),
(8, 'ITEM008', 'Sample Item 8', 200, 'Category1', 'Category2', 'Category3'),
(9, 'ITEM009', 'Sample Item 9', 225, 'Category1', 'Category2', 'Category3'),
(10, 'ITEM010', 'Sample Item 10', 250, 'Category1', 'Category2', 'Category3'),
(11, 'P1234', 'Kalem', 5, 'Kırtasiye', 'Yazı Gereçleri', 'Kalemler'),
(51, 'ITEM002', NULL, NULL, NULL, NULL, NULL);

--
-- Tablo döküm verisi `orderdetail`
--

INSERT INTO `orderdetail` (`ID`, `ORDERSID`, `BASKETDETAILID`, `ITEMID`, `AMOUNT`, `PRICE`, `TOTALPRICE`) VALUES
(1, 1, 1, 1, 2, 25, 50),
(2, 2, 2, 2, 1, 50, 50),
(3, 3, 3, 3, 1, 75, 75),
(4, 3, 4, 4, 2, 50, 100),
(5, 4, 5, 5, 2, 125, 250),
(6, 4, 6, 6, 2, 150, 300),
(7, 5, 7, 7, 1, 175, 175),
(8, 5, 8, 8, 1, 200, 200),
(9, 5, 9, 9, 1, 225, 225);

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`ID`, `USERID`, `BASKETID`, `CREATEDDATE`, `ITEMCOUNT`, `TOTALPRICE`, `STATUS_`) VALUES
(1, 1, 1, '2024-06-16 23:20:12', 2, 50, 1),
(2, 2, 2, '2024-06-16 23:20:12', 1, 50, 1),
(3, 3, 3, '2024-06-16 23:20:12', 3, 150, 1),
(4, 4, 4, '2024-06-16 23:20:12', 4, 300, 1),
(5, 5, 5, '2024-06-16 23:20:12', 5, 500, 1),
(6, 1, 6, '2024-06-16 23:24:54', 1, 10, 1);

--
-- Tablo döküm verisi `payment`
--

INSERT INTO `payment` (`ID`, `BASKETID`, `TOTALPRICE`, `PAYMENTTYPE`, `DATE_`, `ISOK`, `APPROVECODE`, `ERROR_`) VALUES
(1, 1, 50, 1, '2024-06-16 23:20:12', b'1', 'APPROVED', ''),
(2, 2, 50, 1, '2024-06-16 23:20:12', b'1', 'APPROVED', ''),
(3, 3, 150, 2, '2024-06-16 23:20:12', b'1', 'APPROVED', ''),
(4, 4, 300, 2, '2024-06-16 23:20:12', b'1', 'APPROVED', ''),
(5, 5, 500, 1, '2024-06-16 23:20:12', b'1', 'APPROVED', ''),
(100, 100, NULL, NULL, NULL, b'1', NULL, NULL);

--
-- Tablo döküm verisi `town`
--

INSERT INTO `town` (`ID`, `TOWN`) VALUES
(1, 'Kadikoy'),
(2, 'Brooklyn');

--
-- Tablo döküm verisi `user_`
--

INSERT INTO `user_` (`ID`, `NAME`, `EMAIL`) VALUES
(1, 'Ali', 'ali@example.com'),
(2, 'Ayşe', 'ayse@example.com'),
(3, 'Mehmet', 'mehmet@example.com'),
(4, 'Fatma', 'fatma@example.com'),
(5, 'Ahmet', 'ahmet@example.com'),
(6, 'Zeynep', 'zeynep@example.com'),
(7, 'Mustafa', 'mustafa@example.com'),
(8, 'Emine', 'emine@example.com'),
(9, 'Burak', 'burak@example.com'),
(10, 'Seda', 'seda@example.com'),
(11, 'burak', 'burak@example.com'),
(12, 'seda', 'seda@example.com');

-- --------------------------------------------------------

--
-- Görünüm yapısı `v1`
--
DROP TABLE IF EXISTS `v1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v1`  AS SELECT `user_`.`ID` AS `UserID`, `user_`.`NAME` AS `UserName`, `user_`.`EMAIL` AS `UserEmail`, `customer`.`LOYALTYPOINTS` AS `LoyaltyPoints` FROM (`user_` join `customer` on(`user_`.`ID` = `customer`.`ID`)) ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `v2`
--
DROP TABLE IF EXISTS `v2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v2`  AS SELECT `user_`.`ID` AS `UserID`, `user_`.`NAME` AS `UserName`, `address`.`COUNTRYID` AS `COUNTRYID`, `address`.`CITYID` AS `CITYID`, `address`.`TOWNID` AS `TOWNID`, `address`.`DISTRICTID` AS `DISTRICTID`, `address`.`POSTALCODE` AS `POSTALCODE`, `address`.`ADDRESSTEXT` AS `ADDRESSTEXT` FROM (`user_` join `address` on(`user_`.`ID` = `address`.`USERID`)) ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `v3`
--
DROP TABLE IF EXISTS `v3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v3`  AS SELECT `basket`.`ID` AS `BasketID`, `basket`.`USERID` AS `USERID`, `basket`.`CREATEDDATE` AS `CREATEDDATE`, `basket`.`LASTMODIFIEDDATE` AS `LASTMODIFIEDDATE`, `basket`.`ITEMCOUNT` AS `ITEMCOUNT`, `basket`.`TOTALPRICE` AS `BasketTotalPrice`, `basketdetail`.`ITEMID` AS `ITEMID`, `basketdetail`.`AMOUNT` AS `AMOUNT`, `basketdetail`.`PRICE` AS `ItemPrice`, `basketdetail`.`TOTALPRICE` AS `ItemTotalPrice`, `basketdetail`.`DATE_` AS `DetailDate` FROM (`basket` join `basketdetail` on(`basket`.`ID` = `basketdetail`.`BASKETID`)) ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `v4`
--
DROP TABLE IF EXISTS `v4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v4`  AS SELECT `orders`.`ID` AS `OrderID`, `orders`.`USERID` AS `USERID`, `orders`.`BASKETID` AS `BASKETID`, `orders`.`CREATEDDATE` AS `OrderDate`, `orders`.`ITEMCOUNT` AS `ITEMCOUNT`, `orders`.`TOTALPRICE` AS `OrderTotalPrice`, `payment`.`TOTALPRICE` AS `PaymentTotalPrice`, `payment`.`PAYMENTTYPE` AS `PAYMENTTYPE`, `payment`.`DATE_` AS `PaymentDate`, `payment`.`ISOK` AS `ISOK`, `payment`.`APPROVECODE` AS `APPROVECODE`, `payment`.`ERROR_` AS `ERROR_` FROM (`orders` join `payment` on(`orders`.`BASKETID` = `payment`.`BASKETID`)) ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `v5`
--
DROP TABLE IF EXISTS `v5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v5`  AS SELECT `invoice`.`ID` AS `InvoiceID`, `invoice`.`ORDERID` AS `ORDERID`, `invoice`.`INVOICENO` AS `INVOICENO`, `invoice`.`DATE_` AS `InvoiceDate`, `invoice`.`CARGOFICHENO` AS `CARGOFICHENO`, `invoice`.`STATUS_` AS `STATUS_`, `invoicedetail`.`ORDERDETAILID` AS `ORDERDETAILID`, `invoicedetail`.`ITEMID` AS `ITEMID`, `invoicedetail`.`PRICE` AS `ItemPrice`, `invoicedetail`.`AMOUNT` AS `ItemAmount` FROM (`invoice` join `invoicedetail` on(`invoice`.`ID` = `invoicedetail`.`INVOICEID`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
