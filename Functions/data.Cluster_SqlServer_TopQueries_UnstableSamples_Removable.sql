SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_TopQueries_UnstableSamples_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_TopQueries_DatabaseName AS NVARCHAR(450)
    , @Cluster_SqlServer_TopQueries_SqlHandle AS VARBINARY(900)
    , @Cluster_SqlServer_TopQueries_StatementEnd AS BIGINT
    , @Cluster_SqlServer_TopQueries_StatementStart AS BIGINT
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[Id], [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[CollectionDate]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
INNER JOIN [data].[Cluster_SqlServer_TopQueries_Keys] ON [data].[Cluster_SqlServer_TopQueries_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
INNER JOIN [data].[Cluster_SqlServer_TopQueries_UnstableSamples] ON [data].[Cluster_SqlServer_TopQueries_UnstableSamples].[Id] = [data].[Cluster_SqlServer_TopQueries_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
 AND  (@Cluster_SqlServer_Name IS NULL OR [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name)
 AND  (@Cluster_SqlServer_TopQueries_DatabaseName IS NULL OR [data].[Cluster_SqlServer_TopQueries_Keys].[_DatabaseName] = @Cluster_SqlServer_TopQueries_DatabaseName)
 AND  (@Cluster_SqlServer_TopQueries_SqlHandle IS NULL OR [data].[Cluster_SqlServer_TopQueries_Keys].[_SqlHandle] = @Cluster_SqlServer_TopQueries_SqlHandle)
 AND  (@Cluster_SqlServer_TopQueries_StatementEnd IS NULL OR [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementEnd] = @Cluster_SqlServer_TopQueries_StatementEnd)
 AND  (@Cluster_SqlServer_TopQueries_StatementStart IS NULL OR [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementStart] = @Cluster_SqlServer_TopQueries_StatementStart)
GO
