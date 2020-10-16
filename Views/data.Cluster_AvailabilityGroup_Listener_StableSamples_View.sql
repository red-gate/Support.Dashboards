SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_AvailabilityGroup_Listener_StableSamples_View] AS SELECT[data].[Cluster_AvailabilityGroup_Listener_StableSamples].[Id] AS [Id], [data].[Cluster_AvailabilityGroup_Listener_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_AvailabilityGroup_Listener_StableSamples].[_ListenerIpAddress] AS [Cluster_AvailabilityGroup_Listener_ListenerIpAddress], [data].[Cluster_AvailabilityGroup_Listener_StableSamples].[_ListenerPort] AS [Cluster_AvailabilityGroup_Listener_ListenerPort], [data].[Cluster_AvailabilityGroup_Listener_StableSamples].[_ListenerState] AS [Cluster_AvailabilityGroup_Listener_ListenerState], [data].[Cluster_AvailabilityGroup_Listener_StableSamples].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_AvailabilityGroup_Listener_StableSamples].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_AvailabilityGroup_Keys].[_Name] AS [Cluster_AvailabilityGroup_Name], [data].[Cluster_AvailabilityGroup_Listener_Keys].[_ListenerDnsName] AS [Cluster_AvailabilityGroup_Listener_ListenerDnsName] FROM [data].[Cluster_AvailabilityGroup_Listener_StableSamples] INNER JOIN [data].[Cluster_AvailabilityGroup_Listener_Keys] ON [data].[Cluster_AvailabilityGroup_Listener_Keys].[Id] = [data].[Cluster_AvailabilityGroup_Listener_StableSamples].[Id]
 INNER JOIN [data].[Cluster_AvailabilityGroup_Keys] ON [data].[Cluster_AvailabilityGroup_Keys].[Id] = [data].[Cluster_AvailabilityGroup_Listener_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_AvailabilityGroup_Keys].[ParentId]
;
GO
