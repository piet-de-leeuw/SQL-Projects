

PRINT 'HELLO, WORLD'


DECLARE @myVariable INT
SET @myVariable = 6
PRINT @myVariable 

DECLARE @var1 INT, @var2 INT
SET @var1 = 7
SET @var2 = 5

PRINT 'Variable 1 =  ' + CONVERT(varchar(5), @var1) + CHAR(13) + 'Variable 2 = ' + CONVERT(varchar(5), @var2) + CHAR(13) + 'Total: '
print @var1 + @var2


IF @var1 < 2
	BEGIN 
		PRINT '@var1 < 2'
	END
ELSE IF @var1 > 1 AND @var1 < 3
	BEGIN
		PRINT '@var1 > 1 AND @var1 < 3'
	END
ELSE IF @var1 = 4 OR @var1 < 6
	BEGIN 
		PRINT '@var1 = 4 OR @var1 < 6'
	END
ELSE
	BEGIN
		PRINT '@var1 does not qualify!'
	END

/* This is an comment. */
-- This to.
	