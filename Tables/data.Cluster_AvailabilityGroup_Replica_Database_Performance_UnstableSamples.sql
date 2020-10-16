CREATE TABLE [data].[Cluster_AvailabilityGroup_Replica_Database_Performance_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CumulativeLogBytesReceivedPerSecond] [bigint] NULL,
[_CumulativeRedoneBytesPerSecond] [bigint] NULL,
[_CumulativeTransactionDelay] [bigint] NULL,
[_LogSendQueue] [bigint] NULL,
[_RecoveryQueue] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Database_Performance_UnstableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Database_Performance_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Database_Performance_UnstableSamples] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Database_Performance_UnstableSamples_Cluster_AvailabilityGroup_Replica_Database_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_AvailabilityGroup_Replica_Database_Keys] ([Id]) ON DELETE CASCADE
GO
