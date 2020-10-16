SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_SqlProcess_Instances_InstanceDateRange]
(
    @AzureSqlServer_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_SqlProcess_LoginTime AS BIGINT
    , @AzureSqlServer_Database_SqlProcess_SessionId AS BIGINT
    , @MinDate AS BIGINT
    , @MaxDate AS BIGINT
    , @MaxSamples AS INT
)
RETURNS TABLE
AS
RETURN
WITH [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_Database_Name], [AzureSqlServer_Database_SqlProcess_LoginTime], [AzureSqlServer_Database_SqlProcess_SessionId]) AS
(
    SELECT [data].[AzureSqlServer_Database_SqlProcess_Keys].[Id]
    , [data].[AzureSqlServer_Database_SqlProcess_Keys].[ParentId]
    , [data].[AzureSqlServer_Database_SqlProcess_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
    , [data].[AzureSqlServer_Database_SqlProcess_Keys].[_LoginTime] AS [AzureSqlServer_Database_SqlProcess_LoginTime]
    , [data].[AzureSqlServer_Database_SqlProcess_Keys].[_SessionId] AS [AzureSqlServer_Database_SqlProcess_SessionId]
    FROM [data].[AzureSqlServer_Keys]
    INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[ParentId] = [data].[AzureSqlServer_Keys].[Id]
    INNER JOIN [data].[AzureSqlServer_Database_SqlProcess_Keys] ON [data].[AzureSqlServer_Database_SqlProcess_Keys].[ParentId] = [data].[AzureSqlServer_Database_Keys].[Id]
     WHERE [data].[AzureSqlServer_Keys].[_Name] = @AzureSqlServer_Name
     AND [data].[AzureSqlServer_Database_Keys].[_Name] = @AzureSqlServer_Database_Name
     AND [data].[AzureSqlServer_Database_SqlProcess_Keys].[_LoginTime] = @AzureSqlServer_Database_SqlProcess_LoginTime
     AND [data].[AzureSqlServer_Database_SqlProcess_Keys].[_SessionId] = @AzureSqlServer_Database_SqlProcess_SessionId
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[AzureSqlServer_Name]
, [SightedInstances].[AzureSqlServer_Database_Name]
, [SightedInstances].[AzureSqlServer_Database_SqlProcess_LoginTime]
, [utils].[TicksToDateTime]([SightedInstances].[AzureSqlServer_Database_SqlProcess_LoginTime]) AS [AzureSqlServer_Database_SqlProcess_LoginTime_DateTime]
, [SightedInstances].[AzureSqlServer_Database_SqlProcess_SessionId]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_Hostname] AS [AzureSqlServer_Database_SqlProcess_Hostname]
, [Leaf].[_LoginName] AS [AzureSqlServer_Database_SqlProcess_LoginName]
, [Leaf].[_ProgramName] AS [AzureSqlServer_Database_SqlProcess_ProgramName]
FROM
 [SightedInstances]
INNER JOIN
 [data].[AzureSqlServer_Database_SqlProcess_Instances] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
GO
