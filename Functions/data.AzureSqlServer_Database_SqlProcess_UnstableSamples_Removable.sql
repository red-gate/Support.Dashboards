SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_SqlProcess_UnstableSamples_Removable]
(
    @AzureSqlServer_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_SqlProcess_LoginTime AS BIGINT
    , @AzureSqlServer_Database_SqlProcess_SessionId AS BIGINT
)
RETURNS TABLE
AS
RETURN

SELECT [data].[AzureSqlServer_Database_SqlProcess_UnstableSamples].[Id], [data].[AzureSqlServer_Database_SqlProcess_UnstableSamples].[CollectionDate]
FROM [data].[AzureSqlServer_Keys]
INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[ParentId] = [data].[AzureSqlServer_Keys].[Id]
INNER JOIN [data].[AzureSqlServer_Database_SqlProcess_Keys] ON [data].[AzureSqlServer_Database_SqlProcess_Keys].[ParentId] = [data].[AzureSqlServer_Database_Keys].[Id]
INNER JOIN [data].[AzureSqlServer_Database_SqlProcess_UnstableSamples] ON [data].[AzureSqlServer_Database_SqlProcess_UnstableSamples].[Id] = [data].[AzureSqlServer_Database_SqlProcess_Keys].[Id]
 WHERE  (@AzureSqlServer_Name IS NULL OR [data].[AzureSqlServer_Keys].[_Name] = @AzureSqlServer_Name)
 AND  (@AzureSqlServer_Database_Name IS NULL OR [data].[AzureSqlServer_Database_Keys].[_Name] = @AzureSqlServer_Database_Name)
 AND  (@AzureSqlServer_Database_SqlProcess_LoginTime IS NULL OR [data].[AzureSqlServer_Database_SqlProcess_Keys].[_LoginTime] = @AzureSqlServer_Database_SqlProcess_LoginTime)
 AND  (@AzureSqlServer_Database_SqlProcess_SessionId IS NULL OR [data].[AzureSqlServer_Database_SqlProcess_Keys].[_SessionId] = @AzureSqlServer_Database_SqlProcess_SessionId)
GO
