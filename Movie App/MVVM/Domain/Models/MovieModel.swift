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
    let imDBRating, imDBRatingCount, metacriticRating, genres: String
    let genreList: [GenreList]
    let directors: String
    let directorList: [RList]
    let stars: String
    let starList: [RList]

    enum CodingKeys: String, CodingKey {
        case id, title, fullTitle, year, releaseState, image, runtimeMins, runtimeStr, plot, contentRating
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
        case metacriticRating, genres, genreList, directors, directorList, stars, starList
    }
}

struct RList: Codable {
    let id, name: String
}

struct GenreList: Codable {
    let key, value: String
}

