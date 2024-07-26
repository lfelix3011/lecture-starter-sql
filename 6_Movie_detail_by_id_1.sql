USE [LectureBSA]
GO

SELECT 
	M.ID,
	M.Title,
	M.ReleaseDate,
	M.Duration,
	M.[Description],
	JSON_QUERY(
        CONCAT(
            '{"ID":', F.[ID], 
            ',"FileName":"', F.[FileName], 
            '","MimeType":"', F.[MimeType], 
            '","Key":"', F.[Key], 
            '","URL":"', F.[URL], 
            '"}'
        )
    ) AS Poster,
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
				FOR JSON PATH
			) AS Photo
		FOR JSON PATH
	) AS Actors 
FROM [Movie] M
JOIN [Person] D_P ON D_P.[ID] = M.[DirectorID]
LEFT JOIN [PersonPhoto] D_PP ON D_P.[ID] = D_PP.PersonID AND D_PP.IsProfile = 1
LEFT JOIN [File] D_PP_F ON D_PP_F.[ID] = D_PP.PhotoID

LEFT JOIN [MovieActor] MA ON MA.[MovieID] = M.ID
JOIN [Person] A_P ON A_P.[ID] = MA.ActorID
LEFT JOIN [PersonPhoto] A_PP ON A_P.[ID] = A_PP.PersonID AND A_PP.IsProfile = 1
LEFT JOIN [File] A_PP_F ON A_PP_F.[ID] = A_PP.PhotoID

LEFT JOIN [MovieGenre] MG ON MG.MovieID = M.ID
LEFT JOIN [Genre] G ON G.ID = MG.GenreID
LEFT JOIN [File] F ON F.[ID] = M.PosterID
WHERE M.ID = 1