SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [utils].[SplitString] (@String VARCHAR(MAX), @delimiter CHAR)

RETURNS @SplitValues TABLE
(
    SplitValue VARCHAR(MAX) NOT NULL
)
AS
BEGIN
	DECLARE @FoundIndex INT
	DECLARE @ReturnValue VARCHAR(MAX)

	SET @FoundIndex = CHARINDEX(@delimiter, @String)

	WHILE (@FoundIndex <> 0)
	BEGIN
		  SET @ReturnValue = SUBSTRING(@String, 0, @FoundIndex)
		  INSERT @SplitValues (SplitValue) VALUES (@ReturnValue)
		  SET @String = SUBSTRING(@String, @FoundIndex + 1, len(@String) - @FoundIndex)
		  SET @FoundIndex = CHARINDEX(@delimiter, @String)
	END

	INSERT @SplitValues (SplitValue) VALUES (@String)

	RETURN

END    
GO
