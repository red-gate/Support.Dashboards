SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_QueryPlans_Instances_DateRange]
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
    FROM [data].[Cluster_SqlServer_QueryPlans_Sightings]
    WHERE [data].[Cluster_SqlServer_QueryPlans_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_SqlServer_QueryPlans_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_QueryPlans_PlanHandle]) AS
(
    SELECT [data].[Cluster_SqlServer_QueryPlans_Keys].[Id]
    , [data].[Cluster_SqlServer_QueryPlans_Keys].[ParentId]
    , [data].[Cluster_SqlServer_QueryPlans_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_QueryPlans_Keys].[_PlanHandle] AS [Cluster_SqlServer_QueryPlans_PlanHandle]
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_SqlServer_QueryPlans_Keys] ON [data].[Cluster_SqlServer_QueryPlans_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_QueryPlans_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [SightedInstances].[Cluster_SqlServer_QueryPlans_PlanHandle]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_CreateDate] AS [Cluster_SqlServer_QueryPlans_CreateDate]
, [utils].[TicksToDateTime]([Leaf].[_CreateDate]) AS [Cluster_SqlServer_QueryPlans_CreateDate_DateTime]
, [Leaf].[_QueryPlan] AS [Cluster_SqlServer_QueryPlans_QueryPlan]
FROM
 [SightedInstances]
INNER JOIN
 [data].[Cluster_SqlServer_QueryPlans_Instances] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
GO
