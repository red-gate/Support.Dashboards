SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_ServerWaits_UnstableSamples_View] AS SELECT[data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[Id] AS [Id], [data].[Cluster_SqlServer_ServerWaits_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[_SignalWaitTime] AS [Cluster_SqlServer_ServerWaits_SignalWaitTime], [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[_WaitingTasksCount] AS [Cluster_SqlServer_ServerWaits_WaitingTasksCount], [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[_WaitTime] AS [Cluster_SqlServer_ServerWaits_WaitTime], [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_ServerWaits_Keys].[_WaitType] AS [Cluster_SqlServer_ServerWaits_WaitType] FROM [data].[Cluster_SqlServer_ServerWaits_UnstableSamples] INNER JOIN [data].[Cluster_SqlServer_ServerWaits_Keys] ON [data].[Cluster_SqlServer_ServerWaits_Keys].[Id] = [data].[Cluster_SqlServer_ServerWaits_UnstableSamples].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_ServerWaits_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
