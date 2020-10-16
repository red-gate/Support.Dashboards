SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_Database_AccessMethods_UnstableSamples_View] AS SELECT[data].[AzureSqlServer_Database_AccessMethods_UnstableSamples].[Id] AS [Id], [data].[AzureSqlServer_Database_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_Database_AccessMethods_UnstableSamples].[_CumulativeFullScans] AS [AzureSqlServer_Database_AccessMethods_CumulativeFullScans], [data].[AzureSqlServer_Database_AccessMethods_UnstableSamples].[_CumulativePageSplits] AS [AzureSqlServer_Database_AccessMethods_CumulativePageSplits], [data].[AzureSqlServer_Database_AccessMethods_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_AccessMethods_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name] FROM [data].[AzureSqlServer_Database_AccessMethods_UnstableSamples] INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_AccessMethods_UnstableSamples].[Id]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO
