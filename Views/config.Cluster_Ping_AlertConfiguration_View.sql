SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [config].[Cluster_Ping_AlertConfiguration_View] AS SELECT[config].[Cluster_Ping_AlertConfiguration].[Id] AS [Id], [config].[Cluster_Ping_AlertConfiguration].[_AlertType] AS [Cluster_Ping_AlertType], [config].[Cluster_Ping_AlertConfiguration].[_SubType] AS [Cluster_Ping_SubType], [config].[Cluster_Ping_AlertConfiguration].[_Configuration] AS [Cluster_Ping_Configuration], [config].[Cluster_Ping_AlertConfiguration].[_Enabled] AS [Cluster_Ping_Enabled], [config].[Cluster_Ping_AlertConfiguration].[_AlertNotification] AS [Cluster_Ping_AlertNotification], [config].[Cluster_Ping_AlertConfiguration].[_EmailAddress] AS [Cluster_Ping_EmailAddress], [config].[Cluster_Ping_AlertConfiguration].[_Version] AS [Cluster_Ping_Version], [config].[Cluster_Ping_AlertConfiguration].[_Comments] AS [Cluster_Ping_Comments], [config].[Cluster_Ping_AlertConfiguration].[_SlackEnabled] AS [Cluster_Ping_SlackEnabled], [config].[Cluster_Ping_AlertConfiguration].[_SnmpEnabled] AS [Cluster_Ping_SnmpEnabled], [data].[Cluster_Keys].[_Name] AS [Cluster_Name] FROM [config].[Cluster_Ping_AlertConfiguration] INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [config].[Cluster_Ping_AlertConfiguration].[Id]
;
GO
