SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_BufferManager_UnstableSamples_View] AS SELECT[data].[Cluster_SqlServer_BufferManager_UnstableSamples].[Id] AS [Id], [data].[Cluster_SqlServer_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_BufferManager_UnstableSamples].[_BufferCacheHitRatio] AS [Cluster_SqlServer_BufferManager_BufferCacheHitRatio], [data].[Cluster_SqlServer_BufferManager_UnstableSamples].[_PageLifeExpectancy] AS [Cluster_SqlServer_BufferManager_PageLifeExpectancy], [data].[Cluster_SqlServer_BufferManager_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_BufferManager_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name] FROM [data].[Cluster_SqlServer_BufferManager_UnstableSamples] INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_BufferManager_UnstableSamples].[Id]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
