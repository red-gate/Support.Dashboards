SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration_View] AS SELECT[config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[Id] AS [Id], [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[_AlertType] AS [Cluster_SqlServer_Database_CustomMetric_AlertType], [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[_SubType] AS [Cluster_SqlServer_Database_CustomMetric_SubType], [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[_Configuration] AS [Cluster_SqlServer_Database_CustomMetric_Configuration], [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[_Enabled] AS [Cluster_SqlServer_Database_CustomMetric_Enabled], [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[_AlertNotification] AS [Cluster_SqlServer_Database_CustomMetric_AlertNotification], [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[_EmailAddress] AS [Cluster_SqlServer_Database_CustomMetric_EmailAddress], [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[_Version] AS [Cluster_SqlServer_Database_CustomMetric_Version], [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[_Comments] AS [Cluster_SqlServer_Database_CustomMetric_Comments], [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[_SlackEnabled] AS [Cluster_SqlServer_Database_CustomMetric_SlackEnabled], [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[_SnmpEnabled] AS [Cluster_SqlServer_Database_CustomMetric_SnmpEnabled], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_Database_Keys].[_Name] AS [Cluster_SqlServer_Database_Name], [data].[Cluster_SqlServer_Database_CustomMetric_Keys].[_MetricId] AS [Cluster_SqlServer_Database_CustomMetric_MetricId] FROM [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration] INNER JOIN [data].[Cluster_SqlServer_Database_CustomMetric_Keys] ON [data].[Cluster_SqlServer_Database_CustomMetric_Keys].[Id] = [config].[Cluster_SqlServer_Database_CustomMetric_AlertConfiguration].[Id]
 INNER JOIN [data].[Cluster_SqlServer_Database_Keys] ON [data].[Cluster_SqlServer_Database_Keys].[Id] = [data].[Cluster_SqlServer_Database_CustomMetric_Keys].[ParentId]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_Database_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
