SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_Database_GeneralStatistics_UnstableSamples_View] AS SELECT[data].[AzureSqlServer_Database_GeneralStatistics_UnstableSamples].[Id] AS [Id], [data].[AzureSqlServer_Database_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_Database_GeneralStatistics_UnstableSamples].[_UserConnections] AS [AzureSqlServer_Database_GeneralStatistics_UserConnections], [data].[AzureSqlServer_Database_GeneralStatistics_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_GeneralStatistics_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name] FROM [data].[AzureSqlServer_Database_GeneralStatistics_UnstableSamples] INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_GeneralStatistics_UnstableSamples].[Id]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO
