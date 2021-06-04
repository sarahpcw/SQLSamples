--I can put a SEQUENCE in the DEFAULT clause of the DDL for table:


CREATE TABLE Service_Tickets
(ticket_nbr INTEGER DEFAULT NEXT VALUE FOR Invoice_Seq,
 department_code CHAR(1) NOT NULL
   CHECK (department_code IN ('M', 'F'))); 


 
INSERT INTO Service_Tickets (department_code)
VALUES ('M');

SELECT * FROM Service_Tickets;

 --That is cool! But do not stop here. Let’s re-do the Meats and Fish tables with this feature, 
 --because we can then do inserts without the need for a procedure and still be sure of an empty intersection: 


CREATE TABLE Meats2
(ticket_seq INTEGER DEFAULT NEXT VALUE FOR Invoice_Seq 
       PRIMARY KEY,
 meat_type VARCHAR(15) NOT NULL);
 
CREATE TABLE Fish2
(ticket_seq INTEGER DEFAULT NEXT VALUE FOR Invoice_Seq 
       PRIMARY KEY,
 fish_type VARCHAR(15) NOT NULL);

--Now, to get you started,  try these statements. I dropped the kosher theme 🙂


INSERT INTO Meats2 (meat_type) VALUES ('pig');
INSERT INTO Fish2 (fish_type) VALUES ('squid');
SELECT * FROM Meats;
SELECT * FROM Fish;