CREATE TABLE [data].[Cluster_Machine_LogicalDisk_Volume_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_VolumePath] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_LogicalDisk_Volume_StableSamples] ADD CONSTRAINT [Cluster_Machine_LogicalDisk_Volume_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_LogicalDisk_Volume_StableSamples] ADD CONSTRAINT [Cluster_Machine_LogicalDisk_Volume_StableSamples_Cluster_Machine_LogicalDisk_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Machine_LogicalDisk_Keys] ([Id]) ON DELETE CASCADE
GO
