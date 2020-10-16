SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration_View] AS SELECT[config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[Id] AS [Id], [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[_AlertType] AS [AzureSqlServer_ElasticPool_Database_AlertType], [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[_SubType] AS [AzureSqlServer_ElasticPool_Database_SubType], [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[_Configuration] AS [AzureSqlServer_ElasticPool_Database_Configuration], [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[_Enabled] AS [AzureSqlServer_ElasticPool_Database_Enabled], [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[_AlertNotification] AS [AzureSqlServer_ElasticPool_Database_AlertNotification], [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[_EmailAddress] AS [AzureSqlServer_ElasticPool_Database_EmailAddress], [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[_Version] AS [AzureSqlServer_ElasticPool_Database_Version], [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[_Comments] AS [AzureSqlServer_ElasticPool_Database_Comments], [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[_SlackEnabled] AS [AzureSqlServer_ElasticPool_Database_SlackEnabled], [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[_SnmpEnabled] AS [AzureSqlServer_ElasticPool_Database_SnmpEnabled], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_ElasticPool_Keys].[_Name] AS [AzureSqlServer_ElasticPool_Name], [data].[AzureSqlServer_ElasticPool_Database_Keys].[_Name] AS [AzureSqlServer_ElasticPool_Database_Name] FROM [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration] INNER JOIN [data].[AzureSqlServer_ElasticPool_Database_Keys] ON [data].[AzureSqlServer_ElasticPool_Database_Keys].[Id] = [config].[AzureSqlServer_ElasticPool_Database_AlertConfiguration].[Id]
 INNER JOIN [data].[AzureSqlServer_ElasticPool_Keys] ON [data].[AzureSqlServer_ElasticPool_Keys].[Id] = [data].[AzureSqlServer_ElasticPool_Database_Keys].[ParentId]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_ElasticPool_Keys].[ParentId]
;
GO