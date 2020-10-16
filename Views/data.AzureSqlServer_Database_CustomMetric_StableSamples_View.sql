SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_Database_CustomMetric_StableSamples_View] AS SELECT[data].[AzureSqlServer_Database_CustomMetric_StableSamples].[Id] AS [Id], [data].[AzureSqlServer_Database_CustomMetric_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_Database_CustomMetric_StableSamples].[_ErrorMessage] AS [AzureSqlServer_Database_CustomMetric_ErrorMessage], [data].[AzureSqlServer_Database_CustomMetric_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_CustomMetric_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name], [data].[AzureSqlServer_Database_CustomMetric_Keys].[_MetricId] AS [AzureSqlServer_Database_CustomMetric_MetricId] FROM [data].[AzureSqlServer_Database_CustomMetric_StableSamples] INNER JOIN [data].[AzureSqlServer_Database_CustomMetric_Keys] ON [data].[AzureSqlServer_Database_CustomMetric_Keys].[Id] = [data].[AzureSqlServer_Database_CustomMetric_StableSamples].[Id]
 INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_CustomMetric_Keys].[ParentId]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO
