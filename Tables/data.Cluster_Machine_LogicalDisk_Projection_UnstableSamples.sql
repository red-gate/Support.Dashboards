CREATE TABLE [data].[Cluster_Machine_LogicalDisk_Projection_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_EstimatedFullDate] [bigint] NULL,
[_SizeInOneYear] [float] NULL,
[_SizeNow] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_LogicalDisk_Projection_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_LogicalDisk_Projection_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_LogicalDisk_Projection_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_LogicalDisk_Projection_UnstableSamples_Cluster_Machine_LogicalDisk_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Machine_LogicalDisk_Keys] ([Id]) ON DELETE CASCADE
GO
