SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_ResourceGroup_Resource_Keys_DateRange]
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
    FROM [data].[Cluster_ResourceGroup_Resource_Sightings]
    WHERE [data].[Cluster_ResourceGroup_Resource_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_ResourceGroup_Resource_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_ResourceGroup_Name], [Cluster_ResourceGroup_Resource_Name]) AS
(
    SELECT [data].[Cluster_ResourceGroup_Resource_Keys].[Id]
    , [data].[Cluster_ResourceGroup_Resource_Keys].[ParentId]
    , [data].[Cluster_ResourceGroup_Resource_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_ResourceGroup_Keys].[_Name] AS [Cluster_ResourceGroup_Name]
    , [data].[Cluster_ResourceGroup_Resource_Keys].[_Name] AS [Cluster_ResourceGroup_Resource_Name]
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_ResourceGroup_Resource_Keys] ON [data].[Cluster_ResourceGroup_Resource_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_ResourceGroup_Keys] ON [data].[Cluster_ResourceGroup_Keys].[Id] = [data].[Cluster_ResourceGroup_Resource_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_ResourceGroup_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_ResourceGroup_Name]
, [SightedInstances].[Cluster_ResourceGroup_Resource_Name]
FROM
 [SightedInstances]
GO
