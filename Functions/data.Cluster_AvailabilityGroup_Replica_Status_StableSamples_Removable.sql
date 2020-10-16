SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_AvailabilityGroup_Replica_Status_StableSamples_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_AvailabilityGroup_Name AS NVARCHAR(450)
    , @Cluster_AvailabilityGroup_Replica_Name AS NVARCHAR(450)
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_AvailabilityGroup_Replica_Status_StableSamples].[Id], [data].[Cluster_AvailabilityGroup_Replica_Status_StableSamples].[CollectionDate]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_AvailabilityGroup_Keys] ON [data].[Cluster_AvailabilityGroup_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
INNER JOIN [data].[Cluster_AvailabilityGroup_Replica_Keys] ON [data].[Cluster_AvailabilityGroup_Replica_Keys].[ParentId] = [data].[Cluster_AvailabilityGroup_Keys].[Id]
INNER JOIN [data].[Cluster_AvailabilityGroup_Replica_Status_StableSamples] ON [data].[Cluster_AvailabilityGroup_Replica_Status_StableSamples].[Id] = [data].[Cluster_AvailabilityGroup_Replica_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
 AND  (@Cluster_AvailabilityGroup_Name IS NULL OR [data].[Cluster_AvailabilityGroup_Keys].[_Name] = @Cluster_AvailabilityGroup_Name)
 AND  (@Cluster_AvailabilityGroup_Replica_Name IS NULL OR [data].[Cluster_AvailabilityGroup_Replica_Keys].[_Name] = @Cluster_AvailabilityGroup_Replica_Name)
GO
