SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_ResourceGroup_StableSamples_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_ResourceGroup_Name AS NVARCHAR(450)
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_ResourceGroup_StableSamples].[Id], [data].[Cluster_ResourceGroup_StableSamples].[CollectionDate]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_ResourceGroup_Keys] ON [data].[Cluster_ResourceGroup_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
INNER JOIN [data].[Cluster_ResourceGroup_StableSamples] ON [data].[Cluster_ResourceGroup_StableSamples].[Id] = [data].[Cluster_ResourceGroup_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
 AND  (@Cluster_ResourceGroup_Name IS NULL OR [data].[Cluster_ResourceGroup_Keys].[_Name] = @Cluster_ResourceGroup_Name)
GO
