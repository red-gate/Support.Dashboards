SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_StableSamples_Removable]
(
    @AzureSqlServer_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_TopQueries_DatabaseName AS NVARCHAR(450)
    , @AzureSqlServer_Database_TopQueries_SqlHandle AS VARBINARY(900)
    , @AzureSqlServer_Database_TopQueries_StatementEnd AS BIGINT
    , @AzureSqlServer_Database_TopQueries_StatementStart AS BIGINT
    , @AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType AS NVARCHAR(450)
)
RETURNS TABLE
AS
RETURN

SELECT [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_StableSamples].[Id], [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_StableSamples].[CollectionDate]
FROM [data].[AzureSqlServer_Keys]
INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[ParentId] = [data].[AzureSqlServer_Keys].[Id]
INNER JOIN [data].[AzureSqlServer_Database_TopQueries_Keys] ON [data].[AzureSqlServer_Database_TopQueries_Keys].[ParentId] = [data].[AzureSqlServer_Database_Keys].[Id]
INNER JOIN [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys] ON [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[ParentId] = [data].[AzureSqlServer_Database_TopQueries_Keys].[Id]
INNER JOIN [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_StableSamples] ON [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_StableSamples].[Id] = [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[Id]
 WHERE  (@AzureSqlServer_Name IS NULL OR [data].[AzureSqlServer_Keys].[_Name] = @AzureSqlServer_Name)
 AND  (@AzureSqlServer_Database_Name IS NULL OR [data].[AzureSqlServer_Database_Keys].[_Name] = @AzureSqlServer_Database_Name)
 AND  (@AzureSqlServer_Database_TopQueries_DatabaseName IS NULL OR [data].[AzureSqlServer_Database_TopQueries_Keys].[_DatabaseName] = @AzureSqlServer_Database_TopQueries_DatabaseName)
 AND  (@AzureSqlServer_Database_TopQueries_SqlHandle IS NULL OR [data].[AzureSqlServer_Database_TopQueries_Keys].[_SqlHandle] = @AzureSqlServer_Database_TopQueries_SqlHandle)
 AND  (@AzureSqlServer_Database_TopQueries_StatementEnd IS NULL OR [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementEnd] = @AzureSqlServer_Database_TopQueries_StatementEnd)
 AND  (@AzureSqlServer_Database_TopQueries_StatementStart IS NULL OR [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementStart] = @AzureSqlServer_Database_TopQueries_StatementStart)
 AND  (@AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType IS NULL OR [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[_WaitType] = @AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType)
GO
