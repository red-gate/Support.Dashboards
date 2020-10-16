SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [config].[AzureSqlServer_Ping_AlertConfiguration_View] AS SELECT[config].[AzureSqlServer_Ping_AlertConfiguration].[Id] AS [Id], [config].[AzureSqlServer_Ping_AlertConfiguration].[_AlertType] AS [AzureSqlServer_Ping_AlertType], [config].[AzureSqlServer_Ping_AlertConfiguration].[_SubType] AS [AzureSqlServer_Ping_SubType], [config].[AzureSqlServer_Ping_AlertConfiguration].[_Configuration] AS [AzureSqlServer_Ping_Configuration], [config].[AzureSqlServer_Ping_AlertConfiguration].[_Enabled] AS [AzureSqlServer_Ping_Enabled], [config].[AzureSqlServer_Ping_AlertConfiguration].[_AlertNotification] AS [AzureSqlServer_Ping_AlertNotification], [config].[AzureSqlServer_Ping_AlertConfiguration].[_EmailAddress] AS [AzureSqlServer_Ping_EmailAddress], [config].[AzureSqlServer_Ping_AlertConfiguration].[_Version] AS [AzureSqlServer_Ping_Version], [config].[AzureSqlServer_Ping_AlertConfiguration].[_Comments] AS [AzureSqlServer_Ping_Comments], [config].[AzureSqlServer_Ping_AlertConfiguration].[_SlackEnabled] AS [AzureSqlServer_Ping_SlackEnabled], [config].[AzureSqlServer_Ping_AlertConfiguration].[_SnmpEnabled] AS [AzureSqlServer_Ping_SnmpEnabled], [data].[AzureSqlServer_Keys].[_Name] AS [AzureSqlServer_Name] FROM [config].[AzureSqlServer_Ping_AlertConfiguration] INNER JOIN [data].[AzureSqlServer_Keys] ON [data].[AzureSqlServer_Keys].[Id] = [config].[AzureSqlServer_Ping_AlertConfiguration].[Id]
;
GO