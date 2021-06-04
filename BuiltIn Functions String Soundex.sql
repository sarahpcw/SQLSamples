-- Returns a DIFFERENCE value of 4, the least possible difference.  
SELECT SOUNDEX('Green'), SOUNDEX('Greene'), DIFFERENCE('Green','Greene');  
GO  
-- Returns a DIFFERENCE value of 0, the highest possible difference.  
SELECT SOUNDEX('Blotchet-Halls'), SOUNDEX('Greene'), DIFFERENCE('Blotchet-Halls', 'Greene');  
GO  
SELECT SOUNDEX('black'), SOUNDEX('back'), DIFFERENCE('black','back');  
GO  
--Returns a four-character (SOUNDEX) code to evaluate the similarity of two strings.
SELECT SOUNDEX('so'), SOUNDEX('ho'), DIFFERENCE('black','back');  
GO  

--SOUNDEX converts an alphanumeric string to a four-character 
--code that is based on how the string sounds when spoken.
-- The first character of the code is the first character of 
-- character_expression, converted to upper case. 
-- The second through fourth characters of the code are numbers 
-- that represent the letters in the expression. 
-- The letters A, E, I, O, U, H, W, and Y are ignored 
-- unless they are the first letter of the string. 
-- Zeroes are added at the end if necessary to produce 
-- a four-character code. For more information about the SOUNDEX code,
--  see The Soundex Indexing System.
--SOUNDEX codes from different strings can be compared to see how similar the strings sound when spoken. The DIFFERENCE function performs a SOUNDEX on two strings, and returns an integer that represents how similar the SOUNDEX codes are for those strings.
--SOUNDEX is collation sensitive. String functions can be nested.

SELECT SOUNDEX('so'), SOUNDEX('sow'), DIFFERENCE('black','back');  
GO  

SELECT SOUNDEX('black'), SOUNDEX('block'), DIFFERENCE('black','block');  
GO 