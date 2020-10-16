SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_MemoryManager_UnstableSamples_InstanceDateRange]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
    , @EventCount AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name]) AS
(
    SELECT [data].[Cluster_SqlServer_Keys].[Id]
    , [data].[Cluster_SqlServer_Keys].[ParentId]
    , [data].[Cluster_SqlServer_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
     WHERE [data].[Cluster_Keys].[_Name] = @Cluster_Name
     AND [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_ConnectionMemoryBytes] AS [Cluster_SqlServer_MemoryManager_ConnectionMemoryBytes]
, [Leaf].[_DatabaseCacheMemoryBytes] AS [Cluster_SqlServer_MemoryManager_DatabaseCacheMemoryBytes]
, [Leaf].[_FreeMemoryBytes] AS [Cluster_SqlServer_MemoryManager_FreeMemoryBytes]
, [Leaf].[_LockMemoryBytes] AS [Cluster_SqlServer_MemoryManager_LockMemoryBytes]
, [Leaf].[_LogPoolMemoryBytes] AS [Cluster_SqlServer_MemoryManager_LogPoolMemoryBytes]
, [Leaf].[_MaximumWorkspaceMemoryBytes] AS [Cluster_SqlServer_MemoryManager_MaximumWorkspaceMemoryBytes]
, [Leaf].[_OptimizerMemoryBytes] AS [Cluster_SqlServer_MemoryManager_OptimizerMemoryBytes]
, [Leaf].[_PlanCacheMemoryBytes] AS [Cluster_SqlServer_MemoryManager_PlanCacheMemoryBytes]
, [Leaf].[_ReservedMemoryBytes] AS [Cluster_SqlServer_MemoryManager_ReservedMemoryBytes]
, [Leaf].[_StolenServerMemoryBytes] AS [Cluster_SqlServer_MemoryManager_StolenServerMemoryBytes]
, [Leaf].[_TargetServerMemoryBytes] AS [Cluster_SqlServer_MemoryManager_TargetServerMemoryBytes]
, [Leaf].[_TotalServerMemoryBytes] AS [Cluster_SqlServer_MemoryManager_TotalServerMemoryBytes]
, [Leaf].[_WorkspaceMemoryBytes] AS [Cluster_SqlServer_MemoryManager_WorkspaceMemoryBytes]
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
    , [_ConnectionMemoryBytes]
    , [_DatabaseCacheMemoryBytes]
    , [_FreeMemoryBytes]
    , [_LockMemoryBytes]
    , [_LogPoolMemoryBytes]
    , [_MaximumWorkspaceMemoryBytes]
    , [_OptimizerMemoryBytes]
    , [_PlanCacheMemoryBytes]
    , [_ReservedMemoryBytes]
    , [_StolenServerMemoryBytes]
    , [_TargetServerMemoryBytes]
    , [_TotalServerMemoryBytes]
    , [_WorkspaceMemoryBytes]
    FROM [data].[Cluster_SqlServer_MemoryManager_UnstableSamples]
     WHERE [Id] = [SightedInstances].[Id]
     AND [CollectionDate] > [PartitionDates].[PartitionMinDate]
     AND [CollectionDate] <= [PartitionDates].[PartitionMaxDate]
    ORDER BY [CollectionDate] DESC
)
 [Leaf]
GO
