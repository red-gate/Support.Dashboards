SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Agent_Job_History_Instances_TopEvents]
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
, [data].[Cluster_SqlServer_Agent_Job_History_Instances].[CollectionDate]
, [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Agent_Job_History_Instances].[CollectionDate]) AS [CollectionDate_DateTime]
, [data].[Cluster_SqlServer_Agent_Job_History_Instances].[_Message] AS [Cluster_SqlServer_Agent_Job_History_Message]
, [data].[Cluster_SqlServer_Agent_Job_History_Instances].[_RunDuration] AS [Cluster_SqlServer_Agent_Job_History_RunDuration]
, [data].[Cluster_SqlServer_Agent_Job_History_Instances].[_RunStatus] AS [Cluster_SqlServer_Agent_Job_History_RunStatus]
, [data].[Cluster_SqlServer_Agent_Job_History_Instances].[_SqlMessageId] AS [Cluster_SqlServer_Agent_Job_History_SqlMessageId]
, [data].[Cluster_SqlServer_Agent_Job_History_Instances].[_SqlSeverity] AS [Cluster_SqlServer_Agent_Job_History_SqlSeverity]
, [data].[Cluster_SqlServer_Agent_Job_History_Instances].[_StepID] AS [Cluster_SqlServer_Agent_Job_History_StepID]
, [data].[Cluster_SqlServer_Agent_Job_History_Instances].[_StepMessage] AS [Cluster_SqlServer_Agent_Job_History_StepMessage]
, [data].[Cluster_SqlServer_Agent_Job_History_Instances].[_StepName] AS [Cluster_SqlServer_Agent_Job_History_StepName]
FROM [TopInstances]
INNER JOIN [data].[Cluster_SqlServer_Agent_Job_History_Instances]
 ON [TopInstances].[Id] = [data].[Cluster_SqlServer_Agent_Job_History_Instances].[Id]
GO
