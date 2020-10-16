SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_Machine_Network_Sightings_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_Machine_Name AS NVARCHAR(450)
    , @Cluster_Machine_Network_Name AS NVARCHAR(450)
    , @Cluster_Machine_Network_SequenceNumber AS BIGINT
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_Machine_Network_Sightings].[SightingDate], [data].[Cluster_Machine_Network_Sightings].[Id]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_Machine_Keys] ON [data].[Cluster_Machine_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
INNER JOIN [data].[Cluster_Machine_Network_Keys] ON [data].[Cluster_Machine_Network_Keys].[ParentId] = [data].[Cluster_Machine_Keys].[Id]
INNER JOIN [data].[Cluster_Machine_Network_Sightings] ON [data].[Cluster_Machine_Network_Sightings].[Id] = [data].[Cluster_Machine_Network_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
 AND  (@Cluster_Machine_Name IS NULL OR [data].[Cluster_Machine_Keys].[_Name] = @Cluster_Machine_Name)
 AND  (@Cluster_Machine_Network_Name IS NULL OR [data].[Cluster_Machine_Network_Keys].[_Name] = @Cluster_Machine_Network_Name)
 AND  (@Cluster_Machine_Network_SequenceNumber IS NULL OR [data].[Cluster_Machine_Network_Keys].[_SequenceNumber] = @Cluster_Machine_Network_SequenceNumber)
GO
