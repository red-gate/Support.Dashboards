SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[Cluster_Machine_Process_Owner_Instances_View] AS SELECT[data].[Cluster_Machine_Process_Owner_Instances].[Id] AS [Id], [data].[Cluster_Machine_Process_Keys].[CollectionDate] AS [IdCollectionDate], [data].[Cluster_Machine_Process_Owner_Instances].[_Domain] AS [Cluster_Machine_Process_Owner_Domain], [data].[Cluster_Machine_Process_Owner_Instances].[_User] AS [Cluster_Machine_Process_Owner_User], [data].[Cluster_Machine_Process_Owner_Instances].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[Cluster_Machine_Process_Owner_Instances].[CollectionDate]) AS [CollectionDate_DateTime], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_Machine_Keys].[_Name] AS [Cluster_Machine_Name], [data].[Cluster_Machine_Process_Keys].[_Id] AS [Cluster_Machine_Process_Id], [data].[Cluster_Machine_Process_Keys].[_StartDate] AS [Cluster_Machine_Process_StartDate], [utils].[TicksToDateTime]([data].[Cluster_Machine_Process_Keys].[_StartDate]) AS [Cluster_Machine_Process_StartDate_DateTime] FROM [data].[Cluster_Machine_Process_Owner_Instances] INNER JOIN [data].[Cluster_Machine_Process_Keys] ON [data].[Cluster_Machine_Process_Keys].[Id] = [data].[Cluster_Machine_Process_Owner_Instances].[Id]
 INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[Id] = [data].[Cluster_Machine_Process_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_Machine_Keys].[ParentId]
;
GO
