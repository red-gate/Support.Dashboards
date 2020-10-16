CREATE TABLE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_WaitType] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_QueryWaitStats_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_TopQueries_QueryWaitStats_Keys_CollectionDate] ON [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_QueryWaitStats_Keys_ParentId__WaitType] UNIQUE NONCLUSTERED  ([ParentId], [_WaitType]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] ADD CONSTRAINT [Cluster_SqlServer_TopQueries_QueryWaitStats_Keys_Cluster_SqlServer_TopQueries_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_TopQueries_Keys] ([Id]) ON DELETE CASCADE
GO
