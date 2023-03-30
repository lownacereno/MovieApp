import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    var detail : MovieModel?
    
    private let movieTitle = UILabel()
    private let movieReleaseState = UILabel()
    private let movieStars = UILabel()
    private let movieReview = UILabel()
    private let movieRating = UILabel()
    private let moviePoster = UIImageView()
    private let titleDescription = UILabel()
    private let stackView = UIStackView()
    private let stackViewPoster = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initDetailViews()
    }
    
    private func initDetailViews(){
        stackViewPosterSetup()
        moviePosterSetup()
        stackViewSetup()
        movieTitleSetup()
        movieReleaseStateSetup()
        movieStarsSetup()
        movieRatingSetup()
        titleDescriptionSetup()
        movieReviewSetup()
        movieDetailConstraints()
        setMovieValueDescription()
    }
    
    private func movieDetailConstraints(){
        NSLayoutConstraint.activate([
            stackViewPoster.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackViewPoster.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackViewPoster.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleDescription.topAnchor.constraint(equalTo: stackViewPoster.bottomAnchor, constant: 30),
            titleDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieReview.topAnchor.constraint(equalTo: titleDescription.bottomAnchor, constant: 30),
            movieReview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieReview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func stackViewPosterSetup(){
        stackViewPoster.translatesAutoresizingMaskIntoConstraints = false
        stackViewPoster.distribution = .fillEqually
        stackViewPoster.axis = .horizontal
        stackViewPoster.spacing = 10
        stackViewPoster.backgroundColor = .white
        view.addSubview(stackViewPoster)
    }
    
    private func stackViewSetup(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.backgroundColor = .white
        stackViewPoster.addArrangedSubview(stackView)
    }
    
    private func moviePosterSetup(){
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        stackViewPoster.addArrangedSubview(moviePoster)
    }
    
    private func movieTitleSetup(){
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.font = .boldSystemFont(ofSize: 25)
        movieTitle.textColor = .red
        movieTitle.numberOfLines = 0
        stackView.addArrangedSubview(movieTitle)
    }
    
    private func movieReleaseStateSetup(){
        movieReleaseState.translatesAutoresizingMaskIntoConstraints = false
        movieReleaseState.font = .systemFont(ofSize: 22)
        movieReleaseState.numberOfLines = 0
        stackView.addArrangedSubview(movieReleaseState)
    }
    
    private func movieStarsSetup(){
        movieStars.translatesAutoresizingMaskIntoConstraints = false
        movieStars.font = .systemFont(ofSize: 22)
        movieStars.numberOfLines = 0
        stackView.addArrangedSubview(movieStars)
    }
    
    private func movieRatingSetup(){
        movieRating.translatesAutoresizingMaskIntoConstraints = false
        movieRating.font = .systemFont(ofSize: 15)
        movieRating.textAlignment = .right
        stackView.addArrangedSubview(movieRating)
    }
    
    private func titleDescriptionSetup(){
        titleDescription.translatesAutoresizingMaskIntoConstraints = false
        titleDescription.font = .boldSystemFont(ofSize: 25)
        titleDescription.textColor = .red
        titleDescription.numberOfLines = 0
        titleDescription.text = "Descripción"
        view.addSubview(titleDescription)
    }
    
    private func movieReviewSetup(){
        movieReview.translatesAutoresizingMaskIntoConstraints = false
        movieReview.font = .systemFont(ofSize: 22)
        movieReview.numberOfLines = 0
        movieReview.textAlignment = .justified
        view.addSubview(movieReview)
    }
    
    private func setMovieValueDescription(){
        movieRating.text.self = "\(detail?.rating ?? "") ⭐️"
        movieTitle.text.self = detail?.title
        movieReleaseState.text.self = detail?.releaseState
        movieStars.text.self = "Actores: \(detail?.stars ?? "")"
        movieReview.text.self = detail?.plot
        guard let image = detail?.image else { return}
        let url = URL(string: image )
        self.moviePoster.kf.setImage(with: url)
    }
}

