CREATE TABLE [data].[Cluster_AvailabilityGroup_Replica_Info_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_AvailabilityMode] [bigint] NULL,
[_ConnectedState] [bigint] NULL,
[_FailoverMode] [bigint] NULL,
[_JoinState] [bigint] NULL,
[_Role] [bigint] NULL,
[_SynchronizationHealth] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Info_StableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Info_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Info_StableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Info_StableSamples_Cluster_AvailabilityGroup_Replica_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_AvailabilityGroup_Replica_Keys] ([Id]) ON DELETE CASCADE
GO
