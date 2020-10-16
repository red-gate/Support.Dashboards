SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_Machine_Network_UnstableSamples_View] AS SELECT[data].[Cluster_Machine_Network_UnstableSamples].[Id] AS [Id], [data].[Cluster_Machine_Network_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_Machine_Network_UnstableSamples].[_CumulativeBytesReceived] AS [Cluster_Machine_Network_CumulativeBytesReceived], [data].[Cluster_Machine_Network_UnstableSamples].[_CumulativeBytesSent] AS [Cluster_Machine_Network_CumulativeBytesSent], [data].[Cluster_Machine_Network_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_Machine_Network_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_Machine_Keys].[_Name] AS [Cluster_Machine_Name], [data].[Cluster_Machine_Network_Keys].[_Name] AS [Cluster_Machine_Network_Name], [data].[Cluster_Machine_Network_Keys].[_SequenceNumber] AS [Cluster_Machine_Network_SequenceNumber] FROM [data].[Cluster_Machine_Network_UnstableSamples] INNER JOIN [data].[Cluster_Machine_Network_Keys] ON [data].[Cluster_Machine_Network_Keys].[Id] = [data].[Cluster_Machine_Network_UnstableSamples].[Id]
 INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[Id] = [data].[Cluster_Machine_Network_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_Machine_Keys].[ParentId]
;
GO
