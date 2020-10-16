SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_AvailabilityGroup_Listener_Keys_DateRange]
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
    FROM [data].[Cluster_AvailabilityGroup_Listener_Sightings]
    WHERE [data].[Cluster_AvailabilityGroup_Listener_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_AvailabilityGroup_Listener_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_AvailabilityGroup_Name], [Cluster_AvailabilityGroup_Listener_ListenerDnsName]) AS
(
    SELECT [data].[Cluster_AvailabilityGroup_Listener_Keys].[Id]
    , [data].[Cluster_AvailabilityGroup_Listener_Keys].[ParentId]
    , [data].[Cluster_AvailabilityGroup_Listener_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_AvailabilityGroup_Keys].[_Name] AS [Cluster_AvailabilityGroup_Name]
    , [data].[Cluster_AvailabilityGroup_Listener_Keys].[_ListenerDnsName] AS [Cluster_AvailabilityGroup_Listener_ListenerDnsName]
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_AvailabilityGroup_Listener_Keys] ON [data].[Cluster_AvailabilityGroup_Listener_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_AvailabilityGroup_Keys] ON [data].[Cluster_AvailabilityGroup_Keys].[Id] = [data].[Cluster_AvailabilityGroup_Listener_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_AvailabilityGroup_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_AvailabilityGroup_Name]
, [SightedInstances].[Cluster_AvailabilityGroup_Listener_ListenerDnsName]
FROM
 [SightedInstances]
GO
