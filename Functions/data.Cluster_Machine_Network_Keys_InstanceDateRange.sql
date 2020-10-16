SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_Machine_Network_Keys_InstanceDateRange]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_Machine_Name AS NVARCHAR(450)
    , @Cluster_Machine_Network_Name AS NVARCHAR(450)
    , @Cluster_Machine_Network_SequenceNumber AS BIGINT
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_Machine_Name], [Cluster_Machine_Network_Name], [Cluster_Machine_Network_SequenceNumber]) AS
(
    SELECT [data].[Cluster_Machine_Network_Keys].[Id]
    , [data].[Cluster_Machine_Network_Keys].[ParentId]
    , [data].[Cluster_Machine_Network_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_Machine_Keys].[_Name] AS [Cluster_Machine_Name]
    , [data].[Cluster_Machine_Network_Keys].[_Name] AS [Cluster_Machine_Network_Name]
    , [data].[Cluster_Machine_Network_Keys].[_SequenceNumber] AS [Cluster_Machine_Network_SequenceNumber]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_Machine_Network_Keys] ON [data].[Cluster_Machine_Network_Keys].[ParentId] = [data].[Cluster_Machine_Keys].[Id]
     WHERE [data].[Cluster_Keys].[_Name] = @Cluster_Name
     AND [data].[Cluster_Machine_Keys].[_Name] = @Cluster_Machine_Name
     AND [data].[Cluster_Machine_Network_Keys].[_Name] = @Cluster_Machine_Network_Name
     AND [data].[Cluster_Machine_Network_Keys].[_SequenceNumber] = @Cluster_Machine_Network_SequenceNumber
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_Machine_Name]
, [SightedInstances].[Cluster_Machine_Network_Name]
, [SightedInstances].[Cluster_Machine_Network_SequenceNumber]
FROM
 [SightedInstances]
GO
