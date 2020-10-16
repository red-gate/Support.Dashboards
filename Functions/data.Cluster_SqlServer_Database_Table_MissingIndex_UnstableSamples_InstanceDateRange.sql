SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Database_Table_MissingIndex_UnstableSamples_InstanceDateRange]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_Schema AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns AS NVARCHAR(450)
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
    , @EventCount AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Database_Name], [Cluster_SqlServer_Database_Table_Name], [Cluster_SqlServer_Database_Table_Schema], [Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns], [Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns], [Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns]) AS
(
    SELECT [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[Id]
    , [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[ParentId]
    , [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [Cluster_SqlServer_Database_Name]
    , [data].[Cluster_SqlServer_Database_Table_Keys].[_Name] AS [Cluster_SqlServer_Database_Table_Name]
    , [data].[Cluster_SqlServer_Database_Table_Keys].[_Schema] AS [Cluster_SqlServer_Database_Table_Schema]
    , [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_EqualityColumns] AS [Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns]
    , [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_IncludedColumns] AS [Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns]
    , [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_InequalityColumns] AS [Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Database_Table_Keys] ON [data].[Cluster_SqlServer_Database_Table_Keys].[ParentId] = [data].[Cluster_SqlServer_Database_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys] ON [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[ParentId] = [data].[Cluster_SqlServer_Database_Table_Keys].[Id]
     WHERE [data].[Cluster_Keys].[_Name] = @Cluster_Name
     AND [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name
     AND [data].[Cluster_SqlServer_Database_Keys].[_Name] = @Cluster_SqlServer_Database_Name
     AND [data].[Cluster_SqlServer_Database_Table_Keys].[_Name] = @Cluster_SqlServer_Database_Table_Name
     AND [data].[Cluster_SqlServer_Database_Table_Keys].[_Schema] = @Cluster_SqlServer_Database_Table_Schema
     AND [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_EqualityColumns] = @Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns
     AND [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_IncludedColumns] = @Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns
     AND [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_InequalityColumns] = @Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [SightedInstances].[Cluster_SqlServer_Database_Name]
, [SightedInstances].[Cluster_SqlServer_Database_Table_Name]
, [SightedInstances].[Cluster_SqlServer_Database_Table_Schema]
, [SightedInstances].[Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns]
, [SightedInstances].[Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns]
, [SightedInstances].[Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_AverageCost] AS [Cluster_SqlServer_Database_Table_MissingIndex_AverageCost]
, [Leaf].[_AverageImpact] AS [Cluster_SqlServer_Database_Table_MissingIndex_AverageImpact]
, [Leaf].[_LastUserScan] AS [Cluster_SqlServer_Database_Table_MissingIndex_LastUserScan]
, [utils].[TicksToDateTime]([Leaf].[_LastUserScan]) AS [Cluster_SqlServer_Database_Table_MissingIndex_LastUserScan_DateTime]
, [Leaf].[_LastUserSeek] AS [Cluster_SqlServer_Database_Table_MissingIndex_LastUserSeek]
, [utils].[TicksToDateTime]([Leaf].[_LastUserSeek]) AS [Cluster_SqlServer_Database_Table_MissingIndex_LastUserSeek_DateTime]
, [Leaf].[_UniqueCompiles] AS [Cluster_SqlServer_Database_Table_MissingIndex_UniqueCompiles]
, [Leaf].[_UserScans] AS [Cluster_SqlServer_Database_Table_MissingIndex_UserScans]
, [Leaf].[_UserSeeks] AS [Cluster_SqlServer_Database_Table_MissingIndex_UserSeeks]
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
    , [_AverageCost]
    , [_AverageImpact]
    , [_LastUserScan]
    , [_LastUserSeek]
    , [_UniqueCompiles]
    , [_UserScans]
    , [_UserSeeks]
    FROM [data].[Cluster_SqlServer_Database_Table_MissingIndex_UnstableSamples]
     WHERE [Id] = [SightedInstances].[Id]
     AND [CollectionDate] > [PartitionDates].[PartitionMinDate]
     AND [CollectionDate] <= [PartitionDates].[PartitionMaxDate]
    ORDER BY [CollectionDate] DESC
)
 [Leaf]
GO
