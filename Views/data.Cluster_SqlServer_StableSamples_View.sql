SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_StableSamples_View] AS SELECT[data].[Cluster_SqlServer_StableSamples].[Id] AS [Id], [data].[Cluster_SqlServer_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_StableSamples].[_IsReachable] AS [Cluster_SqlServer_IsReachable], [data].[Cluster_SqlServer_StableSamples].[_IsReadyForDataCollection] AS [Cluster_SqlServer_IsReadyForDataCollection], [data].[Cluster_SqlServer_StableSamples].[_MonitoredEntityState] AS [Cluster_SqlServer_MonitoredEntityState], [data].[Cluster_SqlServer_StableSamples].[_MonitoringStatusCategory] AS [Cluster_SqlServer_MonitoringStatusCategory], [data].[Cluster_SqlServer_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name] FROM [data].[Cluster_SqlServer_StableSamples] INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_StableSamples].[Id]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
