SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_ElasticPool_Resources_StableSamples_DateRange]
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
    FROM [data].[AzureSqlServer_ElasticPool_Sightings]
    WHERE [data].[AzureSqlServer_ElasticPool_Sightings].[SightingDate] >= @MinDate AND [data].[AzureSqlServer_ElasticPool_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_ElasticPool_Name]) AS
(
    SELECT [data].[AzureSqlServer_ElasticPool_Keys].[Id]
    , [data].[AzureSqlServer_ElasticPool_Keys].[ParentId]
    , [data].[AzureSqlServer_ElasticPool_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_ElasticPool_Keys].[_Name] AS [AzureSqlServer_ElasticPool_Name]
    FROM [SightedIds]
     INNER JOIN [data].[AzureSqlServer_ElasticPool_Keys] ON [data].[AzureSqlServer_ElasticPool_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_ElasticPool_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[AzureSqlServer_Name]
, [SightedInstances].[AzureSqlServer_ElasticPool_Name]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_ElasticPoolDtuLimit] AS [AzureSqlServer_ElasticPool_Resources_ElasticPoolDtuLimit]
, [Leaf].[_ElasticPoolStorageLimit] AS [AzureSqlServer_ElasticPool_Resources_ElasticPoolStorageLimit]
FROM
 [SightedInstances]
LEFT OUTER JOIN
(
    SELECT [Id], MAX([CollectionDate]) as [GreatestMinDate]
    FROM [data].[AzureSqlServer_ElasticPool_Resources_StableSamples]
    WHERE [CollectionDate] <= @MinDate
    GROUP BY [Id]
)
[GreatestMinDates]
 ON [SightedInstances].[Id] = [GreatestMinDates].[Id]
INNER JOIN
 [data].[AzureSqlServer_ElasticPool_Resources_StableSamples] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
WHERE [Leaf].[CollectionDate] >= COALESCE([GreatestMinDates].[GreatestMinDate], @MinDate)
AND [Leaf].[CollectionDate] <= @MaxDate
GO
