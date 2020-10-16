SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Error_Keys_TopEvents]
(
    @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @EventCount AS BIGINT
)
RETURNS TABLE
AS
RETURN
WITH [TopInstances]([Id], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Error_LogDate], [Cluster_SqlServer_Error_SequenceNumber]) AS
(
    SELECT [TopEvents].[Id]
    , [TopEvents].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [TopEvents].[_LogDate] AS [Cluster_SqlServer_Error_LogDate]
    , [TopEvents].[_SequenceNumber] AS [Cluster_SqlServer_Error_SequenceNumber]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    CROSS APPLY
        (
            SELECT TOP (@EventCount)
            [data].[Cluster_SqlServer_Error_Keys].[Id]
            , [data].[Cluster_SqlServer_Error_Keys].[CollectionDate]
            , [data].[Cluster_SqlServer_Error_Keys].[_LogDate]
            , [data].[Cluster_SqlServer_Error_Keys].[_SequenceNumber]
            FROM [data].[Cluster_SqlServer_Error_Keys]
             WHERE [data].[Cluster_SqlServer_Error_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
             AND [data].[Cluster_SqlServer_Error_Keys].[_LogDate] >= @MinDate
             AND [data].[Cluster_SqlServer_Error_Keys].[_LogDate] <= @MaxDate
            ORDER BY [_LogDate] DESC
        )
        [TopEvents]
)
SELECT
[TopInstances].[Id]
, [TopInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([TopInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [TopInstances].[Cluster_Name]
, [TopInstances].[Cluster_SqlServer_Name]
, [TopInstances].[Cluster_SqlServer_Error_LogDate]
, [utils].[TicksToDateTime]([TopInstances].[Cluster_SqlServer_Error_LogDate]) AS [Cluster_SqlServer_Error_LogDate_DateTime]
, [TopInstances].[Cluster_SqlServer_Error_SequenceNumber]
FROM [TopInstances]
GO
