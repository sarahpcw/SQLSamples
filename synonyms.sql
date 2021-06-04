--Microsoft SQL Server introduces the concept of a synonym. 
--A synonym is an alternative name for a schema-scoped object. 
--Client applications can use a single-part name to reference a base object by using a synonym instead of using a two-part, 
--three-part, or four-part name to reference the base object.

--https://sqlstudies.com/2018/02/15/synonyms-how-and-why/
--https://www.databasestar.com/oracle-synonym/

CREATE SYNONYM dbo.MyProduct FOR AdventureWorks2014.Production.Product;

-- These will produce the same results
SELECT TOP 10 * FROM MyProduct;
SELECT TOP 10 * FROM AdventureWorks2014.Production.Product;

--What is an Oracle Synonym?
--A synonym is an object in a database that represents an alternative name for other objects, 
--such as tables, views, sequences, and stored procedures.
--Why?
--The main reason is to simplify the user access to an object, especially when multiple databases and schemas are involved.

 -- The ORACLE syntax is:

--CREATE [OR REPLACE] [PUBLIC] SYNONYM [schema.] synonym_name FOR [schema.] object_name [@dblink_name];

--create synonym emp for employees

--CREATE PUBLIC SYNONYM cust FOR customers;