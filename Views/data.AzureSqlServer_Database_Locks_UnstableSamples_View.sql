SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_Database_Locks_UnstableSamples_View] AS SELECT[data].[AzureSqlServer_Database_Locks_UnstableSamples].[Id] AS [Id], [data].[AzureSqlServer_Database_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_Database_Locks_UnstableSamples].[_CumulativeDeadlocks] AS [AzureSqlServer_Database_Locks_CumulativeDeadlocks], [data].[AzureSqlServer_Database_Locks_UnstableSamples].[_CumulativeLockTimeouts] AS [AzureSqlServer_Database_Locks_CumulativeLockTimeouts], [data].[AzureSqlServer_Database_Locks_UnstableSamples].[_CumulativeLockWaits] AS [AzureSqlServer_Database_Locks_CumulativeLockWaits], [data].[AzureSqlServer_Database_Locks_UnstableSamples].[_CumulativeLockWaitTime] AS [AzureSqlServer_Database_Locks_CumulativeLockWaitTime], [data].[AzureSqlServer_Database_Locks_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_Locks_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name] FROM [data].[AzureSqlServer_Database_Locks_UnstableSamples] INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_Locks_UnstableSamples].[Id]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO
