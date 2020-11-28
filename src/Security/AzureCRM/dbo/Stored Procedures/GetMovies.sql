CREATE PROCEDURE [dbo].[GetMovies]
AS
	SELECT * FROM OPENROWSET(
	   BULK 'movies.csv',
	   DATA_SOURCE = 'MyBlobStorage',
	   SINGLE_BLOB
	) AS DataFile;
RETURN 0
