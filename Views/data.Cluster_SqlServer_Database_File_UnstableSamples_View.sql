SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_Database_File_UnstableSamples_View] AS SELECT[data].[Cluster_SqlServer_Database_File_UnstableSamples].[Id] AS [Id], [data].[Cluster_SqlServer_Database_File_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_Database_File_UnstableSamples].[_Size] AS [Cluster_SqlServer_Database_File_Size], [data].[Cluster_SqlServer_Database_File_UnstableSamples].[_UsedSize] AS [Cluster_SqlServer_Database_File_UsedSize], [data].[Cluster_SqlServer_Database_File_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Database_File_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [Cluster_SqlServer_Database_Name], [data].[Cluster_SqlServer_Database_File_Keys].[_Name] AS [Cluster_SqlServer_Database_File_Name], [data].[Cluster_SqlServer_Database_File_Keys].[_Type] AS [Cluster_SqlServer_Database_File_Type] FROM [data].[Cluster_SqlServer_Database_File_UnstableSamples] INNER JOIN [data].[Cluster_SqlServer_Database_File_Keys] ON [data].[Cluster_SqlServer_Database_File_Keys].[Id] = [data].[Cluster_SqlServer_Database_File_UnstableSamples].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[Id] = [data].[Cluster_SqlServer_Database_File_Keys].[ParentId]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Database_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
