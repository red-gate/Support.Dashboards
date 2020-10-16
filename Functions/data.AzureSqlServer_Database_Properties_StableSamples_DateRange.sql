SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_Properties_StableSamples_DateRange]
(
    @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedIds]([Id]) AS
(
    SELECT DISTINCT [Id]
    FROM [data].[AzureSqlServer_Database_Sightings]
    WHERE [data].[AzureSqlServer_Database_Sightings].[SightingDate] >= @MinDate AND [data].[AzureSqlServer_Database_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_Database_Name]) AS
(
    SELECT [data].[AzureSqlServer_Database_Keys].[Id]
    , [data].[AzureSqlServer_Database_Keys].[ParentId]
    , [data].[AzureSqlServer_Database_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
    FROM [SightedIds]
     INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[AzureSqlServer_Name]
, [SightedInstances].[AzureSqlServer_Database_Name]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_Collation] AS [AzureSqlServer_Database_Properties_Collation]
, [Leaf].[_CompatibilityLevel] AS [AzureSqlServer_Database_Properties_CompatibilityLevel]
, [Leaf].[_CreateDate] AS [AzureSqlServer_Database_Properties_CreateDate]
, [utils].[TicksToDateTime]([Leaf].[_CreateDate]) AS [AzureSqlServer_Database_Properties_CreateDate_DateTime]
, [Leaf].[_Edition] AS [AzureSqlServer_Database_Properties_Edition]
, [Leaf].[_IsAutoCreateStatistics] AS [AzureSqlServer_Database_Properties_IsAutoCreateStatistics]
, [Leaf].[_IsAutoShrink] AS [AzureSqlServer_Database_Properties_IsAutoShrink]
, [Leaf].[_IsAutoUpdateStatistics] AS [AzureSqlServer_Database_Properties_IsAutoUpdateStatistics]
, [Leaf].[_IsQueryStore] AS [AzureSqlServer_Database_Properties_IsQueryStore]
, [Leaf].[_IsReadOnly] AS [AzureSqlServer_Database_Properties_IsReadOnly]
, [Leaf].[_IsSingleUser] AS [AzureSqlServer_Database_Properties_IsSingleUser]
, [Leaf].[_PageVerify] AS [AzureSqlServer_Database_Properties_PageVerify]
, [Leaf].[_ProductLevel] AS [AzureSqlServer_Database_Properties_ProductLevel]
, [Leaf].[_ProductVersion] AS [AzureSqlServer_Database_Properties_ProductVersion]
, [Leaf].[_State] AS [AzureSqlServer_Database_Properties_State]
FROM
 [SightedInstances]
LEFT OUTER JOIN
(
    SELECT [Id], MAX([CollectionDate]) as [GreatestMinDate]
    FROM [data].[AzureSqlServer_Database_Properties_StableSamples]
    WHERE [CollectionDate] <= @MinDate
    GROUP BY [Id]
)
[GreatestMinDates]
 ON [SightedInstances].[Id] = [GreatestMinDates].[Id]
INNER JOIN
 [data].[AzureSqlServer_Database_Properties_StableSamples] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
WHERE [Leaf].[CollectionDate] >= COALESCE([GreatestMinDates].[GreatestMinDate], @MinDate)
AND [Leaf].[CollectionDate] <= @MaxDate
GO
