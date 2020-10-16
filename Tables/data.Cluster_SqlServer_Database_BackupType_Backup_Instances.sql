CREATE TABLE [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_BackupDevice] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_BackupSize] [bigint] NULL,
[_DeviceName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_FinishDate] [bigint] NULL,
[_IsCompressed] [bit] NULL,
[_IsCopyOnly] [bit] NULL,
[_IsEncrypted] [bit] NULL,
[_IsNativeBackup] [bit] NULL,
[_IsPasswordProtected] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances] ADD CONSTRAINT [Cluster_SqlServer_Database_BackupType_Backup_Instances_Id] PRIMARY KEY CLUSTERED  ([Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_BackupType_Backup_Instances] ADD CONSTRAINT [Cluster_SqlServer_Database_BackupType_Backup_Instances_Cluster_SqlServer_Database_BackupType_Backup_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys] ([Id]) ON DELETE CASCADE
GO
