CREATE TABLE [data].[Cluster_SqlServer_SqlProcess_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_LoginTime] [bigint] NOT NULL,
[_SessionId] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_SqlProcess_Keys] ADD CONSTRAINT [Cluster_SqlServer_SqlProcess_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_SqlProcess_Keys_CollectionDate] ON [data].[Cluster_SqlServer_SqlProcess_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_SqlProcess_Keys] ADD CONSTRAINT [Cluster_SqlServer_SqlProcess_Keys_ParentId__LoginTime__SessionId] UNIQUE NONCLUSTERED  ([ParentId], [_LoginTime], [_SessionId]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_SqlProcess_Keys] ADD CONSTRAINT [Cluster_SqlServer_SqlProcess_Keys_Cluster_SqlServer_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
