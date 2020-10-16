SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Database_File_Projection_UnstableSamples_Purgeable]
(
    @PurgeDate AS BIGINT
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_SqlServer_Database_File_Projection_UnstableSamples].[Id], [data].[Cluster_SqlServer_Database_File_Projection_UnstableSamples].[CollectionDate]
FROM
    (
        -- Only consider ids that have at least one sighting before the purge date.
        SELECT
            [Id]
        FROM [data].[Cluster_SqlServer_Database_File_Keys] [SightedIds]
        WHERE [CollectionDate] <= @PurgeDate
        GROUP BY [Id]
    )
    AS [SightedIdsWithLastDates]
INNER JOIN [data].[Cluster_SqlServer_Database_File_Projection_UnstableSamples] ON [data].[Cluster_SqlServer_Database_File_Projection_UnstableSamples].[Id] = [SightedIdsWithLastDates].[Id]
WHERE [data].[Cluster_SqlServer_Database_File_Projection_UnstableSamples].[CollectionDate] <= @PurgeDate
GO
