SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [alert].[Alert_FeatureUsage]
AS
SELECT        alert.Alert.AlertType, alert.Alert_Type.Name, alert.Alert.[Read],
                             (SELECT        TOP (1) Date
                               FROM            alert.Alert_Severity AS s
                               WHERE        (alert.Alert.AlertId = AlertId)
                               ORDER BY Date) AS Raised, alert.Alert.Cleared
FROM            alert.Alert INNER JOIN
                         alert.Alert_Type ON alert.Alert.AlertType = alert.Alert_Type.AlertType
GO
