SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_Machine_Memory_UnstableSamples_View] AS SELECT[data].[Cluster_Machine_Memory_UnstableSamples].[Id] AS [Id], [data].[Cluster_Machine_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_Machine_Memory_UnstableSamples].[_CumulativePagesInput] AS [Cluster_Machine_Memory_CumulativePagesInput], [data].[Cluster_Machine_Memory_UnstableSamples].[_CumulativePagesOutput] AS [Cluster_Machine_Memory_CumulativePagesOutput], [data].[Cluster_Machine_Memory_UnstableSamples].[_FreeBytes] AS [Cluster_Machine_Memory_FreeBytes], [data].[Cluster_Machine_Memory_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_Machine_Memory_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_Machine_Keys].[_Name] AS [Cluster_Machine_Name] FROM [data].[Cluster_Machine_Memory_UnstableSamples] INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[Id] = [data].[Cluster_Machine_Memory_UnstableSamples].[Id]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_Machine_Keys].[ParentId]
;
GO
