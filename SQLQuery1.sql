--What is a clustered index?
--A clustered index is a type of index where the table records are physically re-ordered to match the index. 
--Clustered indexes are efficient on columns that are searched for a range of values.

--non-clustered index
--A non-clustered index structure exists as a separate first class object in the database. The base table T and any non-clustered index created by the user on T exist as separate structures in the database.
--This type of index does not alter and/or prescribe any sort of ordering of rows in the table.
--In other words, rows of the table are not really stored in any sorted order. Such types of tables are also known as Heap Tables in the database terminology.

-- SQL Server unique indexes
--Before getting started, let me briefly describe SQL Server unique indexes vs. unique constraints:
--A unique index ensures that the values in the index key columns are unique.
--A unique constraint also guarantees tCREATE INDEX index_name
--When a unique constraint is created a corresponding unique index is automatically created on the column(s). 



--CREATE INDEX index_name
--on table_name (column1, column2);
--DROP INDEX index_name;