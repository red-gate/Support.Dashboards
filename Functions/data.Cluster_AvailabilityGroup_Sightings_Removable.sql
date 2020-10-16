SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_AvailabilityGroup_Sightings_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_AvailabilityGroup_Name AS NVARCHAR(450)
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_AvailabilityGroup_Sightings].[SightingDate], [data].[Cluster_AvailabilityGroup_Sightings].[Id]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_AvailabilityGroup_Keys] ON [data].[Cluster_AvailabilityGroup_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
INNER JOIN [data].[Cluster_AvailabilityGroup_Sightings] ON [data].[Cluster_AvailabilityGroup_Sightings].[Id] = [data].[Cluster_AvailabilityGroup_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
 AND  (@Cluster_AvailabilityGroup_Name IS NULL OR [data].[Cluster_AvailabilityGroup_Keys].[_Name] = @Cluster_AvailabilityGroup_Name)
GO
