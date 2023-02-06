import UIKit
import Alamofire

struct MoviesDataService{
    
    static let movieService = MoviesDataService()
    private var baseUrl = "https://my.api.mockaroo.com"
    
    func requestMovieList(completion: @escaping (MovieResponse?, Error?) -> ()) {
        AF.request("\(baseUrl)/movies.json?key=cb03b960", method: .get).responseDecodable(of: MovieResponse.self) { response in
            if response.error == nil{
                completion(response.value, nil)
            }else{
                completion(nil, response.error)
            }
        }
    }
}
