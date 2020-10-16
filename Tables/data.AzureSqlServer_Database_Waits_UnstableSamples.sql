CREATE TABLE [data].[AzureSqlServer_Database_Waits_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_SignalWaitTime] [bigint] NULL,
[_WaitingTasksCount] [bigint] NULL,
[_WaitTime] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Waits_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Waits_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Waits_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Waits_UnstableSamples_AzureSqlServer_Database_Waits_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_Waits_Keys] ([Id]) ON DELETE CASCADE
GO
