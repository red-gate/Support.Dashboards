SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_Database_SqlText_Instances_View] AS SELECT[data].[AzureSqlServer_Database_SqlText_Instances].[Id] AS [Id], [data].[AzureSqlServer_Database_SqlText_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_Database_SqlText_Instances].[_SqlText] AS [AzureSqlServer_Database_SqlText_SqlText], [data].[AzureSqlServer_Database_SqlText_Instances].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_SqlText_Instances].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name], [data].[AzureSqlServer_Database_SqlText_Keys].[_SqlHandle] AS [AzureSqlServer_Database_SqlText_SqlHandle] FROM [data].[AzureSqlServer_Database_SqlText_Instances] INNER JOIN [data].[AzureSqlServer_Database_SqlText_Keys] ON [data].[AzureSqlServer_Database_SqlText_Keys].[Id] = [data].[AzureSqlServer_Database_SqlText_Instances].[Id]
 INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_SqlText_Keys].[ParentId]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO
