SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys_TopEvents]
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
FROM [TopInstances]
GO
