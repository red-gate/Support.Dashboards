SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Error_Instances_DateRange]
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
    FROM [data].[Cluster_SqlServer_Error_Sightings]
    WHERE [data].[Cluster_SqlServer_Error_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_SqlServer_Error_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Error_LogDate], [Cluster_SqlServer_Error_SequenceNumber]) AS
(
    SELECT [data].[Cluster_SqlServer_Error_Keys].[Id]
    , [data].[Cluster_SqlServer_Error_Keys].[ParentId]
    , [data].[Cluster_SqlServer_Error_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_Error_Keys].[_LogDate] AS [Cluster_SqlServer_Error_LogDate]
    , [data].[Cluster_SqlServer_Error_Keys].[_SequenceNumber] AS [Cluster_SqlServer_Error_SequenceNumber]
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_SqlServer_Error_Keys] ON [data].[Cluster_SqlServer_Error_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Error_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [SightedInstances].[Cluster_SqlServer_Error_LogDate]
, [utils].[TicksToDateTime]([SightedInstances].[Cluster_SqlServer_Error_LogDate]) AS [Cluster_SqlServer_Error_LogDate_DateTime]
, [SightedInstances].[Cluster_SqlServer_Error_SequenceNumber]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_ProcessInfo] AS [Cluster_SqlServer_Error_ProcessInfo]
, [Leaf].[_Text] AS [Cluster_SqlServer_Error_Text]
FROM
 [SightedInstances]
INNER JOIN
 [data].[Cluster_SqlServer_Error_Instances] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
GO
