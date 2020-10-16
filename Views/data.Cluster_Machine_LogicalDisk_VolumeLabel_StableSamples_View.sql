SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_Machine_LogicalDisk_VolumeLabel_StableSamples_View] AS SELECT[data].[Cluster_Machine_LogicalDisk_VolumeLabel_StableSamples].[Id] AS [Id], [data].[Cluster_Machine_LogicalDisk_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_Machine_LogicalDisk_VolumeLabel_StableSamples].[_VolumeLabel] AS [Cluster_Machine_LogicalDisk_VolumeLabel_VolumeLabel], [data].[Cluster_Machine_LogicalDisk_VolumeLabel_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_Machine_LogicalDisk_VolumeLabel_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_Machine_Keys].[_Name] AS [Cluster_Machine_Name], [data].[Cluster_Machine_LogicalDisk_Keys].[_Name] AS [Cluster_Machine_LogicalDisk_Name] FROM [data].[Cluster_Machine_LogicalDisk_VolumeLabel_StableSamples] INNER JOIN [data].[Cluster_Machine_LogicalDisk_Keys] ON [data].[Cluster_Machine_LogicalDisk_Keys].[Id] = [data].[Cluster_Machine_LogicalDisk_VolumeLabel_StableSamples].[Id]
 INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[Id] = [data].[Cluster_Machine_LogicalDisk_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_Machine_Keys].[ParentId]
;
GO
