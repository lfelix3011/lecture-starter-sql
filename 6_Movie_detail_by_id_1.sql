USE [LectureBSA]
GO

SELECT 
    M.ID,
    M.Title,
    M.ReleaseDate,
    M.Duration,
    M.[Description],
	(
		SELECT 
			F.[ID],
			F.[FileName],
			F.[MimeType],
			F.[Key],
			F.[URL]
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
	) AS  Poster,
	(
		SELECT 
			D_P.[ID],
			D_P.[FirstName],
			D_P.[LastName],
			(
				SELECT 
					D_PP_F.[ID],
					D_PP_F.[FileName],
					D_PP_F.[MimeType],
					D_PP_F.[Key],
					D_PP_F.[URL]
				FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
			) AS Photo
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
	) AS Director,
   (
		SELECT 
		A_P.[ID], 
		A_P.[FirstName], 
		A_P.[LastName], 
			(
				SELECT 
					A_PP_F.[ID],
					A_PP_F.[FileName],
					A_PP_F.[MimeType],
					A_PP_F.[Key],
					A_PP_F.[URL]
				 
				FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
			) AS Photo
			FROM [MovieActor] MA
		JOIN [Person] A_P ON A_P.[ID] = MA.ActorID
		LEFT JOIN [PersonPhoto] A_PP ON A_P.[ID] = A_PP.PersonID AND A_PP.IsProfile = 1
		LEFT JOIN [File] A_PP_F ON A_PP_F.[ID] = A_PP.PhotoID
		FOR JSON PATH
	) AS Actors,
    (
        SELECT 
            JSON_QUERY(
                CONCAT(
                    '[',
                    STRING_AGG(
                        CONCAT(
                            '{"ID":', G.[ID], 
                            ',"Name":"', G.[Name], 
                            '"}'
                        ), 
                    ', '
                    ), 
                    ']'
                )
            ) 
        AS Genres
    ) AS Genres
FROM [Movie] M
LEFT JOIN [File] F ON F.[ID] = M.PosterID
JOIN [Person] D_P ON D_P.[ID] = M.[DirectorID]
LEFT JOIN [PersonPhoto] D_PP ON D_P.[ID] = D_PP.PersonID AND D_PP.IsProfile = 1
LEFT JOIN [File] D_PP_F ON D_PP_F.[ID] = D_PP.PhotoID
LEFT JOIN [MovieGenre] MG ON MG.MovieID = M.ID
LEFT JOIN [Genre] G ON G.ID = MG.GenreID
WHERE M.ID = 1
GROUP BY 
    M.ID,
    M.Title,
    M.ReleaseDate,
    M.Duration,
    M.[Description],
    F.[ID],
    F.[FileName],
    F.[MimeType],
    F.[Key],
    F.[URL],
    D_P.[ID],
    D_P.[FirstName],
    D_P.[LastName],
    D_P.[Biography],
    D_P.[BirthDate],
    D_P.[Gender],
    D_P.[HomeCountryID],
	D_PP_F.[ID],
    D_PP_F.[FileName],
    D_PP_F.[MimeType],
    D_PP_F.[Key],
    D_PP_F.[URL]