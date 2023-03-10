import Foundation

struct MovieResponse: Codable {
    let items: [MovieModel]
    let errorMessage: String
}

struct MovieModel: Codable {
    let id, title, fullTitle, year: String
    let releaseState: String
    let image: String
    let runtimeMins, runtimeStr, plot, contentRating: String
    let rating, imDBRatingCount, metacriticRating, genres: String
    let genreList: [GenreList]
    let directors: String
    let directorList: [RList]
    let stars: String
    let starList: [RList]

    enum CodingKeys: String, CodingKey {
        case id, title, fullTitle, year, releaseState, image, runtimeMins, runtimeStr, plot, contentRating
        case rating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
        case metacriticRating, genres, genreList, directors, directorList, stars, starList
    }
    
    func getReleaseStateAsDate() -> Date {
        let format = DateFormatter()
        format.locale = Locale(identifier: "en_US_POSIX")
        format.dateFormat = "dd-MMM-yyyy"
        return format.date(from: self.releaseState) ?? Date()
    }

struct RList: Codable {
    let id, name: String
}

struct GenreList: Codable {
    let key, value: String
}
}
