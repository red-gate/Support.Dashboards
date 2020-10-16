SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_Machine_LogicalDisk_UnstableSamples_DateRange]
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
    FROM [data].[Cluster_Machine_LogicalDisk_Sightings]
    WHERE [data].[Cluster_Machine_LogicalDisk_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_Machine_LogicalDisk_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_Machine_Name], [Cluster_Machine_LogicalDisk_Name]) AS
(
    SELECT [data].[Cluster_Machine_LogicalDisk_Keys].[Id]
    , [data].[Cluster_Machine_LogicalDisk_Keys].[ParentId]
    , [data].[Cluster_Machine_LogicalDisk_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_Machine_Keys].[_Name] AS [Cluster_Machine_Name]
    , [data].[Cluster_Machine_LogicalDisk_Keys].[_Name] AS [Cluster_Machine_LogicalDisk_Name]
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_Machine_LogicalDisk_Keys] ON [data].[Cluster_Machine_LogicalDisk_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[Id] = [data].[Cluster_Machine_LogicalDisk_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_Machine_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_Machine_Name]
, [SightedInstances].[Cluster_Machine_LogicalDisk_Name]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_CumulativeIdleTime] AS [Cluster_Machine_LogicalDisk_CumulativeIdleTime]
, [Leaf].[_CumulativeReadBytes] AS [Cluster_Machine_LogicalDisk_CumulativeReadBytes]
, [Leaf].[_CumulativeReads] AS [Cluster_Machine_LogicalDisk_CumulativeReads]
, [Leaf].[_CumulativeReadTime] AS [Cluster_Machine_LogicalDisk_CumulativeReadTime]
, [Leaf].[_CumulativeWriteBytes] AS [Cluster_Machine_LogicalDisk_CumulativeWriteBytes]
, [Leaf].[_CumulativeWrites] AS [Cluster_Machine_LogicalDisk_CumulativeWrites]
, [Leaf].[_CumulativeWriteTime] AS [Cluster_Machine_LogicalDisk_CumulativeWriteTime]
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
    , [_CumulativeIdleTime]
    , [_CumulativeReadBytes]
    , [_CumulativeReads]
    , [_CumulativeReadTime]
    , [_CumulativeWriteBytes]
    , [_CumulativeWrites]
    , [_CumulativeWriteTime]
    FROM [data].[Cluster_Machine_LogicalDisk_UnstableSamples]
     WHERE [Id] = [SightedInstances].[Id]
     AND [CollectionDate] > [PartitionDates].[PartitionMinDate]
     AND [CollectionDate] <= [PartitionDates].[PartitionMaxDate]
    ORDER BY [CollectionDate] DESC
)
 [Leaf]
GO
