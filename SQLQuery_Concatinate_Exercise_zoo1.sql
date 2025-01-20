USE [db_zoo_1]
GO

/*
 * CONVERT(VARCHAR(50), @totalHab) = This converts data type mony into string.
 * CHAR(9) = TAB KEY
 * CHAR(13) = LINE BRAKE
 */

DECLARE @totalHab MONEY
DECLARE @totalNut MONEY
DECLARE @result MONEY

SET @totalHab = (SELECT SUM(habitat_cost) FROM tbl_habitat);
SET @totalNut = (SELECT SUM(nutrition_cost) FROM tbl_nutrition);
SET @result = (@totalHab + @totalNut)

PRINT (
	CONVERT(VARCHAR(50), @totalHab) + CHAR(9) + ' - The Total Habitat Cost' + CHAR(13) +
	CONVERT(VARCHAR(50), @totalNut) + CHAR(9) + CHAR(9) + ' - The Total Nutrition Cost' + CHAR(13) + 
	'---------' + CHAR(13) +
	CONVERT(VARCHAR(50), @result)
);