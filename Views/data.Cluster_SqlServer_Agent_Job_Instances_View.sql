SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_Agent_Job_Instances_View] AS SELECT[data].[Cluster_SqlServer_Agent_Job_Instances].[Id] AS [Id], [data].[Cluster_SqlServer_Agent_Job_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_Agent_Job_Instances].[_DateCreated] AS [Cluster_SqlServer_Agent_Job_DateCreated], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Agent_Job_Instances].[_DateCreated]) AS [Cluster_SqlServer_Agent_Job_DateCreated_DateTime], [data].[Cluster_SqlServer_Agent_Job_Instances].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Agent_Job_Instances].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_Agent_Job_Keys].[_Name] AS [Cluster_SqlServer_Agent_Job_Name] FROM [data].[Cluster_SqlServer_Agent_Job_Instances] INNER JOIN [data].[Cluster_SqlServer_Agent_Job_Keys] ON [data].[Cluster_SqlServer_Agent_Job_Keys].[Id] = [data].[Cluster_SqlServer_Agent_Job_Instances].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Agent_Job_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
