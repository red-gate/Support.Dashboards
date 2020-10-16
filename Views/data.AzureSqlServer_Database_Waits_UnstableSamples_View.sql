SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_Database_Waits_UnstableSamples_View] AS SELECT[data].[AzureSqlServer_Database_Waits_UnstableSamples].[Id] AS [Id], [data].[AzureSqlServer_Database_Waits_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_Database_Waits_UnstableSamples].[_SignalWaitTime] AS [AzureSqlServer_Database_Waits_SignalWaitTime], [data].[AzureSqlServer_Database_Waits_UnstableSamples].[_WaitingTasksCount] AS [AzureSqlServer_Database_Waits_WaitingTasksCount], [data].[AzureSqlServer_Database_Waits_UnstableSamples].[_WaitTime] AS [AzureSqlServer_Database_Waits_WaitTime], [data].[AzureSqlServer_Database_Waits_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_Waits_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name], [data].[AzureSqlServer_Database_Waits_Keys].[_WaitType] AS [AzureSqlServer_Database_Waits_WaitType] FROM [data].[AzureSqlServer_Database_Waits_UnstableSamples] INNER JOIN [data].[AzureSqlServer_Database_Waits_Keys] ON [data].[AzureSqlServer_Database_Waits_Keys].[Id] = [data].[AzureSqlServer_Database_Waits_UnstableSamples].[Id]
 INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_Waits_Keys].[ParentId]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO
