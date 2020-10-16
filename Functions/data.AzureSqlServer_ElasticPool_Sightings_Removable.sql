SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_ElasticPool_Sightings_Removable]
(
    @AzureSqlServer_Name AS NVARCHAR(450)
    , @AzureSqlServer_ElasticPool_Name AS NVARCHAR(450)
)
RETURNS TABLE
AS
RETURN

SELECT [data].[AzureSqlServer_ElasticPool_Sightings].[SightingDate], [data].[AzureSqlServer_ElasticPool_Sightings].[Id]
FROM [data].[AzureSqlServer_Keys]
INNER JOIN [data].[AzureSqlServer_ElasticPool_Keys] ON [data].[AzureSqlServer_ElasticPool_Keys].[ParentId] = [data].[AzureSqlServer_Keys].[Id]
INNER JOIN [data].[AzureSqlServer_ElasticPool_Sightings] ON [data].[AzureSqlServer_ElasticPool_Sightings].[Id] = [data].[AzureSqlServer_ElasticPool_Keys].[Id]
 WHERE  (@AzureSqlServer_Name IS NULL OR [data].[AzureSqlServer_Keys].[_Name] = @AzureSqlServer_Name)
 AND  (@AzureSqlServer_ElasticPool_Name IS NULL OR [data].[AzureSqlServer_ElasticPool_Keys].[_Name] = @AzureSqlServer_ElasticPool_Name)
GO
