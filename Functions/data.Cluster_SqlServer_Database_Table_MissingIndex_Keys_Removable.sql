SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_Schema AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns AS NVARCHAR(450)
    , @Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns AS NVARCHAR(450)
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[Id]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
INNER JOIN [data].[Cluster_SqlServer_Database_Table_Keys] ON [data].[Cluster_SqlServer_Database_Table_Keys].[ParentId] = [data].[Cluster_SqlServer_Database_Keys].[Id]
INNER JOIN [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys] ON [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[ParentId] = [data].[Cluster_SqlServer_Database_Table_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
 AND  (@Cluster_SqlServer_Name IS NULL OR [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name)
 AND  (@Cluster_SqlServer_Database_Name IS NULL OR [data].[Cluster_SqlServer_Database_Keys].[_Name] = @Cluster_SqlServer_Database_Name)
 AND  (@Cluster_SqlServer_Database_Table_Name IS NULL OR [data].[Cluster_SqlServer_Database_Table_Keys].[_Name] = @Cluster_SqlServer_Database_Table_Name)
 AND  (@Cluster_SqlServer_Database_Table_Schema IS NULL OR [data].[Cluster_SqlServer_Database_Table_Keys].[_Schema] = @Cluster_SqlServer_Database_Table_Schema)
 AND  (@Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns IS NULL OR [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_EqualityColumns] = @Cluster_SqlServer_Database_Table_MissingIndex_EqualityColumns)
 AND  (@Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns IS NULL OR [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_IncludedColumns] = @Cluster_SqlServer_Database_Table_MissingIndex_IncludedColumns)
 AND  (@Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns IS NULL OR [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys].[_InequalityColumns] = @Cluster_SqlServer_Database_Table_MissingIndex_InequalityColumns)
GO
