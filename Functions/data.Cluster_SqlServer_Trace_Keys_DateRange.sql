SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Trace_Keys_DateRange]
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
    FROM [data].[Cluster_SqlServer_Trace_Sightings]
    WHERE [data].[Cluster_SqlServer_Trace_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_SqlServer_Trace_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Trace_SequenceNumber], [Cluster_SqlServer_Trace_StartTime]) AS
(
    SELECT [data].[Cluster_SqlServer_Trace_Keys].[Id]
    , [data].[Cluster_SqlServer_Trace_Keys].[ParentId]
    , [data].[Cluster_SqlServer_Trace_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_Trace_Keys].[_SequenceNumber] AS [Cluster_SqlServer_Trace_SequenceNumber]
    , [data].[Cluster_SqlServer_Trace_Keys].[_StartTime] AS [Cluster_SqlServer_Trace_StartTime]
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_SqlServer_Trace_Keys] ON [data].[Cluster_SqlServer_Trace_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Trace_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [SightedInstances].[Cluster_SqlServer_Trace_SequenceNumber]
, [SightedInstances].[Cluster_SqlServer_Trace_StartTime]
, [utils].[TicksToDateTime]([SightedInstances].[Cluster_SqlServer_Trace_StartTime]) AS [Cluster_SqlServer_Trace_StartTime_DateTime]
FROM
 [SightedInstances]
GO
