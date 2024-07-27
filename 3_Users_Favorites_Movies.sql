USE [LectureBSA]
GO

SELECT 
	U.ID,
	U.Username,
	JSON_QUERY(
		'[' + ISNULL(STRING_AGG (FM.[MovieID], ', '), '') + ']' 
	) AS FavoriteMovieIDs
FROM [User] U
LEFT JOIN [FavoriteMovies] FM ON FM.[UserID] = U.ID
GROUP BY U.ID, U.Username