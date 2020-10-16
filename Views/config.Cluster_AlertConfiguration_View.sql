SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [config].[Cluster_AlertConfiguration_View] AS SELECT[config].[Cluster_AlertConfiguration].[Id] AS [Id], [config].[Cluster_AlertConfiguration].[_AlertType] AS [Cluster_AlertType], [config].[Cluster_AlertConfiguration].[_SubType] AS [Cluster_SubType], [config].[Cluster_AlertConfiguration].[_Configuration] AS [Cluster_Configuration], [config].[Cluster_AlertConfiguration].[_Enabled] AS [Cluster_Enabled], [config].[Cluster_AlertConfiguration].[_AlertNotification] AS [Cluster_AlertNotification], [config].[Cluster_AlertConfiguration].[_EmailAddress] AS [Cluster_EmailAddress], [config].[Cluster_AlertConfiguration].[_Version] AS [Cluster_Version], [config].[Cluster_AlertConfiguration].[_Comments] AS [Cluster_Comments], [config].[Cluster_AlertConfiguration].[_SlackEnabled] AS [Cluster_SlackEnabled], [config].[Cluster_AlertConfiguration].[_SnmpEnabled] AS [Cluster_SnmpEnabled], [data].[Cluster_Keys].[_Name] AS [Cluster_Name] FROM [config].[Cluster_AlertConfiguration] INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [config].[Cluster_AlertConfiguration].[Id]
;
GO
