CREATE FUNCTION tSQLt.Private_SplitSqlVersion(@ProductVersion NVARCHAR(128))
RETURNS TABLE
AS
RETURN
  SELECT PARSENAME(@ProductVersion,4) Major,
         PARSENAME(@ProductVersion,3) Minor, 
         PARSENAME(@ProductVersion,2) Build,
         PARSENAME(@ProductVersion,1) Revision;
