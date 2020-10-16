SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_Database_StableSamples_View] AS SELECT[data].[AzureSqlServer_Database_StableSamples].[Id] AS [Id], [data].[AzureSqlServer_Database_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_Database_StableSamples].[_IsReachable] AS [AzureSqlServer_Database_IsReachable], [data].[AzureSqlServer_Database_StableSamples].[_IsReadyForDataCollection] AS [AzureSqlServer_Database_IsReadyForDataCollection], [data].[AzureSqlServer_Database_StableSamples].[_MonitoredEntityState] AS [AzureSqlServer_Database_MonitoredEntityState], [data].[AzureSqlServer_Database_StableSamples].[_MonitoringStatusCategory] AS [AzureSqlServer_Database_MonitoringStatusCategory], [data].[AzureSqlServer_Database_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name] FROM [data].[AzureSqlServer_Database_StableSamples] INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_StableSamples].[Id]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO
