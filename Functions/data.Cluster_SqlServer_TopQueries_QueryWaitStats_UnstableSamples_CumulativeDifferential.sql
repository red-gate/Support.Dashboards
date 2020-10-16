SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples_CumulativeDifferential]
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
    FROM [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Sightings]
    WHERE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Sightings].[SightingDate] <= @MaxDate
)
SELECT
[data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[Id]
, [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[ParentId]
, [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[CollectionDate] AS [IdCollectionDate]
, [utils].[TicksToDateTime]([data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[CollectionDate]) AS [IdCollectionDate_DateTime]
, [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
, [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
, [data].[Cluster_SqlServer_TopQueries_Keys].[_DatabaseName] AS [Cluster_SqlServer_TopQueries_DatabaseName]
, [data].[Cluster_SqlServer_TopQueries_Keys].[_SqlHandle] AS [Cluster_SqlServer_TopQueries_SqlHandle]
, [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementEnd] AS [Cluster_SqlServer_TopQueries_StatementEnd]
, [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementStart] AS [Cluster_SqlServer_TopQueries_StatementStart]
, [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[_WaitType] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitType]
, [RightLeaf].[CollectionDate]
, ([RightLeaf].[Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTime] - ISNULL([LeftLeaf].[Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTime],0)) AS [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTime]
, ([RightLeaf].[Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTimeCount] - ISNULL([LeftLeaf].[Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTimeCount],0)) AS [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTimeCount]
FROM [SightedIds]
 INNER JOIN [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] ON [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[Id] = [SightedIds].[Id]
 INNER JOIN [data].[Cluster_SqlServer_TopQueries_Keys] ON [data].[Cluster_SqlServer_TopQueries_Keys].[Id] = [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[ParentId]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_TopQueries_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
OUTER APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples].[_WaitTime] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTime]
    ,  [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples].[_WaitTimeCount] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTimeCount]
    FROM [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples]
    WHERE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples].[Id] = [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[Id]
      AND [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate] <= @MinDate
    ORDER BY [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate] DESC
)
 AS [LeftLeaf]CROSS APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples].[_WaitTime] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTime]
    ,  [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples].[_WaitTimeCount] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTimeCount]
    FROM [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples]
    WHERE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples].[Id] = [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[Id]
      AND [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate] > @MinDate
      AND [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate] <= @MaxDate
    ORDER BY [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate] DESC
)
 AS [RightLeaf]
GO
