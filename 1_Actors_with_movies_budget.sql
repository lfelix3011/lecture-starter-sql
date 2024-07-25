USE [LectureBSA]
GO

SELECT 
	P.ID,
	P.FirstName,
	P.LastName,
	SUM(M.Budget) AS TotalBudget
FROM [Person] P
JOIN [MovieActor] MA ON MA.[ActorID] = P.ID
JOIN [Movie] M ON M.[ID] = MA.[MovieID]
GROUP BY P.ID, P.FirstName, P.LastName