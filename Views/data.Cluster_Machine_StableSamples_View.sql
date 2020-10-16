SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_Machine_StableSamples_View] AS SELECT[data].[Cluster_Machine_StableSamples].[Id] AS [Id], [data].[Cluster_Machine_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_Machine_StableSamples].[_IsReachable] AS [Cluster_Machine_IsReachable], [data].[Cluster_Machine_StableSamples].[_IsReadyForDataCollection] AS [Cluster_Machine_IsReadyForDataCollection], [data].[Cluster_Machine_StableSamples].[_MonitoredEntityState] AS [Cluster_Machine_MonitoredEntityState], [data].[Cluster_Machine_StableSamples].[_MonitoringStatusCategory] AS [Cluster_Machine_MonitoringStatusCategory], [data].[Cluster_Machine_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_Machine_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_Machine_Keys].[_Name] AS [Cluster_Machine_Name] FROM [data].[Cluster_Machine_StableSamples] INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[Id] = [data].[Cluster_Machine_StableSamples].[Id]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_Machine_Keys].[ParentId]
;
GO
