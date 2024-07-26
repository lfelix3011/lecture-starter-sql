USE [LectureBSA]
GO

SELECT 
	M.[DirectorID],
	CONCAT(P.FirstName, ' ', P.LastName) AS DirectorName,
	AVG(M.Budget) AS AverageBudget
FROM [Movie] M
JOIN [Person] P ON P.[ID] = M.[DirectorID]
GROUP BY M.[DirectorID], P.FirstName, P.LastName