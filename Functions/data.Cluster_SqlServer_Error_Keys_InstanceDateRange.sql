SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Error_Keys_InstanceDateRange]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Error_LogDate AS BIGINT
    , @Cluster_SqlServer_Error_SequenceNumber AS BIGINT
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Error_LogDate], [Cluster_SqlServer_Error_SequenceNumber]) AS
(
    SELECT [data].[Cluster_SqlServer_Error_Keys].[Id]
    , [data].[Cluster_SqlServer_Error_Keys].[ParentId]
    , [data].[Cluster_SqlServer_Error_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_Error_Keys].[_LogDate] AS [Cluster_SqlServer_Error_LogDate]
    , [data].[Cluster_SqlServer_Error_Keys].[_SequenceNumber] AS [Cluster_SqlServer_Error_SequenceNumber]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Error_Keys] ON [data].[Cluster_SqlServer_Error_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
     WHERE [data].[Cluster_Keys].[_Name] = @Cluster_Name
     AND [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name
     AND [data].[Cluster_SqlServer_Error_Keys].[_LogDate] = @Cluster_SqlServer_Error_LogDate
     AND [data].[Cluster_SqlServer_Error_Keys].[_SequenceNumber] = @Cluster_SqlServer_Error_SequenceNumber
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
FROM
 [SightedInstances]
GO
