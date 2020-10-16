SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [datawarehouse].[PopulateAllRPOs]
AS
BEGIN TRANSACTION;

DELETE FROM [datawarehouse].[AllRPOs];

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
     [AllBackupDates]
AS (SELECT DISTINCT
           [BTK].[ParentId] AS [DatabaseId],
           [BI].[_FinishDate] AS [FinishDate]
    FROM [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances] [BI]
        INNER JOIN [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys] [BK]
            ON [BK].[Id] = [BI].[Id]
        INNER JOIN [data].[Cluster_SqlServer_Database_BackupType_Keys] [BTK]
            ON [BTK].[Id] = [BK].[ParentId]),
     [RPOs]
AS (SELECT [DatabaseId],
           [RpoFrom],
           [RpoTo],
           CASE
               WHEN [RpoFrom] IS NULL THEN
                   NULL
               ELSE
                   [RpoTo] - [RpoFrom]
           END [Duration]
    FROM
    (
        SELECT [DatabaseId],
               [FinishDate] AS [RpoTo],
               LAG([FinishDate], 1) OVER (PARTITION BY [DatabaseId] ORDER BY [FinishDate]) AS [RpoFrom]
        FROM [AllBackupDates]
    ) [ConsecutiveBackups] )
INSERT INTO [datawarehouse].[AllRPOs]
(
    [ClusterName],
    [InstanceName],
    [DatabaseName],
    [BackupFinishDate],
    [DurationTicks]
)
SELECT [adb].[ClusterName],
       [adb].[InstanceName],
       [adb].[DatabaseName],
       [RPOs].[RpoTo] AS [To],
       [RPOs].[Duration]
FROM [RPOs]
    INNER JOIN [AllDbs] [adb]
        ON [RPOs].[DatabaseId] = [adb].[DatabaseId]
OPTION (MAXDOP 1);


COMMIT TRANSACTION;
GO
