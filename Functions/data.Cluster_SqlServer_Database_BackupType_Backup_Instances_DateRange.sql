SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances_DateRange]
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
    FROM [data].[Cluster_SqlServer_Database_BackupType_Backup_Sightings]
    WHERE [data].[Cluster_SqlServer_Database_BackupType_Backup_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_SqlServer_Database_BackupType_Backup_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Database_Name], [Cluster_SqlServer_Database_BackupType_Type], [Cluster_SqlServer_Database_BackupType_Backup_StartDate]) AS
(
    SELECT [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[Id]
    , [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[ParentId]
    , [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [Cluster_SqlServer_Database_Name]
    , [data].[Cluster_SqlServer_Database_BackupType_Keys].[_Type] AS [Cluster_SqlServer_Database_BackupType_Type]
    , [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[_StartDate] AS [Cluster_SqlServer_Database_BackupType_Backup_StartDate]
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys] ON [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_SqlServer_Database_BackupType_Keys] ON [data].[Cluster_SqlServer_Database_BackupType_Keys].[Id] = [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[ParentId]
     INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[Id] = [data].[Cluster_SqlServer_Database_BackupType_Keys].[ParentId]
     INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Database_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [SightedInstances].[Cluster_SqlServer_Database_Name]
, [SightedInstances].[Cluster_SqlServer_Database_BackupType_Type]
, [SightedInstances].[Cluster_SqlServer_Database_BackupType_Backup_StartDate]
, [utils].[TicksToDateTime]([SightedInstances].[Cluster_SqlServer_Database_BackupType_Backup_StartDate]) AS [Cluster_SqlServer_Database_BackupType_Backup_StartDate_DateTime]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_BackupDevice] AS [Cluster_SqlServer_Database_BackupType_Backup_BackupDevice]
, [Leaf].[_BackupSize] AS [Cluster_SqlServer_Database_BackupType_Backup_BackupSize]
, [Leaf].[_DeviceName] AS [Cluster_SqlServer_Database_BackupType_Backup_DeviceName]
, [Leaf].[_FinishDate] AS [Cluster_SqlServer_Database_BackupType_Backup_FinishDate]
, [utils].[TicksToDateTime]([Leaf].[_FinishDate]) AS [Cluster_SqlServer_Database_BackupType_Backup_FinishDate_DateTime]
, [Leaf].[_IsCompressed] AS [Cluster_SqlServer_Database_BackupType_Backup_IsCompressed]
, [Leaf].[_IsCopyOnly] AS [Cluster_SqlServer_Database_BackupType_Backup_IsCopyOnly]
, [Leaf].[_IsEncrypted] AS [Cluster_SqlServer_Database_BackupType_Backup_IsEncrypted]
, [Leaf].[_IsNativeBackup] AS [Cluster_SqlServer_Database_BackupType_Backup_IsNativeBackup]
, [Leaf].[_IsPasswordProtected] AS [Cluster_SqlServer_Database_BackupType_Backup_IsPasswordProtected]
FROM
 [SightedInstances]
INNER JOIN
 [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
GO
