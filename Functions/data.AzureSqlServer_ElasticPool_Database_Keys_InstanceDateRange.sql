SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_ElasticPool_Database_Keys_InstanceDateRange]
(
    @AzureSqlServer_Name AS NVARCHAR(450)
    , @AzureSqlServer_ElasticPool_Name AS NVARCHAR(450)
    , @AzureSqlServer_ElasticPool_Database_Name AS NVARCHAR(450)
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_ElasticPool_Name], [AzureSqlServer_ElasticPool_Database_Name]) AS
(
    SELECT [data].[AzureSqlServer_ElasticPool_Database_Keys].[Id]
    , [data].[AzureSqlServer_ElasticPool_Database_Keys].[ParentId]
    , [data].[AzureSqlServer_ElasticPool_Database_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_ElasticPool_Keys].[_Name] AS [AzureSqlServer_ElasticPool_Name]
    , [data].[AzureSqlServer_ElasticPool_Database_Keys].[_Name] AS [AzureSqlServer_ElasticPool_Database_Name]
    FROM [data].[AzureSqlServer_Keys]
    INNER JOIN [data].[AzureSqlServer_ElasticPool_Keys] ON [data].[AzureSqlServer_ElasticPool_Keys].[ParentId] = [data].[AzureSqlServer_Keys].[Id]
    INNER JOIN [data].[AzureSqlServer_ElasticPool_Database_Keys] ON [data].[AzureSqlServer_ElasticPool_Database_Keys].[ParentId] = [data].[AzureSqlServer_ElasticPool_Keys].[Id]
     WHERE [data].[AzureSqlServer_Keys].[_Name] = @AzureSqlServer_Name
     AND [data].[AzureSqlServer_ElasticPool_Keys].[_Name] = @AzureSqlServer_ElasticPool_Name
     AND [data].[AzureSqlServer_ElasticPool_Database_Keys].[_Name] = @AzureSqlServer_ElasticPool_Database_Name
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
