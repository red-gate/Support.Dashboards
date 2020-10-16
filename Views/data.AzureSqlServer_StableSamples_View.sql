SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_StableSamples_View] AS SELECT[data].[AzureSqlServer_StableSamples].[Id] AS [Id], [data].[AzureSqlServer_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_StableSamples].[_IsReachable] AS [AzureSqlServer_IsReachable], [data].[AzureSqlServer_StableSamples].[_IsReadyForDataCollection] AS [AzureSqlServer_IsReadyForDataCollection], [data].[AzureSqlServer_StableSamples].[_MonitoredEntityState] AS [AzureSqlServer_MonitoredEntityState], [data].[AzureSqlServer_StableSamples].[_MonitoringStatusCategory] AS [AzureSqlServer_MonitoringStatusCategory], [data].[AzureSqlServer_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name] FROM [data].[AzureSqlServer_StableSamples] INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_StableSamples].[Id]
;
GO
