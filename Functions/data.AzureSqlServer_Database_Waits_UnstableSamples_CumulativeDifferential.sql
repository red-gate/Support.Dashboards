SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_Waits_UnstableSamples_CumulativeDifferential]
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
    FROM [data].[AzureSqlServer_Database_Waits_Sightings]
    WHERE [data].[AzureSqlServer_Database_Waits_Sightings].[SightingDate] >= @MinDate AND [data].[AzureSqlServer_Database_Waits_Sightings].[SightingDate] <= @MaxDate
)
SELECT
[data].[AzureSqlServer_Database_Waits_Keys].[Id]
, [data].[AzureSqlServer_Database_Waits_Keys].[ParentId]
, [data].[AzureSqlServer_Database_Waits_Keys].[CollectionDate] AS [IdCollectionDate]
, [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_Waits_Keys].[CollectionDate]) AS [IdCollectionDate_DateTime]
, [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
, [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
, [data].[AzureSqlServer_Database_Waits_Keys].[_WaitType] AS [AzureSqlServer_Database_Waits_WaitType]
, [RightLeaf].[CollectionDate]
, ([RightLeaf].[AzureSqlServer_Database_Waits_SignalWaitTime] - ISNULL([LeftLeaf].[AzureSqlServer_Database_Waits_SignalWaitTime],0)) AS [AzureSqlServer_Database_Waits_SignalWaitTime]
, ([RightLeaf].[AzureSqlServer_Database_Waits_WaitingTasksCount] - ISNULL([LeftLeaf].[AzureSqlServer_Database_Waits_WaitingTasksCount],0)) AS [AzureSqlServer_Database_Waits_WaitingTasksCount]
, ([RightLeaf].[AzureSqlServer_Database_Waits_WaitTime] - ISNULL([LeftLeaf].[AzureSqlServer_Database_Waits_WaitTime],0)) AS [AzureSqlServer_Database_Waits_WaitTime]
FROM [SightedIds]
 INNER JOIN [data].[AzureSqlServer_Database_Waits_Keys] ON [data].[AzureSqlServer_Database_Waits_Keys].[Id] = [SightedIds].[Id]
 INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_Waits_Keys].[ParentId]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
OUTER APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[AzureSqlServer_Database_Waits_UnstableSamples].[_SignalWaitTime] AS [AzureSqlServer_Database_Waits_SignalWaitTime]
    ,  [data].[AzureSqlServer_Database_Waits_UnstableSamples].[_WaitingTasksCount] AS [AzureSqlServer_Database_Waits_WaitingTasksCount]
    ,  [data].[AzureSqlServer_Database_Waits_UnstableSamples].[_WaitTime] AS [AzureSqlServer_Database_Waits_WaitTime]
    FROM [data].[AzureSqlServer_Database_Waits_UnstableSamples]
    WHERE [data].[AzureSqlServer_Database_Waits_UnstableSamples].[Id] = [data].[AzureSqlServer_Database_Waits_Keys].[Id]
      AND [data].[AzureSqlServer_Database_Waits_UnstableSamples].[CollectionDate] <= @MinDate
    ORDER BY [data].[AzureSqlServer_Database_Waits_UnstableSamples].[CollectionDate] DESC
)
 AS [LeftLeaf]CROSS APPLY
(
    SELECT TOP 1 [CollectionDate]
    ,  [data].[AzureSqlServer_Database_Waits_UnstableSamples].[_SignalWaitTime] AS [AzureSqlServer_Database_Waits_SignalWaitTime]
    ,  [data].[AzureSqlServer_Database_Waits_UnstableSamples].[_WaitingTasksCount] AS [AzureSqlServer_Database_Waits_WaitingTasksCount]
    ,  [data].[AzureSqlServer_Database_Waits_UnstableSamples].[_WaitTime] AS [AzureSqlServer_Database_Waits_WaitTime]
    FROM [data].[AzureSqlServer_Database_Waits_UnstableSamples]
    WHERE [data].[AzureSqlServer_Database_Waits_UnstableSamples].[Id] = [data].[AzureSqlServer_Database_Waits_Keys].[Id]
      AND [data].[AzureSqlServer_Database_Waits_UnstableSamples].[CollectionDate] > @MinDate
      AND [data].[AzureSqlServer_Database_Waits_UnstableSamples].[CollectionDate] <= @MaxDate
    ORDER BY [data].[AzureSqlServer_Database_Waits_UnstableSamples].[CollectionDate] DESC
)
 AS [RightLeaf]
GO
