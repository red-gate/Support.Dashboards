SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_TopQueries_UnstableSamples_CumulativeDifferential]
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
    FROM [data].[AzureSqlServer_Database_TopQueries_Sightings]
    WHERE [data].[AzureSqlServer_Database_TopQueries_Sightings].[SightingDate] >= @MinDate AND [data].[AzureSqlServer_Database_TopQueries_Sightings].[SightingDate] <= @MaxDate
)
SELECT
[data].[AzureSqlServer_Database_TopQueries_Keys].[Id]
, [data].[AzureSqlServer_Database_TopQueries_Keys].[ParentId]
, [data].[AzureSqlServer_Database_TopQueries_Keys].[CollectionDate] AS [IdCollectionDate]
, [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_TopQueries_Keys].[CollectionDate]) AS [IdCollectionDate_DateTime]
, [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
, [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
, [data].[AzureSqlServer_Database_TopQueries_Keys].[_DatabaseName] AS [AzureSqlServer_Database_TopQueries_DatabaseName]
, [data].[AzureSqlServer_Database_TopQueries_Keys].[_SqlHandle] AS [AzureSqlServer_Database_TopQueries_SqlHandle]
, [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementEnd] AS [AzureSqlServer_Database_TopQueries_StatementEnd]
, [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementStart] AS [AzureSqlServer_Database_TopQueries_StatementStart]
, [RightLeaf].[CollectionDate]
, ([RightLeaf].[AzureSqlServer_Database_TopQueries_ExecutionCount] - ISNULL([LeftLeaf].[AzureSqlServer_Database_TopQueries_ExecutionCount],0)) AS [AzureSqlServer_Database_TopQueries_ExecutionCount]
, ([RightLeaf].[AzureSqlServer_Database_TopQueries_ExecutionTime] - ISNULL([LeftLeaf].[AzureSqlServer_Database_TopQueries_ExecutionTime],0)) AS [AzureSqlServer_Database_TopQueries_ExecutionTime]
, ([RightLeaf].[AzureSqlServer_Database_TopQueries_LogicalReads] - ISNULL([LeftLeaf].[AzureSqlServer_Database_TopQueries_LogicalReads],0)) AS [AzureSqlServer_Database_TopQueries_LogicalReads]
, ([RightLeaf].[AzureSqlServer_Database_TopQueries_LogicalWrites] - ISNULL([LeftLeaf].[AzureSqlServer_Database_TopQueries_LogicalWrites],0)) AS [AzureSqlServer_Database_TopQueries_LogicalWrites]
, ([RightLeaf].[AzureSqlServer_Database_TopQueries_PhysicalReads] - ISNULL([LeftLeaf].[AzureSqlServer_Database_TopQueries_PhysicalReads],0)) AS [AzureSqlServer_Database_TopQueries_PhysicalReads]
, ([RightLeaf].[AzureSqlServer_Database_TopQueries_WorkerTime] - ISNULL([LeftLeaf].[AzureSqlServer_Database_TopQueries_WorkerTime],0)) AS [AzureSqlServer_Database_TopQueries_WorkerTime]
FROM [SightedIds]
 INNER JOIN [data].[AzureSqlServer_Database_TopQueries_Keys] ON [data].[AzureSqlServer_Database_TopQueries_Keys].[Id] = [SightedIds].[Id]
 INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_TopQueries_Keys].[ParentId]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
OUTER APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_ExecutionCount] AS [AzureSqlServer_Database_TopQueries_ExecutionCount]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_ExecutionTime] AS [AzureSqlServer_Database_TopQueries_ExecutionTime]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_LogicalReads] AS [AzureSqlServer_Database_TopQueries_LogicalReads]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_LogicalWrites] AS [AzureSqlServer_Database_TopQueries_LogicalWrites]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_PhysicalReads] AS [AzureSqlServer_Database_TopQueries_PhysicalReads]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_WorkerTime] AS [AzureSqlServer_Database_TopQueries_WorkerTime]
    FROM [data].[AzureSqlServer_Database_TopQueries_UnstableSamples]
    WHERE [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[Id] = [data].[AzureSqlServer_Database_TopQueries_Keys].[Id]
      AND [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[CollectionDate] <= @MinDate
    ORDER BY [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[CollectionDate] DESC
)
 AS [LeftLeaf]CROSS APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_ExecutionCount] AS [AzureSqlServer_Database_TopQueries_ExecutionCount]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_ExecutionTime] AS [AzureSqlServer_Database_TopQueries_ExecutionTime]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_LogicalReads] AS [AzureSqlServer_Database_TopQueries_LogicalReads]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_LogicalWrites] AS [AzureSqlServer_Database_TopQueries_LogicalWrites]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_PhysicalReads] AS [AzureSqlServer_Database_TopQueries_PhysicalReads]
    ,  [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[_WorkerTime] AS [AzureSqlServer_Database_TopQueries_WorkerTime]
    FROM [data].[AzureSqlServer_Database_TopQueries_UnstableSamples]
    WHERE [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[Id] = [data].[AzureSqlServer_Database_TopQueries_Keys].[Id]
      AND [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[CollectionDate] > @MinDate
      AND [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[CollectionDate] <= @MaxDate
    ORDER BY [data].[AzureSqlServer_Database_TopQueries_UnstableSamples].[CollectionDate] DESC
)
 AS [RightLeaf]
GO
