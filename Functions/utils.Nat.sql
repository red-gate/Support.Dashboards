SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- The natural numbers from 0 to @n
CREATE FUNCTION [utils].[Nat] ( @n INT )
RETURNS TABLE
AS
RETURN
    (
WITH    L0
          AS ( SELECT   1 AS c
               UNION ALL
               SELECT   1
             ),
        L1
          AS ( SELECT   1 AS c
               FROM     L0 AS A ,
                        L0 AS B
             ),
        L2
          AS ( SELECT   1 AS c
               FROM     L1 AS A ,
                        L1 AS B
             ),
        L3
          AS ( SELECT   1 AS c
               FROM     L2 AS A ,
                        L2 AS B
             ),
        L4
          AS ( SELECT   1 AS c
               FROM     L3 AS A ,
                        L3 AS B
             ),
        L5
          AS ( SELECT   1 AS c
               FROM     L4 AS A ,
                        L4 AS B
             ),
        Nums
          AS ( SELECT   ROW_NUMBER() OVER ( ORDER BY c ) AS i
               FROM     L5
             )
    SELECT  i - 1 AS [i]
    FROM    Nums
    WHERE   i <= @n
)
GO
