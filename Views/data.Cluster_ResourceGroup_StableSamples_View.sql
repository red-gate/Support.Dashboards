SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_ResourceGroup_StableSamples_View] AS SELECT[data].[Cluster_ResourceGroup_StableSamples].[Id] AS [Id], [data].[Cluster_ResourceGroup_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_ResourceGroup_StableSamples].[_Description] AS [Cluster_ResourceGroup_Description], [data].[Cluster_ResourceGroup_StableSamples].[_Node] AS [Cluster_ResourceGroup_Node], [data].[Cluster_ResourceGroup_StableSamples].[_State] AS [Cluster_ResourceGroup_State], [data].[Cluster_ResourceGroup_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_ResourceGroup_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_ResourceGroup_Keys].[_Name] AS [Cluster_ResourceGroup_Name] FROM [data].[Cluster_ResourceGroup_StableSamples] INNER JOIN [data].[Cluster_ResourceGroup_Keys] ON [data].[Cluster_ResourceGroup_Keys].[Id] = [data].[Cluster_ResourceGroup_StableSamples].[Id]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_ResourceGroup_Keys].[ParentId]
;
GO
