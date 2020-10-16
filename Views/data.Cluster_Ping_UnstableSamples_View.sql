SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_Ping_UnstableSamples_View] AS SELECT[data].[Cluster_Ping_UnstableSamples].[Id] AS [Id], [data].[Cluster_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_Ping_UnstableSamples].[_RoundtripTime] AS [Cluster_Ping_RoundtripTime], [data].[Cluster_Ping_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_Ping_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name] FROM [data].[Cluster_Ping_UnstableSamples] INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_Ping_UnstableSamples].[Id]
;
GO
