SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_AvailabilityGroup_Replica_Info_Instances_View] AS SELECT[data].[Cluster_AvailabilityGroup_Replica_Info_Instances].[Id] AS [Id], [data].[Cluster_AvailabilityGroup_Replica_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_AvailabilityGroup_Replica_Info_Instances].[_IsFci] AS [Cluster_AvailabilityGroup_Replica_Info_IsFci], [data].[Cluster_AvailabilityGroup_Replica_Info_Instances].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_AvailabilityGroup_Replica_Info_Instances].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_AvailabilityGroup_Keys].[_Name] AS [Cluster_AvailabilityGroup_Name], [data].[Cluster_AvailabilityGroup_Replica_Keys].[_Name] AS [Cluster_AvailabilityGroup_Replica_Name] FROM [data].[Cluster_AvailabilityGroup_Replica_Info_Instances] INNER JOIN [data].[Cluster_AvailabilityGroup_Replica_Keys] ON [data].[Cluster_AvailabilityGroup_Replica_Keys].[Id] = [data].[Cluster_AvailabilityGroup_Replica_Info_Instances].[Id]
 INNER JOIN [data].[Cluster_AvailabilityGroup_Keys] ON [data].[Cluster_AvailabilityGroup_Keys].[Id] = [data].[Cluster_AvailabilityGroup_Replica_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_AvailabilityGroup_Keys].[ParentId]
;
GO
