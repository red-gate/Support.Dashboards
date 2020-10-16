SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_Ping_UnstableSamples_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_Ping_UnstableSamples].[Id], [data].[Cluster_Ping_UnstableSamples].[CollectionDate]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_Ping_UnstableSamples] ON [data].[Cluster_Ping_UnstableSamples].[Id] = [data].[Cluster_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
GO
