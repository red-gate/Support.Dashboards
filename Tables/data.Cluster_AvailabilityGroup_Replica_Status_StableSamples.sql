CREATE TABLE [data].[Cluster_AvailabilityGroup_Replica_Status_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_OperationalState] [bigint] NULL,
[_RecoveryHealth] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Status_StableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Status_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Status_StableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Status_StableSamples_Cluster_AvailabilityGroup_Replica_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_AvailabilityGroup_Replica_Keys] ([Id]) ON DELETE CASCADE
GO
