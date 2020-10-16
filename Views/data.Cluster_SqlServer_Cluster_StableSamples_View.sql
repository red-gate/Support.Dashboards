SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_Cluster_StableSamples_View] AS SELECT[data].[Cluster_SqlServer_Cluster_StableSamples].[Id] AS [Id], [data].[Cluster_SqlServer_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_Cluster_StableSamples].[_NodeName] AS [Cluster_SqlServer_Cluster_NodeName], [data].[Cluster_SqlServer_Cluster_StableSamples].[_ResourceGroupName] AS [Cluster_SqlServer_Cluster_ResourceGroupName], [data].[Cluster_SqlServer_Cluster_StableSamples].[_ResourceGroupState] AS [Cluster_SqlServer_Cluster_ResourceGroupState], [data].[Cluster_SqlServer_Cluster_StableSamples].[_State] AS [Cluster_SqlServer_Cluster_State], [data].[Cluster_SqlServer_Cluster_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Cluster_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name] FROM [data].[Cluster_SqlServer_Cluster_StableSamples] INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Cluster_StableSamples].[Id]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
