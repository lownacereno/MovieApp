import UIKit

class HomeViewModel {
    
    private var dataService : MoviesDataService?
    var moviesDownloaded : (() -> ())?
    var movieList : [MovieModel] = []
    
    init(dataService: MoviesDataService){
        self.dataService = dataService
    }
    
    func getMovies(){
        self.dataService?.requestMovieList(completion: { (response, error) in
            if error == nil{
                self.movieList = response?.items ?? []
                self.moviesDownloaded?()
            }
            
        })
        
    }
    
    
}
