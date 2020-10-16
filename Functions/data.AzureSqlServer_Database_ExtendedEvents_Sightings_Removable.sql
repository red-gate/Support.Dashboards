SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [data].[AzureSqlServer_Database_ExtendedEvents_Sightings_Removable]
(
    @AzureSqlServer_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_Name AS NVARCHAR(450)
    , @AzureSqlServer_Database_ExtendedEvents_EventName AS NVARCHAR(450)
    , @AzureSqlServer_Database_ExtendedEvents_Sequence AS BIGINT
    , @AzureSqlServer_Database_ExtendedEvents_TimeStamp AS BIGINT
)
RETURNS TABLE
AS
RETURN

SELECT [data].[AzureSqlServer_Database_ExtendedEvents_Sightings].[SightingDate], [data].[AzureSqlServer_Database_ExtendedEvents_Sightings].[Id]
FROM [data].[AzureSqlServer_Keys]
INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[ParentId] = [data].[AzureSqlServer_Keys].[Id]
INNER JOIN [data].[AzureSqlServer_Database_ExtendedEvents_Keys] ON [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[ParentId] = [data].[AzureSqlServer_Database_Keys].[Id]
INNER JOIN [data].[AzureSqlServer_Database_ExtendedEvents_Sightings] ON [data].[AzureSqlServer_Database_ExtendedEvents_Sightings].[Id] = [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[Id]
 WHERE  (@AzureSqlServer_Name IS NULL OR [data].[AzureSqlServer_Keys].[_Name] = @AzureSqlServer_Name)
 AND  (@AzureSqlServer_Database_Name IS NULL OR [data].[AzureSqlServer_Database_Keys].[_Name] = @AzureSqlServer_Database_Name)
 AND  (@AzureSqlServer_Database_ExtendedEvents_EventName IS NULL OR [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[_EventName] = @AzureSqlServer_Database_ExtendedEvents_EventName)
 AND  (@AzureSqlServer_Database_ExtendedEvents_Sequence IS NULL OR [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[_Sequence] = @AzureSqlServer_Database_ExtendedEvents_Sequence)
 AND  (@AzureSqlServer_Database_ExtendedEvents_TimeStamp IS NULL OR [data].[AzureSqlServer_Database_ExtendedEvents_Keys].[_TimeStamp] = @AzureSqlServer_Database_ExtendedEvents_TimeStamp)
GO
