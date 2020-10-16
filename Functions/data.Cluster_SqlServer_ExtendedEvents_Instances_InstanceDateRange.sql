SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_ExtendedEvents_Instances_InstanceDateRange]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_ExtendedEvents_EventName AS NVARCHAR(450)
    , @Cluster_SqlServer_ExtendedEvents_Sequence AS BIGINT
    , @Cluster_SqlServer_ExtendedEvents_TimeStamp AS BIGINT
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_ExtendedEvents_EventName], [Cluster_SqlServer_ExtendedEvents_Sequence], [Cluster_SqlServer_ExtendedEvents_TimeStamp]) AS
(
    SELECT [data].[Cluster_SqlServer_ExtendedEvents_Keys].[Id]
    , [data].[Cluster_SqlServer_ExtendedEvents_Keys].[ParentId]
    , [data].[Cluster_SqlServer_ExtendedEvents_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_ExtendedEvents_Keys].[_EventName] AS [Cluster_SqlServer_ExtendedEvents_EventName]
    , [data].[Cluster_SqlServer_ExtendedEvents_Keys].[_Sequence] AS [Cluster_SqlServer_ExtendedEvents_Sequence]
    , [data].[Cluster_SqlServer_ExtendedEvents_Keys].[_TimeStamp] AS [Cluster_SqlServer_ExtendedEvents_TimeStamp]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_ExtendedEvents_Keys] ON [data].[Cluster_SqlServer_ExtendedEvents_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
     WHERE [data].[Cluster_Keys].[_Name] = @Cluster_Name
     AND [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name
     AND [data].[Cluster_SqlServer_ExtendedEvents_Keys].[_EventName] = @Cluster_SqlServer_ExtendedEvents_EventName
     AND [data].[Cluster_SqlServer_ExtendedEvents_Keys].[_Sequence] = @Cluster_SqlServer_ExtendedEvents_Sequence
     AND [data].[Cluster_SqlServer_ExtendedEvents_Keys].[_TimeStamp] = @Cluster_SqlServer_ExtendedEvents_TimeStamp
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [SightedInstances].[Cluster_SqlServer_ExtendedEvents_EventName]
, [SightedInstances].[Cluster_SqlServer_ExtendedEvents_Sequence]
, [SightedInstances].[Cluster_SqlServer_ExtendedEvents_TimeStamp]
, [utils].[TicksToDateTime]([SightedInstances].[Cluster_SqlServer_ExtendedEvents_TimeStamp]) AS [Cluster_SqlServer_ExtendedEvents_TimeStamp_DateTime]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_EventData] AS [Cluster_SqlServer_ExtendedEvents_EventData]
, [Leaf].[_FileName] AS [Cluster_SqlServer_ExtendedEvents_FileName]
, [Leaf].[_FileOffset] AS [Cluster_SqlServer_ExtendedEvents_FileOffset]
FROM
 [SightedInstances]
INNER JOIN
 [data].[Cluster_SqlServer_ExtendedEvents_Instances] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
GO
