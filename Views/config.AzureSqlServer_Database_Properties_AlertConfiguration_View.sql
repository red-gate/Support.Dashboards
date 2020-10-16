SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [config].[AzureSqlServer_Database_Properties_AlertConfiguration_View] AS SELECT[config].[AzureSqlServer_Database_Properties_AlertConfiguration].[Id] AS [Id], [config].[AzureSqlServer_Database_Properties_AlertConfiguration].[_AlertType] AS [AzureSqlServer_Database_Properties_AlertType], [config].[AzureSqlServer_Database_Properties_AlertConfiguration].[_SubType] AS [AzureSqlServer_Database_Properties_SubType], [config].[AzureSqlServer_Database_Properties_AlertConfiguration].[_Configuration] AS [AzureSqlServer_Database_Properties_Configuration], [config].[AzureSqlServer_Database_Properties_AlertConfiguration].[_Enabled] AS [AzureSqlServer_Database_Properties_Enabled], [config].[AzureSqlServer_Database_Properties_AlertConfiguration].[_AlertNotification] AS [AzureSqlServer_Database_Properties_AlertNotification], [config].[AzureSqlServer_Database_Properties_AlertConfiguration].[_EmailAddress] AS [AzureSqlServer_Database_Properties_EmailAddress], [config].[AzureSqlServer_Database_Properties_AlertConfiguration].[_Version] AS [AzureSqlServer_Database_Properties_Version], [config].[AzureSqlServer_Database_Properties_AlertConfiguration].[_Comments] AS [AzureSqlServer_Database_Properties_Comments], [config].[AzureSqlServer_Database_Properties_AlertConfiguration].[_SlackEnabled] AS [AzureSqlServer_Database_Properties_SlackEnabled], [config].[AzureSqlServer_Database_Properties_AlertConfiguration].[_SnmpEnabled] AS [AzureSqlServer_Database_Properties_SnmpEnabled], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name], [data].[AzureSqlServer_Database_Keys].[_Name] AS [AzureSqlServer_Database_Name] FROM [config].[AzureSqlServer_Database_Properties_AlertConfiguration] INNER JOIN [data].[AzureSqlServer_Database_Keys] ON [data].[AzureSqlServer_Database_Keys].[Id] = [config].[AzureSqlServer_Database_Properties_AlertConfiguration].[Id]
 INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [data].[AzureSqlServer_Database_Keys].[ParentId]
;
GO
