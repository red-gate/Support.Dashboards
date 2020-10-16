CREATE TABLE [data].[Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_DatabaseState] [bigint] NULL,
[_DatabaseSynchronizationState] [bigint] NULL,
[_IsDatabaseJoined] [bigint] NULL,
[_IsFailoverReady] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples_Cluster_AvailabilityGroup_Replica_Database_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_AvailabilityGroup_Replica_Database_Keys] ([Id]) ON DELETE CASCADE
GO
