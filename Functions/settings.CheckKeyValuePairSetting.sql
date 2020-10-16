SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [settings].[CheckKeyValuePairSetting]
(
	@keyvalue nvarchar(MAX), @keyvaluetype nvarchar(10)
)
RETURNS bit
AS
BEGIN

	DECLARE @result bit;
	SET @result = 1  

	IF @keyvaluetype != UPPER(@keyvaluetype) COLLATE LATIN1_GENERAL_CS_AS
		SET @result = 0
	ELSE IF @keyvaluetype = 'NUMERIC'
		SET @result = ISNUMERIC(@keyvalue);
	ELSE IF @keyvaluetype = 'BOOLEAN'
		SET @result = CASE WHEN @keyvalue = 'True' OR @keyvalue = 'False' THEN 1 ELSE 0 END;
	ELSE IF @keyvaluetype = 'STRING'
		set @result = 1;
	ELSE IF @keyvaluetype = 'DATE'
		SET @result = ISDATE(@keyvalue)
	ELSE IF @keyvaluetype = 'CSV'
		SELECT @result = @result & CASE WHEN LEN(SplitValue) >= 2 AND CHARINDEX('"', SplitValue) = 1 AND CHARINDEX('"', SplitValue, 2) = LEN(SplitValue) THEN 1 ELSE 0 END 
		FROM [utils].[SplitString](@keyvalue, ',')
	ELSE
		SET @result = 0
  
	RETURN (@result);
END

GO
