SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_Process_UnstableSamples_View] AS SELECT[data].[Cluster_SqlServer_Process_UnstableSamples].[Id] AS [Id], [data].[Cluster_SqlServer_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_Process_UnstableSamples].[_CumulativePrivilegedTime] AS [Cluster_SqlServer_Process_CumulativePrivilegedTime], [data].[Cluster_SqlServer_Process_UnstableSamples].[_CumulativeUserTime] AS [Cluster_SqlServer_Process_CumulativeUserTime], [data].[Cluster_SqlServer_Process_UnstableSamples].[_PrivateBytes] AS [Cluster_SqlServer_Process_PrivateBytes], [data].[Cluster_SqlServer_Process_UnstableSamples].[_VirtualBytes] AS [Cluster_SqlServer_Process_VirtualBytes], [data].[Cluster_SqlServer_Process_UnstableSamples].[_WorkingSet] AS [Cluster_SqlServer_Process_WorkingSet], [data].[Cluster_SqlServer_Process_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Process_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name] FROM [data].[Cluster_SqlServer_Process_UnstableSamples] INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Process_UnstableSamples].[Id]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
