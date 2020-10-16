SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [alert].[Alert_Current]
AS
SELECT
  a.AlertType as AlertType,
  a.SubType as SubType,
  a.AlertId,
  a.RootCir,
  a.GroupCir,
  a.TargetObject,
  a.[Read],
  a.[ReadDate],
  at.[Event],
  a.[LastUpdate],
  a.[Raised],
  a.[LastSeverity],
  a.[WorstSeverity],
  a.[Cleared],
  a.[ClearedDate],
  a.[LastComment]
FROM
  alert.Alert a, alert.Alert_Type at
WHERE
  a.AlertType = at.AlertType
GO
