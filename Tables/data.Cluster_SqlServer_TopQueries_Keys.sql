CREATE TABLE [data].[Cluster_SqlServer_TopQueries_Keys]
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
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_Keys] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_TopQueries_Keys_CollectionDate] ON [data].[Cluster_SqlServer_TopQueries_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_Keys] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_Keys_ParentId__DatabaseName__SqlHandle__StatementEnd__StatementStart] UNIQUE NONCLUSTERED  ([ParentId], [_DatabaseName], [_SqlHandle], [_StatementEnd], [_StatementStart]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_Keys] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_Keys_Cluster_SqlServer_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
