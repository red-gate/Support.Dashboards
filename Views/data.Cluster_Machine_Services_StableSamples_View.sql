SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_Machine_Services_StableSamples_View] AS SELECT[data].[Cluster_Machine_Services_StableSamples].[Id] AS [Id], [data].[Cluster_Machine_Services_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_Machine_Services_StableSamples].[_ServiceState] AS [Cluster_Machine_Services_ServiceState], [data].[Cluster_Machine_Services_StableSamples].[_Startup] AS [Cluster_Machine_Services_Startup], [data].[Cluster_Machine_Services_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_Machine_Services_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_Machine_Keys].[_Name] AS [Cluster_Machine_Name], [data].[Cluster_Machine_Services_Keys].[_ServiceName] AS [Cluster_Machine_Services_ServiceName] FROM [data].[Cluster_Machine_Services_StableSamples] INNER JOIN [data].[Cluster_Machine_Services_Keys] ON [data].[Cluster_Machine_Services_Keys].[Id] = [data].[Cluster_Machine_Services_StableSamples].[Id]
 INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[Id] = [data].[Cluster_Machine_Services_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_Machine_Keys].[ParentId]
;
GO
