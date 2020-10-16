SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Agent_Job_History_Keys_Purgeable]
(
    @PurgeDate AS BIGINT
)
RETURNS TABLE
AS
RETURN

-- Purge all rows of all ids that have not been sighted after the purge date.
-- The cascade will handle the leaf tables for us.
SELECT
    [data].[Cluster_SqlServer_Agent_Job_History_Keys].[Id]
FROM
    [data].[Cluster_SqlServer_Agent_Job_History_Keys]
WHERE
    [_RunDate] <= @PurgeDate
    AND [Id] NOT IN 
(
    SELECT
        [Id]
    FROM
        [data].[Cluster_SqlServer_Agent_Job_History_Sightings]
    WHERE
        [SightingDate] > @PurgeDate
)
GO
