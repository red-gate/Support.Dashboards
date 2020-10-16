SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_SqlProcess_UnstableSamples_InstanceDateRange]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_SqlProcess_LoginTime AS BIGINT
    , @Cluster_SqlServer_SqlProcess_SessionId AS BIGINT
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
    , @EventCount AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_SqlProcess_LoginTime], [Cluster_SqlServer_SqlProcess_SessionId]) AS
(
    SELECT [data].[Cluster_SqlServer_SqlProcess_Keys].[Id]
    , [data].[Cluster_SqlServer_SqlProcess_Keys].[ParentId]
    , [data].[Cluster_SqlServer_SqlProcess_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_SqlProcess_Keys].[_LoginTime] AS [Cluster_SqlServer_SqlProcess_LoginTime]
    , [data].[Cluster_SqlServer_SqlProcess_Keys].[_SessionId] AS [Cluster_SqlServer_SqlProcess_SessionId]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_SqlProcess_Keys] ON [data].[Cluster_SqlServer_SqlProcess_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
     WHERE [data].[Cluster_Keys].[_Name] = @Cluster_Name
     AND [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name
     AND [data].[Cluster_SqlServer_SqlProcess_Keys].[_LoginTime] = @Cluster_SqlServer_SqlProcess_LoginTime
     AND [data].[Cluster_SqlServer_SqlProcess_Keys].[_SessionId] = @Cluster_SqlServer_SqlProcess_SessionId
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [SightedInstances].[Cluster_SqlServer_SqlProcess_LoginTime]
, [utils].[TicksToDateTime]([SightedInstances].[Cluster_SqlServer_SqlProcess_LoginTime]) AS [Cluster_SqlServer_SqlProcess_LoginTime_DateTime]
, [SightedInstances].[Cluster_SqlServer_SqlProcess_SessionId]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_BlockingSessionId] AS [Cluster_SqlServer_SqlProcess_BlockingSessionId]
, [Leaf].[_BlockingSessionLoginTime] AS [Cluster_SqlServer_SqlProcess_BlockingSessionLoginTime]
, [utils].[TicksToDateTime]([Leaf].[_BlockingSessionLoginTime]) AS [Cluster_SqlServer_SqlProcess_BlockingSessionLoginTime_DateTime]
, [Leaf].[_Command] AS [Cluster_SqlServer_SqlProcess_Command]
, [Leaf].[_CumulativeLogicalReads] AS [Cluster_SqlServer_SqlProcess_CumulativeLogicalReads]
, [Leaf].[_CumulativeProcessorTime] AS [Cluster_SqlServer_SqlProcess_CumulativeProcessorTime]
, [Leaf].[_CumulativeReads] AS [Cluster_SqlServer_SqlProcess_CumulativeReads]
, [Leaf].[_CumulativeWrites] AS [Cluster_SqlServer_SqlProcess_CumulativeWrites]
, [Leaf].[_DatabaseName] AS [Cluster_SqlServer_SqlProcess_DatabaseName]
, [Leaf].[_FullCommand] AS [Cluster_SqlServer_SqlProcess_FullCommand]
, [Leaf].[_LastRequestEnd] AS [Cluster_SqlServer_SqlProcess_LastRequestEnd]
, [utils].[TicksToDateTime]([Leaf].[_LastRequestEnd]) AS [Cluster_SqlServer_SqlProcess_LastRequestEnd_DateTime]
, [Leaf].[_LastRequestStart] AS [Cluster_SqlServer_SqlProcess_LastRequestStart]
, [utils].[TicksToDateTime]([Leaf].[_LastRequestStart]) AS [Cluster_SqlServer_SqlProcess_LastRequestStart_DateTime]
, [Leaf].[_LastWaitType] AS [Cluster_SqlServer_SqlProcess_LastWaitType]
, [Leaf].[_MemoryUsage] AS [Cluster_SqlServer_SqlProcess_MemoryUsage]
, [Leaf].[_MostRecentSqlHandle] AS [Cluster_SqlServer_SqlProcess_MostRecentSqlHandle]
, [Leaf].[_OpenTransactions] AS [Cluster_SqlServer_SqlProcess_OpenTransactions]
, [Leaf].[_PlanHandle] AS [Cluster_SqlServer_SqlProcess_PlanHandle]
, [Leaf].[_QueryStartTime] AS [Cluster_SqlServer_SqlProcess_QueryStartTime]
, [utils].[TicksToDateTime]([Leaf].[_QueryStartTime]) AS [Cluster_SqlServer_SqlProcess_QueryStartTime_DateTime]
, [Leaf].[_SqlHandle] AS [Cluster_SqlServer_SqlProcess_SqlHandle]
, [Leaf].[_StatementEnd] AS [Cluster_SqlServer_SqlProcess_StatementEnd]
, [Leaf].[_StatementStart] AS [Cluster_SqlServer_SqlProcess_StatementStart]
, [Leaf].[_Status] AS [Cluster_SqlServer_SqlProcess_Status]
, [Leaf].[_TotalBlockingTime] AS [Cluster_SqlServer_SqlProcess_TotalBlockingTime]
, [Leaf].[_WaitResource] AS [Cluster_SqlServer_SqlProcess_WaitResource]
, [Leaf].[_WaitTime] AS [Cluster_SqlServer_SqlProcess_WaitTime]
, [Leaf].[_WaitType] AS [Cluster_SqlServer_SqlProcess_WaitType]
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
    , [_BlockingSessionId]
    , [_BlockingSessionLoginTime]
    , [_Command]
    , [_CumulativeLogicalReads]
    , [_CumulativeProcessorTime]
    , [_CumulativeReads]
    , [_CumulativeWrites]
    , [_DatabaseName]
    , [_FullCommand]
    , [_LastRequestEnd]
    , [_LastRequestStart]
    , [_LastWaitType]
    , [_MemoryUsage]
    , [_MostRecentSqlHandle]
    , [_OpenTransactions]
    , [_PlanHandle]
    , [_QueryStartTime]
    , [_SqlHandle]
    , [_StatementEnd]
    , [_StatementStart]
    , [_Status]
    , [_TotalBlockingTime]
    , [_WaitResource]
    , [_WaitTime]
    , [_WaitType]
    FROM [data].[Cluster_SqlServer_SqlProcess_UnstableSamples]
     WHERE [Id] = [SightedInstances].[Id]
     AND [CollectionDate] > [PartitionDates].[PartitionMinDate]
     AND [CollectionDate] <= [PartitionDates].[PartitionMaxDate]
    ORDER BY [CollectionDate] DESC
)
 [Leaf]
GO
