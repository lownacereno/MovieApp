import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    private var movieTitle : UILabel = {
        let movieTitleLabel = UILabel()
        movieTitleLabel.text = "movie title"
        movieTitleLabel.font = .systemFont(ofSize: 25)
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return movieTitleLabel
    }()
    
    private let movieYear : UILabel = {
        let movieYearLabel = UILabel()
        movieYearLabel.font = .systemFont(ofSize: 25)
        movieYearLabel.text = "movie year"
        movieYearLabel.translatesAutoresizingMaskIntoConstraints = false
        return movieYearLabel
    }()
    
    private let moviePoster : UIImageView = {
        let movieImage = UIImageView()
        movieImage.contentMode = .scaleAspectFill
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        return movieImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(movieTitle)
        addSubview(movieYear)
        addSubview(moviePoster)
        
        NSLayoutConstraint.activate([
            moviePoster.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            moviePoster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            moviePoster.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            moviePoster.widthAnchor.constraint(equalToConstant: 50),
            moviePoster.heightAnchor.constraint(equalToConstant: 50),
            
            movieTitle.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 12),
            movieTitle.centerYAnchor.constraint(equalTo: moviePoster.centerYAnchor),
            
            movieYear.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 12),
            movieYear.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 12),
            movieYear.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor, constant: -12),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: MovieModel){
        moviePoster.image = UIImage(systemName: model.image)
        movieTitle.text = model.title
        movieYear.text = model.year
        
    }
    
    func setCellMovieValue(movie: MovieModel){
        self.movieTitle.text = movie.title
        self.movieYear.text = movie.year
        
    }
}

