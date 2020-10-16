SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration_View] AS SELECT[config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[Id] AS [Id], [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[_AlertType] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_AlertType], [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[_SubType] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_SubType], [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[_Configuration] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_Configuration], [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[_Enabled] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_Enabled], [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[_AlertNotification] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_AlertNotification], [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[_EmailAddress] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_EmailAddress], [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[_Version] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_Version], [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[_Comments] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_Comments], [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[_SlackEnabled] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_SlackEnabled], [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[_SnmpEnabled] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_SnmpEnabled], [data].[Cluster_Keys].[_Name] AS [Cluster_Name], [data].[Cluster_SqlServer_Keys].[_Name] AS [Cluster_SqlServer_Name], [data].[Cluster_SqlServer_TopQueries_Keys].[_DatabaseName] AS [Cluster_SqlServer_TopQueries_DatabaseName], [data].[Cluster_SqlServer_TopQueries_Keys].[_SqlHandle] AS [Cluster_SqlServer_TopQueries_SqlHandle], [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementEnd] AS [Cluster_SqlServer_TopQueries_StatementEnd], [data].[Cluster_SqlServer_TopQueries_Keys].[_StatementStart] AS [Cluster_SqlServer_TopQueries_StatementStart], [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[_WaitType] AS [Cluster_SqlServer_TopQueries_QueryWaitStats_WaitType] FROM [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration] INNER JOIN [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] ON [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[Id] = [config].[Cluster_SqlServer_TopQueries_QueryWaitStats_AlertConfiguration].[Id]
 INNER JOIN [data].[Cluster_SqlServer_TopQueries_Keys] ON [data].[Cluster_SqlServer_TopQueries_Keys].[Id] = [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys].[ParentId]
 INNER JOIN [data].[Cluster_SqlServer_Keys] ON [data].[Cluster_SqlServer_Keys].[Id] = [data].[Cluster_SqlServer_TopQueries_Keys].[ParentId]
 INNER JOIN [data].[Cluster_Keys] ON [data].[Cluster_Keys].[Id] = [data].[Cluster_SqlServer_Keys].[ParentId]
;
GO
