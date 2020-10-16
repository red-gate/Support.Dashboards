SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples_InstanceDateRange]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_TopQueries_DatabaseName AS NVARCHAR(450)
    , @Cluster_SqlServer_TopQueries_SqlHandle AS VARBINARY(900)
    , @Cluster_SqlServer_TopQueries_StatementEnd AS BIGINT
    , @Cluster_SqlServer_TopQueries_StatementStart AS BIGINT
    , @Cluster_SqlServer_TopQueries_QueryWaitStats_WaitType AS NVARCHAR(450)
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
    , @EventCount AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_TopQueries_DatabaseName], [Cluster_SqlServer_TopQueries_SqlHandle], [Cluster_SqlServer_TopQueries_StatementEnd], [Cluster_SqlServer_TopQueries_StatementStart], [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitType]) AS
(
    SELECT [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[Id]
    , [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[ParentId]
    , [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_TopQueries_Keys].[_DatabaseName] AS [Cluster_SqlServer_TopQueries_DatabaseName]
    , [data].[Cluster_SqlServer_TopQueries_Keys].[_SqlHandle] AS [Cluster_SqlServer_TopQueries_SqlHandle]
    , [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementEnd] AS [Cluster_SqlServer_TopQueries_StatementEnd]
    , [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementStart] AS [Cluster_SqlServer_TopQueries_StatementStart]
    , [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[_WaitType] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitType]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_TopQueries_Keys] ON [data].[Cluster_SqlServer_TopQueries_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] ON [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[ParentId] = [data].[Cluster_SqlServer_TopQueries_Keys].[Id]
     WHERE [data].[Cluster_Keys].[_Name] = @Cluster_Name
     AND [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name
     AND [data].[Cluster_SqlServer_TopQueries_Keys].[_DatabaseName] = @Cluster_SqlServer_TopQueries_DatabaseName
     AND [data].[Cluster_SqlServer_TopQueries_Keys].[_SqlHandle] = @Cluster_SqlServer_TopQueries_SqlHandle
     AND [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementEnd] = @Cluster_SqlServer_TopQueries_StatementEnd
     AND [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementStart] = @Cluster_SqlServer_TopQueries_StatementStart
     AND [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[_WaitType] = @Cluster_SqlServer_TopQueries_QueryWaitStats_WaitType
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [SightedInstances].[Cluster_SqlServer_TopQueries_DatabaseName]
, [SightedInstances].[Cluster_SqlServer_TopQueries_SqlHandle]
, [SightedInstances].[Cluster_SqlServer_TopQueries_StatementEnd]
, [SightedInstances].[Cluster_SqlServer_TopQueries_StatementStart]
, [SightedInstances].[Cluster_SqlServer_TopQueries_QueryWaitStats_WaitType]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_WaitTime] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTime]
, [Leaf].[_WaitTimeCount] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitTimeCount]
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
    , [_WaitTime]
    , [_WaitTimeCount]
    FROM [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples]
     WHERE [Id] = [SightedInstances].[Id]
     AND [CollectionDate] > [PartitionDates].[PartitionMinDate]
     AND [CollectionDate] <= [PartitionDates].[PartitionMaxDate]
    ORDER BY [CollectionDate] DESC
)
 [Leaf]
GO
