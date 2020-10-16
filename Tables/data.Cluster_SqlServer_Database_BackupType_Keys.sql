CREATE TABLE [data].[Cluster_SqlServer_Database_BackupType_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Type] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_BackupType_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_BackupType_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_Database_BackupType_Keys_CollectionDate] ON [data].[Cluster_SqlServer_Database_BackupType_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_BackupType_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_BackupType_Keys_ParentId__Type] UNIQUE NONCLUSTERED  ([ParentId], [_Type]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_BackupType_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_BackupType_Keys_Cluster_SqlServer_Database_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
