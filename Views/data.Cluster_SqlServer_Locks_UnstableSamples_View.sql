SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_Locks_UnstableSamples_View] AS SELECT[data].[Cluster_SqlServer_Locks_UnstableSamples].[Id] AS [Id], [data].[Cluster_SqlServer_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_Locks_UnstableSamples].[_CumulativeDeadlocks] AS [Cluster_SqlServer_Locks_CumulativeDeadlocks], [data].[Cluster_SqlServer_Locks_UnstableSamples].[_CumulativeLockTimeouts] AS [Cluster_SqlServer_Locks_CumulativeLockTimeouts], [data].[Cluster_SqlServer_Locks_UnstableSamples].[_CumulativeLockWaits] AS [Cluster_SqlServer_Locks_CumulativeLockWaits], [data].[Cluster_SqlServer_Locks_UnstableSamples].[_CumulativeLockWaitTime] AS [Cluster_SqlServer_Locks_CumulativeLockWaitTime], [data].[Cluster_SqlServer_Locks_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Locks_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name] FROM [data].[Cluster_SqlServer_Locks_UnstableSamples] INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Locks_UnstableSamples].[Id]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
