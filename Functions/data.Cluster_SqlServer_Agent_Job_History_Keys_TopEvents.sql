SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Agent_Job_History_Keys_TopEvents]
(
    @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @EventCount AS BIGINT
)
RETURNS TABLE
AS
RETURN
WITH [TopInstances]([Id], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Agent_Job_Name], [Cluster_SqlServer_Agent_Job_History_Id], [Cluster_SqlServer_Agent_Job_History_RunDate]) AS
(
    SELECT [TopEvents].[Id]
    , [TopEvents].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_Agent_Job_Keys].[_Name] AS [Cluster_SqlServer_Agent_Job_Name]
    , [TopEvents].[_Id] AS [Cluster_SqlServer_Agent_Job_History_Id]
    , [TopEvents].[_RunDate] AS [Cluster_SqlServer_Agent_Job_History_RunDate]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Agent_Job_Keys] ON [data].[Cluster_SqlServer_Agent_Job_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
    CROSS APPLY
        (
            SELECT TOP (@EventCount)
            [data].[Cluster_SqlServer_Agent_Job_History_Keys].[Id]
            , [data].[Cluster_SqlServer_Agent_Job_History_Keys].[CollectionDate]
            , [data].[Cluster_SqlServer_Agent_Job_History_Keys].[_Id]
            , [data].[Cluster_SqlServer_Agent_Job_History_Keys].[_RunDate]
            FROM [data].[Cluster_SqlServer_Agent_Job_History_Keys]
             WHERE [data].[Cluster_SqlServer_Agent_Job_History_Keys].[ParentId] = [data].[Cluster_SqlServer_Agent_Job_Keys].[Id]
             AND [data].[Cluster_SqlServer_Agent_Job_History_Keys].[_RunDate] >= @MinDate
             AND [data].[Cluster_SqlServer_Agent_Job_History_Keys].[_RunDate] <= @MaxDate
            ORDER BY [_RunDate] DESC
        )
        [TopEvents]
)
SELECT
[TopInstances].[Id]
, [TopInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([TopInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [TopInstances].[Cluster_Name]
, [TopInstances].[Cluster_SqlServer_Name]
, [TopInstances].[Cluster_SqlServer_Agent_Job_Name]
, [TopInstances].[Cluster_SqlServer_Agent_Job_History_Id]
, [TopInstances].[Cluster_SqlServer_Agent_Job_History_RunDate]
, [utils].[TicksToDateTime]([TopInstances].[Cluster_SqlServer_Agent_Job_History_RunDate]) AS [Cluster_SqlServer_Agent_Job_History_RunDate_DateTime]
FROM [TopInstances]
GO
