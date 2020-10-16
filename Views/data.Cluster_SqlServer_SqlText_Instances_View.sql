SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_SqlText_Instances_View] AS SELECT[data].[Cluster_SqlServer_SqlText_Instances].[Id] AS [Id], [data].[Cluster_SqlServer_SqlText_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_SqlText_Instances].[_SqlText] AS [Cluster_SqlServer_SqlText_SqlText], [data].[Cluster_SqlServer_SqlText_Instances].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_SqlText_Instances].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_SqlText_Keys].[_SqlHandle] AS [Cluster_SqlServer_SqlText_SqlHandle] FROM [data].[Cluster_SqlServer_SqlText_Instances] INNER JOIN [data].[Cluster_SqlServer_SqlText_Keys] ON [data].[Cluster_SqlServer_SqlText_Keys].[Id] = [data].[Cluster_SqlServer_SqlText_Instances].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_SqlText_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
