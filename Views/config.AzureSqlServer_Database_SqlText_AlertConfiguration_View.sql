SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [config].[AzureSqlServer_Database_SqlText_AlertConfiguration_View] AS SELECT[config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[Id] AS [Id], [config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[_AlertType] AS [AzureSqlServer_Database_SqlText_AlertType], [config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[_SubType] AS [AzureSqlServer_Database_SqlText_SubType], [config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[_Configuration] AS [AzureSqlServer_Database_SqlText_Configuration], [config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[_Enabled] AS [AzureSqlServer_Database_SqlText_Enabled], [config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[_AlertNotification] AS [AzureSqlServer_Database_SqlText_AlertNotification], [config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[_EmailAddress] AS [AzureSqlServer_Database_SqlText_EmailAddress], [config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[_Version] AS [AzureSqlServer_Database_SqlText_Version], [config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[_Comments] AS [AzureSqlServer_Database_SqlText_Comments], [config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[_SlackEnabled] AS [AzureSqlServer_Database_SqlText_SlackEnabled], [config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[_SnmpEnabled] AS [AzureSqlServer_Database_SqlText_SnmpEnabled], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name], [data].[AzureSqlServer_Database_SqlText_Keys].[_SqlHandle] AS [AzureSqlServer_Database_SqlText_SqlHandle] FROM [config].[AzureSqlServer_Database_SqlText_AlertConfiguration] INNER JOIN [data].[AzureSqlServer_Database_SqlText_Keys] ON [data].[AzureSqlServer_Database_SqlText_Keys].[Id] = [config].[AzureSqlServer_Database_SqlText_AlertConfiguration].[Id]
 INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [data].[AzureSqlServer_Database_SqlText_Keys].[ParentId]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO