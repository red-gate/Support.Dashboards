SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples_InstanceDateRange]
(
    @AzureSqlServer_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_TopQueries_DatabaseName AS NVARCHAR(450)
    , @AzureSqlServer_Database_TopQueries_SqlHandle AS VARBINARY(900)
    , @AzureSqlServer_Database_TopQueries_StatementEnd AS BIGINT
    , @AzureSqlServer_Database_TopQueries_StatementStart AS BIGINT
    , @AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType AS NVARCHAR(450)
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
    , @EventCount AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_Database_Name], [AzureSqlServer_Database_TopQueries_DatabaseName], [AzureSqlServer_Database_TopQueries_SqlHandle], [AzureSqlServer_Database_TopQueries_StatementEnd], [AzureSqlServer_Database_TopQueries_StatementStart], [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType]) AS
(
    SELECT [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[Id]
    , [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[ParentId]
    , [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_DatabaseName] AS [AzureSqlServer_Database_TopQueries_DatabaseName]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_SqlHandle] AS [AzureSqlServer_Database_TopQueries_SqlHandle]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementEnd] AS [AzureSqlServer_Database_TopQueries_StatementEnd]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementStart] AS [AzureSqlServer_Database_TopQueries_StatementStart]
    , [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[_WaitType] AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType]
    FROM [data].[AzureSqlServer_Keys]
    INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[ParentId] = [data].[AzureSqlServer_Keys].[Id]
    INNER JOIN [data].[AzureSqlServer_Database_TopQueries_Keys] ON [data].[AzureSqlServer_Database_TopQueries_Keys].[ParentId] = [data].[AzureSqlServer_Database_Keys].[Id]
    INNER JOIN [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys] ON [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[ParentId] = [data].[AzureSqlServer_Database_TopQueries_Keys].[Id]
     WHERE [data].[AzureSqlServer_Keys].[_Name] = @AzureSqlServer_Name
     AND [data].[AzureSqlServer_Database_Keys].[_Name] = @AzureSqlServer_Database_Name
     AND [data].[AzureSqlServer_Database_TopQueries_Keys].[_DatabaseName] = @AzureSqlServer_Database_TopQueries_DatabaseName
     AND [data].[AzureSqlServer_Database_TopQueries_Keys].[_SqlHandle] = @AzureSqlServer_Database_TopQueries_SqlHandle
     AND [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementEnd] = @AzureSqlServer_Database_TopQueries_StatementEnd
     AND [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementStart] = @AzureSqlServer_Database_TopQueries_StatementStart
     AND [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[_WaitType] = @AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[AzureSqlServer_Name]
, [SightedInstances].[AzureSqlServer_Database_Name]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_DatabaseName]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_SqlHandle]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_StatementEnd]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_StatementStart]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_WaitTime] AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTime]
, [Leaf].[_WaitTimeCount] AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitTimeCount]
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
    FROM [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples]
     WHERE [Id] = [SightedInstances].[Id]
     AND [CollectionDate] > [PartitionDates].[PartitionMinDate]
     AND [CollectionDate] <= [PartitionDates].[PartitionMaxDate]
    ORDER BY [CollectionDate] DESC
)
 [Leaf]
GO
