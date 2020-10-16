CREATE TABLE [alert].[Alert_Comment]
(
[CommentId] [bigint] NOT NULL IDENTITY(1, 1),
[AlertId] [bigint] NOT NULL,
[Author] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[Date] [bigint] NOT NULL,
[CommentText] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [alert].[Alert_Comment] ADD CONSTRAINT [Alert_Comment_CommentId] PRIMARY KEY CLUSTERED  ([CommentId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Alert_Comment_Date] ON [alert].[Alert_Comment] ([Date]) ON [PRIMARY]
GO
ALTER TABLE [alert].[Alert_Comment] ADD CONSTRAINT [Alert_Comment_Alert] FOREIGN KEY ([AlertId]) REFERENCES [alert].[Alert] ([AlertId]) ON DELETE CASCADE
GO
