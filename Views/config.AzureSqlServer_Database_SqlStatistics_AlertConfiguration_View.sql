SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration_View] AS SELECT[config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[Id] AS [Id], [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[_AlertType] AS [AzureSqlServer_Database_SqlStatistics_AlertType], [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[_SubType] AS [AzureSqlServer_Database_SqlStatistics_SubType], [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[_Configuration] AS [AzureSqlServer_Database_SqlStatistics_Configuration], [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[_Enabled] AS [AzureSqlServer_Database_SqlStatistics_Enabled], [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[_AlertNotification] AS [AzureSqlServer_Database_SqlStatistics_AlertNotification], [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[_EmailAddress] AS [AzureSqlServer_Database_SqlStatistics_EmailAddress], [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[_Version] AS [AzureSqlServer_Database_SqlStatistics_Version], [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[_Comments] AS [AzureSqlServer_Database_SqlStatistics_Comments], [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[_SlackEnabled] AS [AzureSqlServer_Database_SqlStatistics_SlackEnabled], [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[_SnmpEnabled] AS [AzureSqlServer_Database_SqlStatistics_SnmpEnabled], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name] FROM [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration] INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [config].[AzureSqlServer_Database_SqlStatistics_AlertConfiguration].[Id]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO