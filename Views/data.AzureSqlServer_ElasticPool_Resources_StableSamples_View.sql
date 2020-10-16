SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_ElasticPool_Resources_StableSamples_View] AS SELECT[data].[AzureSqlServer_ElasticPool_Resources_StableSamples].[Id] AS [Id], [data].[AzureSqlServer_ElasticPool_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_ElasticPool_Resources_StableSamples].[_ElasticPoolDtuLimit] AS [AzureSqlServer_ElasticPool_Resources_ElasticPoolDtuLimit], [data].[AzureSqlServer_ElasticPool_Resources_StableSamples].[_ElasticPoolStorageLimit] AS [AzureSqlServer_ElasticPool_Resources_ElasticPoolStorageLimit], [data].[AzureSqlServer_ElasticPool_Resources_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_ElasticPool_Resources_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_ElasticPool_Keys].[_Name] AS [AzureSqlServer_ElasticPool_Name] FROM [data].[AzureSqlServer_ElasticPool_Resources_StableSamples] INNER JOIN [data].[AzureSqlServer_ElasticPool_Keys] ON [data].[AzureSqlServer_ElasticPool_Keys].[Id] = [data].[AzureSqlServer_ElasticPool_Resources_StableSamples].[Id]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_ElasticPool_Keys].[ParentId]
;
GO
