SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_StableSamples_DateRange]
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
    FROM [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Sightings]
    WHERE [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Sightings].[SightingDate] >= @MinDate AND [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_Database_Name], [AzureSqlServer_Database_TopQueries_DatabaseName], [AzureSqlServer_Database_TopQueries_SqlHandle], [AzureSqlServer_Database_TopQueries_StatementEnd], [AzureSqlServer_Database_TopQueries_StatementStart], [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType]) AS
(
    SELECT [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[Id]
    , [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[ParentId]
    , [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_DatabaseName] AS [AzureSqlServer_Database_TopQueries_DatabaseName]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_SqlHandle] AS [AzureSqlServer_Database_TopQueries_SqlHandle]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementEnd] AS [AzureSqlServer_Database_TopQueries_StatementEnd]
    , [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementStart] AS [AzureSqlServer_Database_TopQueries_StatementStart]
    , [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[_WaitType] AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType]
    FROM [SightedIds]
     INNER JOIN [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys] ON [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[AzureSqlServer_Database_TopQueries_Keys] ON [data].[AzureSqlServer_Database_TopQueries_Keys].[Id] = [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[ParentId]
     INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_TopQueries_Keys].[ParentId]
     INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[AzureSqlServer_Name]
, [SightedInstances].[AzureSqlServer_Database_Name]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_DatabaseName]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_SqlHandle]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_StatementEnd]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_StatementStart]
, [SightedInstances].[AzureSqlServer_Database_TopQueries_QueryWaitStats_WaitType]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_LoginName] AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_LoginName]
, [Leaf].[_ProgramName] AS [AzureSqlServer_Database_TopQueries_QueryWaitStats_ProgramName]
FROM
 [SightedInstances]
LEFT OUTER JOIN
(
    SELECT [Id], MAX([CollectionDate]) as [GreatestMinDate]
    FROM [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_StableSamples]
    WHERE [CollectionDate] <= @MinDate
    GROUP BY [Id]
)
[GreatestMinDates]
 ON [SightedInstances].[Id] = [GreatestMinDates].[Id]
INNER JOIN
 [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_StableSamples] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
WHERE [Leaf].[CollectionDate] >= COALESCE([GreatestMinDates].[GreatestMinDate], @MinDate)
AND [Leaf].[CollectionDate] <= @MaxDate
GO
