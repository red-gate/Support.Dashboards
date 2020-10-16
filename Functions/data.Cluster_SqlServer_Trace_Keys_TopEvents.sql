SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Trace_Keys_TopEvents]
(
    @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @EventCount AS BIGINT
)
RETURNS TABLE
AS
RETURN
WITH [TopInstances]([Id], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Trace_SequenceNumber], [Cluster_SqlServer_Trace_StartTime]) AS
(
    SELECT [TopEvents].[Id]
    , [TopEvents].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [TopEvents].[_SequenceNumber] AS [Cluster_SqlServer_Trace_SequenceNumber]
    , [TopEvents].[_StartTime] AS [Cluster_SqlServer_Trace_StartTime]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    CROSS APPLY
        (
            SELECT TOP (@EventCount)
            [data].[Cluster_SqlServer_Trace_Keys].[Id]
            , [data].[Cluster_SqlServer_Trace_Keys].[CollectionDate]
            , [data].[Cluster_SqlServer_Trace_Keys].[_SequenceNumber]
            , [data].[Cluster_SqlServer_Trace_Keys].[_StartTime]
            FROM [data].[Cluster_SqlServer_Trace_Keys]
             WHERE [data].[Cluster_SqlServer_Trace_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
             AND [data].[Cluster_SqlServer_Trace_Keys].[_StartTime] >= @MinDate
             AND [data].[Cluster_SqlServer_Trace_Keys].[_StartTime] <= @MaxDate
            ORDER BY [_StartTime] DESC
        )
        [TopEvents]
)
SELECT
[TopInstances].[Id]
, [TopInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([TopInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [TopInstances].[Cluster_Name]
, [TopInstances].[Cluster_SqlServer_Name]
, [TopInstances].[Cluster_SqlServer_Trace_SequenceNumber]
, [TopInstances].[Cluster_SqlServer_Trace_StartTime]
, [utils].[TicksToDateTime]([TopInstances].[Cluster_SqlServer_Trace_StartTime]) AS [Cluster_SqlServer_Trace_StartTime_DateTime]
FROM [TopInstances]
GO
