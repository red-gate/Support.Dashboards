CREATE TABLE [config].[Group_AlertConfiguration]
(
[Id] [bigint] NOT NULL,
[_AlertType] [bigint] NOT NULL,
[_SubType] [bigint] NOT NULL CONSTRAINT [DF_Group_AlertConfiguration__SubType] DEFAULT ((0)),
[_Configuration] [xml] NOT NULL,
[_Enabled] [bit] NOT NULL,
[_AlertNotification] [bigint] NOT NULL,
[_EmailAddress] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[_Comments] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DF_Group_AlertConfiguration__Comments] DEFAULT (''),
[_Version] [bigint] NOT NULL,
[_SlackEnabled] [bit] NOT NULL CONSTRAINT [DF_Group_AlertConfiguration__SlackEnabled] DEFAULT ((1)),
[_SnmpEnabled] [bit] NOT NULL CONSTRAINT [DF_Group_AlertConfiguration__SnmpEnabled] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [config].[Group_AlertConfiguration] ADD CONSTRAINT [Group_AlertConfiguration_Id__AlertType__SubType] PRIMARY KEY CLUSTERED  ([Id], [_AlertType], [_SubType]) ON [PRIMARY]
GO
ALTER TABLE [config].[Group_AlertConfiguration] ADD CONSTRAINT [Group_AlertConfiguration_Group_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Group_Keys] ([Id]) ON DELETE CASCADE
GO
