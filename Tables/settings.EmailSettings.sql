CREATE TABLE [settings].[EmailSettings]
(
[Id] [int] NOT NULL,
[Server] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[Port] [int] NOT NULL,
[UseAuthentication] [bit] NOT NULL,
[UserName] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[Password] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[ConnectionSecurityMode] [int] NOT NULL,
[EmailFrom] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[GlobalAlertEmailEnable] [bit] NOT NULL,
[AlertEmailOnEnded] [bit] NOT NULL,
[WebUiPrefix] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[AlertEmailLimit] [int] NOT NULL CONSTRAINT [AlertEmailLimit_Default] DEFAULT ((30)),
[Encrypted] [bit] NOT NULL CONSTRAINT [Encrypted_Default] DEFAULT ((0)),
[NotificationLevel] [int] NOT NULL CONSTRAINT [NotificationLevel_Default] DEFAULT ((0)),
[EmailOnBaseMonitorError] [bit] NOT NULL CONSTRAINT [EmailOnBaseMonitorError_Default] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [settings].[EmailSettings] ADD CONSTRAINT [AlertEmailLimit_GreaterThanZero] CHECK (([AlertEmailLimit]>(0)))
GO
ALTER TABLE [settings].[EmailSettings] ADD CONSTRAINT [EmailSettings_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
