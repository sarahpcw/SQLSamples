/*
The main difference between the two is in the way they 
encode the character and the number of bits that they use for each. 
ASCII originally used seven bits to encode each character. ...
 In contrast, Unicode uses a variable bit encoding program where you 
 can choose between 32, 16, and 8-bit encodings.
*/

DECLARE @nstring nchar(12);  
SET @nstring = N'Åkergatan 24';  
SELECT UNICODE(@nstring), NCHAR(UNICODE(@nstring)); 