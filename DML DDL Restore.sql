create database AW

RESTORE FILELISTONLY
FROM DISK = 'C:\Users\u\Documents\AdventureWorks2014.bak'

RESTORE DATABASE AdventureWorks2014
FROM DISK = 'C:\Users\u\Documents\AdventureWorks2014.bak' with recovery