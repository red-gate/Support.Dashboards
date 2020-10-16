CREATE TABLE [data].[AzureSqlServer_Database_SqlProcess_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_LoginTime] [bigint] NOT NULL,
[_SessionId] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlProcess_Keys] ADD CONSTRAINT [AzureSqlServer_Database_SqlProcess_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AzureSqlServer_Database_SqlProcess_Keys_CollectionDate] ON [data].[AzureSqlServer_Database_SqlProcess_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlProcess_Keys] ADD CONSTRAINT [AzureSqlServer_Database_SqlProcess_Keys_ParentId__LoginTime__SessionId] UNIQUE NONCLUSTERED  ([ParentId], [_LoginTime], [_SessionId]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlProcess_Keys] ADD CONSTRAINT [AzureSqlServer_Database_SqlProcess_Keys_AzureSqlServer_Database_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
