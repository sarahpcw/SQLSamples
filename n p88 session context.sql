CREATE DATABASE Session_Test;
GO
 
CREATE TABLE dbo.TestData
    (
        ID INT IDENTITY(1, 1) NOT NULL ,
        PartNo NVARCHAR(10) NOT NULL ,
        PartName NVARCHAR(50) NOT NULL
    );
GO
 
INSERT INTO dbo.TestData (PartNo ,
            PartName
                )
VALUES ( N'00-123456', N'Test Product One' ) ,
    ( N'01-98765', N'Test Product Two' );
GO
 
CREATE VIEW dbo.ShowTestData
AS
    SELECT ID ,
           PartNo ,
           PartName ,
           SESSION_CONTEXT(N'test') AS [Test Context] ,
           SESSION_CONTEXT(N'test2') AS [Test2 Context] ,
           SESSION_CONTEXT(N'test3') AS [Test3 Context]
    FROM   dbo.TestData;
GO


select CONTEXT_INFO(); 

--This simple example sets the context_info value to 0x1256698456, 
--and then uses the CONTEXT_INFO function to retrieve the value.
-- Associates up to 128 bytes of binary information with the current session or connection.
 
SET CONTEXT_INFO 0x1256698456;  
GO  
SELECT CONTEXT_INFO();  
GO

DECLARE @BinVar varbinary(128);  
SET @BinVar = CAST(REPLICATE( 0x20, 128 ) AS varbinary(128) );  
SET CONTEXT_INFO @BinVar;  
SELECT CONTEXT_INFO() AS MyContextInfo;  
GO  

DECLARE @BinVar varbinary(128);  
SET @BinVar = CAST('0123450' AS varbinary(128) );  
SET CONTEXT_INFO @BinVar;  
SELECT CONTEXT_INFO() AS MyContextInfo;  
GO  