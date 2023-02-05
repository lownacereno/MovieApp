import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    var detail : MovieModel?
    
    private let movieTitle = UILabel()
    private let movieReleaseState = UILabel()
    private let movieStars = UILabel()
    private let movieReview = UILabel()
    private let moviePoster = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 215/255.0, green: 233/255.0, blue: 185/255.0, alpha: 1)
        initDetailViews()
    }
    
    func initDetailViews(){
        movieTitleSetup()
        movieReleaseStateSetup()
        movieStarsSetup()
        movieReviewSetup()
        moviePosterSetup()
        movieDetailConstraints()
        setMovieValueDescription()
    }
    
    func movieDetailConstraints(){
        NSLayoutConstraint.activate([
            movieTitle.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100),
            movieTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            movieReleaseState.topAnchor.constraint(equalTo: movieTitle.bottomAnchor,constant: 12),
            movieReleaseState.centerXAnchor.constraint(equalTo: movieTitle.centerXAnchor),
            movieStars.topAnchor.constraint(equalTo: movieReleaseState.bottomAnchor, constant: 12),
            movieStars.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 20),
            movieStars.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            movieReview.topAnchor.constraint(equalTo: movieStars.bottomAnchor, constant: 12),
            movieReview.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 20),
            movieReview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            moviePoster.topAnchor.constraint(equalTo: movieReview.bottomAnchor, constant: 50),
            moviePoster.centerXAnchor.constraint(equalTo: movieReview.centerXAnchor),
            moviePoster.widthAnchor.constraint(equalToConstant: 200),
            moviePoster.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func movieTitleSetup(){
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.font = .boldSystemFont(ofSize: 30)
        movieTitle.numberOfLines = 0
        view.addSubview(movieTitle)
    }
    
    func movieReleaseStateSetup(){
        movieReleaseState.translatesAutoresizingMaskIntoConstraints = false
        movieReleaseState.font = .systemFont(ofSize: 25)
        movieReleaseState.numberOfLines = 0
        view.addSubview(movieReleaseState)
    }
    
    func movieStarsSetup(){
        movieStars.translatesAutoresizingMaskIntoConstraints = false
        movieStars.font = .systemFont(ofSize: 25)
        movieStars.numberOfLines = 0
        view.addSubview(movieStars)
    }
    
    func movieReviewSetup(){
        movieReview.translatesAutoresizingMaskIntoConstraints = false
        movieReview.font = .systemFont(ofSize: 25)
        movieReview.numberOfLines = 0
        view.addSubview(movieReview)
    }
    
    func moviePosterSetup(){
        moviePoster.contentMode = .scaleAspectFill
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moviePoster)
    }
    
    func setMovieValueDescription(){
        movieTitle.text.self = detail?.title
        movieReleaseState.text.self = "Stars: \(detail?.releaseState ?? "")"
        movieStars.text.self = detail?.stars
        movieReview.text.self = detail?.plot
        guard let url = URL(string: detail!.image ) else {return}
        self.moviePoster.kf.setImage(with: url)
    }
}



