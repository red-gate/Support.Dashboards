SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- SQL Server's DATEADD function only accepts INT values, i.e. 32 bits.
-- To do this we DATEADD the seconds and milliseconds separately.
-- Milliseconds obviously fit into 32 bits, but in order to get seconds to
-- fit into 32 bits, we reduce the range to the 1901-1970-2038 Unix epoch.
-- Hopefully you are not still using this function in 2038...
CREATE FUNCTION [utils].[TicksToDateTime] (@ticks BIGINT) RETURNS DATETIME
BEGIN
    DECLARE @dateTime DATETIME
    
    -- Check whether @ticks falls within the Unix epoch.
    IF @ticks < 599881131520000000
        BEGIN
            -- Below the Unix epoch, just return SqlDateTime.MinValue
            SET @dateTime = '1753-01-01T00:00:00.000Z'
        END
    ELSE IF @ticks > 642830804470000000
        BEGIN
            -- Above the Unix epoch, just return SqlDateTime.MaxValue
            SET @dateTime = '9999-12-31T23:59:59.997Z'
        END
    ELSE
        BEGIN
            -- There are 10000000 ticks in a second.
            -- 1970-01-01 is 62135596800 seconds.
            -- Subtract after rounding to handle negative values correctly.
            DECLARE @bigSeconds BIGINT
            SET @bigSeconds = (@ticks  / 10000000) - 62135596800

            DECLARE @seconds INT
            SET @seconds = CONVERT(INT, @bigSeconds)

            -- There are 10000 ticks in a millisecond.
            DECLARE @milliseconds INT
            SET @milliseconds = CONVERT(INT, (@ticks / 10000) % 1000)

            SET @dateTime = DATEADD(ms, @milliseconds, DATEADD(ss, @seconds, '1970'))
        END
    
    RETURN @dateTime
END
GO
