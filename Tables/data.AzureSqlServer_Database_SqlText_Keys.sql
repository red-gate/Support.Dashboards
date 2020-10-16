CREATE TABLE [data].[AzureSqlServer_Database_SqlText_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_SqlHandle] [varbinary] (900) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlText_Keys] ADD CONSTRAINT [AzureSqlServer_Database_SqlText_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AzureSqlServer_Database_SqlText_Keys_CollectionDate] ON [data].[AzureSqlServer_Database_SqlText_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlText_Keys] ADD CONSTRAINT [AzureSqlServer_Database_SqlText_Keys_ParentId__SqlHandle] UNIQUE NONCLUSTERED  ([ParentId], [_SqlHandle]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlText_Keys] ADD CONSTRAINT [AzureSqlServer_Database_SqlText_Keys_AzureSqlServer_Database_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
