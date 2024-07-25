USE [LectureBSA]
GO

SELECT 
	U.ID,
	U.Username,
	'[' + ISNULL(STRING_AGG (FM.[MovieID], ', '), 0) + ']' AS 'FavoriteMovieIDs'
FROM [User] U
LEFT JOIN [FavoriteMovies] FM ON FM.[UserID] = U.ID
GROUP BY U.ID, U.Username