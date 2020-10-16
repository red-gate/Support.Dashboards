SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_Database_Storage_UnstableSamples_View] AS SELECT[data].[Cluster_SqlServer_Database_Storage_UnstableSamples].[Id] AS [Id], [data].[Cluster_SqlServer_Database_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_Database_Storage_UnstableSamples].[_TotalDataUsedBytes] AS [Cluster_SqlServer_Database_Storage_TotalDataUsedBytes], [data].[Cluster_SqlServer_Database_Storage_UnstableSamples].[_TotalLogUsedBytes] AS [Cluster_SqlServer_Database_Storage_TotalLogUsedBytes], [data].[Cluster_SqlServer_Database_Storage_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Database_Storage_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [Cluster_SqlServer_Database_Name] FROM [data].[Cluster_SqlServer_Database_Storage_UnstableSamples] INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[Id] = [data].[Cluster_SqlServer_Database_Storage_UnstableSamples].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Database_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
