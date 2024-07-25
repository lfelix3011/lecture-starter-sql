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
	JSON_QUERY(
         CONCAT(
            '{"ID":', D_P.[ID], 
            ',"FirstName":"', D_P.[FirstName], 
            '","LastName":"', D_P.[LastName], 
            '"}'
        )
    ) AS Director
	--JSON_QUERY(
 --        CONCAT(
 --           '{"ID":', D_P.[ID], 
 --           ',"FirstName":"', D_P.[FirstName], 
 --           '","LastName":"', D_P.[LastName], 
 --           '"}'
 --       )
 --   ) AS Actors
FROM [Movie] M
JOIN [Person] D_P ON D_P.[ID] = M.[DirectorID]
LEFT JOIN [PersonPhoto] D_PP ON D_P.[ID] = D_PP.PersonID
LEFT JOIN [File] D_PP_F ON D_PP_F.[ID] = D_PP.PhotoID

--LEFT JOIN [MovieActor] MA ON MA.[MovieID] = M.ID
--JOIN [Person] A_P ON A_P.[ID] = MA.ActorID
--LEFT JOIN [PersonPhoto] A_PP ON A_P.[ID] = A_PP.PersonID
--LEFT JOIN [File] A_PP_F ON A_PP_F.[ID] = A_PP.PhotoID

LEFT JOIN [MovieGenre] MG ON MG.MovieID = M.ID
LEFT JOIN [Genre] G ON G.ID = MG.GenreID
LEFT JOIN [File] F ON F.[ID] = M.PosterID
WHERE M.ID = 1