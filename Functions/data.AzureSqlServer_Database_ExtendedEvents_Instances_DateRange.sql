SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_ExtendedEvents_Instances_DateRange]
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
    FROM [data].[AzureSqlServer_Database_ExtendedEvents_Sightings]
    WHERE [data].[AzureSqlServer_Database_ExtendedEvents_Sightings].[SightingDate] >= @MinDate AND [data].[AzureSqlServer_Database_ExtendedEvents_Sightings].[SightingDate] <= @MaxDate
)
, [SightedInstances]([Id], [ParentId], [IdCollectionDate], [AzureSqlServer_Name], [AzureSqlServer_Database_Name], [AzureSqlServer_Database_ExtendedEvents_EventName], [AzureSqlServer_Database_ExtendedEvents_Sequence], [AzureSqlServer_Database_ExtendedEvents_TimeStamp]) AS
(
    SELECT [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[Id]
    , [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[ParentId]
    , [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[CollectionDate] AS [IdCollectionDate]
    , [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name]
    , [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name]
    , [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[_EventName] AS [AzureSqlServer_Database_ExtendedEvents_EventName]
    , [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[_Sequence] AS [AzureSqlServer_Database_ExtendedEvents_Sequence]
    , [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[_TimeStamp] AS [AzureSqlServer_Database_ExtendedEvents_TimeStamp]
    FROM [SightedIds]
     INNER JOIN [data].[AzureSqlServer_Database_ExtendedEvents_Keys] ON [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[Id] = [SightedIds].[Id]
     INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[ParentId]
     INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
)
SELECT
[SightedInstances].[Id]
, [SightedInstances].[ParentId]
, [SightedInstances].[IdCollectionDate]
, [utils].[TicksToDateTime]([SightedInstances].[IdCollectionDate]) AS [IdCollectionDate_DateTime]
, [SightedInstances].[AzureSqlServer_Name]
, [SightedInstances].[AzureSqlServer_Database_Name]
, [SightedInstances].[AzureSqlServer_Database_ExtendedEvents_EventName]
, [SightedInstances].[AzureSqlServer_Database_ExtendedEvents_Sequence]
, [SightedInstances].[AzureSqlServer_Database_ExtendedEvents_TimeStamp]
, [utils].[TicksToDateTime]([SightedInstances].[AzureSqlServer_Database_ExtendedEvents_TimeStamp]) AS [AzureSqlServer_Database_ExtendedEvents_TimeStamp_DateTime]
, [Leaf].[CollectionDate]
, [utils].[TicksToDateTime]([Leaf].[CollectionDate]) AS [CollectionDate_DateTime]
, [Leaf].[_EventData] AS [AzureSqlServer_Database_ExtendedEvents_EventData]
, [Leaf].[_FileName] AS [AzureSqlServer_Database_ExtendedEvents_FileName]
, [Leaf].[_FileOffset] AS [AzureSqlServer_Database_ExtendedEvents_FileOffset]
FROM
 [SightedInstances]
INNER JOIN
 [data].[AzureSqlServer_Database_ExtendedEvents_Instances] [Leaf]
 ON [SightedInstances].[Id] = [Leaf].[Id]
GO
