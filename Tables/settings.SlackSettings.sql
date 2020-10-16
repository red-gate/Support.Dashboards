CREATE TABLE [settings].[SlackSettings]
(
[Id] [int] NOT NULL,
[Enable] [bit] NOT NULL,
[WebhookUrl] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[Channel] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[UserName] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[AlertOnEnded] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[SlackSettings] ADD CONSTRAINT [SlackSettings_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
