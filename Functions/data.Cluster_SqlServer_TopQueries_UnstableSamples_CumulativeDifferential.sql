SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_TopQueries_UnstableSamples_CumulativeDifferential]
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
    FROM [data].[Cluster_SqlServer_TopQueries_Sightings]
    WHERE [data].[Cluster_SqlServer_TopQueries_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_SqlServer_TopQueries_Sightings].[SightingDate] <= @MaxDate
)
SELECT
[data].[Cluster_SqlServer_TopQueries_Keys].[Id]
, [data].[Cluster_SqlServer_TopQueries_Keys].[ParentId]
, [data].[Cluster_SqlServer_TopQueries_Keys].[CollectionDate] AS [IdCollectionDate]
, [utils].[TicksToDateTime]([data].[Cluster_SqlServer_TopQueries_Keys].[CollectionDate]) AS [IdCollectionDate_DateTime]
, [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
, [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
, [data].[Cluster_SqlServer_TopQueries_Keys].[_DatabaseName] AS [Cluster_SqlServer_TopQueries_DatabaseName]
, [data].[Cluster_SqlServer_TopQueries_Keys].[_SqlHandle] AS [Cluster_SqlServer_TopQueries_SqlHandle]
, [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementEnd] AS [Cluster_SqlServer_TopQueries_StatementEnd]
, [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementStart] AS [Cluster_SqlServer_TopQueries_StatementStart]
, [RightLeaf].[CollectionDate]
, ([RightLeaf].[Cluster_SqlServer_TopQueries_ExecutionCount] - ISNULL([LeftLeaf].[Cluster_SqlServer_TopQueries_ExecutionCount],0)) AS [Cluster_SqlServer_TopQueries_ExecutionCount]
, ([RightLeaf].[Cluster_SqlServer_TopQueries_ExecutionTime] - ISNULL([LeftLeaf].[Cluster_SqlServer_TopQueries_ExecutionTime],0)) AS [Cluster_SqlServer_TopQueries_ExecutionTime]
, ([RightLeaf].[Cluster_SqlServer_TopQueries_LogicalReads] - ISNULL([LeftLeaf].[Cluster_SqlServer_TopQueries_LogicalReads],0)) AS [Cluster_SqlServer_TopQueries_LogicalReads]
, ([RightLeaf].[Cluster_SqlServer_TopQueries_LogicalWrites] - ISNULL([LeftLeaf].[Cluster_SqlServer_TopQueries_LogicalWrites],0)) AS [Cluster_SqlServer_TopQueries_LogicalWrites]
, ([RightLeaf].[Cluster_SqlServer_TopQueries_PhysicalReads] - ISNULL([LeftLeaf].[Cluster_SqlServer_TopQueries_PhysicalReads],0)) AS [Cluster_SqlServer_TopQueries_PhysicalReads]
, ([RightLeaf].[Cluster_SqlServer_TopQueries_WorkerTime] - ISNULL([LeftLeaf].[Cluster_SqlServer_TopQueries_WorkerTime],0)) AS [Cluster_SqlServer_TopQueries_WorkerTime]
FROM [SightedIds]
 INNER JOIN [data].[Cluster_SqlServer_TopQueries_Keys] ON [data].[Cluster_SqlServer_TopQueries_Keys].[Id] = [SightedIds].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_TopQueries_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
OUTER APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_ExecutionCount] AS [Cluster_SqlServer_TopQueries_ExecutionCount]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_ExecutionTime] AS [Cluster_SqlServer_TopQueries_ExecutionTime]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_LogicalReads] AS [Cluster_SqlServer_TopQueries_LogicalReads]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_LogicalWrites] AS [Cluster_SqlServer_TopQueries_LogicalWrites]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_PhysicalReads] AS [Cluster_SqlServer_TopQueries_PhysicalReads]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_WorkerTime] AS [Cluster_SqlServer_TopQueries_WorkerTime]
    FROM [data].[Cluster_SqlServer_TopQueries_UnstableSamples]
    WHERE [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[Id] = [data].[Cluster_SqlServer_TopQueries_Keys].[Id]
      AND [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[CollectionDate] <= @MinDate
    ORDER BY [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[CollectionDate] DESC
)
 AS [LeftLeaf]CROSS APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_ExecutionCount] AS [Cluster_SqlServer_TopQueries_ExecutionCount]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_ExecutionTime] AS [Cluster_SqlServer_TopQueries_ExecutionTime]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_LogicalReads] AS [Cluster_SqlServer_TopQueries_LogicalReads]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_LogicalWrites] AS [Cluster_SqlServer_TopQueries_LogicalWrites]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_PhysicalReads] AS [Cluster_SqlServer_TopQueries_PhysicalReads]
    ,  [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[_WorkerTime] AS [Cluster_SqlServer_TopQueries_WorkerTime]
    FROM [data].[Cluster_SqlServer_TopQueries_UnstableSamples]
    WHERE [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[Id] = [data].[Cluster_SqlServer_TopQueries_Keys].[Id]
      AND [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[CollectionDate] > @MinDate
      AND [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[CollectionDate] <= @MaxDate
    ORDER BY [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[CollectionDate] DESC
)
 AS [RightLeaf]
GO
