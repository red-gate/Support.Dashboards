SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_TopQueries_Keys_InstanceDateRange]
(
    @AzureSqlServer_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_TopQueries_DatabaseName AS NVARCHAR(450)
    , @AzureSqlServer_Database_TopQueries_SqlHandle AS VARBINARY(900)
    , @AzureSqlServer_Database_TopQueries_StatementEnd AS BIGINT
    , @AzureSqlServer_Database_TopQueries_StatementStart AS BIGINT
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_Database_Name], [AzureSqlServer_Database_TopQueries_DatabaseName], [AzureSqlServer_Database_TopQueries_SqlHandle], [AzureSqlServer_Database_TopQueries_StatementEnd], [AzureSqlServer_Database_TopQueries_StatementStart]) AS
(
    SELECT [data].[AzureSqlServer_Database_TopQueries_Keys].[Id]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[ParentId]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_DatabaseName] AS [AzureSqlServer_Database_TopQueries_DatabaseName]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_SqlHandle] AS [AzureSqlServer_Database_TopQueries_SqlHandle]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementEnd] AS [AzureSqlServer_Database_TopQueries_StatementEnd]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementStart] AS [AzureSqlServer_Database_TopQueries_StatementStart]
    FROM [data].[AzureSqlServer_Keys]
    INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[ParentId] = [data].[AzureSqlServer_Keys].[Id]
    INNER JOIN [data].[AzureSqlServer_Database_TopQueries_Keys] ON [data].[AzureSqlServer_Database_TopQueries_Keys].[ParentId] = [data].[AzureSqlServer_Database_Keys].[Id]
     WHERE [data].[AzureSqlServer_Keys].[_Name] = @AzureSqlServer_Name
     AND [data].[AzureSqlServer_Database_Keys].[_Name] = @AzureSqlServer_Database_Name
     AND [data].[AzureSqlServer_Database_TopQueries_Keys].[_DatabaseName] = @AzureSqlServer_Database_TopQueries_DatabaseName
     AND [data].[AzureSqlServer_Database_TopQueries_Keys].[_SqlHandle] = @AzureSqlServer_Database_TopQueries_SqlHandle
     AND [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementEnd] = @AzureSqlServer_Database_TopQueries_StatementEnd
     AND [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementStart] = @AzureSqlServer_Database_TopQueries_StatementStart
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[AzureSqlServer_Name]
, [SightedInstances].[AzureSqlServer_Database_Name]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_DatabaseName]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_SqlHandle]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_StatementEnd]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_StatementStart]
FROM
 [SightedInstances]
GO
