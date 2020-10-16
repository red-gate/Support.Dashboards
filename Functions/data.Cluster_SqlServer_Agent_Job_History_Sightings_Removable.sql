SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_Agent_Job_History_Sightings_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Agent_Job_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Agent_Job_History_Id AS BIGINT
    , @Cluster_SqlServer_Agent_Job_History_RunDate AS BIGINT
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_SqlServer_Agent_Job_History_Sightings].[SightingDate], [data].[Cluster_SqlServer_Agent_Job_History_Sightings].[Id]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
INNER JOIN [data].[Cluster_SqlServer_Agent_Job_Keys] ON [data].[Cluster_SqlServer_Agent_Job_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
INNER JOIN [data].[Cluster_SqlServer_Agent_Job_History_Keys] ON [data].[Cluster_SqlServer_Agent_Job_History_Keys].[ParentId] = [data].[Cluster_SqlServer_Agent_Job_Keys].[Id]
INNER JOIN [data].[Cluster_SqlServer_Agent_Job_History_Sightings] ON [data].[Cluster_SqlServer_Agent_Job_History_Sightings].[Id] = [data].[Cluster_SqlServer_Agent_Job_History_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
 AND  (@Cluster_SqlServer_Name IS NULL OR [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name)
 AND  (@Cluster_SqlServer_Agent_Job_Name IS NULL OR [data].[Cluster_SqlServer_Agent_Job_Keys].[_Name] = @Cluster_SqlServer_Agent_Job_Name)
 AND  (@Cluster_SqlServer_Agent_Job_History_Id IS NULL OR [data].[Cluster_SqlServer_Agent_Job_History_Keys].[_Id] = @Cluster_SqlServer_Agent_Job_History_Id)
 AND  (@Cluster_SqlServer_Agent_Job_History_RunDate IS NULL OR [data].[Cluster_SqlServer_Agent_Job_History_Keys].[_RunDate] = @Cluster_SqlServer_Agent_Job_History_RunDate)
GO
