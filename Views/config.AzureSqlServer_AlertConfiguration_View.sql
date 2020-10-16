SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [config].[AzureSqlServer_AlertConfiguration_View] AS SELECT[config].[AzureSqlServer_AlertConfiguration].[Id] AS [Id], [config].[AzureSqlServer_AlertConfiguration].[_AlertType] AS [AzureSqlServer_AlertType], [config].[AzureSqlServer_AlertConfiguration].[_SubType] AS [AzureSqlServer_SubType], [config].[AzureSqlServer_AlertConfiguration].[_Configuration] AS [AzureSqlServer_Configuration], [config].[AzureSqlServer_AlertConfiguration].[_Enabled] AS [AzureSqlServer_Enabled], [config].[AzureSqlServer_AlertConfiguration].[_AlertNotification] AS [AzureSqlServer_AlertNotification], [config].[AzureSqlServer_AlertConfiguration].[_EmailAddress] AS [AzureSqlServer_EmailAddress], [config].[AzureSqlServer_AlertConfiguration].[_Version] AS [AzureSqlServer_Version], [config].[AzureSqlServer_AlertConfiguration].[_Comments] AS [AzureSqlServer_Comments], [config].[AzureSqlServer_AlertConfiguration].[_SlackEnabled] AS [AzureSqlServer_SlackEnabled], [config].[AzureSqlServer_AlertConfiguration].[_SnmpEnabled] AS [AzureSqlServer_SnmpEnabled], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name] FROM [config].[AzureSqlServer_AlertConfiguration] INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [config].[AzureSqlServer_AlertConfiguration].[Id]
;
GO
