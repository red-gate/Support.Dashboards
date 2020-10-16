SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_AvailabilityGroup_Replica_Info_StableSamples_DateRange]
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
    FROM [data].[Cluster_AvailabilityGroup_Replica_Sightings]
    WHERE [data].[Cluster_AvailabilityGroup_Replica_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_AvailabilityGroup_Replica_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_AvailabilityGroup_Name], [Cluster_AvailabilityGroup_Replica_Name]) AS
(
    SELECT [data].[Cluster_AvailabilityGroup_Replica_Keys].[Id]
    , [data].[Cluster_AvailabilityGroup_Replica_Keys].[ParentId]
    , [data].[Cluster_AvailabilityGroup_Replica_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_AvailabilityGroup_Keys].[_Name] AS [Cluster_AvailabilityGroup_Name]
    , [data].[Cluster_AvailabilityGroup_Replica_Keys].[_Name] AS [Cluster_AvailabilityGroup_Replica_Name]
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_AvailabilityGroup_Replica_Keys] ON [data].[Cluster_AvailabilityGroup_Replica_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_AvailabilityGroup_Keys] ON [data].[Cluster_AvailabilityGroup_Keys].[Id] = [data].[Cluster_AvailabilityGroup_Replica_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_AvailabilityGroup_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_AvailabilityGroup_Name]
, [SightedInstances].[Cluster_AvailabilityGroup_Replica_Name]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_AvailabilityMode] AS [Cluster_AvailabilityGroup_Replica_Info_AvailabilityMode]
, [Leaf].[_ConnectedState] AS [Cluster_AvailabilityGroup_Replica_Info_ConnectedState]
, [Leaf].[_FailoverMode] AS [Cluster_AvailabilityGroup_Replica_Info_FailoverMode]
, [Leaf].[_JoinState] AS [Cluster_AvailabilityGroup_Replica_Info_JoinState]
, [Leaf].[_Role] AS [Cluster_AvailabilityGroup_Replica_Info_Role]
, [Leaf].[_SynchronizationHealth] AS [Cluster_AvailabilityGroup_Replica_Info_SynchronizationHealth]
FROM
 [SightedInstances]
LEFT OUTER JOIN
(
    SELECT [Id], MAX([CollectionDate]) as [GreatestMinDate]
    FROM [data].[Cluster_AvailabilityGroup_Replica_Info_StableSamples]
    WHERE [CollectionDate] <= @MinDate
    GROUP BY [Id]
)
[GreatestMinDates]
 ON [SightedInstances].[Id] = [GreatestMinDates].[Id]
INNER JOIN
 [data].[Cluster_AvailabilityGroup_Replica_Info_StableSamples] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
WHERE [Leaf].[CollectionDate] >= COALESCE([GreatestMinDates].[GreatestMinDate], @MinDate)
AND [Leaf].[CollectionDate] <= @MaxDate
GO
