SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_QueryPlans_Instances_InstanceDateRange]
(
    @AzureSqlServer_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_QueryPlans_PlanHandle AS VARBINARY(900)
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_Database_Name], [AzureSqlServer_Database_QueryPlans_PlanHandle]) AS
(
    SELECT [data].[AzureSqlServer_Database_QueryPlans_Keys].[Id]
    , [data].[AzureSqlServer_Database_QueryPlans_Keys].[ParentId]
    , [data].[AzureSqlServer_Database_QueryPlans_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
    , [data].[AzureSqlServer_Database_QueryPlans_Keys].[_PlanHandle] AS [AzureSqlServer_Database_QueryPlans_PlanHandle]
    FROM [data].[AzureSqlServer_Keys]
    INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[ParentId] = [data].[AzureSqlServer_Keys].[Id]
    INNER JOIN [data].[AzureSqlServer_Database_QueryPlans_Keys] ON [data].[AzureSqlServer_Database_QueryPlans_Keys].[ParentId] = [data].[AzureSqlServer_Database_Keys].[Id]
     WHERE [data].[AzureSqlServer_Keys].[_Name] = @AzureSqlServer_Name
     AND [data].[AzureSqlServer_Database_Keys].[_Name] = @AzureSqlServer_Database_Name
     AND [data].[AzureSqlServer_Database_QueryPlans_Keys].[_PlanHandle] = @AzureSqlServer_Database_QueryPlans_PlanHandle
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[AzureSqlServer_Name]
, [SightedInstances].[AzureSqlServer_Database_Name]
, [SightedInstances].[AzureSqlServer_Database_QueryPlans_PlanHandle]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_CreateDate] AS [AzureSqlServer_Database_QueryPlans_CreateDate]
, [utils].[TicksToDateTime]([Leaf].[_CreateDate]) AS [AzureSqlServer_Database_QueryPlans_CreateDate_DateTime]
, [Leaf].[_QueryPlan] AS [AzureSqlServer_Database_QueryPlans_QueryPlan]
FROM
 [SightedInstances]
INNER JOIN
 [data].[AzureSqlServer_Database_QueryPlans_Instances] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
GO
