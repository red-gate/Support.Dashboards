SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_ElasticPool_Resources_UnstableSamples_DateRange]
(
    @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
    , @EventCount AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedIds]([Id]) AS
(
    SELECT DISTINCT [Id]
    FROM [data].[AzureSqlServer_ElasticPool_Sightings]
    WHERE [data].[AzureSqlServer_ElasticPool_Sightings].[SightingDate] >= @MinDate AND [data].[AzureSqlServer_ElasticPool_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_ElasticPool_Name]) AS
(
    SELECT [data].[AzureSqlServer_ElasticPool_Keys].[Id]
    , [data].[AzureSqlServer_ElasticPool_Keys].[ParentId]
    , [data].[AzureSqlServer_ElasticPool_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_ElasticPool_Keys].[_Name] AS [AzureSqlServer_ElasticPool_Name]
    FROM [SightedIds]
     INNER JOIN [data].[AzureSqlServer_ElasticPool_Keys] ON [data].[AzureSqlServer_ElasticPool_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_ElasticPool_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[AzureSqlServer_Name]
, [SightedInstances].[AzureSqlServer_ElasticPool_Name]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_AvgAllocatedStoragePercent] AS [AzureSqlServer_ElasticPool_Resources_AvgAllocatedStoragePercent]
, [Leaf].[_AvgCpuPercent] AS [AzureSqlServer_ElasticPool_Resources_AvgCpuPercent]
, [Leaf].[_AvgDataIoPercent] AS [AzureSqlServer_ElasticPool_Resources_AvgDataIoPercent]
, [Leaf].[_AvgLogWritePercent] AS [AzureSqlServer_ElasticPool_Resources_AvgLogWritePercent]
, [Leaf].[_AvgStoragePercent] AS [AzureSqlServer_ElasticPool_Resources_AvgStoragePercent]
, [Leaf].[_EndTime] AS [AzureSqlServer_ElasticPool_Resources_EndTime]
, [utils].[TicksToDateTime]([Leaf].[_EndTime]) AS [AzureSqlServer_ElasticPool_Resources_EndTime_DateTime]
, [Leaf].[_MaxSessionPercent] AS [AzureSqlServer_ElasticPool_Resources_MaxSessionPercent]
, [Leaf].[_MaxWorkerPercent] AS [AzureSqlServer_ElasticPool_Resources_MaxWorkerPercent]
, [Leaf].[_StartTime] AS [AzureSqlServer_ElasticPool_Resources_StartTime]
, [utils].[TicksToDateTime]([Leaf].[_StartTime]) AS [AzureSqlServer_ElasticPool_Resources_StartTime_DateTime]
FROM
 [SightedInstances]
INNER JOIN
(
    -- We partition the date range into n 'bins' and take the last sample in each bin, if available.
    -- We calculate the bin sizes in floating point to handle ranges of less than n ticks, then round up.
    SELECT
        (@MinDate + CAST(CEILING(CAST(@MaxDate - @MinDate AS FLOAT) / @MaxSamples) AS BIGINT) * ([i]    )) AS [PartitionMinDate],
        (@MinDate + CAST(CEILING(CAST(@MaxDate - @MinDate AS FLOAT) / @MaxSamples) AS BIGINT) * ([i] + 1)) AS [PartitionMaxDate]
    FROM [utils].[Nat](@MaxSamples)
    WHERE @MinDate + CAST(CEILING(CAST(@MaxDate - @MinDate AS FLOAT) / @MaxSamples) AS BIGINT) * [i] < @MaxDate
)
 [PartitionDates] ON 1 = 1
CROSS APPLY
(
    SELECT TOP (@EventCount)
    [CollectionDate]
    , [_AvgAllocatedStoragePercent]
    , [_AvgCpuPercent]
    , [_AvgDataIoPercent]
    , [_AvgLogWritePercent]
    , [_AvgStoragePercent]
    , [_EndTime]
    , [_MaxSessionPercent]
    , [_MaxWorkerPercent]
    , [_StartTime]
    FROM [data].[AzureSqlServer_ElasticPool_Resources_UnstableSamples]
     WHERE [Id] = [SightedInstances].[Id]
     AND [CollectionDate] > [PartitionDates].[PartitionMinDate]
     AND [CollectionDate] <= [PartitionDates].[PartitionMaxDate]
    ORDER BY [CollectionDate] DESC
)
 [Leaf]
GO
