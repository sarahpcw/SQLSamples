--GUID stands for Globally Unique Identifier
-- newsequentialid has new unique number per system
DECLARE @myid uniqueidentifier  
--SET @myid = NEWID() 
set @myid = newid()
select 'Value of @myid is: ' as Heading
, CONVERT(varchar(255), @myid) as NewIDValue 


CREATE TABLE dbo.TestData2
    (
        ID int   NOT NULL ,
        PartNo NVARCHAR(10) NOT NULL ,
        PartName NVARCHAR(50) NOT NULL
    );
GO

alter table dbo.TestData2
add  ID2  uniqueidentifier 


INSERT INTO dbo.TestData2 (id, ID2, PartNo ,
            PartName
                )
VALUES ( 100 , newid() , N'00-123456', N'Test Product One' ) ,
    ( 200, newid(), N'01-98765', N'Test Product Two' );
GO


CREATE TABLE dbo.TestData3
    (   ID int identity(100,2)  NOT NULL ,
        PartNo NVARCHAR(10) NOT NULL ,
        PartName NVARCHAR(50) NOT NULL
    );
GO

INSERT INTO dbo.TestData3 (PartNo ,  PartName   )
VALUES (  '00-123456', 'Test Product One' ) ,
    (   '01-98765', 'Test Product Two' );
GO

select * from dbo.TestData2






CREATE TABLE dbo.TestData4
    (   ID uniqueidentifier  NOT NULL default newsequentialID(),
        PartNo NVARCHAR(10) NOT NULL ,
        PartName NVARCHAR(50) NOT NULL
    );
GO

INSERT INTO dbo.TestData4 (PartNo ,  PartName   )
VALUES (  '00-123456', 'Test Product One' ) ,
    (   '01-98765', 'Test Product Two' );
GO

select * from dbo.TestData4




DECLARE @myid uniqueidentifier  
--SET @myid = NEWID() 
set @myid = newsequentialid()
select 'Value of @myid is: ' as Heading
, CONVERT(varchar(255), @myid) as NewIDValue 