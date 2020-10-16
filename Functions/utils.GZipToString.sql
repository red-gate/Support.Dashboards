SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE FUNCTION [utils].[GZipToString] (@str [nvarchar] (max))
RETURNS [nvarchar] (max)
WITH EXECUTE AS CALLER
EXTERNAL NAME [RedGate.SQLMonitor.Clr].[UserDefinedFunctions].[GZipToString]
GO
