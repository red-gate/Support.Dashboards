SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_Waits_Sightings_Purgeable]
(
    @PurgeDate AS BIGINT
)
RETURNS TABLE
AS
RETURN

SELECT [SightingDate], [Id]
FROM [data].[AzureSqlServer_Database_Waits_Sightings]
WHERE [SightingDate] <= @PurgeDate
GO