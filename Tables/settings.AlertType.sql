CREATE TABLE [settings].[AlertType]
(
[Filter] [bigint] NOT NULL,
[AlertType] [bigint] NOT NULL,
[SubType] [bigint] NOT NULL CONSTRAINT [AlertType_SubType_DF] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [settings].[AlertType] ADD CONSTRAINT [AlertType_Filter_AlertType_SubType] PRIMARY KEY CLUSTERED  ([Filter], [AlertType], [SubType]) ON [PRIMARY]
GO
ALTER TABLE [settings].[AlertType] ADD CONSTRAINT [AlertType_InboxSavedFilter] FOREIGN KEY ([Filter]) REFERENCES [settings].[InboxSavedFilter] ([Id])
GO
