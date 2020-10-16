SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples_InstanceDateRange]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_AvailabilityGroup_Name AS NVARCHAR(450)
    , @Cluster_AvailabilityGroup_Replica_Name AS NVARCHAR(450)
    , @Cluster_AvailabilityGroup_Replica_Database_Name AS NVARCHAR(450)
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_AvailabilityGroup_Name], [Cluster_AvailabilityGroup_Replica_Name], [Cluster_AvailabilityGroup_Replica_Database_Name]) AS
(
    SELECT [data].[Cluster_AvailabilityGroup_Replica_Database_Keys].[Id]
    , [data].[Cluster_AvailabilityGroup_Replica_Database_Keys].[ParentId]
    , [data].[Cluster_AvailabilityGroup_Replica_Database_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_AvailabilityGroup_Keys].[_Name] AS [Cluster_AvailabilityGroup_Name]
    , [data].[Cluster_AvailabilityGroup_Replica_Keys].[_Name] AS [Cluster_AvailabilityGroup_Replica_Name]
    , [data].[Cluster_AvailabilityGroup_Replica_Database_Keys].[_Name] AS [Cluster_AvailabilityGroup_Replica_Database_Name]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_AvailabilityGroup_Keys] ON [data].[Cluster_AvailabilityGroup_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_AvailabilityGroup_Replica_Keys] ON [data].[Cluster_AvailabilityGroup_Replica_Keys].[ParentId] = [data].[Cluster_AvailabilityGroup_Keys].[Id]
    INNER JOIN [data].[Cluster_AvailabilityGroup_Replica_Database_Keys] ON [data].[Cluster_AvailabilityGroup_Replica_Database_Keys].[ParentId] = [data].[Cluster_AvailabilityGroup_Replica_Keys].[Id]
     WHERE [data].[Cluster_Keys].[_Name] = @Cluster_Name
     AND [data].[Cluster_AvailabilityGroup_Keys].[_Name] = @Cluster_AvailabilityGroup_Name
     AND [data].[Cluster_AvailabilityGroup_Replica_Keys].[_Name] = @Cluster_AvailabilityGroup_Replica_Name
     AND [data].[Cluster_AvailabilityGroup_Replica_Database_Keys].[_Name] = @Cluster_AvailabilityGroup_Replica_Database_Name
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_AvailabilityGroup_Name]
, [SightedInstances].[Cluster_AvailabilityGroup_Replica_Name]
, [SightedInstances].[Cluster_AvailabilityGroup_Replica_Database_Name]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_DatabaseState] AS [Cluster_AvailabilityGroup_Replica_Database_Status_DatabaseState]
, [Leaf].[_DatabaseSynchronizationState] AS [Cluster_AvailabilityGroup_Replica_Database_Status_DatabaseSynchronizationState]
, [Leaf].[_IsDatabaseJoined] AS [Cluster_AvailabilityGroup_Replica_Database_Status_IsDatabaseJoined]
, [Leaf].[_IsFailoverReady] AS [Cluster_AvailabilityGroup_Replica_Database_Status_IsFailoverReady]
FROM
 [SightedInstances]
LEFT OUTER JOIN
(
    SELECT [Id], MAX([CollectionDate]) as [GreatestMinDate]
    FROM [data].[Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples]
    WHERE [CollectionDate] <= @MinDate
    GROUP BY [Id]
)
[GreatestMinDates]
 ON [SightedInstances].[Id] = [GreatestMinDates].[Id]
INNER JOIN
 [data].[Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
WHERE [Leaf].[CollectionDate] >= COALESCE([GreatestMinDates].[GreatestMinDate], @MinDate)
AND [Leaf].[CollectionDate] <= @MaxDate
GO
