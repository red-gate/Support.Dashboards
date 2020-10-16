CREATE TABLE [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_StartDate] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_BackupType_Backup_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_Database_BackupType_Backup_Keys__StartDate] ON [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys] ([_StartDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_BackupType_Backup_Keys_ParentId__StartDate] UNIQUE NONCLUSTERED  ([ParentId], [_StartDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_BackupType_Backup_Keys_Cluster_SqlServer_Database_BackupType_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Database_BackupType_Keys] ([Id]) ON DELETE CASCADE
GO
