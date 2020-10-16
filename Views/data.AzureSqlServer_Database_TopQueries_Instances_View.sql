SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [data].[AzureSqlServer_Database_TopQueries_Instances_View] AS SELECT[data].[AzureSqlServer_Database_TopQueries_Instances].[Id] AS [Id], [data].[AzureSqlServer_Database_TopQueries_Keys].[CollectionDate] AS [IdCollectionDate], [data].[AzureSqlServer_Database_TopQueries_Instances].[_QueryText] AS [AzureSqlServer_Database_TopQueries_QueryText], [data].[AzureSqlServer_Database_TopQueries_Instances].[CollectionDate] AS [CollectionDate], [utils].[TicksToDateTime]([data].[AzureSqlServer_Database_TopQueries_Instances].[CollectionDate]) AS [CollectionDate_DateTime], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name], [data].[AzureSqlServer_Database_TopQueries_Keys].[_DatabaseName] AS [AzureSqlServer_Database_TopQueries_DatabaseName], [data].[AzureSqlServer_Database_TopQueries_Keys].[_SqlHandle] AS [AzureSqlServer_Database_TopQueries_SqlHandle], [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementEnd] AS [AzureSqlServer_Database_TopQueries_StatementEnd], [data].[AzureSqlServer_Database_TopQueries_Keys].[_StatementStart] AS [AzureSqlServer_Database_TopQueries_StatementStart] FROM [data].[AzureSqlServer_Database_TopQueries_Instances] INNER JOIN [data].[AzureSqlServer_Database_TopQueries_Keys] ON [data].[AzureSqlServer_Database_TopQueries_Keys].[Id] = [data].[AzureSqlServer_Database_TopQueries_Instances].[Id]
 INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_TopQueries_Keys].[ParentId]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO
