CREATE TABLE [settings].[InboxSavedFilter]
(
[Id] [bigint] NOT NULL,
[Name] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[AlertTypeRestricted] [bit] NOT NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[LastTimeSpan] [bigint] NULL,
[IncludeCleared] [bit] NOT NULL,
[IncludeNonCleared] [bit] NOT NULL,
[IncludeRead] [bit] NOT NULL,
[IncludeUnRead] [bit] NOT NULL,
[IncludeEvent] [bit] NOT NULL,
[IncludeActiveContinous] [bit] NOT NULL,
[IncludeFinishedContinous] [bit] NOT NULL,
[IncludeWithComments] [bit] NOT NULL,
[IncludeWithoutComments] [bit] NOT NULL,
[IncludeMonitoring] [bit] NOT NULL,
[IncludeNonMonitoring] [bit] NOT NULL,
[ExcludedSeverities] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[InboxSavedFilter] ADD CONSTRAINT [InboxSavedFilter_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [SavedFilter_Names] ON [settings].[InboxSavedFilter] ([Name]) ON [PRIMARY]
GO
