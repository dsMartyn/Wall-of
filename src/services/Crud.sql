CREATE DATABASE  `wallof`.`wallof` /*!40100 DEFAULT CHARACTER SET latin1 */

CREATE TABLE  `wallof`.`tblHistory` (
  `RowID` int(11) NOT NULL auto_increment,
  `IPAddress` int(11) NOT NULL,
  `Page` int(11) NOT NULL,
  `Referrer` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  PRIMARY KEY  (`RowID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8


CREATE TABLE  `wallof`.`tblLogin` (
  `RowID` int(11) NOT NULL auto_increment,
  `MemberID` int(11) NOT NULL,
  `LoginTime` datetime NOT NULL,
  `LogoutTime` datetime default NULL,
  `IPAddress` varchar(32) default NULL,
  PRIMARY KEY  (`RowID`)
) ENGINE=MyISAM AUTO_INCREMENT=18374885 DEFAULT CHARSET=utf8



CREATE TABLE  `wallof`.`tblMembers` (
  `RowID` int(11) NOT NULL auto_increment,
  `UserName` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `FirstName` varchar(32) NOT NULL,
  `LastName` varchar(32) NOT NULL,
  `DOB` datetime NOT NULL,
  `ContactNumber` varchar(11) default NULL,
  `StartDate` datetime default NULL,
  PRIMARY KEY  (`RowID`),
  UNIQUE KEY `UserName` (`UserName`),
  KEY `Indexes` (`UserName`,`FirstName`,`LastName`,`ContactNumber`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8

CREATE TABLE  `wallof`.`tblProducts` (
  `RowID` int(11) NOT NULL auto_increment,
  `MemberID` int(11) NOT NULL default '0',
  `CompanyName` varchar(32) default NULL,
  `CompanyDesc` varchar(9999) default NULL,
  `YoutubeVideoUrl` varchar(512) default NULL,
  `GooglePostCode` varchar(512) NOT NULL,
  `AddressName` varchar(512) default NULL,
  `AddressStreet` varchar(512) default NULL,
  `AddressTown` varchar(512) default NULL,
  `AddressCounty` varchar(512) default NULL,
  `AddressPostCode` varchar(512) default NULL,
  `AddressEmail` varchar(512) default NULL,
  `AddressTel` varchar(512) default NULL,
  `AddressMob` varchar(512) default NULL,
  `AddressFax` varchar(512) default NULL,
  `status` int(11) NOT NULL default '0',
  PRIMARY KEY  (`RowID`),
  UNIQUE KEY `Unique1` USING BTREE (`MemberID`,`CompanyName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8