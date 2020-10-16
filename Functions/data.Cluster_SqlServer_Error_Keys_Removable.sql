SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Error_Keys_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Error_LogDate AS BIGINT
    , @Cluster_SqlServer_Error_SequenceNumber AS BIGINT
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_SqlServer_Error_Keys].[Id]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
INNER JOIN [data].[Cluster_SqlServer_Error_Keys] ON [data].[Cluster_SqlServer_Error_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
 AND  (@Cluster_SqlServer_Name IS NULL OR [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name)
 AND  (@Cluster_SqlServer_Error_LogDate IS NULL OR [data].[Cluster_SqlServer_Error_Keys].[_LogDate] = @Cluster_SqlServer_Error_LogDate)
 AND  (@Cluster_SqlServer_Error_SequenceNumber IS NULL OR [data].[Cluster_SqlServer_Error_Keys].[_SequenceNumber] = @Cluster_SqlServer_Error_SequenceNumber)
GO
