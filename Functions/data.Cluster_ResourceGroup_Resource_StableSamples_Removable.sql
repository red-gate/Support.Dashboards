SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_ResourceGroup_Resource_StableSamples_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_ResourceGroup_Name AS NVARCHAR(450)
    , @Cluster_ResourceGroup_Resource_Name AS NVARCHAR(450)
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_ResourceGroup_Resource_StableSamples].[Id], [data].[Cluster_ResourceGroup_Resource_StableSamples].[CollectionDate]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_ResourceGroup_Keys] ON [data].[Cluster_ResourceGroup_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
INNER JOIN [data].[Cluster_ResourceGroup_Resource_Keys] ON [data].[Cluster_ResourceGroup_Resource_Keys].[ParentId] = [data].[Cluster_ResourceGroup_Keys].[Id]
INNER JOIN [data].[Cluster_ResourceGroup_Resource_StableSamples] ON [data].[Cluster_ResourceGroup_Resource_StableSamples].[Id] = [data].[Cluster_ResourceGroup_Resource_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
 AND  (@Cluster_ResourceGroup_Name IS NULL OR [data].[Cluster_ResourceGroup_Keys].[_Name] = @Cluster_ResourceGroup_Name)
 AND  (@Cluster_ResourceGroup_Resource_Name IS NULL OR [data].[Cluster_ResourceGroup_Resource_Keys].[_Name] = @Cluster_ResourceGroup_Resource_Name)
GO
