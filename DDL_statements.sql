CREATE DATABASE LectureBSA
GO

USE [LectureBSA]
GO

CREATE TABLE [File] (
	[ID] INT IDENTITY(1,1) CONSTRAINT PK_File PRIMARY KEY,
	[FileName] VARCHAR(80) NOT NULL,
	[MimeType] VARCHAR(50) NOT NULL,
	[Key] VARCHAR(200) NOT NULL,
	[URL] VARCHAR(300) NOT NULL,
	[CreatedAt] DATETIME NOT NULL CONSTRAINT DF_File_CreatedAt DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL CONSTRAINT DF_File_UpdatedAt DEFAULT GETDATE(),
);
GO

CREATE TABLE [User] (
	[ID] INT IDENTITY(1,1) CONSTRAINT PK_User PRIMARY KEY,
	[Username] VARCHAR(30) NOT NULL,
	[FirstName] VARCHAR(30) NOT NULL,
	[LastName] VARCHAR(30) NOT NULL,
	[Email] VARCHAR(60) NOT NULL UNIQUE,
	[Password] VARCHAR(200) NOT NULL,
	[AvatarID] INT NULL CONSTRAINT FK_File_User FOREIGN KEY REFERENCES [File](ID),
	[CreatedAt] DATETIME NOT NULL CONSTRAINT DF_User_CreatedAt DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL CONSTRAINT DF_User_UpdatedAt DEFAULT GETDATE(),
);
GO

CREATE TABLE [Country] (
	[ID] INT IDENTITY(1,1) CONSTRAINT PK_Country PRIMARY KEY,
	[Name] VARCHAR(128) NOT NULL,
	[CreatedAt] DATETIME NOT NULL CONSTRAINT DF_Country_CreatedAt DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL CONSTRAINT DF_Country_UpdatedAt DEFAULT GETDATE(),
);
GO

CREATE TABLE [Person] (
	[ID] INT IDENTITY(1,1) CONSTRAINT PK_Person PRIMARY KEY,
	[FirstName] VARCHAR(30) NOT NULL,
	[LastName] VARCHAR(30) NOT NULL,
	[Biography] VARCHAR(MAX) NOT NULL,
	[BirthDate] DATETIME NOT NULL,
	[Gender] VARCHAR(14) NOT NULL CONSTRAINT CK_Person_Gender CHECK ([Gender] IN ('Not known', 'Male', 'Female', 'Not applicable')),
	[HomeCountryID] INT NOT NULL CONSTRAINT FK_Country_Person FOREIGN KEY REFERENCES [Country](ID),
	[CreatedAt] DATETIME NOT NULL CONSTRAINT DF_Person_CreatedAt DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL CONSTRAINT DF_Person_UpdatedAt DEFAULT GETDATE(),
)
GO

CREATE TABLE [PersonPhoto] (
	[ID] INT IDENTITY(1,1) CONSTRAINT PK_PersonPhoto PRIMARY KEY,
	[IsProfile] BIT NOT NULL CONSTRAINT DF_PersonPhoto_IsProfile DEFAULT 0,
	[PersonID] INT NOT NULL CONSTRAINT FK_Person_PersonPhoto FOREIGN KEY REFERENCES [Person](ID),
	[PhotoID] INT NOT NULL  CONSTRAINT FK_File_Person FOREIGN KEY REFERENCES [File](ID),
	[CreatedAt] DATETIME NOT NULL CONSTRAINT DF_PersonPhoto_CreatedAt DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL CONSTRAINT DF_PersonPhoto_UpdatedAt DEFAULT GETDATE(),
	CONSTRAINT UC_PersonPhoto_Profile UNIQUE (PersonID, IsProfile)
)
GO

CREATE TABLE [Movie] (
	[ID] INT IDENTITY(1,1) CONSTRAINT PK_Movie PRIMARY KEY,
	[Title] VARCHAR(30) NOT NULL,
	[Description] VARCHAR(MAX) NOT NULL,
	[Budget] DECIMAL(15, 2) NOT NULL,
	[ReleaseDate] DATETIME NOT NULL,
	[Duration] INT NOT NULL,
	[DirectorID] INT NOT NULL CONSTRAINT FK_Person_Movie FOREIGN KEY REFERENCES [Person](ID),
	[CountryProducedID] INT NOT NULL CONSTRAINT FK_Country_Movie FOREIGN KEY REFERENCES [Country](ID),
	[PosterID] INT NULL CONSTRAINT FK_File_Movie FOREIGN KEY REFERENCES [File](ID),
	[CreatedAt] DATETIME NOT NULL CONSTRAINT DF_Movie_CreatedAt DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL CONSTRAINT DF_Movie_UpdatedAt DEFAULT GETDATE(),
)
GO

CREATE TABLE [Genre] (
	[ID] INT IDENTITY(1,1) CONSTRAINT PK_Genre PRIMARY KEY,
	[Name] VARCHAR(20) NOT NULL,
	[CreatedAt] DATETIME NOT NULL CONSTRAINT DF_Genre_CreatedAt DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL CONSTRAINT DF_Genre_UpdatedAt DEFAULT GETDATE(),
)
GO

CREATE TABLE [MovieGenre] (
	CONSTRAINT PK_MovieGenre PRIMARY KEY ([MovieID], [GenreID]),
	[MovieID] INT NOT NULL CONSTRAINT FK_Movie_MovieGenre FOREIGN KEY REFERENCES [Movie](ID),
	[GenreID] INT NOT NULL CONSTRAINT FK_Genre_MovieGenre FOREIGN KEY REFERENCES [Genre](ID),
	[CreatedAt] DATETIME NOT NULL CONSTRAINT DF_MovieGenre_CreatedAt DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL CONSTRAINT DF_MovieGenre_UpdatedAt DEFAULT GETDATE(),
)
GO

