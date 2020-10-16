SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_Waits_Keys_DateRange]
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
    FROM [data].[AzureSqlServer_Database_Waits_Sightings]
    WHERE [data].[AzureSqlServer_Database_Waits_Sightings].[SightingDate] >= @MinDate AND [data].[AzureSqlServer_Database_Waits_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_Database_Name], [AzureSqlServer_Database_Waits_WaitType]) AS
(
    SELECT [data].[AzureSqlServer_Database_Waits_Keys].[Id]
    , [data].[AzureSqlServer_Database_Waits_Keys].[ParentId]
    , [data].[AzureSqlServer_Database_Waits_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
    , [data].[AzureSqlServer_Database_Waits_Keys].[_WaitType] AS [AzureSqlServer_Database_Waits_WaitType]
    FROM [SightedIds]
     INNER JOIN [data].[AzureSqlServer_Database_Waits_Keys] ON [data].[AzureSqlServer_Database_Waits_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_Waits_Keys].[ParentId]
     INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[AzureSqlServer_Name]
, [SightedInstances].[AzureSqlServer_Database_Name]
, [SightedInstances].[AzureSqlServer_Database_Waits_WaitType]
FROM
 [SightedInstances]
GO
