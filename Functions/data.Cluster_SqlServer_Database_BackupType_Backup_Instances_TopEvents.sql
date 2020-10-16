SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances_TopEvents]
(
    @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @EventCount AS BIGINT
)
RETURNS TABLE
AS
RETURN
WITH [TopInstances]([Id], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Database_Name], [Cluster_SqlServer_Database_BackupType_Type], [Cluster_SqlServer_Database_BackupType_Backup_StartDate]) AS
(
    SELECT [TopEvents].[Id]
    , [TopEvents].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [Cluster_SqlServer_Database_Name]
    , [data].[Cluster_SqlServer_Database_BackupType_Keys].[_Type] AS [Cluster_SqlServer_Database_BackupType_Type]
    , [TopEvents].[_StartDate] AS [Cluster_SqlServer_Database_BackupType_Backup_StartDate]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Database_BackupType_Keys] ON [data].[Cluster_SqlServer_Database_BackupType_Keys].[ParentId] = [data].[Cluster_SqlServer_Database_Keys].[Id]
    CROSS APPLY
        (
            SELECT TOP (@EventCount)
            [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[Id]
            , [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[CollectionDate]
            , [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[_StartDate]
            FROM [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys]
             WHERE [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[ParentId] = [data].[Cluster_SqlServer_Database_BackupType_Keys].[Id]
             AND [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[_StartDate] >= @MinDate
             AND [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[_StartDate] <= @MaxDate
            ORDER BY [_StartDate] DESC
        )
        [TopEvents]
)
SELECT
[TopInstances].[Id]
, [TopInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([TopInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [TopInstances].[Cluster_Name]
, [TopInstances].[Cluster_SqlServer_Name]
, [TopInstances].[Cluster_SqlServer_Database_Name]
, [TopInstances].[Cluster_SqlServer_Database_BackupType_Type]
, [TopInstances].[Cluster_SqlServer_Database_BackupType_Backup_StartDate]
, [utils].[TicksToDateTime]([TopInstances].[Cluster_SqlServer_Database_BackupType_Backup_StartDate]) AS [Cluster_SqlServer_Database_BackupType_Backup_StartDate_DateTime]
, [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[CollectionDate]
, [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[CollectionDate]) AS [CollectionDate_DateTime]
, [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[_BackupDevice] AS [Cluster_SqlServer_Database_BackupType_Backup_BackupDevice]
, [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[_BackupSize] AS [Cluster_SqlServer_Database_BackupType_Backup_BackupSize]
, [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[_DeviceName] AS [Cluster_SqlServer_Database_BackupType_Backup_DeviceName]
, [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[_FinishDate] AS [Cluster_SqlServer_Database_BackupType_Backup_FinishDate]
, [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[_FinishDate]) AS [Cluster_SqlServer_Database_BackupType_Backup_FinishDate_DateTime]
, [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[_IsCompressed] AS [Cluster_SqlServer_Database_BackupType_Backup_IsCompressed]
, [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[_IsCopyOnly] AS [Cluster_SqlServer_Database_BackupType_Backup_IsCopyOnly]
, [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[_IsEncrypted] AS [Cluster_SqlServer_Database_BackupType_Backup_IsEncrypted]
, [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[_IsNativeBackup] AS [Cluster_SqlServer_Database_BackupType_Backup_IsNativeBackup]
, [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[_IsPasswordProtected] AS [Cluster_SqlServer_Database_BackupType_Backup_IsPasswordProtected]
FROM [TopInstances]
INNER JOIN [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances]
 ON [TopInstances].[Id] = [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances].[Id]
GO
