SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_Ping_UnstableSamples_View] AS SELECT[data].[AzureSqlServer_Ping_UnstableSamples].[Id] AS [Id], [data].[AzureSqlServer_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_Ping_UnstableSamples].[_RoundtripTime] AS [AzureSqlServer_Ping_RoundtripTime], [data].[AzureSqlServer_Ping_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Ping_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name] FROM [data].[AzureSqlServer_Ping_UnstableSamples] INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Ping_UnstableSamples].[Id]
;
GO
