SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- SQL Server's DATEDIFF/DATEPART functions only accept INT values, i.e. 32 bits.
-- To do this we DATEDIFF/DATEPART the seconds and milliseconds separately.
-- Milliseconds obviously fit into 32 bits, but in order to get seconds to
-- fit into 32 bits, we reduce the range to the 1901-1970-2038 Unix epoch.
-- Hopefully you are not still using this function in 2038...
CREATE FUNCTION [utils].[DateTimeToTicks] (@dateTime DATETIME) RETURNS BIGINT
BEGIN
    DECLARE @ticks BIGINT
    
    -- Check whether @dateTime falls within the Unix epoch.
    IF @dateTime < '1901-12-13T20:45:52.000Z'
        BEGIN
            -- Below the Unix epoch, just return DateTime.MinValue.Ticks
            SET @ticks = 0
        END
    ELSE IF @dateTime > '2038-01-19T03:14:07.000Z'
        BEGIN
            -- Above the Unix epoch, just return DateTime.MaxValue.Ticks
            SET @ticks = 3155378975999999999
        END
    ELSE
        BEGIN
            DECLARE @seconds INT
            SET @seconds = DATEDIFF(ss, '1970', @dateTime)

            DECLARE @milliseconds INT
            SET @milliseconds = DATEPART(ms, @dateTime)

            -- 1970-01-01 is 62135596800 seconds.
            -- There are 10000000 ticks in a second.
            -- There are 10000 ticks in a millisecond.
            SET @ticks = (62135596800 + @seconds) * 10000000 + @milliseconds * 10000
        END
    
    RETURN @ticks
END
GO
