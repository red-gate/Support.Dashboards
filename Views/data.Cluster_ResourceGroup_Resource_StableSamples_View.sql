SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_ResourceGroup_Resource_StableSamples_View] AS SELECT[data].[Cluster_ResourceGroup_Resource_StableSamples].[Id] AS [Id], [data].[Cluster_ResourceGroup_Resource_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_ResourceGroup_Resource_StableSamples].[_Description] AS [Cluster_ResourceGroup_Resource_Description], [data].[Cluster_ResourceGroup_Resource_StableSamples].[_State] AS [Cluster_ResourceGroup_Resource_State], [data].[Cluster_ResourceGroup_Resource_StableSamples].[_Type] AS [Cluster_ResourceGroup_Resource_Type], [data].[Cluster_ResourceGroup_Resource_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_ResourceGroup_Resource_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_ResourceGroup_Keys].[_Name] AS [Cluster_ResourceGroup_Name], [data].[Cluster_ResourceGroup_Resource_Keys].[_Name] AS [Cluster_ResourceGroup_Resource_Name] FROM [data].[Cluster_ResourceGroup_Resource_StableSamples] INNER JOIN [data].[Cluster_ResourceGroup_Resource_Keys] ON [data].[Cluster_ResourceGroup_Resource_Keys].[Id] = [data].[Cluster_ResourceGroup_Resource_StableSamples].[Id]
 INNER JOIN [data].[Cluster_ResourceGroup_Keys] ON [data].[Cluster_ResourceGroup_Keys].[Id] = [data].[Cluster_ResourceGroup_Resource_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_ResourceGroup_Keys].[ParentId]
;
GO
