SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_Process_StableSamples_View] AS SELECT[data].[Cluster_SqlServer_Process_StableSamples].[Id] AS [Id], [data].[Cluster_SqlServer_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_Process_StableSamples].[_Id] AS [Cluster_SqlServer_Process_Id], [data].[Cluster_SqlServer_Process_StableSamples].[_Name] AS [Cluster_SqlServer_Process_Name], [data].[Cluster_SqlServer_Process_StableSamples].[_StartDate] AS [Cluster_SqlServer_Process_StartDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Process_StableSamples].[_StartDate]) AS [Cluster_SqlServer_Process_StartDate_DateTime], [data].[Cluster_SqlServer_Process_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Process_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name] FROM [data].[Cluster_SqlServer_Process_StableSamples] INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Process_StableSamples].[Id]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
