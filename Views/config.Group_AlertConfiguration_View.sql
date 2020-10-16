SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [config].[Group_AlertConfiguration_View] AS SELECT[config].[Group_AlertConfiguration].[Id] AS [Id], [config].[Group_AlertConfiguration].[_AlertType] AS [Group_AlertType], [config].[Group_AlertConfiguration].[_SubType] AS [Group_SubType], [config].[Group_AlertConfiguration].[_Configuration] AS [Group_Configuration], [config].[Group_AlertConfiguration].[_Enabled] AS [Group_Enabled], [config].[Group_AlertConfiguration].[_AlertNotification] AS [Group_AlertNotification], [config].[Group_AlertConfiguration].[_EmailAddress] AS [Group_EmailAddress], [config].[Group_AlertConfiguration].[_Version] AS [Group_Version], [config].[Group_AlertConfiguration].[_Comments] AS [Group_Comments], [config].[Group_AlertConfiguration].[_SlackEnabled] AS [Group_SlackEnabled], [config].[Group_AlertConfiguration].[_SnmpEnabled] AS [Group_SnmpEnabled], [data].[Group_Keys].[_Name] AS [Group_Name] FROM [config].[Group_AlertConfiguration] INNER JOIN [data].[Group_Keys] ON [data].[Group_Keys].[Id] = [config].[Group_AlertConfiguration].[Id]
;
GO
