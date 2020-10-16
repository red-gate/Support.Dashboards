SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Agent_Job_History_Instances_InstanceDateRange]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Agent_Job_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Agent_Job_History_Id AS BIGINT
    , @Cluster_SqlServer_Agent_Job_History_RunDate AS BIGINT
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Agent_Job_Name], [Cluster_SqlServer_Agent_Job_History_Id], [Cluster_SqlServer_Agent_Job_History_RunDate]) AS
(
    SELECT [data].[Cluster_SqlServer_Agent_Job_History_Keys].[Id]
    , [data].[Cluster_SqlServer_Agent_Job_History_Keys].[ParentId]
    , [data].[Cluster_SqlServer_Agent_Job_History_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_Agent_Job_Keys].[_Name] AS [Cluster_SqlServer_Agent_Job_Name]
    , [data].[Cluster_SqlServer_Agent_Job_History_Keys].[_Id] AS [Cluster_SqlServer_Agent_Job_History_Id]
    , [data].[Cluster_SqlServer_Agent_Job_History_Keys].[_RunDate] AS [Cluster_SqlServer_Agent_Job_History_RunDate]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Agent_Job_Keys] ON [data].[Cluster_SqlServer_Agent_Job_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Agent_Job_History_Keys] ON [data].[Cluster_SqlServer_Agent_Job_History_Keys].[ParentId] = [data].[Cluster_SqlServer_Agent_Job_Keys].[Id]
     WHERE [data].[Cluster_Keys].[_Name] = @Cluster_Name
     AND [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name
     AND [data].[Cluster_SqlServer_Agent_Job_Keys].[_Name] = @Cluster_SqlServer_Agent_Job_Name
     AND [data].[Cluster_SqlServer_Agent_Job_History_Keys].[_Id] = @Cluster_SqlServer_Agent_Job_History_Id
     AND [data].[Cluster_SqlServer_Agent_Job_History_Keys].[_RunDate] = @Cluster_SqlServer_Agent_Job_History_RunDate
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [SightedInstances].[Cluster_SqlServer_Agent_Job_Name]
, [SightedInstances].[Cluster_SqlServer_Agent_Job_History_Id]
, [SightedInstances].[Cluster_SqlServer_Agent_Job_History_RunDate]
, [utils].[TicksToDateTime]([SightedInstances].[Cluster_SqlServer_Agent_Job_History_RunDate]) AS [Cluster_SqlServer_Agent_Job_History_RunDate_DateTime]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_Message] AS [Cluster_SqlServer_Agent_Job_History_Message]
, [Leaf].[_RunDuration] AS [Cluster_SqlServer_Agent_Job_History_RunDuration]
, [Leaf].[_RunStatus] AS [Cluster_SqlServer_Agent_Job_History_RunStatus]
, [Leaf].[_SqlMessageId] AS [Cluster_SqlServer_Agent_Job_History_SqlMessageId]
, [Leaf].[_SqlSeverity] AS [Cluster_SqlServer_Agent_Job_History_SqlSeverity]
, [Leaf].[_StepID] AS [Cluster_SqlServer_Agent_Job_History_StepID]
, [Leaf].[_StepMessage] AS [Cluster_SqlServer_Agent_Job_History_StepMessage]
, [Leaf].[_StepName] AS [Cluster_SqlServer_Agent_Job_History_StepName]
FROM
 [SightedInstances]
INNER JOIN
 [data].[Cluster_SqlServer_Agent_Job_History_Instances] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
GO
