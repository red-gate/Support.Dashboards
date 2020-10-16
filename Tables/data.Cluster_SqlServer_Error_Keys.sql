CREATE TABLE [data].[Cluster_SqlServer_Error_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_LogDate] [bigint] NOT NULL,
[_SequenceNumber] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Error_Keys] ADD CONSTRAINT [Cluster_SqlServer_Error_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_Error_Keys__LogDate] ON [data].[Cluster_SqlServer_Error_Keys] ([_LogDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Error_Keys] ADD CONSTRAINT [Cluster_SqlServer_Error_Keys_ParentId__LogDate__SequenceNumber] UNIQUE NONCLUSTERED  ([ParentId], [_LogDate], [_SequenceNumber]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Error_Keys] ADD CONSTRAINT [Cluster_SqlServer_Error_Keys_Cluster_SqlServer_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
