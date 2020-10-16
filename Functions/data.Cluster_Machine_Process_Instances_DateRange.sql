SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_Machine_Process_Instances_DateRange]
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
    FROM [data].[Cluster_Machine_Process_Sightings]
    WHERE [data].[Cluster_Machine_Process_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_Machine_Process_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_Machine_Name], [Cluster_Machine_Process_Id], [Cluster_Machine_Process_StartDate]) AS
(
    SELECT [data].[Cluster_Machine_Process_Keys].[Id]
    , [data].[Cluster_Machine_Process_Keys].[ParentId]
    , [data].[Cluster_Machine_Process_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_Machine_Keys].[_Name] AS [Cluster_Machine_Name]
    , [data].[Cluster_Machine_Process_Keys].[_Id] AS [Cluster_Machine_Process_Id]
    , [data].[Cluster_Machine_Process_Keys].[_StartDate] AS [Cluster_Machine_Process_StartDate]
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_Machine_Process_Keys] ON [data].[Cluster_Machine_Process_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[Id] = [data].[Cluster_Machine_Process_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_Machine_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_Machine_Name]
, [SightedInstances].[Cluster_Machine_Process_Id]
, [SightedInstances].[Cluster_Machine_Process_StartDate]
, [utils].[TicksToDateTime]([SightedInstances].[Cluster_Machine_Process_StartDate]) AS [Cluster_Machine_Process_StartDate_DateTime]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_Name] AS [Cluster_Machine_Process_Name]
FROM
 [SightedInstances]
INNER JOIN
 [data].[Cluster_Machine_Process_Instances] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
GO
