SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_SqlServer_Database_Table_Index_UnstableSamples_View] AS SELECT[data].[Cluster_SqlServer_Database_Table_Index_UnstableSamples].[Id] AS [Id], [data].[Cluster_SqlServer_Database_Table_Index_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_SqlServer_Database_Table_Index_UnstableSamples].[_Fragmentation] AS [Cluster_SqlServer_Database_Table_Index_Fragmentation], [data].[Cluster_SqlServer_Database_Table_Index_UnstableSamples].[_Pages] AS [Cluster_SqlServer_Database_Table_Index_Pages], [data].[Cluster_SqlServer_Database_Table_Index_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_SqlServer_Database_Table_Index_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [Cluster_SqlServer_Database_Name], [data].[Cluster_SqlServer_Database_Table_Keys].[_Name] AS [Cluster_SqlServer_Database_Table_Name], [data].[Cluster_SqlServer_Database_Table_Keys].[_Schema] AS [Cluster_SqlServer_Database_Table_Schema], [data].[Cluster_SqlServer_Database_Table_Index_Keys].[_Name] AS [Cluster_SqlServer_Database_Table_Index_Name] FROM [data].[Cluster_SqlServer_Database_Table_Index_UnstableSamples] INNER JOIN [data].[Cluster_SqlServer_Database_Table_Index_Keys] ON [data].[Cluster_SqlServer_Database_Table_Index_Keys].[Id] = [data].[Cluster_SqlServer_Database_Table_Index_UnstableSamples].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Database_Table_Keys] ON [data].[Cluster_SqlServer_Database_Table_Keys].[Id] = [data].[Cluster_SqlServer_Database_Table_Index_Keys].[ParentId]
 INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[Id] = [data].[Cluster_SqlServer_Database_Table_Keys].[ParentId]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Database_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
