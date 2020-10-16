SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_ExtendedEvents_Keys_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_ExtendedEvents_EventName AS NVARCHAR(450)
    , @Cluster_SqlServer_ExtendedEvents_Sequence AS BIGINT
    , @Cluster_SqlServer_ExtendedEvents_TimeStamp AS BIGINT
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_SqlServer_ExtendedEvents_Keys].[Id]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
INNER JOIN [data].[Cluster_SqlServer_ExtendedEvents_Keys] ON [data].[Cluster_SqlServer_ExtendedEvents_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
 AND  (@Cluster_SqlServer_Name IS NULL OR [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name)
 AND  (@Cluster_SqlServer_ExtendedEvents_EventName IS NULL OR [data].[Cluster_SqlServer_ExtendedEvents_Keys].[_EventName] = @Cluster_SqlServer_ExtendedEvents_EventName)
 AND  (@Cluster_SqlServer_ExtendedEvents_Sequence IS NULL OR [data].[Cluster_SqlServer_ExtendedEvents_Keys].[_Sequence] = @Cluster_SqlServer_ExtendedEvents_Sequence)
 AND  (@Cluster_SqlServer_ExtendedEvents_TimeStamp IS NULL OR [data].[Cluster_SqlServer_ExtendedEvents_Keys].[_TimeStamp] = @Cluster_SqlServer_ExtendedEvents_TimeStamp)
GO
