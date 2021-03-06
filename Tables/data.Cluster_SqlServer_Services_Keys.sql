CREATE TABLE [data].[Cluster_SqlServer_Services_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_ServiceName] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Services_Keys] ADD CONSTRAINT [Cluster_SqlServer_Services_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_Services_Keys_CollectionDate] ON [data].[Cluster_SqlServer_Services_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Services_Keys] ADD CONSTRAINT [Cluster_SqlServer_Services_Keys_ParentId__ServiceName] UNIQUE NONCLUSTERED  ([ParentId], [_ServiceName]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Services_Keys] ADD CONSTRAINT [Cluster_SqlServer_Services_Keys_Cluster_SqlServer_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
