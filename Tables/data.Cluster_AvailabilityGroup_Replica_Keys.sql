CREATE TABLE [data].[Cluster_AvailabilityGroup_Replica_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Name] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Keys] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_AvailabilityGroup_Replica_Keys_CollectionDate] ON [data].[Cluster_AvailabilityGroup_Replica_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Keys] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Keys_ParentId__Name] UNIQUE NONCLUSTERED  ([ParentId], [_Name]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Keys] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Keys_Cluster_AvailabilityGroup_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_AvailabilityGroup_Keys] ([Id]) ON DELETE CASCADE
GO
