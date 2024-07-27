USE [LectureBSA]
GO

DECLARE @RELEASE_DATE_FROM DATETIME = '2022-01-01';
DECLARE @DURATION_MINUTES DATETIME = 135;

SELECT 
	M.ID,
	M.Title,
	M.ReleaseDate,
	M.Duration,
	M.[Description],
	(
		SELECT 
			P.[ID],
			P.[FirstName],
			P.[LastName],
			P.[Biography],
			P.[BirthDate],
			P.[Gender],
			P.[HomeCountryID]
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
	) AS  Director,
	(
		SELECT 
			F.[ID],
			F.[FileName],
			F.[MimeType],
			F.[Key],
			F.[URL]
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
	) AS  Poster
FROM [Movie] M
JOIN [Person] P ON P.[ID] = M.[DirectorID]
LEFT JOIN [File] F ON F.[ID] = M.PosterID
LEFT JOIN [MovieGenre] MG ON MG.MovieID = M.ID
LEFT JOIN [Genre] G ON G.ID = MG.GenreID
WHERE M.CountryProducedID = 1 AND M.ReleaseDate >= @RELEASE_DATE_FROM AND
M.Duration > @DURATION_MINUTES AND G.[Name] IN ('Action', 'Drama');