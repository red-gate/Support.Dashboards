SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [settings].[SetKeyValuePair]
    @KeyName nchar(50),
    @KeyValue nvarchar(max),
    @KeyValueType nvarchar(50)
AS 
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION

              IF EXISTS (SELECT * FROM [settings].[KeyValuePairs] WITH (UPDLOCK, SERIALIZABLE) WHERE KeyName = @KeyName)
              BEGIN
                     UPDATE [settings].[KeyValuePairs] SET KeyValue = @KeyValue WHERE KeyName = @KeyName
              END
              ELSE
              BEGIN
                     INSERT INTO [settings].[KeyValuePairs] (KeyName, KeyValue, KeyValueType)   VALUES (@KeyName, @KeyValue, @KeyValueType);
              END

   COMMIT TRANSACTION
END;
GO
