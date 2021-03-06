-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 28, 2017 at 07:56 AM
-- Server version: 5.6.34
-- PHP Version: 7.1.0

DROP DATABASE IF Exists dropx103_resource_db;
CREATE DATABASE dropx103_resource_db;
USE dropx103_resource_db;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Create Users
--
CREATE USER 'dropx103'@'localhost' IDENTIFIED BY 'som3thingsom3thing'; GRANT ALL PRIVILEGES ON *.* TO 'dropx103'@'localhost';
CREATE USER 'dropx103'@'127.0.0.1' IDENTIFIED BY 'som3thingsom3thing'; GRANT ALL PRIVILEGES ON *.* TO 'dropx103'@'127.0.0.1';
CREATE USER 'dropx103'@'::1' IDENTIFIED BY 'som3thingsom3thing'; GRANT ALL PRIVILEGES ON *.* TO 'dropx103'@'::1';

--
-- Database: `Resource_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Counties`
--

CREATE TABLE `Counties` (
  `CountyID` int(11) NOT NULL,
  `CountyName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CountyAssignment`
--

CREATE TABLE `CountyAssignment` (
  `CountyAssignmentID` int(11) NOT NULL /*added by alex --> */ AUTO_INCREMENT,
  `StateID` varchar(2) NOT NULL,
  `CountyID` int(11) NOT NULL,
  CONSTRAINT `pk_CountyAssignmentID` PRIMARY KEY (`CountyAssignmentID`) /* <-- added by alex */
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Resources`
--

CREATE TABLE `Resources` (
  `ResourceID` int(11) NOT NULL,
  `ResourceName` varchar(255) NOT NULL,
  `StreetAddress` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `StateID` varchar(2) DEFAULT NULL,
  `ZIP` varchar(10) DEFAULT NULL,
  `PhoneNUMBER` varchar(12) NOT NULL,
  `Fax` varchar(12) DEFAULT NULL,
  `Email` varchar(12) DEFAULT NULL,
  `CountyAssignmentID` INT(11) /* <-- added by Steph 5/2/2017 */
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Resources`
--

INSERT INTO `Resources` (`ResourceID`, `ResourceName`, `StreetAddress`, `City`, `StateID`, `ZIP`, `PhoneNUMBER`, `Fax`, `Email`, `CountyAssignmentID`) VALUES /* --> Edited by Steph 5/2/2017 to link county assignment to resources */
(1, 'Crisis Prevention/Suicide Hotline', NULL, NULL, 'WI', NULL, '608-757-5025', NULL, NULL, 73),
(2, 'Poison Information Center', NULL, NULL, 'WI', NULL, '800-222-1222', NULL, NULL, 73),
(3, 'A Safe Place for Newborns', NULL, NULL, 'WI', NULL, '877-440-2229', NULL, NULL, 73),
(4, 'Runaway Hotline', NULL, NULL, 'WI', NULL, '800-924-7238', NULL, NULL, 73),
(5, 'Rape Crisis Hotline', NULL, NULL, 'WI', NULL, '866-666-4576', NULL, NULL, 73),
(6, 'National Human Trafficking Hotline', NULL, NULL, 'WI', NULL, '888-373-7888', NULL, NULL, 73),
(7, 'Rock County Sheriff', NULL, NULL, 'WI', NULL, '608-757-8000', NULL, NULL, 54),
(8, 'Beloit Police Department', NULL, NULL, 'WI', NULL, '608-364-6800', NULL, NULL, 54),
(9, 'Clinton Police Department', NULL, NULL, 'WI', NULL, '608-676-5140', NULL, NULL, 54),
(10, 'Edgerton Police Department', NULL, NULL, 'WI', NULL, '608-884-3321', NULL, NULL, 54),
(11, 'Evansville Police Department', NULL, NULL, 'WI', NULL, '608-882-2292', NULL, NULL, 54),
(12, 'Janesville Police Department', NULL, NULL, 'WI', NULL, '608-757-2244', NULL, NULL, 54),
(13, 'Milton Police Department', NULL, NULL, 'WI', NULL, '608-868-6910', NULL, NULL, 54),
(14, 'Crime Stoppers Hotline Beloit', NULL, NULL, 'WI', NULL, '608-363-7463', NULL, NULL, 54),
(15, 'Elderly Abuse Reporting(ADRC)', NULL, NULL, 'WI', NULL, '608-741-3600', NULL, NULL, 54),
(16, 'Child Abuse/Child Protective Services(child)', NULL, NULL, 'WI', NULL, '608-757-5401', NULL, NULL, 54),
(17, 'Domestic Violence Hotline', NULL, NULL, 'WI', NULL, '800-394-2255', NULL, NULL, 54),
(18, 'Beloit, St. Vincent De Paul', NULL, NULL, 'WI', NULL, '608-362-6775', NULL, NULL, 54),
(19, 'Beloit, Salvation Army', NULL, NULL, 'WI', NULL, '608-365-6572', NULL, NULL, 54),
(20, 'Beloit, Salvation Army', NULL, NULL, 'WI', NULL, '608-365-6572', NULL, NULL, 54), /* Double entry*/
(21, 'Edgerton Community Outreach', NULL, NULL, 'WI', NULL, '608-884-9593', NULL, NULL, 54),
(22, 'Janesville, Rock Assembly of God', NULL, NULL, 'WI', NULL, '608-756-2232', NULL, NULL, 54),
(23, 'Caritas', NULL, NULL, 'WI', NULL, '608-362-4403', NULL, NULL, 54),
(24, 'Faith Works', NULL, NULL, 'WI', NULL, '608-752-7798', NULL, NULL, 54), /* Phone number discrepancy. This seems to be the phone number for Orchard View Alliance  Church, not Faith Works*/ 
(25, 'Better Business Bureau of Wisconsin', NULL, NULL, 'WI', NULL, '800-273-1002', NULL, NULL, 54),
(26, 'Consumer Protection Hotline, WI', NULL, NULL, 'WI', NULL, '877-238-7368', NULL, NULL, 54), /* Phone number discrepancy. Seems to be for a Tennant resource center, not consumer protection*/
(27, 'National Fraud Information Center', NULL, NULL, 'WI', NULL, '800-876-7060', NULL, NULL, 54),
(28, 'CESA Two Vocational Opportunities', NULL, NULL, 'WI', NULL, '608-741-6687', NULL, NULL, 54),
(29, 'Community Action- Skills Enhancement', NULL, NULL, 'WI', NULL, '608-313-1300', NULL, NULL, 54),
(30, 'Jobs Corps', NULL, NULL, 'WI', NULL, '715-674-2311', NULL, NULL, 54), /* CHECKED THE PHONE #s UP TO THIS POINT - CALEB*/
(31, 'Rock Co. Division of Vocational', NULL, NULL, 'WI', NULL, '608-741-3585', NULL, NULL, 54),
(32, 'Rock County Job Service Center', NULL, NULL, 'WI', NULL, '608-741-3400', NULL, NULL, 54),
(33, 'Wisconsin Seasonal JobsSite', NULL, NULL, 'WI', NULL, '608-741-3526', NULL, NULL, 54),
(34, 'WISE Program', NULL, NULL, 'WI', NULL, '608-741-3541', NULL, NULL, 54),
(35, 'Fatherhood Initiative', NULL, NULL, 'WI', NULL, '608-313-1316', NULL, NULL, 54),
(36, 'Work Force Investment Act', NULL, NULL, 'WI', NULL, '608-741-3507', NULL, NULL, 54),
(37, 'Blackhawk Tech GED/HSED', NULL, NULL, 'WI', NULL, '608-757-7741', NULL, NULL, 54),
(38, 'Beloit Transit System', NULL, NULL, 'WI', NULL, '608-364-2870', NULL, NULL, 54),
(39, 'DRS Medical Transport', NULL, NULL, 'WI', NULL, '866-996-3729', NULL, NULL, 54),
(40, 'Specialized Transit', NULL, NULL, 'WI', NULL, '608-757-505', NULL, NULL, 54),
(41, 'Greyhound Bus Lines', NULL, NULL, 'WI', NULL, '800-231-2222', NULL, NULL, 54),
(42, 'Janesville Transit System', NULL, NULL, 'WI', NULL, '608-755-3150', NULL, NULL, 54),
(43, 'Work and Wheels', NULL, NULL, 'WI', NULL, '608-755-2491', NULL, NULL, 54),
(44, 'Retired Senior Volunteer Program SVS', NULL, NULL, 'WI', NULL, '608-362-9593', NULL, NULL, 54),
(45, 'Faith Works (volunteers)', NULL, NULL, 'WI', NULL, '608-752-7798', NULL, NULL, 54),
(46, 'Community Justice- Madison', NULL, NULL, 'WI', NULL, '608-204-9642', NULL, NULL, 54),
(47, 'Disability Right', NULL, NULL, 'WI', NULL, '800-928-8778', NULL, NULL, 54),
(48, 'Equal Opportunities- Beloit', NULL, NULL, 'WI', NULL, '608-364-6710', NULL, NULL, 54),
(49, 'Equal Rights Division- Madison', NULL, NULL, 'WI', NULL, '608-266-6860', NULL, NULL, 54),
(50, 'WI Dept. of Workforce Development', NULL, NULL, 'WI', NULL, '608-266-6860', NULL, NULL, 54),
(51, 'Janesville Neighborhood & Community', NULL, NULL, 'WI', NULL, '608-755-3065', NULL, NULL, 54),
(52, 'WI Workers\' Rights Center', NULL, NULL, 'WI', NULL, '800-255-0376', NULL, NULL, 54),
(53, 'WI Tenants Resource Center', NULL, NULL, 'WI', NULL, '608-257-0006', NULL, NULL, 54),
(54, 'Beloit Domestic Violence Center', NULL, NULL, 'WI', NULL, '608-365-1119', NULL, NULL, 54),
(55, 'Janesville Alternatives to Violence- YWCA', NULL, NULL, 'WI', NULL, '608-752-2583', NULL, NULL, 54),
(56, 'Janesville YWCA Abuse in Laterlife', NULL, NULL, 'WI', NULL, '608-752-5445', NULL, NULL, 54),
(57, 'Deferred Prosecution Domestic Violence', NULL, NULL, 'WI', NULL, '608-757-5677', NULL, NULL, 54),
(58, 'Sexual Assault Recovery Program', NULL, NULL, 'WI', NULL, '866-666-4576', NULL, NULL, 54),
(59, 'Beloit, C.A.R.E. Central Christian Church', NULL, NULL, 'WI', NULL, '608-362-7663', NULL, NULL, 54),
(60, 'Beloit, Caritas Inc.', NULL, NULL, 'WI', NULL, '608-362-4403', NULL, NULL, 54),
(61, 'Beloit, Cornerstone Church of God Food', NULL, NULL, 'WI', NULL, '608-362-7547', NULL, NULL, 54),
(62, 'Beloit, New Zion Baptist Food Pantry', NULL, NULL, 'WI', NULL, '608-362-7703', NULL, NULL, 54),
(63, 'Beloit, People\'s Church Food Pantry', NULL, NULL, 'WI', NULL, '608-362-7556', NULL, NULL, 54),
(64, 'Beloit, Salvation Army', NULL, NULL, 'WI', NULL, '608-365-6572', NULL, NULL, 54),
(65, 'Clinton, Christ Lutheran Food Pantry', NULL, NULL, 'WI', NULL, '608-676-4994', NULL, NULL, 54),
(66, 'Clinton Community Outreach', NULL, NULL, 'WI', NULL, '608-29S-9548', NULL, NULL, 54),
(67, 'Evansville, Ecumenical Care Closet', NULL, NULL, 'WI', NULL, '608-882-4532', NULL, NULL, 54),
(68, 'Evansville Food Pantry', NULL, NULL, 'WI', NULL, '608-882-4532', NULL, NULL, 54),
(69, 'Edgerton Community Outreach', NULL, NULL, 'WI', NULL, '608-884-9593', NULL, NULL, 54),
(70, 'Milton Community Action Food Pantry', NULL, NULL, 'WI', NULL, '608-868-1166', NULL, NULL, 54),
(71, 'Orfordville C.U.P.', NULL, NULL, 'WI', NULL, '608-290-6592', NULL, NULL, 54),
(72, 'Rockton Township General Assistance', NULL, NULL, 'WI', NULL, '815-624-7788', NULL, NULL, 54),
(73, 'Janesville, ECHO', NULL, NULL, 'WI', NULL, '608-754-5333', NULL, NULL, 54),
(74, 'Janesville, Salvation Army', NULL, NULL, 'WI', NULL, '608-754-8577', NULL, NULL, 54),
(75, 'Second Harvest Foodbank of So. WI', NULL, NULL, 'WI', NULL, '608-223-9121', NULL, NULL, 54),
(76, 'Nutrition and Health Assoc. Nutrition Solutions', NULL, NULL, 'WI', NULL, '608-754-3722', NULL, NULL, 54),
(77, 'Rock County WIC Beloit', NULL, NULL, 'WI', NULL, '608-362-1566', NULL, NULL, 54),
(78, 'Rock County WIC Janesville', NULL, NULL, 'WI', NULL, '608-754-3722', NULL, NULL, 54),
(79, 'UW~Extension Nutrition Education Program', NULL, NULL, 'WI', NULL, '608-757-5696', NULL, NULL, 54),
(80, 'UW~Extension Nutrition Education Program', NULL, NULL, 'WI', NULL, '608-363-6272', NULL, NULL, 54),
(81, 'Rock County WIC Beloit', NULL, NULL, 'WI', NULL, '608-362-1566', NULL, NULL, 54),
(82, 'Rock County WIC Janesville', NULL, NULL, 'WI', NULL, '608-754-3722', NULL, NULL, 54),
(83, 'Caritas', NULL, NULL, 'WI', NULL, '608-362-4403', NULL, NULL, 54),
(84, 'ECHO', NULL, NULL, 'WI', NULL, '608-754-5333', NULL, NULL, 54),
(85, 'Caritas Community Diaper Bank', NULL, NULL, 'WI', NULL, '608-362-4403', NULL, NULL, 54),
(86, 'Stateline Pregnancy Clinic', NULL, NULL, 'WI', NULL, '608-365-5433', NULL, NULL, 54),
(87, 'Janesville ECHO', NULL, NULL, 'WI', NULL, '608-754-5333', NULL, NULL, 54),
(88, 'Beloit, New Life Tabernacle', NULL, NULL, 'WI', NULL, '608-207-3561', NULL, NULL, 54),
(89, 'Beloit, Salvation Army', NULL, NULL, 'WI', NULL, '608-365-6572', NULL, NULL, 54),
(90, 'Beloit, Caritas', NULL, NULL, 'WI', NULL, '608-362-4403', NULL, NULL, 54),
(91, 'Janesville, United Methodist Church', NULL, NULL, 'WI', NULL, '608-752-0548', NULL, NULL, 54),
(92, 'Janesville, ECHO Community Meal', NULL, NULL, 'WI', NULL, '608-754-5333', NULL, NULL, 54),
(93, 'Janesville, Midwest Christian Center', NULL, NULL, 'WI', NULL, '608-755-1750', NULL, NULL, 54),
(94, 'Janesville, Salvation Army', NULL, NULL, 'WI', NULL, '608-757-8300', NULL, NULL, 54),
(95, 'Janesville, Church of Nazarene', NULL, NULL, 'WI', NULL, '608-752-1323', NULL, NULL, 54),
(96, 'Meals on Wheels Beloit', NULL, NULL, 'WI', NULL, '608-362-3683', NULL, NULL, 54),
(97, 'Meals on Wheels Janesville', NULL, NULL, 'WI', NULL, '608-756-6784', NULL, NULL, 54),
(98, 'School Meal sites inc. summer Beloit', NULL, NULL, 'WI', NULL, '608-361-3446', NULL, NULL, 54),
(99, 'School Meal sites inc. summer Janesville', NULL, NULL, 'WI', NULL, '608-743-5132', NULL, NULL, 54),
(100, 'New Zion Baptist Church', NULL, NULL, 'WI', NULL, '608-362-7703', NULL, NULL, 54),
(101, 'Beloit, City of', NULL, NULL, 'WI', NULL, '608-364-6600', NULL, NULL, 54),
(102, 'Beloit Municipal Court', NULL, NULL, 'WI', NULL, '608-364-6613', NULL, NULL, 54),
(103, 'Beloit Town Hall', NULL, NULL, 'WI', NULL, '608-364-2980', NULL, NULL, 54),
(104, 'Child Support Enforcement', NULL, NULL, 'WI', NULL, '608-757-5700', NULL, NULL, 54),
(105, 'Clerk of Courts', NULL, NULL, 'WI', NULL, '608-743-2200', NULL, NULL, 54),
(106, 'Clinton, Village of', NULL, NULL, 'WI', NULL, '608-676-5304', NULL, NULL, 54),
(107, 'Rock Co. Court System Receptionist', NULL, NULL, 'WI', NULL, '608-743-2225', NULL, NULL, 54),
(108, 'Department of Immigration', NULL, NULL, 'WI', NULL, '800-375-5283', NULL, NULL, 54),
(109, 'Edgerton, City of', NULL, NULL, 'WI', NULL, '608-884-3341', NULL, NULL, 54),
(110, 'Evansville, City of', NULL, NULL, 'WI', NULL, '608-882-2266', NULL, NULL, 54),
(111, 'Janesville, City of', NULL, NULL, 'WI', NULL, '608-755-3000', NULL, NULL, 54),
(112, 'KIDS Child Support Information line', NULL, NULL, 'WI', NULL, '800-991-5530', NULL, NULL, 54),
(113, 'Milton, City of', NULL, NULL, 'WI', NULL, '608-868-6900', NULL, NULL, 54),
(114, 'Orfordville, City of', NULL, NULL, 'WI', NULL, '608-879-2004', NULL, NULL, 54),
(115, 'South Beloit, City of', NULL, NULL, 'WI', NULL, '815-389-3023', NULL, NULL, 54),
(116, 'Roscoe, Village of', NULL, NULL, 'WI', NULL, '815-623-2829', NULL, NULL, 54),
(117, 'Rockton, Village of', NULL, NULL, 'WI', NULL, '815-624-7600', NULL, NULL, 54),
(118, 'Treasure Office(PropertyTax)', NULL, NULL, 'WI', NULL, '608-757-5670', NULL, NULL, 54),
(119, 'Salvation Army, Beloit', NULL, NULL, 'WI', NULL, '608-365-6572', NULL, NULL, 54),
(120, 'Salvation Army, Janesville', NULL, NULL, 'WI', NULL, '608-757-8300', NULL, NULL, 54),
(121, 'American Red Cross Beloit', NULL, NULL, 'WI', NULL, '608-232-5821', NULL, NULL, 54),
(122, 'American Red Cross Janesville', NULL, NULL, 'WI', NULL, '877-618-6628', NULL, NULL, 54),
(123, 'Transitional living Program', NULL, NULL, 'WI', NULL, '608-313-1302', NULL, NULL, 54),
(124, 'Caritas', NULL, NULL, 'WI', NULL, '608-362-4403', NULL, NULL, 54),
(125, 'Family Services Assoc. of So. WI and No.IL', NULL, NULL, 'WI', NULL, '608-365-1244', NULL, NULL, 54),
(126, 'Edgerton Community Outreach', NULL, NULL, 'WI', NULL, '608-884-9593', NULL, NULL, 54),
(127, 'Janesville ECHO', NULL, NULL, 'WI', NULL, '608-754-5333', NULL, NULL, 54),
(128, 'Consumer Credit Counseling Beloit', NULL, NULL, 'WI', NULL, '608-365-1244', NULL, NULL, 54),
(129, 'Consumer Credit Counseling Janesville', NULL, NULL, 'WI', NULL, '608 752-5813', NULL, NULL, 54),
(130, 'Energy Assistance', NULL, NULL, 'WI', NULL, '608-363-9200', NULL, NULL, 54),
(131, 'Bureau of Consumer Protection', NULL, NULL, 'WI', NULL, '800-422-7128', NULL, NULL, 54),
(132, 'WI Home Energy Assistance', NULL, NULL, 'WI', NULL, '866-432-8947', NULL, NULL, 54),
(133, 'Rock County Project', NULL, NULL, 'WI', NULL, '608-314-5501', NULL, NULL, 54),
(134, 'Sparrows Nest- Beloit', NULL, NULL, 'WI', NULL, '608-362 8215', NULL, NULL, 54),
(135, 'Lazarus House- Janesville', NULL, NULL, 'WI', NULL, '608-373-0766', NULL, NULL, 54),
(136, 'My Sister\'s Place Women', NULL, NULL, 'WI', NULL, '608-365-1244', NULL, NULL, 54), /* Phone number doesn't match based on online search. Also, I can't find a 'My Sister's Place' shelter in Rock County. */
(137, 'Red Road House', NULL, NULL, 'WI', NULL, '608-743-0904', NULL, NULL, 54),
(138, 'YWCA Transitional Living Women- Janesville', NULL, NULL, 'WI', NULL, '608-755-4749', NULL, NULL, 54),
(139, 'Housing four our Vets', NULL, NULL, 'WI', NULL, '608-741-4500', NULL, NULL, 54),
(140, 'Beloit Housing Authority', NULL, NULL, 'WI', NULL, '608-364-8740', NULL, NULL, 54),
(141, 'Janesville Neighborhood & Community', NULL, NULL, 'WI', NULL, '608-755-3065', NULL, NULL, 54),
(142, 'Edgerton Housing Authority', NULL, NULL, 'WI', NULL, '608-884-8454', NULL, NULL, 54),
(143, 'Evansville Housing Authority', NULL, NULL, 'WI', NULL, '608-882-4518', NULL, NULL, 54),
(144, 'Grant Village -Janesville', NULL, NULL, 'WI', NULL, '608-755-1755', NULL, NULL, 54),
(145, 'Janesville Commons -Janesville', NULL, NULL, 'WI', NULL, '608-754-3178', NULL, NULL, 54),
(146, 'Lexington Court Apartments', NULL, NULL, 'WI', NULL, '262-642-7704', NULL, NULL, 54),
(147, 'Woodside Terrace -Beloit', NULL, NULL, 'WI', NULL, '608-365-0333', NULL, NULL, 54),
(148, 'Alden Street Apartments,Janesville', NULL, NULL, 'WI', NULL, '608-752-4259', NULL, NULL, 54),
(149, 'Independent Disability Services', NULL, NULL, 'WI', NULL, '608-7S4-5552', NULL, NULL, 54),
(150, 'Hamilton Terrace -Janesville', NULL, NULL, 'WI', NULL, '608-754-4040', NULL, NULL, 54),
(151, 'G.I.F.T.S Men\'s Shelter -Janesville', NULL, NULL, 'WI', NULL, '608-728-0140', NULL, NULL, 54),
(152, 'Hands of Faith Families- Beloit', NULL, NULL, 'WI', NULL, '608-363-0683', NULL, NULL, 54),
(153, 'House of Mercy Families- Janesville', NULL, NULL, 'WI', NULL, '608-754-0045', NULL, NULL, 54),
(154, 'Britton House- Men Beloit', NULL, NULL, 'WI', NULL, '608-365-4787', NULL, NULL, 54),
(155, 'Trinity House Homeless Shelter- Rockford', NULL, NULL, 'WI', NULL, '815-963-3369', NULL, NULL, 54),
(156, 'American Red Cross Shelter- Rockford', NULL, NULL, 'WI', NULL, '815-963-8471', NULL, NULL, 54),
(157, 'Crisis Service: Men -Rockford', NULL, NULL, 'WI', NULL, '815-965-5332', NULL, NULL, 54),
(158, 'Affordable Dentures- Madison &Rockford', NULL, NULL, 'WI', NULL, '800-336-8873', NULL, NULL, 54),
(159, 'Beloit Area Health Care Dental Clinic', NULL, NULL, 'WI', NULL, '608-361-0311', NULL, NULL, 54),
(160, 'Blackhawk Technical College', NULL, NULL, 'WI', NULL, '608-757-7732', NULL, NULL, 54),
(161, 'Marquette University School of Dentistry', NULL, NULL, 'WI', NULL, '414-288-6790', NULL, NULL, 54),
(162, 'Wisconsin Dental Association, Inc.', NULL, NULL, 'WI', NULL, '888-538-8932', NULL, NULL, 54),
(163, 'Health Net', NULL, NULL, 'WI', NULL, '608-756-4638', NULL, NULL, 54),
(164, 'Senior Services of Rock County TEPP', NULL, NULL, 'WI', NULL, '608-743-4120', NULL, NULL, 54),
(165, 'Wisconsin School for the Deaf', NULL, NULL, 'WI', NULL, '877-973-3323', NULL, NULL, 54),
(166, 'WI School for the Visually Handicapped', NULL, NULL, 'WI', NULL, '608-758-6100', NULL, NULL, 54),
(167, 'Aids Network, Beloit', NULL, NULL, 'WI', NULL, '608-364-4027', NULL, NULL, 54),
(168, 'Aids Network, Janesville', NULL, NULL, 'WI', NULL, '608-756-3010', NULL, NULL, 54),
(169, 'Aids Resource Center, Madison (WI)', NULL, NULL, 'WI', NULL, '800-486-6276', NULL, NULL, 54),
(170, 'Beloit Area Community Health CareCenter', NULL, NULL, 'WI', NULL, '608-361-0311', NULL, NULL, 54),
(171, 'First Choice Women\'s Care Center,Janesville', NULL, NULL, 'WI', NULL, '608-755-2438', NULL, NULL, 54),
(172, 'First Choice Women\'s Care Center Beloit', NULL, NULL, 'WI', NULL, '608-313-1300', NULL, NULL, 54),
(173, 'Health Net of Janesville', NULL, NULL, 'WI', NULL, '608-756-4638', NULL, NULL, 54),
(174, 'Mercy CommunityCare', NULL, NULL, 'WI', NULL, '608-741-5658', NULL, NULL, 54),
(175, 'South Beloit Family Health Clinic', NULL, NULL, 'WI', NULL, '815-389-2268', NULL, NULL, 54),
(176, 'Rock County', NULL, NULL, 'WI', NULL, '608-758-6170', NULL, NULL, 54),
(177, 'Winnebago County', NULL, NULL, 'WI', NULL, '815-987-2536', NULL, NULL, 54),
(178, 'Beloit Public library', NULL, NULL, 'WI', NULL, '608-364-2905', NULL, NULL, 54),
(179, 'Clinton Public Library', NULL, NULL, 'WI', NULL, '608-676-5569', NULL, NULL, 54),
(180, 'Edgerton Public library', NULL, NULL, 'WI', NULL, '608-884-4511', NULL, NULL, 54),
(181, 'Evansville Public library', NULL, NULL, 'WI', NULL, '608-882-2260', NULL, NULL, 54),
(182, 'Janesville/Hedberg Public library', NULL, NULL, 'WI', NULL, '608-758-6588', NULL, NULL, 54),
(183, 'Milton Public Library', NULL, NULL, 'WI', NULL, '608-868-7462', NULL, NULL, 54),
(184, 'Orfordville Public library', NULL, NULL, 'WI', NULL, '608-879-9229', NULL, NULL, 54),
(185, 'Rockton Public Library/Talcott free library', NULL, NULL, 'WI', NULL, '815-624-7511', NULL, NULL, 54),
(186, 'South Beloit Public library', NULL, NULL, 'WI', NULL, '815-389-2495', NULL, NULL, 54),
(187, 'WI talking book & Braille library- Milwaukee', NULL, NULL, 'WI', NULL, '800-242-8822', NULL, NULL, 54),
(188, 'Even Start Family Literacy-Beloit', NULL, NULL, 'WI', NULL, '608-361-1905', NULL, NULL, 54),
(189, 'Adult English Learner Classes Janesville', NULL, NULL, 'WI', NULL, '608-757-7620', NULL, NULL, 54),
(190, 'The Literacy Connection -Janesville', NULL, NULL, 'WI', NULL, '608-756-3125', NULL, NULL, 54),
(191, 'Rockford LiteracyCouncil', NULL, NULL, 'WI', NULL, '815-963-7323', NULL, NULL, 54),
(192, 'Stateline Literacy Council-Beloit', NULL, NULL, 'WI', NULL, '608-362-5207', NULL, NULL, 54),
(193, 'Exchange Family Resource Center Janesville', NULL, NULL, 'WI', NULL, '608-314-9006', NULL, NULL, 54),
(194, 'Exchange Family Resource Center Beloit', NULL, NULL, 'WI', NULL, '608-365-8553', NULL, NULL, 54),
(195, 'Community Action', NULL, NULL, 'WI', NULL, '608-755-2488', NULL, NULL, 54),
(196, 'Community Coordinated Child Care', NULL, NULL, 'WI', NULL, '800-750-5437', NULL, NULL, 54),
(197, 'Rock-Walworth Head Start & Early Head Start', NULL, NULL, 'WI', NULL, '800-774-7778', NULL, NULL, 54),
(198, 'ALS Association Wisconsin Chapter', NULL, NULL, 'WI', NULL, '262-784-5267', NULL, NULL, 54),
(199, 'American Cancer Society -Madison', NULL, NULL, 'WI', NULL, '800-227-2345', NULL, NULL, 54),
(200, 'Easter Seals Wisconsin -Madison', NULL, NULL, 'WI', NULL, '800-422-2324', NULL, NULL, 54),
(201, 'First Lutheran Church -Janesville', NULL, NULL, 'WI', NULL, '608-752-7434', NULL, NULL, 54),
(202, 'Society\'s Assets Inc.- Elkhorn', NULL, NULL, 'WI', NULL, '800-261-8181', NULL, NULL, 54),
(203, 'Associates In Psychotherapy Janesville', NULL, NULL, 'WI', NULL, '608-752-7255', NULL, NULL, 54),
(204, 'Associates In Psychotherapy', NULL, NULL, 'WI', NULL, '608-365-4313', NULL, NULL, 54),
(205, 'Beloit Counseling Center', NULL, NULL, 'WI', NULL, '608-363-6300', NULL, NULL, 54),
(206, 'Catholic Charities', NULL, NULL, 'WI', NULL, '608-752-4993', NULL, NULL, 54),
(207, 'Rock Co. Clinical services children and', NULL, NULL, 'WI', NULL, '608-757-5229', NULL, NULL, 54),
(208, 'Counseling Care center- Beloit Health', NULL, NULL, 'WI', NULL, '608-364-5686', NULL, NULL, 54),
(209, 'CrossRoads Counseling Center', NULL, NULL, 'WI', NULL, '608-755-5260', NULL, NULL, 54),
(210, 'Family Services of S. Wisconsin & N. Illinois', NULL, NULL, 'WI', NULL, '608-365-1244', NULL, NULL, 54),
(211, 'Genesis CounselingServices', NULL, NULL, 'WI', NULL, '608-757-0404', NULL, NULL, 54),
(212, 'Janesville PsychiatricCiinic', NULL, NULL, 'WI', NULL, '608-755-1475', NULL, NULL, 54),
(213, 'Autism Support Group', NULL, NULL, 'WI', NULL, '608-752-4993', NULL, NULL, 54),
(214, 'Beloit Regional Hospice', NULL, NULL, 'WI', NULL, '608-363-7421', NULL, NULL, 54),
(215, 'Agrace Hospice', NULL, NULL, 'WI', NULL, '608-755-1871', NULL, NULL, 54),
(216, 'Lutheran Social Services', NULL, NULL, 'WI', NULL, '608-752-7660', NULL, NULL, 54),
(217, 'Mercv Ootions', NULL, NULL, 'WI', NULL, '608-756-5555', NULL, NULL, 54),
(218, 'Pregnancy Helpline', NULL, NULL, 'WI', NULL, '608-755-9739', NULL, NULL, 54),
(219, 'Stateline Pregnancy Clinic', NULL, NULL, 'WI', NULL, '608-365-5433', NULL, NULL, 54),
(220, 'Winther Counseling UW-Whitewater', NULL, NULL, 'WI', NULL, '262-472-2842', NULL, NULL, 54),
(221, 'Beloit Health Systems', NULL, NULL, 'WI', NULL, '608-364-2200', NULL, NULL, 54),
(222, 'Beloit Memorial Hospital', NULL, NULL, 'WI', NULL, '608-364-5011', NULL, NULL, 54),
(223, 'Dean Care', NULL, NULL, 'WI', NULL, '608-371-8000', NULL, NULL, 54),
(224, 'Dean StMary\'s Hospital Janesville', NULL, NULL, 'WI', NULL, '608-373-8000', NULL, NULL, 54),
(225, 'Mercy Health System', NULL, NULL, 'WI', NULL, '608-756-6000', NULL, NULL, 54),
(226, 'Mercy Hospital', NULL, NULL, 'WI', NULL, '800-756-4147', NULL, NULL, 54),
(227, 'Edgerton Hospital', NULL, NULL, 'WI', NULL, '608-884-3441', NULL, NULL, 54),
(228, 'Caritas', NULL, NULL, 'WI', NULL, '608-362-4403', NULL, NULL, 54),
(229, 'Health Net', NULL, NULL, 'WI', NULL, '608-756-4638', NULL, NULL, 54),
(230, 'Janesville, Salvation Army', NULL, NULL, 'WI', NULL, '608-757-8300', NULL, NULL, 54),
(231, 'Illinois Department of Public Health', NULL, NULL, 'WI', NULL, '800-782-7860', NULL, NULL, 54),
(232, 'Rock County Health Dept. South', NULL, NULL, 'WI', NULL, '608-757-5442', NULL, NULL, 54),
(233, 'Rock County Health Dept. North', NULL, NULL, 'WI', NULL, '608-364-2010', NULL, NULL, 54),
(234, 'First Choice Women\'s Care Center, Janesville', NULL, NULL, 'WI', NULL, '608-755-2438', NULL, NULL, 54),
(235, 'First Choice Women\'s Care Center Beloit', NULL, NULL, 'WI', NULL, '608-313-1300', NULL, NULL, 54),
(236, 'ABC for Health', NULL, NULL, 'WI', NULL, '800-585-4222', NULL, NULL, 54),
(237, 'Dean on Call, twenty-four hourhelpline', NULL, NULL, 'WI', NULL, '800-576-8773', NULL, NULL, 54),
(238, 'Maternal & Child Health Hotline', NULL, NULL, 'WI', NULL, '800-722-2295', NULL, NULL, 54),
(239, 'Mercy Health Line', NULL, NULL, 'WI', NULL, '608-756-6100', NULL, NULL, 54),
(240, 'Rock County Health Dept. North', NULL, NULL, 'WI', NULL, '608-757-5442', NULL, NULL, 54),
(241, 'Rock County Health Dept. South', NULL, NULL, 'WI', NULL, '608-364-2010', NULL, NULL, 54),
(242, 'Beloit Area Community Health Center', NULL, NULL, 'WI', NULL, '608-361-0311', NULL, NULL, 54),
(243, 'Crusader Clinic -Rockford', NULL, NULL, 'WI', NULL, '815-490-1600', NULL, NULL, 54),
(244, 'First Choice Women\'s Health Center', NULL, NULL, 'WI', NULL, '608-755-2438', NULL, NULL, 54),
(245, 'First Choice Women\'s Health Center Beloit', NULL, NULL, 'WI', NULL, '608-313-1300', NULL, NULL, 54),
(246, 'Janesville Community Health Center', NULL, NULL, 'WI', NULL, '608-758-7814', NULL, NULL, 54),
(247, 'Early Head Start Doula Program', NULL, NULL, 'WI', NULL, '800-774-7778', NULL, NULL, 54),
(248, 'Nutrition & Health Associates. (NHA) *Prenatal Care Pragram/WICJanesvi/le', NULL, NULL, 'WI', NULL, '608-754-3722', NULL, NULL, 54),
(249, 'Nutrition & Health Associates. (NHA) * Prenatal Care Program/ WIC Bela it', NULL, NULL, 'WI', NULL, '608-362-1566', NULL, NULL, 54),
(250, 'Pregnancy Helpline of Janesville, Inc.', NULL, NULL, 'WI', NULL, '608-755-9739', NULL, NULL, 54),
(251, 'Prenatal Class- Beloit Hospital', NULL, NULL, 'WI', NULL, '608-364-5237', NULL, NULL, 54),
(252, 'Prenatal Class- Mercy Hospital', NULL, NULL, 'WI', NULL, '608-756-6799', NULL, NULL, 54),
(253, 'Prenatal Class- Dean St. Mary\'s', NULL, NULL, 'WI', NULL, '608-371-8000', NULL, NULL, 54),
(254, 'Rock Co. Health Dept. Home Visiting Program', NULL, NULL, 'WI', NULL, '608-757-5440', NULL, NULL, 54),
(255, 'Stateline PregnancvCiinic', NULL, NULL, 'WI', NULL, '608-365-5433', NULL, NULL, 54),
(256, 'Exchange Family Resource Center Beloit', NULL, NULL, 'WI', NULL, '608-365-8553', NULL, NULL, 54),
(257, 'Exchange Family Resource Center Janesville', NULL, NULL, 'WI', NULL, '608-314-9006', NULL, NULL, 54),
(258, 'Exchange Family Resource Center Janesville', NULL, NULL, 'WI', NULL, '608-314-9006', NULL, NULL, 54),
(259, 'Tobacco Quitline', NULL, NULL, 'WI', NULL, '877-784-8669', NULL, NULL, 54),
(260, 'Mercy Options', NULL, NULL, 'WI', NULL, '608-756-5555', NULL, NULL, 54),
(261, 'Rock Co Human Services', NULL, NULL, 'WI', NULL, '608-757-5344', NULL, NULL, 54),
(262, 'Cross Roads', NULL, NULL, 'WI', NULL, '608-755-5260', NULL, NULL, 54),
(263, 'Genesis', NULL, NULL, 'WI', NULL, '608-757-0404', NULL, NULL, 54),
(264, 'Youngstar Childcare referral specialist', NULL, NULL, 'WI', NULL, '888-713-5437', NULL, NULL, 54),
(265, 'Community Coordinated Child Care', NULL, NULL, 'WI', NULL, '800-750-5437', NULL, NULL, 54),
(266, 'Rock-Walworth HeadStart & Early Head Start', NULL, NULL, 'WI', NULL, '800-774-7778', NULL, NULL, 54),
(267, 'Latino Service Providers', NULL, NULL, 'WI', NULL, '608-361-1928', NULL, NULL, 54),
(268, 'YWCA Immigrant Outreach', NULL, NULL, 'WI', NULL, '608-752-5445', NULL, NULL, 54),
(269, 'Beloit Even Start Family Literacy ESL', NULL, NULL, 'WI', NULL, '608-361-1905', NULL, NULL, 54),
(270, 'English Language Learner Blackhawk Tech', NULL, NULL, 'WI', NULL, '608-757-7741', NULL, NULL, 54),
(271, 'Beloit Turner School District', NULL, NULL, 'WI', NULL, '608-364-6370', NULL, NULL, 54),
(272, 'Clinton Community School District', NULL, NULL, 'WI', NULL, '608-676-2223', NULL, NULL, 54),
(273, 'Evansville Community School District', NULL, NULL, 'WI', NULL, '608-882-4600', NULL, NULL, 54),
(274, 'Edgerton School District', NULL, NULL, 'WI', NULL, '608-884-9402', NULL, NULL, 54),
(275, 'Milton School District', NULL, NULL, 'WI', NULL, '608-868-9300', NULL, NULL, 54),
(276, 'Parkview School District', NULL, NULL, 'WI', NULL, '608-879-2994', NULL, NULL, 54),
(277, 'Beloit School District', NULL, NULL, 'WI', NULL, '608-361-4100', NULL, NULL, 54),
(278, 'Beloit InSPIRE Coordinator', NULL, NULL, 'WI', NULL, '608-290-6193', NULL, NULL, 54),
(279, 'Janesville School District', NULL, NULL, 'WI', NULL, '608-743-5000', NULL, NULL, 54),
(280, 'Janesville InSPIRE Coordinator', NULL, NULL, 'WI', NULL, '608-752-8273', NULL, NULL, 54),
(281, 'Hononegah Community High School District', NULL, NULL, 'WI', NULL, '815-624-2070', NULL, NULL, 54),
(282, 'South Beloit Community School District', NULL, NULL, 'WI', NULL, '815-389-9004', NULL, NULL, 54),
(283, 'Independent Disability Services- Respite', NULL, NULL, 'WI', NULL, '608-754-5552', NULL, NULL, 54),
(284, 'WI First Step Hotline', NULL, NULL, 'WI', NULL, '800-722-2295', NULL, NULL, 54),
(285, 'Birth to Three CESA II', NULL, NULL, 'WI', NULL, '608-756-3147', NULL, NULL, 54),
(286, 'Family Respite Care Services', NULL, NULL, 'WI', NULL, '608-758-0956', NULL, NULL, 54),
(287, 'Family Respite Care Services', NULL, NULL, 'WI', NULL, '608-758-0956', NULL, NULL, 54),
(288, 'Food Share', NULL, NULL, 'WI', NULL, '800-362-3002', NULL, NULL, 54),
(289, 'WI Medical Assistance/Badgercare+', NULL, NULL, 'WI', NULL, '888-794-5780', NULL, NULL, 54),
(290, 'Long Term Support', NULL, NULL, 'WI', NULL, '888-794-5780', NULL, NULL, 54),
(291, 'Social Security Administration', NULL, NULL, 'WI', NULL, '800-772-1213', NULL, NULL, 54),
(292, 'Unemployment', NULL, NULL, 'WI', NULL, '800-494-4944', NULL, NULL, 54),
(293, 'W-two', NULL, NULL, 'WI', NULL, '608-741-3400', NULL, NULL, 54),
(294, 'Rock Co. Human Services Economic Support', NULL, NULL, 'WI', NULL, '888-794-5780', NULL, NULL, 54),
(295, 'Rock Co. Southern Consortium', NULL, NULL, 'WI', NULL, '888-794-5780', NULL, NULL, 54),
(296, 'Health Insurance Market Place', NULL, NULL, 'WI', NULL, '800-318-2596', NULL, NULL, 54),
(297, 'Badgercare+ Southern Consortium', NULL, NULL, 'WI', NULL, '888-794-5780', NULL, NULL, 54),
(298, 'United Way', NULL, NULL, NULL, NULL, '211', 'WI', NULL, 73),
(299, 'United Way Blackhawk Region', NULL, NULL, 'WI', NULL, '608-757-3040', NULL, NULL, 54);

-- --------------------------------------------------------

--
-- Table structure for table `ResourceTypeAssignment`
--

CREATE TABLE `ResourceTypeAssignment` (
  `ResourceTypeAssignmentID` int(11) NOT NULL,
  `ResourceTypeID` int(11) NOT NULL,
  `ResourceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ResourceTypeAssignment`
--

INSERT INTO `ResourceTypeAssignment` (`ResourceTypeAssignmentID`, `ResourceTypeID`, `ResourceID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 2, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14),
(15, 3, 15),
(16, 3, 16),
(17, 3, 17),
(18, 4, 18),
(19, 4, 19),
(20, 4, 19),
(21, 4, 21),
(22, 4, 22),
(23, 4, 23),
(24, 4, 24),
(25, 5, 25),
(26, 5, 26),
(27, 5, 27),
(28, 6, 28),
(29, 6, 29),
(30, 6, 30),
(31, 6, 31),
(32, 6, 32),
(33, 6, 33),
(34, 6, 34),
(35, 6, 35),
(36, 6, 36),
(37, 6, 37),
(38, 7, 38),
(39, 7, 39),
(40, 7, 40),
(41, 7, 41),
(42, 7, 42),
(43, 7, 43),
(44, 7, 44),
(45, 7, 45),
(46, 8, 46),
(47, 8, 47),
(48, 8, 48),
(49, 8, 49),
(50, 8, 50),
(51, 8, 51),
(52, 8, 52),
(53, 8, 53),
(54, 9, 54),
(55, 9, 55),
(56, 9, 56),
(57, 9, 57),
(58, 9, 58),
(59, 10, 59),
(60, 10, 60),
(61, 10, 61),
(62, 10, 62),
(63, 10, 63),
(64, 10, 19),
(65, 10, 65),
(66, 10, 66),
(67, 10, 67),
(68, 10, 68),
(69, 10, 69),
(70, 10, 70),
(71, 10, 71),
(72, 10, 72),
(73, 10, 73),
(74, 10, 74),
(75, 10, 75),
(76, 11, 76),
(77, 11, 77),
(78, 11, 78),
(79, 11, 79),
(80, 11, 79),
(81, 12, 77),
(82, 12, 78),
(83, 12, 23),
(84, 12, 84),
(85, 13, 85),
(86, 13, 86),
(87, 13, 87),
(88, 14, 88),
(89, 14, 19),
(90, 14, 90),
(91, 14, 91),
(92, 14, 92),
(93, 14, 93),
(94, 14, 94),
(95, 14, 95),
(96, 14, 96),
(97, 14, 97),
(98, 14, 98),
(99, 14, 99),
(100, 14, 100),
(101, 15, 101),
(102, 15, 102),
(103, 15, 103),
(104, 15, 104),
(105, 15, 105),
(106, 15, 106),
(107, 15, 107),
(108, 15, 108),
(109, 15, 109),
(110, 15, 110),
(111, 15, 111),
(112, 15, 112),
(113, 15, 113),
(114, 15, 114),
(115, 15, 115),
(116, 15, 116),
(117, 15, 117),
(118, 15, 118),
(119, 16, 119),
(120, 16, 120),
(121, 16, 121),
(122, 16, 122),
(123, 17, 123),
(124, 17, 23),
(125, 17, 125),
(126, 17, 21),
(127, 17, 87),
(128, 18, 128),
(129, 18, 129),
(130, 18, 130),
(131, 18, 131),
(132, 18, 132),
(133, 19, 133),
(134, 20, 134),
(135, 20, 135),
(136, 20, 136),
(137, 20, 137),
(138, 20, 138),
(139, 20, 139),
(140, 21, 140),
(141, 21, 51),
(142, 21, 142),
(143, 21, 143),
(144, 22, 144),
(145, 22, 145),
(146, 22, 146),
(147, 22, 147),
(148, 23, 148),
(149, 23, 149),
(150, 23, 150),
(151, 24, 151),
(152, 24, 152),
(153, 24, 153),
(154, 24, 154),
(155, 24, 155),
(156, 24, 156),
(157, 24, 157),
(158, 25, 158),
(159, 25, 159),
(160, 25, 160),
(161, 25, 161),
(162, 25, 162),
(163, 25, 163),
(164, 26, 164),
(165, 26, 165),
(166, 27, 166),
(167, 28, 167),
(168, 28, 168),
(169, 28, 169),
(170, 28, 170),
(171, 28, 171),
(172, 28, 172),
(173, 28, 173),
(174, 28, 174),
(175, 28, 175),
(176, 29, 176),
(177, 29, 177),
(178, 30, 178),
(179, 30, 179),
(180, 30, 180),
(181, 30, 181),
(182, 30, 182),
(183, 30, 183),
(184, 30, 184),
(185, 30, 185),
(186, 30, 186),
(187, 30, 187),
(188, 31, 188),
(189, 31, 189),
(190, 31, 190),
(191, 31, 191),
(192, 31, 192),
(193, 32, 193),
(194, 32, 194),
(195, 32, 195),
(196, 32, 196),
(197, 32, 197),
(198, 33, 198),
(199, 33, 199),
(200, 33, 200),
(201, 33, 201),
(202, 33, 202),
(203, 34, 203),
(204, 34, 204),
(205, 34, 205),
(206, 34, 206),
(207, 34, 207),
(208, 34, 208),
(209, 34, 209),
(210, 34, 210),
(211, 34, 211),
(212, 34, 212),
(213, 34, 213),
(214, 34, 214),
(215, 34, 215),
(216, 34, 216),
(217, 34, 217),
(218, 34, 218),
(219, 34, 86),
(220, 34, 220),
(221, 34, 221),
(222, 34, 222),
(223, 34, 223),
(224, 34, 224),
(225, 34, 225),
(226, 34, 226),
(227, 34, 227),
(228, 35, 23),
(229, 35, 163),
(230, 35, 74),
(231, 36, 231),
(232, 36, 232),
(233, 36, 233),
(234, 37, 234),
(235, 37, 172),
(236, 38, 236),
(237, 38, 237),
(238, 38, 238),
(239, 38, 239),
(240, 38, 233),
(241, 38, 232),
(242, 39, 242),
(243, 39, 243),
(244, 39, 244),
(245, 39, 245),
(246, 39, 246),
(247, 39, 247),
(248, 39, 248),
(249, 39, 249),
(250, 39, 250),
(251, 39, 251),
(252, 39, 252),
(253, 39, 253),
(254, 39, 254),
(255, 39, 255),
(256, 39, 194),
(257, 39, 193),
(258, 39, 193),
(259, 39, 259),
(260, 39, 260),
(261, 39, 261),
(262, 39, 262),
(263, 39, 263),
(264, 40, 264),
(265, 40, 196),
(266, 40, 266),
(267, 41, 267),
(268, 41, 268),
(269, 41, 269),
(270, 41, 270),
(271, 42, 271),
(272, 42, 272),
(273, 42, 273),
(274, 42, 274),
(275, 42, 275),
(276, 42, 276),
(277, 42, 277),
(278, 42, 278),
(279, 42, 279),
(280, 42, 280),
(281, 42, 281),
(282, 42, 282),
(283, 43, 283),
(284, 43, 284),
(285, 43, 285),
(286, 43, 286),
(287, 44, 286),
(288, 44, 288),
(289, 44, 289),
(290, 44, 290),
(291, 44, 291),
(292, 44, 292),
(293, 44, 293),
(294, 44, 294),
(295, 44, 295),
(296, 45, 296),
(297, 45, 297),
(298, 46, 298),
(299, 46, 299);

-- --------------------------------------------------------

--
-- Table structure for table `ResourceTypes`
--

CREATE TABLE `ResourceTypes` (
  `ResourceTypeID` int(11) NOT NULL,
  `ResourceTypeName` varchar(150) DEFAULT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ResourceTypes`
--

INSERT INTO `ResourceTypes` (`ResourceTypeID`, `ResourceTypeName`) VALUES
(1, 'Emergency'),
(2, 'Law Enforcement Resources' /* <-- (3/13/2018) Changed from: 'Non Emergency' */),
(3, 'Reporting Abuse'),
(4, 'Clothes Free'),
(5, 'Consumer Protection'),
(6, 'Job Training/Employment'),
(7, 'Transportation'),
(8, 'Discrimination/Equity'),
(9, 'Domestic Violence'),
(10, 'Food/Food Pantries'),
(11, 'Nutrition'),
(12, 'Formula'),
(13, 'Diapers/Baby Formula'),
(14, 'Food Assistance/Meal Sites'),
(15, 'Government'),
(16, 'Disasters'),
(17, 'Rent Assistance'),
(18, 'Credit Couseling/Assistance'),
(19, 'Homeless Teens'),
(20, 'Transitional Living Programs'),
(21, 'Section 8 & Public Housing'),
(22, 'Subsidized Housing Family'),
(23, 'Disabled Housing'),
(24, 'Shelters'),
(25, 'Medical and Dental'),
(26, 'Hearing'),
(27, 'Vision'),
(28, 'Free/Sliding Scale Clinics'),
(29, 'Public Defender'),
(30, 'Libraries'),
(31, 'Literacy'),
(32, 'Child Development/Parenting'),
(33, 'Loan Closets'),
(34, 'Counseling and Support'),
(35, 'Prescription Drug Assistance'),
(36, 'Immunizations/Vaccinations'),
(37, 'STD Testing'),
(38, 'Health Information Lines'),
(39, 'Pregnancy/Prenatal'),
(40, 'Childcare'),
(41, 'Services For Latinos'),
(42, 'School District Contacts, Pregnant and Parenting Teens, and Contact School Nurse or Guidance Counselor'),
(43, 'Children With Special Health Care Needs'),
(44, 'Public Benefits'),
(45, 'Health Insurance'),
(46, 'Rock County Resource Information');

-- --------------------------------------------------------

--
-- Table structure for table `States`
--

CREATE TABLE `States` (
  `StateID` varchar(2) NOT NULL,
  `StateName` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `States`
--

INSERT INTO `States` (`StateID`, `StateName`) VALUES
('AK', 'Alaska'),
('AR', 'Arkansas'),
('AZ', 'Arizona'),
('CA', 'California'),
('CO', 'Colorado'),
('CT', 'Connecticut'),
('DC', 'District of Col'),
('DE', 'Delaware'),
('FL', 'Florida'),
('GA', 'Georgia'),
('HI', 'Hawaii'),
('IA', 'Iowa'),
('ID', 'Idaho'),
('IL', 'Illinois'),
('IN', 'Indiana'),
('KS', 'Kansas'),
('KY', 'Kentucky'),
('LA', 'Louisiana'),
('MA', 'Massachusetts'),
('MD', 'Maryland'),
('ME', 'Maine'),
('MI', 'Michigan'),
('MN', 'Minnesota'),
('MO', 'Missouri'),
('MS', 'Mississippi'),
('MT', 'Montana'),
('NC', 'North Carolina'),
('ND', 'North Dakota'),
('NE', 'Nebraska'),
('NH', 'New Hampshire'),
('NJ', 'New Jersey'),
('NM', 'New Mexico'),
('NV', 'Nevada'),
('NY', 'New York'),
('OH', 'Ohio'),
('OK', 'Oklahoma'),
('OR', 'Oregon'),
('PA', 'Pennsylvania'),
('PR', 'Puerto Rico'),
('RI', 'Rhode Island'),
('SC', 'South Carolina'),
('SD', 'South Dakota'),
('TN', 'Tennessee'),
('TX', 'Texas'),
('UT', 'Utah'),
('VA', 'Virginia'),
('VT', 'Vermont'),
('WA', 'Washington'),
('WI', 'Wisconsin'),
('WV', 'West Virginia'),
('WY', 'Wyoming'),
('ZZ', 'Not Applicable'); /* <-- Added by Steph 5/2/2017 to account for nationwide resources */

INSERT INTO Counties (CountyID,CountyName) VALUES
(99999, 'N/A'), /*--> Added by Steph 5/2/2017 to account for nationwide & statewide resources */
(55001, 'Adams'),
(55003, 'Ashland'),
(55005, 'Barron'),
(55007, 'Bayfield'),
(55009, 'Brown'),
(55011, 'Buffalo'),
(55013, 'Burnett'),
(55015, 'Calumet'),
(55017, 'Chippewa'),
(55019, 'Clark'),
(55021, 'Columbia'),
(55023, 'Crawford'),
(55025, 'Dane'),
(55027, 'Dodge'),
(55029, 'Door'),
(55031, 'Douglas'),
(55033, 'Dunn'),
(55035, 'Eau Claire'),
(55037, 'Florence'),
(55039, 'Fond du Lac'),
(55041, 'Forest'),
(55043, 'Grant'),
(55045, 'Green'),
(55047, 'Green Lake'),
(55049, 'Iowa'),
(55051, 'Iron'),
(55053, 'Jackson'),
(55055, 'Jefferson'),
(55057, 'Juneau'),
(55059, 'Kenosha'),
(55061, 'Kewauna'),
(55063, 'La Crosse'),
(55065, 'Lafayette'),
(55067, 'Langlade'),
(55069, 'Lincoln'),
(55071, 'Manitowoc'),
(55073, 'Marathon'),
(55075, 'Marinette'),
(55077, 'Marquette'),
(55078, 'Menominee'),
(55079, 'Milwaukee'),
(55081, 'Monroe'),
(55083, 'Oconto'),
(55085, 'Oneida'),
(55087, 'Outagamie'),
(55089, 'Ozaukee'),
(55091, 'Pepin'),
(55093, 'Pierce'),
(55095, 'Polk'),
(55097, 'Portage'),
(55099, 'Price'),
(55101, 'Racine'),
(55103, 'Richland'),
(55105, 'Rock'),
(55107, 'Rusk'),
(55109, 'Sauk'),
(55111, 'Sawyer'),
(55113, 'Shawano'),
(55115, 'Sheboygan'),
(55117, 'St. Croix'),
(55119, 'Taylor'),
(55121, 'Trempealeau'),
(55123, 'Vernon'),
(55125, 'Vilas'),
(55127, 'Walworth'),
(55129, 'Washburn'),
(55131, 'Washington'),
(55133, 'Waukesha'),
(55135, 'Waupaca'),
(55137, 'Waushara'),
(55139, 'Winnebago'),
(55141, 'Wood');


INSERT INTO CountyAssignment (StateID,CountyID) VALUES
('WI', 55001),
('WI', 55003),
('WI', 55005),
('WI', 55007),
('WI', 55009),
('WI', 55011),
('WI', 55013),
('WI', 55015),
('WI', 55017),
('WI', 55019),
('WI', 55021),
('WI', 55023),
('WI', 55025),
('WI', 55027),
('WI', 55029),
('WI', 55031),
('WI', 55033),
('WI', 55035),
('WI', 55037),
('WI', 55039),
('WI', 55041),
('WI', 55043),
('WI', 55045),
('WI', 55047),
('WI', 55049),
('WI', 55051),
('WI', 55053),
('WI', 55055),
('WI', 55057),
('WI', 55059),
('WI', 55061),
('WI', 55063),
('WI', 55065),
('WI', 55067),
('WI', 55069),
('WI', 55071),
('WI', 55073),
('WI', 55075),
('WI', 55077),
('WI', 55078),
('WI', 55079),
('WI', 55081),
('WI', 55083),
('WI', 55085),
('WI', 55087),
('WI', 55089),
('WI', 55091),
('WI', 55093),
('WI', 55095),
('WI', 55097),
('WI', 55099),
('WI', 55101),
('WI', 55103),
('WI', 55105),
('WI', 55107),
('WI', 55109),
('WI', 55111),
('WI', 55113),
('WI', 55115),
('WI', 55117),
('WI', 55119),
('WI', 55121),
('WI', 55123),
('WI', 55125),
('WI', 55127),
('WI', 55129),
('WI', 55131),
('WI', 55133),
('WI', 55135),
('WI', 55137),
('WI', 55139),
('WI', 55141), 
('WI', 99999), /* <-- added by Steph 5/2/2017 to account for statewide resources */
('ZZ', 99999); /* <-- added by Steph 5/2/2017 to account for statewide resources */

-- --------------------------------------------------------

--
-- Table structure for table `UserAssignment`
--

CREATE TABLE `UserAssignment` (
  `UserAssignmentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CountyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `AccessLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Counties`
--
ALTER TABLE `Counties`
  ADD PRIMARY KEY (`CountyID`);

--
-- Indexes for table `CountyAssignment`
--
ALTER TABLE `CountyAssignment`
  -- (removed by alex --> ) ADD PRIMARY KEY (`CountyAssignmentID`),
  ADD KEY `StateID` (`StateID`),
  ADD KEY `CountyID` (`CountyID`);

--
-- Indexes for table `Resources`
--
ALTER TABLE `Resources`
  ADD PRIMARY KEY (`ResourceID`),
  ADD KEY `StateID` (`StateID`);

--
-- Indexes for table `ResourceTypeAssignment`
--
ALTER TABLE `ResourceTypeAssignment`
  ADD PRIMARY KEY (`ResourceTypeAssignmentID`),
  ADD KEY `ResourceTypeID` (`ResourceTypeID`),
  ADD KEY `ResourceID` (`ResourceID`);

--
-- Indexes for table `ResourceTypes`
--
ALTER TABLE `ResourceTypes`
  ADD PRIMARY KEY (`ResourceTypeID`);

--
-- Indexes for table `States`
--
ALTER TABLE `States`
  ADD PRIMARY KEY (`StateID`);

--
-- Indexes for table `UserAssignment`
--
ALTER TABLE `UserAssignment`
  ADD PRIMARY KEY (`UserAssignmentID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CountyID` (`CountyID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Counties`
--
ALTER TABLE `Counties`
  MODIFY `CountyID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CountyAssignment`
--
ALTER TABLE `CountyAssignment`
  MODIFY `CountyAssignmentID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Resources`
--
ALTER TABLE `Resources`
  MODIFY `ResourceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;
--
-- AUTO_INCREMENT for table `ResourceTypeAssignment`
--
ALTER TABLE `ResourceTypeAssignment`
  MODIFY `ResourceTypeAssignmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;
--
-- AUTO_INCREMENT for table `ResourceTypes`
--
ALTER TABLE `ResourceTypes`
  MODIFY `ResourceTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `UserAssignment`
--
ALTER TABLE `UserAssignment`
  MODIFY `UserAssignmentID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `CountyAssignment`
--
ALTER TABLE `CountyAssignment`
  ADD CONSTRAINT `countyassignment_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `States` (`StateID`),
  ADD CONSTRAINT `countyassignment_ibfk_2` FOREIGN KEY (`CountyID`) REFERENCES `Counties` (`CountyID`);

--
-- Constraints for table `Resources`
--
ALTER TABLE `Resources`
  ADD CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `States` (`StateID`),
  ADD CONSTRAINT `resources_ibfk_2` FOREIGN KEY (`CountyAssignmentID`) REFERENCES `CountyAssignment` (`CountyAssignmentID`); /* <--added by Steph to assign counties to resources */

--
-- Constraints for table `ResourceTypeAssignment`
--
ALTER TABLE `ResourceTypeAssignment`
  ADD CONSTRAINT `resourcetypeassignment_ibfk_1` FOREIGN KEY (`ResourceTypeID`) REFERENCES `ResourceTypes` (`ResourceTypeID`),
  ADD CONSTRAINT `resourcetypeassignment_ibfk_2` FOREIGN KEY (`ResourceID`) REFERENCES `Resources` (`ResourceID`);

--
-- Constraints for table `UserAssignment`
--
ALTER TABLE `UserAssignment`
  ADD CONSTRAINT `userassignment_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `userassignment_ibfk_2` FOREIGN KEY (`CountyID`) REFERENCES `Counties` (`CountyID`);
