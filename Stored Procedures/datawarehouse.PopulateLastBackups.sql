SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [datawarehouse].[PopulateLastBackups]
AS
BEGIN TRANSACTION;

DELETE FROM datawarehouse.LastBackups;

WITH [AllDbs]
AS (SELECT [data].[Cluster_SqlServer_Database_Keys].[Id] AS [DatabaseId],
           [data].[Cluster_Keys].[_Name] AS [ClusterName],
           [data].[Cluster_SqlServer_Keys].[_Name] AS [InstanceName],
           [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [DatabaseName]
    FROM [data].[Cluster_SqlServer_Database_Keys]
        INNER JOIN [data].[Cluster_SqlServer_Keys]
            ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Database_Keys].[ParentId]
        INNER JOIN [data].[Cluster_Keys]
            ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]),
     AllBackupDates
AS (SELECT BTK.ParentId AS DatabaseId,
           BK._StartDate AS StartDate,
           BI._FinishDate AS FinishDate,
           BI._BackupSize AS Size,
           BTK._Type AS BackupType,
           BI._IsNativeBackup AS IsNativeBackup,
           BI._BackupDevice AS BackupDevice,
           ROW_NUMBER() OVER (PARTITION BY [BTK].[ParentId],
                                           [BTK].[_Type]
                              ORDER BY [BI].[_FinishDate] DESC
                             ) AS [RowNum]
    FROM [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances] [BI]
        INNER JOIN [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys] [BK]
            ON [BK].[Id] = [BI].[Id]
        INNER JOIN [data].[Cluster_SqlServer_Database_BackupType_Keys] [BTK]
            ON [BTK].[Id] = [BK].[ParentId])
INSERT INTO datawarehouse.LastBackups
(
    ClusterName,
    InstanceName,
    DatabaseName,
    StartDate,
    FinishDate,
    Size,
    BackupType,
    IsNativeBackup,
    BackupDevice
)
SELECT AllDbs.ClusterName,
       AllDbs.InstanceName,
       AllDbs.DatabaseName,
       AllBackupDates.StartDate,
       AllBackupDates.FinishDate,
       AllBackupDates.Size,
       AllBackupDates.BackupType,
       AllBackupDates.IsNativeBackup,
       AllBackupDates.BackupDevice
FROM AllDbs
    JOIN AllBackupDates
        ON AllDbs.DatabaseId = AllBackupDates.DatabaseId
WHERE AllBackupDates.RowNum = 1;


COMMIT TRANSACTION;
GO
