CREATE TABLE [data].[Cluster_SqlServer_SqlText_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_SqlHandle] [varbinary] (900) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_SqlText_Keys] ADD CONSTRAINT [Cluster_SqlServer_SqlText_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_SqlText_Keys_CollectionDate] ON [data].[Cluster_SqlServer_SqlText_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_SqlText_Keys] ADD CONSTRAINT [Cluster_SqlServer_SqlText_Keys_ParentId__SqlHandle] UNIQUE NONCLUSTERED  ([ParentId], [_SqlHandle]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_SqlText_Keys] ADD CONSTRAINT [Cluster_SqlServer_SqlText_Keys_Cluster_SqlServer_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
