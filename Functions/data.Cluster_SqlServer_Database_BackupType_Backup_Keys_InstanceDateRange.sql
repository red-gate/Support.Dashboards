SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys_InstanceDateRange]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_BackupType_Type AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_BackupType_Backup_StartDate AS BIGINT
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Database_Name], [Cluster_SqlServer_Database_BackupType_Type], [Cluster_SqlServer_Database_BackupType_Backup_StartDate]) AS
(
    SELECT [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[Id]
    , [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[ParentId]
    , [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [Cluster_SqlServer_Database_Name]
    , [data].[Cluster_SqlServer_Database_BackupType_Keys].[_Type] AS [Cluster_SqlServer_Database_BackupType_Type]
    , [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[_StartDate] AS [Cluster_SqlServer_Database_BackupType_Backup_StartDate]
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Database_BackupType_Keys] ON [data].[Cluster_SqlServer_Database_BackupType_Keys].[ParentId] = [data].[Cluster_SqlServer_Database_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys] ON [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[ParentId] = [data].[Cluster_SqlServer_Database_BackupType_Keys].[Id]
     WHERE [data].[Cluster_Keys].[_Name] = @Cluster_Name
     AND [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name
     AND [data].[Cluster_SqlServer_Database_Keys].[_Name] = @Cluster_SqlServer_Database_Name
     AND [data].[Cluster_SqlServer_Database_BackupType_Keys].[_Type] = @Cluster_SqlServer_Database_BackupType_Type
     AND [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys].[_StartDate] = @Cluster_SqlServer_Database_BackupType_Backup_StartDate
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
FROM
 [SightedInstances]
GO
