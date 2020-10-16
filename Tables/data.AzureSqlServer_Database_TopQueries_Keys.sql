CREATE TABLE [data].[AzureSqlServer_Database_TopQueries_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_DatabaseName] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[_SqlHandle] [varbinary] (900) NOT NULL,
[_StatementEnd] [bigint] NOT NULL,
[_StatementStart] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_TopQueries_Keys] ADD CONSTRAINT [AzureSqlServer_Database_TopQueries_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AzureSqlServer_Database_TopQueries_Keys_CollectionDate] ON [data].[AzureSqlServer_Database_TopQueries_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_TopQueries_Keys] ADD CONSTRAINT [AzureSqlServer_Database_TopQueries_Keys_ParentId__DatabaseName__SqlHandle__StatementEnd__StatementStart] UNIQUE NONCLUSTERED  ([ParentId], [_DatabaseName], [_SqlHandle], [_StatementEnd], [_StatementStart]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_TopQueries_Keys] ADD CONSTRAINT [AzureSqlServer_Database_TopQueries_Keys_AzureSqlServer_Database_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
