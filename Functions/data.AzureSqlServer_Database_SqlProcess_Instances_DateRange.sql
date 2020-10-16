SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_SqlProcess_Instances_DateRange]
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
    FROM [data].[AzureSqlServer_Database_SqlProcess_Sightings]
    WHERE [data].[AzureSqlServer_Database_SqlProcess_Sightings].[SightingDate] >= @MinDate AND [data].[AzureSqlServer_Database_SqlProcess_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_Database_Name], [AzureSqlServer_Database_SqlProcess_LoginTime], [AzureSqlServer_Database_SqlProcess_SessionId]) AS
(
    SELECT [data].[AzureSqlServer_Database_SqlProcess_Keys].[Id]
    , [data].[AzureSqlServer_Database_SqlProcess_Keys].[ParentId]
    , [data].[AzureSqlServer_Database_SqlProcess_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
    , [data].[AzureSqlServer_Database_SqlProcess_Keys].[_LoginTime] AS [AzureSqlServer_Database_SqlProcess_LoginTime]
    , [data].[AzureSqlServer_Database_SqlProcess_Keys].[_SessionId] AS [AzureSqlServer_Database_SqlProcess_SessionId]
    FROM [SightedIds]
     INNER JOIN [data].[AzureSqlServer_Database_SqlProcess_Keys] ON [data].[AzureSqlServer_Database_SqlProcess_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_SqlProcess_Keys].[ParentId]
     INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
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
