CREATE TABLE [data].[Cluster_Machine_VMware_Processor_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CpuLimitMhz] [bigint] NULL,
[_CpuReservationMhz] [bigint] NULL,
[_CpuShares] [bigint] NULL,
[_EffectiveVmSpeedMhz] [bigint] NULL,
[_HostProcessorSpeedMhz] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_VMware_Processor_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_VMware_Processor_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_VMware_Processor_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_VMware_Processor_UnstableSamples_Cluster_Machine_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Machine_Keys] ([Id]) ON DELETE CASCADE
GO
