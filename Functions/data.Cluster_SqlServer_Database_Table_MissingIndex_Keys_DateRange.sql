SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys_DateRange]
(
    @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedIds]([Id]) AS
(
    SELECT DISTINCT [Id]
    FROM [data].[Cluster_SqlServer_Database_Table_MissingIndex_Sightings]
    WHERE [data].[Cluster_SqlServer_Database_Table_MissingIndex_Sightings].[SightingDate] >= @MinDate AND [data].[Cluster_SqlServer_Database_Table_MissingIndex_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Database_Name], [Cluster_SqlServer_Database_Table_Name], [Cluster_SqlServer_Database_Table_Schema], [Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns], [Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns], [Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns]) AS
(
    SELECT [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[Id]
    , [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[ParentId]
    , [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[Cluster_Keys].[_Name] AS [Cluster_Name]
    , [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name]
    , [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [Cluster_SqlServer_Database_Name]
    , [data].[Cluster_SqlServer_Database_Table_Keys].[_Name] AS [Cluster_SqlServer_Database_Table_Name]
    , [data].[Cluster_SqlServer_Database_Table_Keys].[_Schema] AS [Cluster_SqlServer_Database_Table_Schema]
    , [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_EqualityColumns] AS [Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns]
    , [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_IncludedColumns] AS [Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns]
    , [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_InequalityColumns] AS [Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns]
    FROM [SightedIds]
     INNER JOIN [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys] ON [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[Cluster_SqlServer_Database_Table_Keys] ON [data].[Cluster_SqlServer_Database_Table_Keys].[Id] = [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[ParentId]
     INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[Id] = [data].[Cluster_SqlServer_Database_Table_Keys].[ParentId]
     INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Database_Keys].[ParentId]
     INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[Cluster_Name]
, [SightedInstances].[Cluster_SqlServer_Name]
, [SightedInstances].[Cluster_SqlServer_Database_Name]
, [SightedInstances].[Cluster_SqlServer_Database_Table_Name]
, [SightedInstances].[Cluster_SqlServer_Database_Table_Schema]
, [SightedInstances].[Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns]
, [SightedInstances].[Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns]
, [SightedInstances].[Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns]
FROM
 [SightedInstances]
GO
