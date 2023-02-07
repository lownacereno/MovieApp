import UIKit
import Kingfisher

class MovieListTableViewCell: UITableViewCell {
    
    private var movieTitle = UILabel()
    private let movieReleaseState = UILabel()
    private let moviePoster = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customCellConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customCellConfigure(){
        moviePosterCell()
        movieTitleCell()
        movieReleaseStateCell()
        movieCellConstraints()
    }
    
    func movieCellConstraints(){
        NSLayoutConstraint.activate([
            moviePoster.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            moviePoster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            moviePoster.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            moviePoster.widthAnchor.constraint(equalToConstant: 100),
            moviePoster.heightAnchor.constraint(equalToConstant: 100),
            movieTitle.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            movieTitle.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 12),
            movieTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieReleaseState.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 12),
            movieReleaseState.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 12)
        ])
    }
    
    func moviePosterCell(){
        moviePoster.contentMode = .scaleAspectFill
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        moviePoster.layer.cornerRadius = 50
        moviePoster.clipsToBounds = true
        addSubview(moviePoster)
    }
    
    func movieTitleCell(){
        movieTitle.font = .boldSystemFont(ofSize: 20)
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.numberOfLines = 0
        addSubview(movieTitle)
    }
    
    func movieReleaseStateCell(){
        movieReleaseState.font = .systemFont(ofSize: 20)
        movieReleaseState.translatesAutoresizingMaskIntoConstraints = false
        addSubview(movieReleaseState)
    }
    
    func setCellMovieValue(model: MovieModel){
        self.movieTitle.text = model.title
        self.movieReleaseState.text = model.releaseState
        guard let url = URL(string: model.image ) else {return}
        self.moviePoster.kf.setImage(with: url)
    }
}

