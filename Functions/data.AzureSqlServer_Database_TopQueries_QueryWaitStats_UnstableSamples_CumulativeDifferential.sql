SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples_CumulativeDifferential]
(
    @MinDate AS BIGINT
    , @MaxDate AS BIGINT
)
RETURNS TABLE
AS
RETURN
WITH [SightedIds]([Id]) AS
(
    SELECT DISTINCT [Id]
    FROM [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Sightings]
    WHERE [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Sightings].[SightingDate] >= @MinDate AND [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Sightings].[SightingDate] <= @MaxDate
)
SELECT
[data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[Id]
, [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[ParentId]
, [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[CollectionDate] AS [IdCollectionDate]
, [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[CollectionDate]) AS [IdCollectionDate_DateTime]
, [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
, [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
, [data].[AzureSqlServer_Database_TopQueries_Keys].[_DatabaseName] AS [AzureSqlServer_Database_TopQueries_DatabaseName]
, [data].[AzureSqlServer_Database_TopQueries_Keys].[_SqlHandle] AS [AzureSqlServer_Database_TopQueries_SqlHandle]
, [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementEnd] AS [AzureSqlServer_Database_TopQueries_StatementEnd]
, [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementStart] AS [AzureSqlServer_Database_TopQueries_StatementStart]
, [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[_WaitType] AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType]
, [RightLeaf].[CollectionDate]
, ([RightLeaf].[AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTime] - ISNULL([LeftLeaf].[AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTime],0)) AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTime]
, ([RightLeaf].[AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTimeCount] - ISNULL([LeftLeaf].[AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTimeCount],0)) AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTimeCount]
FROM [SightedIds]
 INNER JOIN [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys] ON [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[Id] = [SightedIds].[Id]
 INNER JOIN [data].[AzureSqlServer_Database_TopQueries_Keys] ON [data].[AzureSqlServer_Database_TopQueries_Keys].[Id] = [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[ParentId]
 INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_TopQueries_Keys].[ParentId]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
OUTER APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[_WaitTime] AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTime]
    ,  [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[_WaitTimeCount] AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTimeCount]
    FROM [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples]
    WHERE [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[Id] = [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[Id]
      AND [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate] <= @MinDate
    ORDER BY [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate] DESC
)
 AS [LeftLeaf]CROSS APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[_WaitTime] AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTime]
    ,  [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[_WaitTimeCount] AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTimeCount]
    FROM [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples]
    WHERE [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[Id] = [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[Id]
      AND [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate] > @MinDate
      AND [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate] <= @MaxDate
    ORDER BY [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate] DESC
)
 AS [RightLeaf]
GO
