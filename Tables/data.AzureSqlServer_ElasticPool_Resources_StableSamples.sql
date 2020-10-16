CREATE TABLE [data].[AzureSqlServer_ElasticPool_Resources_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_ElasticPoolDtuLimit] [bigint] NULL,
[_ElasticPoolStorageLimit] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_ElasticPool_Resources_StableSamples] ADD CONSTRAINT [AzureSqlServer_ElasticPool_Resources_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_ElasticPool_Resources_StableSamples] ADD CONSTRAINT [AzureSqlServer_ElasticPool_Resources_StableSamples_AzureSqlServer_ElasticPool_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_ElasticPool_Keys] ([Id]) ON DELETE CASCADE
GO
