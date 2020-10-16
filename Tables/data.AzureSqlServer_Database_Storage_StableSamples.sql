CREATE TABLE [data].[AzureSqlServer_Database_Storage_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_DatabaseMaxSizeInBytes] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Storage_StableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Storage_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Storage_StableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Storage_StableSamples_AzureSqlServer_Database_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
