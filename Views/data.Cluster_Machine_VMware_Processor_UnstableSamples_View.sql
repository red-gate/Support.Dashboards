SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_Machine_VMware_Processor_UnstableSamples_View] AS SELECT[data].[Cluster_Machine_VMware_Processor_UnstableSamples].[Id] AS [Id], [data].[Cluster_Machine_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_Machine_VMware_Processor_UnstableSamples].[_CpuLimitMhz] AS [Cluster_Machine_VMware_Processor_CpuLimitMhz], [data].[Cluster_Machine_VMware_Processor_UnstableSamples].[_CpuReservationMhz] AS [Cluster_Machine_VMware_Processor_CpuReservationMhz], [data].[Cluster_Machine_VMware_Processor_UnstableSamples].[_CpuShares] AS [Cluster_Machine_VMware_Processor_CpuShares], [data].[Cluster_Machine_VMware_Processor_UnstableSamples].[_EffectiveVmSpeedMhz] AS [Cluster_Machine_VMware_Processor_EffectiveVmSpeedMhz], [data].[Cluster_Machine_VMware_Processor_UnstableSamples].[_HostProcessorSpeedMhz] AS [Cluster_Machine_VMware_Processor_HostProcessorSpeedMhz], [data].[Cluster_Machine_VMware_Processor_UnstableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_Machine_VMware_Processor_UnstableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_Machine_Keys].[_Name] AS [Cluster_Machine_Name] FROM [data].[Cluster_Machine_VMware_Processor_UnstableSamples] INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[Id] = [data].[Cluster_Machine_VMware_Processor_UnstableSamples].[Id]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_Machine_Keys].[ParentId]
;
GO
