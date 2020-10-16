SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_Error_Instances_View] AS SELECT[data].[Cluster_SqlServer_Error_Instances].[Id] AS [Id], [data].[Cluster_SqlServer_Error_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_Error_Instances].[_ProcessInfo] AS [Cluster_SqlServer_Error_ProcessInfo], [data].[Cluster_SqlServer_Error_Instances].[_Text] AS [Cluster_SqlServer_Error_Text], [data].[Cluster_SqlServer_Error_Instances].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Error_Instances].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_Error_Keys].[_LogDate] AS [Cluster_SqlServer_Error_LogDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Error_Keys].[_LogDate]) AS [Cluster_SqlServer_Error_LogDate_DateTime], [data].[Cluster_SqlServer_Error_Keys].[_SequenceNumber] AS [Cluster_SqlServer_Error_SequenceNumber] FROM [data].[Cluster_SqlServer_Error_Instances] INNER JOIN [data].[Cluster_SqlServer_Error_Keys] ON [data].[Cluster_SqlServer_Error_Keys].[Id] = [data].[Cluster_SqlServer_Error_Instances].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Error_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
