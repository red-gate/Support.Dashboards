CREATE TABLE [alert].[Alert_Severity]
(
[AlertId] [bigint] NOT NULL,
[Date] [bigint] NOT NULL,
[Severity] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [alert].[Alert_Severity] ADD CONSTRAINT [Alert_Severity_AlertId_Date] PRIMARY KEY CLUSTERED  ([AlertId], [Date]) ON [PRIMARY]
GO
ALTER TABLE [alert].[Alert_Severity] ADD CONSTRAINT [Alert_Severity_Alert] FOREIGN KEY ([AlertId]) REFERENCES [alert].[Alert] ([AlertId]) ON DELETE CASCADE
GO
