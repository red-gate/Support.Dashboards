SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples_Purgeable]
(
    @PurgeDate AS BIGINT
)
RETURNS TABLE
AS
RETURN

SELECT [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[Id], [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate]
FROM
    (
        -- Only consider ids that have at least one sighting before the purge date.
        SELECT
            [Id]
        FROM [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys] [SightedIds]
        WHERE [CollectionDate] <= @PurgeDate
        GROUP BY [Id]
    )
    AS [SightedIdsWithLastDates]
INNER JOIN [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples] ON [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[Id] = [SightedIdsWithLastDates].[Id]
WHERE [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples].[CollectionDate] <= @PurgeDate
GO
