CREATE TABLE [data].[Cluster_SqlServer_Database_BackupType_Backup_Sightings]
(
[Id] [bigint] NOT NULL,
[SightingDate] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_BackupType_Backup_Sightings] ADD CONSTRAINT [Cluster_SqlServer_Database_BackupType_Backup_Sightings_SightingDate_Id] PRIMARY KEY CLUSTERED  ([SightingDate], [Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_Database_BackupType_Backup_Sightings_Id] ON [data].[Cluster_SqlServer_Database_BackupType_Backup_Sightings] ([Id], [SightingDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_BackupType_Backup_Sightings] ADD CONSTRAINT [Cluster_SqlServer_Database_BackupType_Backup_Sightings_Cluster_SqlServer_Database_BackupType_Backup_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Database_BackupType_Backup_Keys] ([Id]) ON DELETE CASCADE
GO
