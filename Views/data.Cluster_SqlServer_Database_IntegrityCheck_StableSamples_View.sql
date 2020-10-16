SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_Database_IntegrityCheck_StableSamples_View] AS SELECT[data].[Cluster_SqlServer_Database_IntegrityCheck_StableSamples].[Id] AS [Id], [data].[Cluster_SqlServer_Database_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_Database_IntegrityCheck_StableSamples].[_LastIntegrityCheck] AS [Cluster_SqlServer_Database_IntegrityCheck_LastIntegrityCheck], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Database_IntegrityCheck_StableSamples].[_LastIntegrityCheck]) AS [Cluster_SqlServer_Database_IntegrityCheck_LastIntegrityCheck_DateTime], [data].[Cluster_SqlServer_Database_IntegrityCheck_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Database_IntegrityCheck_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [Cluster_SqlServer_Database_Name] FROM [data].[Cluster_SqlServer_Database_IntegrityCheck_StableSamples] INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[Id] = [data].[Cluster_SqlServer_Database_IntegrityCheck_StableSamples].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Database_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
