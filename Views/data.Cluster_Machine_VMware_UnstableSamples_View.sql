SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_Machine_VMware_UnstableSamples_View] AS SELECT[data].[Cluster_Machine_VMware_UnstableSamples].[Id] AS [Id], [data].[Cluster_Machine_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_Machine_VMware_UnstableSamples].[_CpuCostop] AS [Cluster_Machine_VMware_CpuCostop], [data].[Cluster_Machine_VMware_UnstableSamples].[_CpuUsage] AS [Cluster_Machine_VMware_CpuUsage], [data].[Cluster_Machine_VMware_UnstableSamples].[_DiskLatency] AS [Cluster_Machine_VMware_DiskLatency], [data].[Cluster_Machine_VMware_UnstableSamples].[_DiskRead] AS [Cluster_Machine_VMware_DiskRead], [data].[Cluster_Machine_VMware_UnstableSamples].[_DiskWrite] AS [Cluster_Machine_VMware_DiskWrite], [data].[Cluster_Machine_VMware_UnstableSamples].[_GuestCpuReady] AS [Cluster_Machine_VMware_GuestCpuReady], [data].[Cluster_Machine_VMware_UnstableSamples].[_GuestCpuSwapWait] AS [Cluster_Machine_VMware_GuestCpuSwapWait], [data].[Cluster_Machine_VMware_UnstableSamples].[_GuestMemoryBallooned] AS [Cluster_Machine_VMware_GuestMemoryBallooned], [data].[Cluster_Machine_VMware_UnstableSamples].[_GuestMemoryLatency] AS [Cluster_Machine_VMware_GuestMemoryLatency], [data].[Cluster_Machine_VMware_UnstableSamples].[_HostMemoryBallooned] AS [Cluster_Machine_VMware_HostMemoryBallooned], [data].[Cluster_Machine_VMware_UnstableSamples].[_MemorySwapInRate] AS [Cluster_Machine_VMware_MemorySwapInRate], [data].[Cluster_Machine_VMware_UnstableSamples].[_MemorySwapOutRate] AS [Cluster_Machine_VMware_MemorySwapOutRate], [data].[Cluster_Machine_VMware_UnstableSamples].[_MemoryUsage] AS [Cluster_Machine_VMware_MemoryUsage], [data].[Cluster_Machine_VMware_UnstableSamples].[_NetworkUsage] AS [Cluster_Machine_VMware_NetworkUsage], [data].[Cluster_Machine_VMware_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_Machine_VMware_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_Machine_Keys].[_Name] AS [Cluster_Machine_Name] FROM [data].[Cluster_Machine_VMware_UnstableSamples] INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[Id] = [data].[Cluster_Machine_VMware_UnstableSamples].[Id]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_Machine_Keys].[ParentId]
;
GO