CREATE TABLE [FavoriteMovies] (
	CONSTRAINT PK_FavoriteMovies PRIMARY KEY([MovieID], [UserID]),
	[MovieID] INT NOT NULL CONSTRAINT FK_Movie_FavoriteMovies FOREIGN KEY REFERENCES [Movie](ID),
	[UserID] INT NOT NULL CONSTRAINT FK_User_FavoriteMovies FOREIGN KEY REFERENCES [User](ID),
	[CreatedAt] DATETIME NOT NULL CONSTRAINT DF_FavoriteMovies_CreatedAt DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL CONSTRAINT DF_FavoriteMovies_UpdatedAt DEFAULT GETDATE(),
)
GO

CREATE TABLE [Character] (
	[ID] INT IDENTITY(1,1) CONSTRAINT PK_Character PRIMARY KEY,
	[Name] VARCHAR(30) NOT NULL,
	[Description] VARCHAR(MAX) NOT NULL,
	[Role] VARCHAR(10) NOT NULL CONSTRAINT CK_Role CHECK ([Role] IN ('leading', 'supporting', 'background')),
	[MovieID] INT NOT NULL CONSTRAINT FK_Movie_Character FOREIGN KEY REFERENCES [Movie](ID),
	[CreatedAt] DATETIME NOT NULL CONSTRAINT DF_Character_CreatedAt DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL CONSTRAINT DF_Character_UpdatedAt DEFAULT GETDATE(),
)
GO

CREATE TABLE [MovieActor] (
	CONSTRAINT PK_MovieActor PRIMARY KEY([MovieID], [ActorID]),
	[MovieID] INT NOT NULL CONSTRAINT FK_Movie_MovieActor FOREIGN KEY REFERENCES [Movie](ID),
	[ActorID] INT NOT NULL CONSTRAINT FK_Person_MovieActor FOREIGN KEY REFERENCES [Person](ID),
	[CharacterID] INT NULL CONSTRAINT FK_Character_MovieActor FOREIGN KEY REFERENCES [Character](ID),
	[CreatedAt] DATETIME NOT NULL CONSTRAINT DF_MovieActor_CreatedAt DEFAULT GETDATE(),
	[UpdatedAt] DATETIME NOT NULL CONSTRAINT DF_MovieActor_UpdatedAt DEFAULT GETDATE(),
)


-- File table
CREATE TRIGGER trg_UpdateFile_Timespan
ON [File]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [File]
    SET UpdatedAt = GETDATE()
    FROM [File] f
    INNER JOIN inserted i ON f.[ID] = i.[ID];
END;
GO

-- User table
CREATE TRIGGER trg_UpdateUser_Timespan
ON [User]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [User]
    SET UpdatedAt = GETDATE()
    FROM [User] u
    INNER JOIN inserted i ON u.[ID] = i.[ID];
END;
GO

-- Country table
CREATE TRIGGER trg_UpdateCountry_Timespan
ON [Country]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [Country]
    SET UpdatedAt = GETDATE()
    FROM [Country] c
    INNER JOIN inserted i ON c.[ID] = i.[ID];
END;
GO

-- Person table
CREATE TRIGGER trg_UpdatePerson_Timespan
ON [Person]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [Person]
    SET UpdatedAt = GETDATE()
    FROM [Person] p
    INNER JOIN inserted i ON p.[ID] = i.[ID];
END;
GO

-- Movie table
CREATE TRIGGER trg_UpdateMovie_Timespan
ON [Movie]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [Movie]
    SET UpdatedAt = GETDATE()
    FROM [Movie] m
    INNER JOIN inserted i ON m.[ID] = i.[ID];
END;
GO

-- Genre table
CREATE TRIGGER trg_UpdateGenre_Timespan
ON [Genre]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [Genre]
    SET UpdatedAt = GETDATE()
    FROM [Genre] g
    INNER JOIN inserted i ON g.[ID] = i.[ID];
END;
GO

-- MovieGenre table
CREATE TRIGGER trg_UpdateMovieGenre_Timespan
ON [MovieGenre]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [MovieGenre]
    SET UpdatedAt = GETDATE()
    FROM [MovieGenre] mg
    INNER JOIN inserted i ON mg.[MovieID] = i.[MovieID] AND mg.[GenreID] = i.[GenreID];
END;
GO

-- PersonPhoto table
CREATE TRIGGER trg_UpdatePersonPhoto_Timespan
ON [PersonPhoto]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [PersonPhoto]
    SET UpdatedAt = GETDATE()
    FROM [PersonPhoto] pp
    INNER JOIN inserted i ON pp.[PersonID] = i.[PersonID] AND pp.[PhotoID] = i.[PhotoID];
END;
GO

-- FavoriteMovies table
CREATE TRIGGER trg_UpdateFavoriteMovies_Timespan
ON [FavoriteMovies]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [FavoriteMovies]
    SET UpdatedAt = GETDATE()
    FROM [FavoriteMovies] fm
    INNER JOIN inserted i ON fm.[MovieID] = i.[MovieID] AND fm.[UserID] = i.[UserID];
END;
GO

-- Character table
CREATE TRIGGER trg_UpdateCharacter_Timespan
ON [Character]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [Character]
    SET UpdatedAt = GETDATE()
    FROM [Character] c
    INNER JOIN inserted i ON c.[ID] = i.[ID];
END;
GO

-- MovieActor
CREATE TRIGGER trg_UpdateMovieActor_Timespan
ON [MovieActor]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [MovieActor]
    SET UpdatedAt = GETDATE()
    FROM [MovieActor] ma
    INNER JOIN inserted i ON ma.[MovieID] = i.[MovieID] AND ma.[ActorID] = i.[ActorID];
END;
GO
