
CREATE FUNCTION Integration.GenerateDateDimensionColumns(@Date date)
RETURNS TABLE
AS
RETURN SELECT @Date AS [Date],
              DAY(@Date) AS [Day Number],
              CAST(DATENAME(day, @Date) AS nvarchar(10)) AS [Day],
              CAST(DATENAME(month, @Date) AS nvarchar(10)) AS [Month],
              CAST(SUBSTRING(DATENAME(month, @Date), 1, 3) AS nvarchar(3)) AS [Short Month],
              MONTH(@Date) AS [Calendar Month Number],
              CAST(N'CY' + CAST(YEAR(@Date) AS nvarchar(4)) + N'-' + SUBSTRING(DATENAME(month, @Date), 1, 3) AS nvarchar(10)) AS [Calendar Month Label],
              YEAR(@Date) AS [Calendar Year],
              CAST(N'CY' + CAST(YEAR(@Date) AS nvarchar(4)) AS nvarchar(10)) AS [Calendar Year Label],
              CASE WHEN MONTH(@Date) IN (11, 12)
                   THEN MONTH(@Date) - 10
                   ELSE MONTH(@Date) + 2
              END AS [Fiscal Month Number],
              CAST(N'FY' + CAST(CASE WHEN MONTH(@Date) IN (11, 12)
                                     THEN YEAR(@Date) + 1
                                     ELSE YEAR(@Date)
                                END AS nvarchar(4)) + N'-' + SUBSTRING(DATENAME(month, @Date), 1, 3) AS nvarchar(20)) AS [Fiscal Month Label],
              CASE WHEN MONTH(@Date) IN (11, 12)
                   THEN YEAR(@Date) + 1
                   ELSE YEAR(@Date)
              END AS [Fiscal Year],
              CAST(N'FY' + CAST(CASE WHEN MONTH(@Date) IN (11, 12)
                                     THEN YEAR(@Date) + 1
                                     ELSE YEAR(@Date)
                                END AS nvarchar(4)) AS nvarchar(10)) AS [Fiscal Year Label],
              DATEPART(ISO_WEEK, @Date) AS [ISO Week Number];