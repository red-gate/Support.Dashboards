CREATE TABLE [data].[Cluster_AvailabilityGroup_Replica_Performance_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CumulativeFlowControlTime] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Performance_UnstableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Performance_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Performance_UnstableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Performance_UnstableSamples_Cluster_AvailabilityGroup_Replica_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_AvailabilityGroup_Replica_Keys] ([Id]) ON DELETE CASCADE
GO
