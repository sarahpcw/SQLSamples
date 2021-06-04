-- PAGE 21
-----------
--A WHERE clause is a predicate. 
--Retrieving records from a database using 
--a projection statement like SELECT and 
--combining it with any other clause that limits or filters 
--your result set is considered to be a predicate. 
--A predicate is am assertion which returns true or false. 
--Only the true path affects the result set. 
--That's the short answer.

--predicate
--[predicate]

--VERB
--predicated (past tense) · predicated (past participle)
--grammar
--logic
--state, affirm, or assert (something) about the subject of 
--a sentence or an argument of a proposition.
--"a word which predicates something about its subject" · 

--declare or affirm (something) as true or existing; postulate or assert.
--"the Pleistocene colonization of Tasmania has long been predicated"
--synonyms:
--postulate · put forward · advance · propound · submit · predicate · 


--(predicate something on/upon)
--found or base something on.
--"the theory of structure on which later chemistry was predicated"
--synonyms:
--base · be dependent · found · establish · rest · 
--build · ground · premise



-- equi join
-- self join

CREATE INDEX idx_lastname
ON employees (LastName); 
--If you want to create an index on a combination of columns, you can list the column names within the parentheses, separated by commas:
DROP INDEX employees.idx_lastname; 

CREATE INDEX idx_pname
ON employees (LastName, FirstName); 
DROP INDEX employees.idx_pname; 

CREATE unique INDEX idx_pname
ON employees (LastName, FirstName); 
DROP INDEX employees.idx_pname; 

--BACKUP DATABASE  [training]
--TO DISK = 'C:\Users\u\workspace\Paddy\testDB.bak'
--WITH DIFFERENTIAL; 

