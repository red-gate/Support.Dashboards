SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_SqlProcess_Instances_View] AS SELECT[data].[Cluster_SqlServer_SqlProcess_Instances].[Id] AS [Id], [data].[Cluster_SqlServer_SqlProcess_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_SqlProcess_Instances].[_Hostname] AS [Cluster_SqlServer_SqlProcess_Hostname], [data].[Cluster_SqlServer_SqlProcess_Instances].[_LoginName] AS [Cluster_SqlServer_SqlProcess_LoginName], [data].[Cluster_SqlServer_SqlProcess_Instances].[_ProgramName] AS [Cluster_SqlServer_SqlProcess_ProgramName], [data].[Cluster_SqlServer_SqlProcess_Instances].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_SqlProcess_Instances].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_SqlProcess_Keys].[_LoginTime] AS [Cluster_SqlServer_SqlProcess_LoginTime], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_SqlProcess_Keys].[_LoginTime]) AS [Cluster_SqlServer_SqlProcess_LoginTime_DateTime], [data].[Cluster_SqlServer_SqlProcess_Keys].[_SessionId] AS [Cluster_SqlServer_SqlProcess_SessionId] FROM [data].[Cluster_SqlServer_SqlProcess_Instances] INNER JOIN [data].[Cluster_SqlServer_SqlProcess_Keys] ON [data].[Cluster_SqlServer_SqlProcess_Keys].[Id] = [data].[Cluster_SqlServer_SqlProcess_Instances].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_SqlProcess_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
