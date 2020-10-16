SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [dbo].[proc1]
AS
SELECT *
FROM dbo.table1 AS t
CROSS APPLY sys.dm_exec_describe_first_result_set(t.Colun1, NULL, NULL) AS sc


GO
