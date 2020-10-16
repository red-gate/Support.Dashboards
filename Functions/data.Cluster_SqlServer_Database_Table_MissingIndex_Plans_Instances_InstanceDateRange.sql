SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Database_Table_MissingIndex_Plans_Instances_InstanceDateRange]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_Schema AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns AS NVARCHAR(450)
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [Cluster_Name], [Cluster_SqlServer_Name], [Cluster_SqlServer_Database_Name], [Cluster_SqlServer_Database_Table_Name], [Cluster_SqlServer_Database_Table_Schema], [Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns], [Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns], [Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns]) AS
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
    FROM [data].[Cluster_Keys]
    INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Database_Table_Keys] ON [data].[Cluster_SqlServer_Database_Table_Keys].[ParentId] = [data].[Cluster_SqlServer_Database_Keys].[Id]
    INNER JOIN [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys] ON [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[ParentId] = [data].[Cluster_SqlServer_Database_Table_Keys].[Id]
     WHERE [data].[Cluster_Keys].[_Name] = @Cluster_Name
     AND [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name
     AND [data].[Cluster_SqlServer_Database_Keys].[_Name] = @Cluster_SqlServer_Database_Name
     AND [data].[Cluster_SqlServer_Database_Table_Keys].[_Name] = @Cluster_SqlServer_Database_Table_Name
     AND [data].[Cluster_SqlServer_Database_Table_Keys].[_Schema] = @Cluster_SqlServer_Database_Table_Schema
     AND [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_EqualityColumns] = @Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns
     AND [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_IncludedColumns] = @Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns
     AND [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_InequalityColumns] = @Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns
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
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_PlanHandle] AS [Cluster_SqlServer_Database_Table_MissingIndex_Plans_PlanHandle]
FROM
 [SightedInstances]
INNER JOIN
 [data].[Cluster_SqlServer_Database_Table_MissingIndex_Plans_Instances] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
GO
