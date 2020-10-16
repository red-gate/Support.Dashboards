CREATE TABLE [data].[AzureSqlServer_ElasticPool_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Name] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_ElasticPool_Keys] ADD CONSTRAINT [AzureSqlServer_ElasticPool_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AzureSqlServer_ElasticPool_Keys_CollectionDate] ON [data].[AzureSqlServer_ElasticPool_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_ElasticPool_Keys] ADD CONSTRAINT [AzureSqlServer_ElasticPool_Keys_ParentId__Name] UNIQUE NONCLUSTERED  ([ParentId], [_Name]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_ElasticPool_Keys] ADD CONSTRAINT [AzureSqlServer_ElasticPool_Keys_AzureSqlServer_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[AzureSqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
