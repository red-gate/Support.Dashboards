SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[Cluster_SqlServer_QueryPlans_Keys_Removable]
(
    @Cluster_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_Name AS NVARCHAR(450)
    , @Cluster_SqlServer_QueryPlans_PlanHandle AS VARBINARY(900)
)
RETURNS TABLE
AS
RETURN

SELECT [data].[Cluster_SqlServer_QueryPlans_Keys].[Id]
FROM [data].[Cluster_Keys]
INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[ParentId] = [data].[Cluster_Keys].[Id]
INNER JOIN [data].[Cluster_SqlServer_QueryPlans_Keys] ON [data].[Cluster_SqlServer_QueryPlans_Keys].[ParentId] = [data].[Cluster_SqlServer_Keys].[Id]
 WHERE  (@Cluster_Name IS NULL OR [data].[Cluster_Keys].[_Name] = @Cluster_Name)
 AND  (@Cluster_SqlServer_Name IS NULL OR [data].[Cluster_SqlServer_Keys].[_Name] = @Cluster_SqlServer_Name)
 AND  (@Cluster_SqlServer_QueryPlans_PlanHandle IS NULL OR [data].[Cluster_SqlServer_QueryPlans_Keys].[_PlanHandle] = @Cluster_SqlServer_QueryPlans_PlanHandle)
GO
