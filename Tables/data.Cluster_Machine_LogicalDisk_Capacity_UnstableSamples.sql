CREATE TABLE [data].[Cluster_Machine_LogicalDisk_Capacity_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_FreeBytes] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_LogicalDisk_Capacity_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_LogicalDisk_Capacity_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_LogicalDisk_Capacity_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_LogicalDisk_Capacity_UnstableSamples_Cluster_Machine_LogicalDisk_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Machine_LogicalDisk_Keys] ([Id]) ON DELETE CASCADE
GO
