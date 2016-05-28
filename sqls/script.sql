CREATE TABLE `account` (
  `Id` int(11) NOT NULL,
  `UserName` varchar(15) DEFAULT NULL,
  `Password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `cylindercategorymaster` (
  `CategoryId` int(11) NOT NULL,
  `CategoryName` varchar(25) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `cylindertransaction` (
  `Id` int(11) NOT NULL,
  `CylinderTypeId` int(11) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `OperationTypeId` int(11) DEFAULT NULL,
  `DeliveryPersonId` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Comments` varchar(150) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `UpdateDate` date DEFAULT NULL,
  `IsDelete` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `CylinderTypeId` (`CylinderTypeId`),
  KEY `CategoryId` (`CategoryId`),
  KEY `OperationTypeId` (`OperationTypeId`),
  KEY `DeliveryPersonId` (`DeliveryPersonId`),
  CONSTRAINT `cylindertransaction_ibfk_1` FOREIGN KEY (`CylinderTypeId`) REFERENCES `cylindertypemaster` (`CylinderTypeId`),
  CONSTRAINT `cylindertransaction_ibfk_2` FOREIGN KEY (`CategoryId`) REFERENCES `cylindercategorymaster` (`CategoryId`),
  CONSTRAINT `cylindertransaction_ibfk_3` FOREIGN KEY (`OperationTypeId`) REFERENCES `operationmaster` (`OperationTypeId`),
  CONSTRAINT `cylindertransaction_ibfk_4` FOREIGN KEY (`DeliveryPersonId`) REFERENCES `deliverypersonmaster` (`DeliveryPersonId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `cylindertypemaster` (
  `CylinderTypeId` int(11) NOT NULL,
  `CylinderType` varchar(150) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `UpdateDate` date DEFAULT NULL,
  PRIMARY KEY (`CylinderTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `deliverypersonmaster` (
  `DeliveryPersonId` int(11) NOT NULL,
  `DeliveryPersonFirstName` varchar(50) DEFAULT NULL,
  `DeliveryPersonLastName` varchar(75) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `UpdateDate` date DEFAULT NULL,
  PRIMARY KEY (`DeliveryPersonId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `invoicedetails` (
  `Id` int(11) NOT NULL,
  `InvoiceId` varchar(25) DEFAULT NULL,
  `InvoiceValue` decimal(16,4) DEFAULT NULL,
  `InvoiceDate` date DEFAULT NULL,
  `InvoiceReceivedDate` date DEFAULT NULL,
  `TruckNumber` varchar(25) DEFAULT NULL,
  `QtyOfCommodity` int(11) DEFAULT NULL,
  `QtyOfSubDomestic` int(11) DEFAULT NULL,
  `QtyOfNonSubDomestic` int(11) DEFAULT NULL,
  `QtyOfNonDomesticSmall` int(11) DEFAULT NULL,
  `QtyOfNonDomesticLarge` int(11) DEFAULT NULL,
  `QuantityOfRegulators` int(11) DEFAULT NULL,
  `InvoiceTypeId` int(11) DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `UpdateDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `InvoiceTypeId` (`InvoiceTypeId`),
  CONSTRAINT `invoicedetails_ibfk_1` FOREIGN KEY (`InvoiceTypeId`) REFERENCES `invoicetypemaster` (`InvoiceTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `invoicetypemaster` (
  `InvoiceTypeId` int(11) NOT NULL,
  `InvoiceType` varchar(25) DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`InvoiceTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `operationmaster` (
  `OperationTypeId` int(11) NOT NULL,
  `OperationType` varchar(15) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `UpdateDate` date DEFAULT NULL,
  PRIMARY KEY (`OperationTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `stockdetails` (
  `StockId` int(11) NOT NULL,
  `CylinderTypeId` int(11) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `UpdateDate` date DEFAULT NULL,
  PRIMARY KEY (`StockId`),
  KEY `CylinderTypeId` (`CylinderTypeId`),
  KEY `CategoryId` (`CategoryId`),
  CONSTRAINT `stockdetails_ibfk_1` FOREIGN KEY (`CylinderTypeId`) REFERENCES `cylindertypemaster` (`CylinderTypeId`),
  CONSTRAINT `stockdetails_ibfk_2` FOREIGN KEY (`CategoryId`) REFERENCES `cylindercategorymaster` (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



select * from stockdetails;

create table Stock(Id int primary key,StockId int, OpeningStock int, ClosingStock int, CreateDate datetime, UpdateDate datetime,
foreign key(StockId) references StockDetails(StockId)
);

select * from stockDetails;
select * from CylinderTypeMaster;
UPDATE CylinderTypeMacylindertypemasterster set CylinderType='NON DOMESTIC Small'
 where CylinderTypeId = 4;
 
delete from CylinderTypeMaster where CylinderTypeId=1;
select * from cylindertransaction;
delete from cylindertransaction where CylinderTypeId=1;
commit;
delete from cylindertransaction;

select * from stock;
create table deliverypersontypemaster(Id int primary key, deliverypersontype varchar(50),createdate datetime,updatedate datetime);

insert into deliverypersontypemaster (Id, deliverypersontype, createdate) 
values(1, 'Delivery Person', sysdate());

insert into deliverypersontypemaster (Id, deliverypersontype, createdate) 
values(2, 'Outside Delivery Person', sysdate());

insert into deliverypersontypemaster (Id, deliverypersontype, createdate) 
values(3, 'Other', sysdate());

commit;
select  * from deliverypersontypemaster;

select * from deliverypersonmdeliverypersonmastertypeidkeyaster;
alter table deliverypersonmaster modify column DeliveryPersonTypeId ;
alter table deliverypersonmaster add constraint typeidkey 
foreign key (DeliveryPersonTypeId) references deliverypersontypemaster(Id);




