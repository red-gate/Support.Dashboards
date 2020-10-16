SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_ServerWaits_UnstableSamples_CumulativeDifferential]
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
    FROM [data].[Cluster_SqlServer_ServerWaits_Sightings]
    WHERE [data].[Cluster_SqlServer_ServerWaits_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_SqlServer_ServerWaits_Sightings].[SightingDate] <= @MaxDate
)
SELECT
[data].[Cluster_SqlServer_ServerWaits_Keys].[Id]
, [data].[Cluster_SqlServer_ServerWaits_Keys].[ParentId]
, [data].[Cluster_SqlServer_ServerWaits_Keys].[CollectionDate] AS [IdCollectionDate]
, [utils].[TicksToDateTime]([data].[Cluster_SqlServer_ServerWaits_Keys].[CollectionDate]) AS [IdCollectionDate_DateTime]
, [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
, [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
, [data].[Cluster_SqlServer_ServerWaits_Keys].[_WaitType] AS [Cluster_SqlServer_ServerWaits_WaitType]
, [RightLeaf].[CollectionDate]
, ([RightLeaf].[Cluster_SqlServer_ServerWaits_SignalWaitTime] - ISNULL([LeftLeaf].[Cluster_SqlServer_ServerWaits_SignalWaitTime],0)) AS [Cluster_SqlServer_ServerWaits_SignalWaitTime]
, ([RightLeaf].[Cluster_SqlServer_ServerWaits_WaitingTasksCount] - ISNULL([LeftLeaf].[Cluster_SqlServer_ServerWaits_WaitingTasksCount],0)) AS [Cluster_SqlServer_ServerWaits_WaitingTasksCount]
, ([RightLeaf].[Cluster_SqlServer_ServerWaits_WaitTime] - ISNULL([LeftLeaf].[Cluster_SqlServer_ServerWaits_WaitTime],0)) AS [Cluster_SqlServer_ServerWaits_WaitTime]
FROM [SightedIds]
 INNER JOIN [data].[Cluster_SqlServer_ServerWaits_Keys] ON [data].[Cluster_SqlServer_ServerWaits_Keys].[Id] = [SightedIds].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_ServerWaits_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
OUTER APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[_SignalWaitTime] AS [Cluster_SqlServer_ServerWaits_SignalWaitTime]
    ,  [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[_WaitingTasksCount] AS [Cluster_SqlServer_ServerWaits_WaitingTasksCount]
    ,  [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[_WaitTime] AS [Cluster_SqlServer_ServerWaits_WaitTime]
    FROM [data].[Cluster_SqlServer_ServerWaits_UnstableSamples]
    WHERE [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[Id] = [data].[Cluster_SqlServer_ServerWaits_Keys].[Id]
      AND [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[CollectionDate] <= @MinDate
    ORDER BY [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[CollectionDate] DESC
)
 AS [LeftLeaf]CROSS APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[_SignalWaitTime] AS [Cluster_SqlServer_ServerWaits_SignalWaitTime]
    ,  [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[_WaitingTasksCount] AS [Cluster_SqlServer_ServerWaits_WaitingTasksCount]
    ,  [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[_WaitTime] AS [Cluster_SqlServer_ServerWaits_WaitTime]
    FROM [data].[Cluster_SqlServer_ServerWaits_UnstableSamples]
    WHERE [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[Id] = [data].[Cluster_SqlServer_ServerWaits_Keys].[Id]
      AND [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[CollectionDate] > @MinDate
      AND [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[CollectionDate] <= @MaxDate
    ORDER BY [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[CollectionDate] DESC
)
 AS [RightLeaf]
GO
