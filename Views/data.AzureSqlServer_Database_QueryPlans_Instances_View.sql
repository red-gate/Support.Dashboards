SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_Database_QueryPlans_Instances_View] AS SELECT[data].[AzureSqlServer_Database_QueryPlans_Instances].[Id] AS [Id], [data].[AzureSqlServer_Database_QueryPlans_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_Database_QueryPlans_Instances].[_CreateDate] AS [AzureSqlServer_Database_QueryPlans_CreateDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_QueryPlans_Instances].[_CreateDate]) AS [AzureSqlServer_Database_QueryPlans_CreateDate_DateTime], [data].[AzureSqlServer_Database_QueryPlans_Instances].[_QueryPlan] AS [AzureSqlServer_Database_QueryPlans_QueryPlan], [data].[AzureSqlServer_Database_QueryPlans_Instances].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_QueryPlans_Instances].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name], [data].[AzureSqlServer_Database_QueryPlans_Keys].[_PlanHandle] AS [AzureSqlServer_Database_QueryPlans_PlanHandle] FROM [data].[AzureSqlServer_Database_QueryPlans_Instances] INNER JOIN [data].[AzureSqlServer_Database_QueryPlans_Keys] ON [data].[AzureSqlServer_Database_QueryPlans_Keys].[Id] = [data].[AzureSqlServer_Database_QueryPlans_Instances].[Id]
 INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_QueryPlans_Keys].[ParentId]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO
