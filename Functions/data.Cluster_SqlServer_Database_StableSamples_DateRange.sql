SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Database_StableSamples_DateRange]
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
    FROM [data].[Cluster_SqlServer_Database_Sightings]
    WHERE [data].[Cluster_SqlServer_Database_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_SqlServer_Database_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Database_Name]) AS
(
    SELECT [data].[Cluster_SqlServer_Database_Keys].[Id]
    , [data].[Cluster_SqlServer_Database_Keys].[ParentId]
    , [data].[Cluster_SqlServer_Database_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [Cluster_SqlServer_Database_Name]
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Database_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [SightedInstances].[Cluster_SqlServer_Database_Name]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_AutoCreateStatistics] AS [Cluster_SqlServer_Database_AutoCreateStatistics]
, [Leaf].[_AutoShrink] AS [Cluster_SqlServer_Database_AutoShrink]
, [Leaf].[_Collation] AS [Cluster_SqlServer_Database_Collation]
, [Leaf].[_CompatibilityLevel] AS [Cluster_SqlServer_Database_CompatibilityLevel]
, [Leaf].[_CreateDate] AS [Cluster_SqlServer_Database_CreateDate]
, [utils].[TicksToDateTime]([Leaf].[_CreateDate]) AS [Cluster_SqlServer_Database_CreateDate_DateTime]
, [Leaf].[_DatabaseId] AS [Cluster_SqlServer_Database_DatabaseId]
, [Leaf].[_PageVerify] AS [Cluster_SqlServer_Database_PageVerify]
, [Leaf].[_ReadOnly] AS [Cluster_SqlServer_Database_ReadOnly]
, [Leaf].[_RecoveryModel] AS [Cluster_SqlServer_Database_RecoveryModel]
, [Leaf].[_Standby] AS [Cluster_SqlServer_Database_Standby]
, [Leaf].[_State] AS [Cluster_SqlServer_Database_State]
FROM
 [SightedInstances]
LEFT OUTER JOIN
(
    SELECT [Id], MAX([CollectionDate]) as [GreatestMinDate]
    FROM [data].[Cluster_SqlServer_Database_StableSamples]
    WHERE [CollectionDate] <= @MinDate
    GROUP BY [Id]
)
[GreatestMinDates]
 ON [SightedInstances].[Id] = [GreatestMinDates].[Id]
INNER JOIN
 [data].[Cluster_SqlServer_Database_StableSamples] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
WHERE [Leaf].[CollectionDate] >= COALESCE([GreatestMinDates].[GreatestMinDate], @MinDate)
AND [Leaf].[CollectionDate] <= @MaxDate
GO
