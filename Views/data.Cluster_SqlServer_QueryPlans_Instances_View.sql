SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_QueryPlans_Instances_View] AS SELECT[data].[Cluster_SqlServer_QueryPlans_Instances].[Id] AS [Id], [data].[Cluster_SqlServer_QueryPlans_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_QueryPlans_Instances].[_CreateDate] AS [Cluster_SqlServer_QueryPlans_CreateDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_QueryPlans_Instances].[_CreateDate]) AS [Cluster_SqlServer_QueryPlans_CreateDate_DateTime], [data].[Cluster_SqlServer_QueryPlans_Instances].[_QueryPlan] AS [Cluster_SqlServer_QueryPlans_QueryPlan], [data].[Cluster_SqlServer_QueryPlans_Instances].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_QueryPlans_Instances].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_QueryPlans_Keys].[_PlanHandle] AS [Cluster_SqlServer_QueryPlans_PlanHandle] FROM [data].[Cluster_SqlServer_QueryPlans_Instances] INNER JOIN [data].[Cluster_SqlServer_QueryPlans_Keys] ON [data].[Cluster_SqlServer_QueryPlans_Keys].[Id] = [data].[Cluster_SqlServer_QueryPlans_Instances].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_QueryPlans_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
