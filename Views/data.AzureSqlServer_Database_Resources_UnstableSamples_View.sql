SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_Database_Resources_UnstableSamples_View] AS SELECT[data].[AzureSqlServer_Database_Resources_UnstableSamples].[Id] AS [Id], [data].[AzureSqlServer_Database_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_Database_Resources_UnstableSamples].[_MaxSessionPercent] AS [AzureSqlServer_Database_Resources_MaxSessionPercent], [data].[AzureSqlServer_Database_Resources_UnstableSamples].[_MaxWorkerPercent] AS [AzureSqlServer_Database_Resources_MaxWorkerPercent], [data].[AzureSqlServer_Database_Resources_UnstableSamples].[_PercentCpu] AS [AzureSqlServer_Database_Resources_PercentCpu], [data].[AzureSqlServer_Database_Resources_UnstableSamples].[_PercentIo] AS [AzureSqlServer_Database_Resources_PercentIo], [data].[AzureSqlServer_Database_Resources_UnstableSamples].[_PercentLogWrite] AS [AzureSqlServer_Database_Resources_PercentLogWrite], [data].[AzureSqlServer_Database_Resources_UnstableSamples].[_PercentMemoryUsed] AS [AzureSqlServer_Database_Resources_PercentMemoryUsed], [data].[AzureSqlServer_Database_Resources_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_Resources_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name] FROM [data].[AzureSqlServer_Database_Resources_UnstableSamples] INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_Resources_UnstableSamples].[Id]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO