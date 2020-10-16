CREATE TABLE [data].[AzureSqlServer_Database_MemoryManager_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_FreeMemoryBytes] [bigint] NULL,
[_TargetServerMemoryBytes] [bigint] NULL,
[_TotalServerMemoryBytes] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_MemoryManager_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_MemoryManager_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_MemoryManager_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_MemoryManager_UnstableSamples_AzureSqlServer_Database_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
