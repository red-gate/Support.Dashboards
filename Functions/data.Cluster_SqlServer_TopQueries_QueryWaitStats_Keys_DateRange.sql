SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys_DateRange]
(
    @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedIds]([Id]) AS
(
    SELECT DISTINCT [Id]
    FROM [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Sightings]
    WHERE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_TopQueries_DatabaseName], [Cluster_SqlServer_TopQueries_SqlHandle], [Cluster_SqlServer_TopQueries_StatementEnd], [Cluster_SqlServer_TopQueries_StatementStart], [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitType]) AS
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
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] ON [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_SqlServer_TopQueries_Keys] ON [data].[Cluster_SqlServer_TopQueries_Keys].[Id] = [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[ParentId]
     INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_TopQueries_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
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
FROM
 [SightedInstances]
GO
