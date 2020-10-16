SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_AvailabilityGroup_Listener_StableSamples_Purgeable]
(
    @PurgeDate AS BIGINT
)
RETURNS TABLE
AS
RETURN

-- Purge stable samples before the last stable sample before the purge date.
SELECT [data].[Cluster_AvailabilityGroup_Listener_StableSamples].[Id], [data].[Cluster_AvailabilityGroup_Listener_StableSamples].[CollectionDate]
FROM
    (
        -- Only consider ids that have at least one sighting before the purge date.
        SELECT
            [Id]
            ,
            (
                SELECT TOP 1 [Dates].[CollectionDate]
                FROM [data].[Cluster_AvailabilityGroup_Listener_StableSamples] [Dates]
                 WHERE [Dates].[Id] = [SightedIds].[Id]
                 AND [Dates].[CollectionDate] <= @PurgeDate
                ORDER BY [Dates].[CollectionDate] DESC
            )
            AS [LastDate]
        FROM [data].[Cluster_AvailabilityGroup_Listener_Keys] [SightedIds]
        WHERE [CollectionDate] <= @PurgeDate
        GROUP BY [Id]
    )
    AS [SightedIdsWithLastDates]
INNER JOIN [data].[Cluster_AvailabilityGroup_Listener_StableSamples] ON [data].[Cluster_AvailabilityGroup_Listener_StableSamples].[Id] = [SightedIdsWithLastDates].[Id]
WHERE [data].[Cluster_AvailabilityGroup_Listener_StableSamples].[CollectionDate] < [SightedIdsWithLastDates].[LastDate]
GO
