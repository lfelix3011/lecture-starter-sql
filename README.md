# lecture-starter-sql
This Repo has the requeriments for the Lecture: "JavaScript: Database and SQL" of Binary Studio 2024

# LectureBSA Database Schema

## ER Diagram

```mermaid


erDiagram

    Movie ||--o{ Country : CountryProducedID
    Movie ||--o{ Person : DirectorID
    Movie ||--o{ File : PosterID
    Movie {
        int ID
        string Title
        string Description
        decimal Budget
        datetime ReleaseDate
        int Duration
        int DirectorID
        int CountryProducedID
        int PosterID
        datetime CreatedAt
        datetime UpdatedAt
    }
    
    MovieGenre }o--|| Movie : MovieID
    MovieGenre }o--|| Genre : GenreID
    MovieGenre {
        int MovieID
        int GenreID
        datetime CreatedAt
        datetime UpdatedAt
    }
    
    MovieActor }o--|| Movie : MovieID
    MovieActor }o--|| Person : ActorID
    MovieActor }o--|| Character : CharacterID
    MovieActor {
        int MovieID
        int ActorID
        int CharacterID
        datetime CreatedAt
        datetime UpdatedAt
    }
    
    Person ||--o{ Country : HomeCountryID
    Person {
        int ID
        string FirstName
        string LastName
        string Biography
        datetime BirthDate
        string Gender
        int HomeCountryID
        datetime CreatedAt
        datetime UpdatedAt
    }
    
    PersonPhoto ||--o{ File : PhotoID
    PersonPhoto }o--|| Person : PersonID
    PersonPhoto {
        int ID
        bit IsProfile
        int PersonID
        int PhotoID
        datetime CreatedAt
        datetime UpdatedAt
    }
    
    Character }o--|| Movie : MovieID
    Character {
        int ID
        string Name
        string Description
        string Role
        int MovieID
        datetime CreatedAt
        datetime UpdatedAt
    }

    FavoriteMovies }o--|| Movie : MovieID
    FavoriteMovies }o--|| User : UserID
    FavoriteMovies {
        int MovieID
        int UserID
        datetime CreatedAt
        datetime UpdatedAt
    }
    
    User ||--o{ File : AvatarID
    User {
        int ID
        string Username
        string FirstName
        string LastName
        string Email
        string Password
        int AvatarID
        datetime CreatedAt
        datetime UpdatedAt
    }
    
    Country {
        int ID
        string Name
        datetime CreatedAt
        datetime UpdatedAt
    }
    
    Genre {
        int ID
        string Name
        datetime CreatedAt
        datetime UpdatedAt
    }
    
    File {
        int ID
        string FileName
        string MimeType
        string Key
        string URL
        datetime CreatedAt
        datetime UpdatedAt
    }