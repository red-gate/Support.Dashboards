SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_StableSamples_View] AS SELECT[data].[Cluster_StableSamples].[Id] AS [Id], [data].[Cluster_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_StableSamples].[_IsReachable] AS [Cluster_IsReachable], [data].[Cluster_StableSamples].[_IsReadyForDataCollection] AS [Cluster_IsReadyForDataCollection], [data].[Cluster_StableSamples].[_MonitoredEntityState] AS [Cluster_MonitoredEntityState], [data].[Cluster_StableSamples].[_MonitoringStatusCategory] AS [Cluster_MonitoringStatusCategory], [data].[Cluster_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name] FROM [data].[Cluster_StableSamples] INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_StableSamples].[Id]
;
GO
