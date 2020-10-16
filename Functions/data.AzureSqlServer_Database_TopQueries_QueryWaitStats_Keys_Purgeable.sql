SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys_Purgeable]
(
    @PurgeDate AS BIGINT
)
RETURNS TABLE
AS
RETURN

-- Purge all rows of all ids that have not been sighted after the purge date.
-- The cascade will handle the leaf tables for us.
SELECT
    [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys].[Id]
FROM
    [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys]
WHERE
    [CollectionDate] <= @PurgeDate
    AND [Id] NOT IN 
(
    SELECT
        [Id]
    FROM
        [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Sightings]
    WHERE
        [SightingDate] > @PurgeDate
)
GO
