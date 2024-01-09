-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 09 Janvier 2024 à 12:45
-- Version du serveur: 5.6.13
-- Version de PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


--
-- Structure de la table `affectation`
--

CREATE TABLE IF NOT EXISTS `affectation` (
  `idAffectation` int(11) NOT NULL AUTO_INCREMENT,
  `creneau` int(11) DEFAULT NULL,
  `personnel` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAffectation`),
  UNIQUE KEY `idAffectation` (`idAffectation`),
  KEY `fonction` (`creneau`),
  KEY `specialité` (`personnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cadredesante`
--

CREATE TABLE IF NOT EXISTS `cadredesante` (
  `identifiant` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prénom` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motDePasse` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`identifiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contrainte`
--

CREATE TABLE IF NOT EXISTS `contrainte` (
  `idContrainte` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valeur` int(11) DEFAULT NULL,
  `fonction` int(11) DEFAULT NULL,
  PRIMARY KEY (`idContrainte`),
  KEY `personnel` (`fonction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contraintenonrespecter`
--

CREATE TABLE IF NOT EXISTS `contraintenonrespecter` (
  `idContrainteNonRespecter` int(11) NOT NULL AUTO_INCREMENT,
  `creneau` int(11) DEFAULT NULL,
  `contrainte` int(11) DEFAULT NULL,
  PRIMARY KEY (`idContrainteNonRespecter`),
  UNIQUE KEY `idContrainteNonRespecter` (`idContrainteNonRespecter`),
  KEY `creneau` (`creneau`),
  KEY `contraintelegale` (`contrainte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `creneau`
--

CREATE TABLE IF NOT EXISTS `creneau` (
  `IdCreneau` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `debutPlage` time DEFAULT NULL,
  `finPlage` time DEFAULT NULL,
  `besoinMinPersonnel` int(11) NOT NULL,
  `besoinEnSpecialite` varchar(25) CHARACTER SET armscii8 DEFAULT NULL,
  PRIMARY KEY (`IdCreneau`),
  KEY `personnel` (`besoinEnSpecialite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

CREATE TABLE IF NOT EXISTS `fonction` (
  `idFonction` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idFonction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `idPersonnel` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prénom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialité` int(11) DEFAULT NULL,
  `TempsTravailleMensuel` float DEFAULT NULL,
  `fonction` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPersonnel`),
  KEY `fonction` (`fonction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `specialité`
--

CREATE TABLE IF NOT EXISTS `specialité` (
  `idSpecialité` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempsMax` int(11) NOT NULL,
  PRIMARY KEY (`idSpecialité`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
