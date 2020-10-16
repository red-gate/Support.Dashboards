CREATE TABLE [data].[AzureSqlServer_Database_BufferManager_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_BufferCacheHitRatio] [float] NULL,
[_PageLifeExpectancy] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_BufferManager_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_BufferManager_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_BufferManager_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_BufferManager_UnstableSamples_AzureSqlServer_Database_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
