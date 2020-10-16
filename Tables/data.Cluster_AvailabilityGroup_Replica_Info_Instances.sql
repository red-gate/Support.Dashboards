CREATE TABLE [data].[Cluster_AvailabilityGroup_Replica_Info_Instances]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_IsFci] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Info_Instances] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Info_Instances_Id] PRIMARY KEY CLUSTERED  ([Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_AvailabilityGroup_Replica_Info_Instances] ADD CONSTRAINT [Cluster_AvailabilityGroup_Replica_Info_Instances_Cluster_AvailabilityGroup_Replica_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_AvailabilityGroup_Replica_Keys] ([Id]) ON DELETE CASCADE
GO
