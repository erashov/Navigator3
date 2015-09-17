




CREATE FUNCTION [dbo].[fn_datediff] -- Вычисление разницы между двумя датами
(
   @from_ts AS DATETIME, -- начальня дата
   @to_ts   AS DATETIME, -- конечная дата 
   @str     AS VARCHAR(10) -- формат вывода
) 
  
RETURNS VARCHAR(24) 
AS 
BEGIN 

RETURN 
( 
  SELECT 
/*    CASE sgn WHEN 1 THEN '+' WHEN -1 THEN '-' END + 
    RIGHT('000' + CAST(y  AS VARCHAR(4)), 4) + '-' + 
    RIGHT('0'   + CAST(m  AS VARCHAR(2)), 2) + '-' + 
    RIGHT('0'   + CAST(d  AS VARCHAR(2)), 2) + ' ' + 
    RIGHT('0'   + CAST(h  AS VARCHAR(2)), 2) + ':' + 
    RIGHT('0'   + CAST(mi AS VARCHAR(2)), 2) + ':' + 
    RIGHT('0'   + CAST(s  AS VARCHAR(2)), 2) + '.' + 
    RIGHT('00'  + CAST(ms AS VARCHAR(3)), 3) */
    CASE @str 
     WHEN 'all' THEN
       RIGHT('0'   + CAST(m  AS VARCHAR(2)), 2) + 'м ' + 
       RIGHT('0'   + CAST(d  AS VARCHAR(2)), 2) + 'дн ' + 
       RIGHT('0'   + CAST(h  AS VARCHAR(2)), 2) + 'ч ' + 
       RIGHT('0'   + CAST(mi AS VARCHAR(2)), 2) + 'мин' 
     WHEN 'm'  THEN RIGHT('0'   + CAST(m  AS VARCHAR(2)), 2)
     WHEN 'd'  THEN RIGHT('0'   + CAST(d  AS VARCHAR(2)), 2)
     WHEN 'h'  THEN RIGHT('0'   + CAST(h  AS VARCHAR(2)), 2)
     WHEN 'mi' THEN RIGHT('0'  + CAST(mi  AS VARCHAR(2)), 2)
    END

  FROM 
  ( 
    SELECT from_ts, to_ts, sgn, y, m, d, 
     s / 3600      AS h, 
     s % 3600 / 60 AS mi, 
     s % 60        AS s, 
     (1000 + DATEPART(ms, to_ts) - DATEPART(ms, from_ts)) % 1000 AS ms 
    FROM 
   ( 
      SELECT from_ts, to_ts, sgn, 
        y, 
        m - DATEDIFF(month, from_ts, y_ts) AS m, 
        d - DATEDIFF(day,   from_ts, m_ts) AS d, 
        DATEDIFF(second, d_ts, to_ts)      AS s 
      FROM 
     ( 
        SELECT *, 
          DATEADD(year,  y, from_ts) AS y_ts, 
          DATEADD(month, m, from_ts) AS m_ts,
          DATEADD(day, d, from_ts)   AS d_ts,
          DATEDIFF(second, from_ts, to_ts) - CASE WHEN DATEPART(ms, to_ts) < DATEPART(ms, from_ts) THEN 1 ELSE 0 END AS s 
         -- DATEDIFF(second, d_ts, to_ts) - CASE WHEN DATEPART(ms, to_ts) < DATEPART(ms, from_ts) THEN 1 ELSE 0 END AS s 
        FROM 
        ( 
          SELECT from_ts, to_ts, sgn, 
            y - CASE WHEN DATEADD(year,  y, from_ts) > to_ts 
            THEN 1 ELSE 0 END AS y, 
            m - CASE WHEN DATEADD(month, m, from_ts) > to_ts 
            THEN 1 ELSE 0 END AS m, 
            d - CASE WHEN DATEADD(day,   d, from_ts) > to_ts 
            THEN 1 ELSE 0 END AS d 
          FROM 
          ( 
            SELECT *, 
              DATEDIFF(year,  from_ts, to_ts) AS y, 
              DATEDIFF(month, from_ts, to_ts) AS m, 
              DATEDIFF(day,   from_ts, to_ts) AS d 
            FROM 
            ( 
              SELECT 
                CASE WHEN from_ts <= to_ts THEN from_ts ELSE to_ts   END AS from_ts, 
                CASE WHEN from_ts <= to_ts THEN to_ts   ELSE from_ts END AS to_ts, 
                CASE WHEN from_ts <= to_ts THEN 1 WHEN to_ts < from_ts THEN -1 END AS sgn 
              FROM 
              ( 
                SELECT @from_ts AS from_ts, @to_ts AS to_ts 
              ) 
              AS D0 
            ) 
            AS D1 
          ) 
          AS D2 
        ) 
        AS D3 
      ) 
      AS D4 
    ) 
    AS D5 
  ) 
  AS D6 
) 

END





