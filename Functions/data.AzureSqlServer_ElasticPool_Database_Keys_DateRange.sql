SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_ElasticPool_Database_Keys_DateRange]
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
    FROM [data].[AzureSqlServer_ElasticPool_Database_Sightings]
    WHERE [data].[AzureSqlServer_ElasticPool_Database_Sightings].[SightingDate] >= @MinDate AND [data].[AzureSqlServer_ElasticPool_Database_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_ElasticPool_Name], [AzureSqlServer_ElasticPool_Database_Name]) AS
(
    SELECT [data].[AzureSqlServer_ElasticPool_Database_Keys].[Id]
    , [data].[AzureSqlServer_ElasticPool_Database_Keys].[ParentId]
    , [data].[AzureSqlServer_ElasticPool_Database_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_ElasticPool_Keys].[_Name] AS [AzureSqlServer_ElasticPool_Name]
    , [data].[AzureSqlServer_ElasticPool_Database_Keys].[_Name] AS [AzureSqlServer_ElasticPool_Database_Name]
    FROM [SightedIds]
     INNER JOIN [data].[AzureSqlServer_ElasticPool_Database_Keys] ON [data].[AzureSqlServer_ElasticPool_Database_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[AzureSqlServer_ElasticPool_Keys] ON [data].[AzureSqlServer_ElasticPool_Keys].[Id] = [data].[AzureSqlServer_ElasticPool_Database_Keys].[ParentId]
     INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_ElasticPool_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[AzureSqlServer_Name]
, [SightedInstances].[AzureSqlServer_ElasticPool_Name]
, [SightedInstances].[AzureSqlServer_ElasticPool_Database_Name]
FROM
 [SightedInstances]
GO
