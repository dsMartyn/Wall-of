
CREATE DATABASE  `wallof`.`wallof` /*!40100 DEFAULT CHARACTER SET latin1 */

CREATE TABLE  `wallof`.`tblEmailLog` (
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(256) NOT NULL,
  `Sender` varchar(256) NOT NULL,
  `Subject` varchar(256) NOT NULL,
  `Body` varchar(9999) NOT NULL,
  `Headers` varchar(9999) NOT NULL,
  `MemberID` int(11) NOT NULL,
  PRIMARY KEY (`RowID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

CREATE TABLE  `wallof`.`tblHistory` (
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  `IPAddress` int(11) NOT NULL,
  `Page` int(11) NOT NULL,
  `Referrer` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  PRIMARY KEY (`RowID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

CREATE TABLE  `wallof`.`tblImages` (
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  `Image` blob,
  `ImageName` varchar(25) DEFAULT NULL,
  `ImageWidth` int(11) DEFAULT NULL,
  `ImageHeight` int(11) DEFAULT NULL,
  PRIMARY KEY (`RowID`),
  KEY `newindex` (`RowID`)
) ENGINE=MyISAM AUTO_INCREMENT=117105 DEFAULT CHARSET=utf8

CREATE TABLE  `wallof`.`tblKeywords` (
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  `Keyword` varchar(25) DEFAULT NULL,
  `CRC1` bigint(20) DEFAULT NULL,
  `CRC2` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RowID`),
  UNIQUE KEY `idxKey` (`Keyword`),
  UNIQUE KEY `crc` (`CRC1`,`CRC2`),
  KEY `CRC1` (`CRC1`)
) ENGINE=MyISAM AUTO_INCREMENT=793302 DEFAULT CHARSET=utf8

CREATE TABLE  `wallof`.`tblLnkKeywordProducts` (
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  `KeywordID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  PRIMARY KEY (`RowID`),
  UNIQUE KEY `idxUnique` (`ProductID`,`KeywordID`),
  KEY `KeywordIDX` (`KeywordID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=585512 DEFAULT CHARSET=utf8

CREATE TABLE  `wallof`.`tblLogin` (
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberID` int(11) NOT NULL,
  `LoginTime` datetime NOT NULL,
  `LogoutTime` datetime DEFAULT NULL,
  `IPAddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`RowID`)
) ENGINE=MyISAM AUTO_INCREMENT=18374907 DEFAULT CHARSET=utf8

CREATE TABLE  `wallof`.`tblMembers` (
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `FirstName` varchar(32) NOT NULL,
  `LastName` varchar(32) NOT NULL,
  `DOB` datetime NOT NULL,
  `ContactNumber` varchar(11) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  PRIMARY KEY (`RowID`),
  UNIQUE KEY `UserName` (`UserName`),
  KEY `Indexes` (`UserName`,`FirstName`,`LastName`,`ContactNumber`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8

CREATE TABLE  `wallof`.`tblProducts` (
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  `ItemName` varchar(32) DEFAULT NULL,
  `ItemDesc` varchar(9999) DEFAULT NULL,
  `YoutubeVideoUrl` varchar(512) DEFAULT NULL,
  `GooglePostCode` varchar(10) DEFAULT NULL,
  `AddressName` varchar(32) DEFAULT NULL,
  `AddressStreet` varchar(32) DEFAULT NULL,
  `AddressTown` varchar(32) DEFAULT NULL,
  `AddressCounty` varchar(32) DEFAULT NULL,
  `AddressPostCode` varchar(10) DEFAULT NULL,
  `AddressEmail` varchar(512) DEFAULT NULL,
  `AddressTel` varchar(12) DEFAULT NULL,
  `AddressMob` varchar(12) DEFAULT NULL,
  `AddressFax` varchar(12) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ImageID` int(11) DEFAULT NULL,
  `Category` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`RowID`),
  UNIQUE KEY `Unique1` (`MemberID`,`ItemName`) USING BTREE,
  KEY `newindex` (`RowID`)
) ENGINE=MyISAM AUTO_INCREMENT=117105 DEFAULT CHARSET=utf8