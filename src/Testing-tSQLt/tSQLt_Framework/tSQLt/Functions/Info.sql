CREATE FUNCTION tSQLt.Info()
RETURNS TABLE
AS
RETURN
SELECT Version = '1.0.7597.5637',
       ClrVersion = (SELECT tSQLt.Private::Info()),
       ClrSigningKey = (SELECT tSQLt.Private::SigningKey()),
       V.SqlVersion,
       V.SqlBuild,
       V.SqlEdition
  FROM
  (
    SELECT CAST(PSSV.Major+'.'+PSSV.Minor AS NUMERIC(10,2)) AS SqlVersion,
           CAST(PSSV.Build+'.'+PSSV.Revision AS NUMERIC(10,2)) AS SqlBuild,
           PSV.Edition AS SqlEdition
          FROM tSQLt.Private_SqlVersion() AS PSV
         CROSS APPLY tSQLt.Private_SplitSqlVersion(PSV.ProductVersion) AS PSSV
  )V;
