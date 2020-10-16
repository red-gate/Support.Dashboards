CREATE TABLE [alert].[Notifications]
(
[AlertId] [bigint] NOT NULL,
[SeverityDate] [bigint] NOT NULL,
[NotificationDate] [bigint] NOT NULL,
[NotificationType] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [alert].[Notifications] ADD CONSTRAINT [Alert_Notifications_Idx] PRIMARY KEY CLUSTERED  ([AlertId], [SeverityDate], [NotificationDate], [NotificationType]) ON [PRIMARY]
GO
ALTER TABLE [alert].[Notifications] ADD CONSTRAINT [Alert_Notifications_Severity] FOREIGN KEY ([AlertId], [SeverityDate]) REFERENCES [alert].[Alert_Severity] ([AlertId], [Date]) ON DELETE CASCADE
GO
