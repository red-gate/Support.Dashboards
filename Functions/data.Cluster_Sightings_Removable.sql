SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_Sightings_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_Sightings].[SightingDate], [data].[Cluster_Sightings].[Id]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_Sightings] ON [data].[Cluster_Sightings].[Id] = [data].[Cluster_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
GO
