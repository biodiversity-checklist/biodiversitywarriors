-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 19, 2015 at 04:11 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ft2_floraINA_biodiversitywarriors_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `biodiversitywarriors_coll`
--

CREATE TABLE IF NOT EXISTS `biodiversitywarriors_coll` (
`id` int(11) NOT NULL,
  `collCode` varchar(50) NOT NULL,
  `dateColl` date DEFAULT NULL,
  `indivID` int(11) NOT NULL,
  `collReps` int(11) DEFAULT NULL,
  `dnaColl` enum('yes','no') DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `deposit` varchar(200) DEFAULT NULL,
  `n_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `biodiversitywarriors_collector`
--

CREATE TABLE IF NOT EXISTS `biodiversitywarriors_collector` (
`id` int(11) NOT NULL,
  `collID` int(11) NOT NULL,
  `personID` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `n_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `biodiversitywarriors_det`
--

CREATE TABLE IF NOT EXISTS `biodiversitywarriors_det` (
`id` int(11) NOT NULL,
  `indivID` int(11) NOT NULL,
  `personID` int(11) NOT NULL,
  `det_date` date NOT NULL,
  `taxonID` int(11) NOT NULL,
  `confid` enum('high','medium','low') NOT NULL,
  `using` varchar(1000) DEFAULT NULL,
  `notes` varchar(1500) DEFAULT NULL,
  `n_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `biodiversitywarriors_img`
--

CREATE TABLE IF NOT EXISTS `biodiversitywarriors_img` (
`id` int(11) NOT NULL,
  `indivID` int(11) NOT NULL,
  `personID` int(11) NOT NULL,
  `md5sum` varchar(50) DEFAULT NULL,
  `filename` varchar(200) NOT NULL COMMENT 'Original file name',
  `directory` varchar(500) DEFAULT NULL COMMENT 'Directory structure in zip file',
  `plantpart` enum('whole twig with leaves (and inflorescence)','whole compound leaf','leaf upper surface','leaf lower surface','lower leafbase','leaf axil (w stipules petiole)','terminal bud','inflorescence','flower/fruit basal view','flower/fruit side view','flower/fruit apical view','flower/fruit longitudinal section','flower/fruit cross section','twig surface','twig cross section','trunk bark') DEFAULT NULL,
  `notes` varchar(300) DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `n_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `biodiversitywarriors_indiv`
--

CREATE TABLE IF NOT EXISTS `biodiversitywarriors_indiv` (
`id` int(11) NOT NULL,
  `locnID` int(11) NOT NULL DEFAULT '0',
  `plot` varchar(100) DEFAULT NULL COMMENT 'The unique code for the sample plot (if any)',
  `tag` int(11) DEFAULT '0' COMMENT 'The plant/tree number within the sample plot',
  `personID` int(11) NOT NULL COMMENT 'The creator for this indiv record',
  `n_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `biodiversitywarriors_locn`
--

CREATE TABLE IF NOT EXISTS `biodiversitywarriors_locn` (
`id` int(11) NOT NULL,
  `longitude` float(9,5) NOT NULL COMMENT 'Longitude in decimal degrees, Datum WGS84',
  `latitude` float(8,5) NOT NULL COMMENT 'Latitude in decimal degrees, Datum WGS84',
  `elev` int(11) NOT NULL COMMENT 'Elevation ASL (m)',
  `geomorph` varchar(200) DEFAULT NULL,
  `locality` varchar(300) NOT NULL COMMENT 'Descriptive name of place',
  `county` varchar(300) DEFAULT NULL COMMENT 'Kabupaten',
  `province` varchar(300) NOT NULL DEFAULT 'Kalimantan Barat',
  `island` varchar(300) NOT NULL DEFAULT 'Borneo',
  `country` varchar(100) NOT NULL DEFAULT 'Indonesia',
  `notes` varchar(500) DEFAULT NULL COMMENT 'Other notes about place',
  `n_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `biodiversitywarriors_obs`
--

CREATE TABLE IF NOT EXISTS `biodiversitywarriors_obs` (
`id` int(11) NOT NULL,
  `indivID` int(11) NOT NULL,
  `date` date NOT NULL COMMENT 'Date of the observation',
  `personID` int(11) NOT NULL COMMENT 'Person making the observation',
  `microhab` varchar(500) DEFAULT NULL,
  `habit` enum('tree','shrub','liana','herb') NOT NULL,
  `dbh` decimal(10,1) DEFAULT '0.0',
  `height` decimal(10,2) DEFAULT '0.00',
  `bud` enum('no','yes') NOT NULL DEFAULT 'no',
  `flower` enum('no','yes') NOT NULL DEFAULT 'no',
  `fruit` enum('no','yes') NOT NULL DEFAULT 'no',
  `localname` varchar(100) DEFAULT NULL,
  `notes` varchar(300) DEFAULT NULL COMMENT 'General notes about this plant at time of observation',
  `char_lf_insert_alt` tinyint(1) DEFAULT NULL,
  `char_lf_insert_opp` tinyint(1) DEFAULT NULL,
  `n_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `biodiversitywarriors_person`
--

CREATE TABLE IF NOT EXISTS `biodiversitywarriors_person` (
`id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `short_namecode` varchar(20) DEFAULT NULL,
  `institutions` varchar(100) DEFAULT NULL,
  `project` varchar(100) DEFAULT NULL,
  `n_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `biodiversitywarriors_person`
--

INSERT INTO `biodiversitywarriors_person` (`id`, `name`, `email`, `twitter`, `website`, `phone`, `short_namecode`, `institutions`, `project`, `n_status`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `biodiversitywarriors_taxon`
--

CREATE TABLE IF NOT EXISTS `biodiversitywarriors_taxon` (
`id` int(11) NOT NULL,
  `rank` enum('family','genus','species','subspecies') DEFAULT NULL,
  `morphotype` varchar(100) DEFAULT NULL,
  `kewid` varchar(20) DEFAULT NULL,
  `fam` varchar(100) DEFAULT NULL,
  `gen` varchar(100) DEFAULT NULL,
  `sp` varchar(100) DEFAULT NULL,
  `subtype` enum('var','ssp','forma') DEFAULT NULL,
  `ssp` varchar(100) DEFAULT NULL,
  `auth` varchar(200) DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `n_status` int(11) NOT NULL DEFAULT '0',
  `fullname` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biodiversitywarriors_coll`
--
ALTER TABLE `biodiversitywarriors_coll`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `collCode` (`collCode`), ADD KEY `indivID` (`indivID`);

--
-- Indexes for table `biodiversitywarriors_collector`
--
ALTER TABLE `biodiversitywarriors_collector`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `coll_order` (`collID`,`order`), ADD UNIQUE KEY `coll_person` (`collID`,`personID`), ADD KEY `personID` (`personID`);

--
-- Indexes for table `biodiversitywarriors_det`
--
ALTER TABLE `biodiversitywarriors_det`
 ADD PRIMARY KEY (`id`), ADD KEY `indivID` (`indivID`), ADD KEY `personID` (`personID`), ADD KEY `taxonID` (`taxonID`);

--
-- Indexes for table `biodiversitywarriors_img`
--
ALTER TABLE `biodiversitywarriors_img`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_file_person` (`personID`,`filename`), ADD KEY `indivID` (`indivID`), ADD KEY `personID` (`personID`);

--
-- Indexes for table `biodiversitywarriors_indiv`
--
ALTER TABLE `biodiversitywarriors_indiv`
 ADD PRIMARY KEY (`id`), ADD KEY `locnID` (`locnID`);

--
-- Indexes for table `biodiversitywarriors_locn`
--
ALTER TABLE `biodiversitywarriors_locn`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `biodiversitywarriors_obs`
--
ALTER TABLE `biodiversitywarriors_obs`
 ADD PRIMARY KEY (`id`), ADD KEY `personID` (`personID`), ADD KEY `indivID` (`indivID`);

--
-- Indexes for table `biodiversitywarriors_person`
--
ALTER TABLE `biodiversitywarriors_person`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `biodiversitywarriors_taxon`
--
ALTER TABLE `biodiversitywarriors_taxon`
 ADD PRIMARY KEY (`id`), ADD KEY `fullname` (`fullname`), ADD KEY `fam` (`fam`), ADD KEY `gen` (`gen`), ADD KEY `sp` (`sp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `biodiversitywarriors_coll`
--
ALTER TABLE `biodiversitywarriors_coll`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `biodiversitywarriors_collector`
--
ALTER TABLE `biodiversitywarriors_collector`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `biodiversitywarriors_det`
--
ALTER TABLE `biodiversitywarriors_det`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `biodiversitywarriors_img`
--
ALTER TABLE `biodiversitywarriors_img`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `biodiversitywarriors_indiv`
--
ALTER TABLE `biodiversitywarriors_indiv`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `biodiversitywarriors_locn`
--
ALTER TABLE `biodiversitywarriors_locn`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `biodiversitywarriors_obs`
--
ALTER TABLE `biodiversitywarriors_obs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `biodiversitywarriors_person`
--
ALTER TABLE `biodiversitywarriors_person`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `biodiversitywarriors_taxon`
--
ALTER TABLE `biodiversitywarriors_taxon`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
