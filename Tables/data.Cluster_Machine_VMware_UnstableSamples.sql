CREATE TABLE [data].[Cluster_Machine_VMware_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CpuCostop] [bigint] NULL,
[_CpuUsage] [bigint] NULL,
[_DiskLatency] [bigint] NULL,
[_DiskRead] [bigint] NULL,
[_DiskWrite] [bigint] NULL,
[_GuestCpuReady] [float] NULL,
[_GuestCpuSwapWait] [float] NULL,
[_GuestMemoryBallooned] [bigint] NULL,
[_GuestMemoryLatency] [bigint] NULL,
[_HostMemoryBallooned] [bigint] NULL,
[_MemorySwapInRate] [bigint] NULL,
[_MemorySwapOutRate] [bigint] NULL,
[_MemoryUsage] [bigint] NULL,
[_NetworkUsage] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_VMware_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_VMware_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_VMware_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_VMware_UnstableSamples_Cluster_Machine_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Machine_Keys] ([Id]) ON DELETE CASCADE
GO
