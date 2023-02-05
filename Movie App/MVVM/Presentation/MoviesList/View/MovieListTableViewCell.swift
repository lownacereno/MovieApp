import UIKit
import Kingfisher

class MovieListTableViewCell: UITableViewCell {
    
    private var movieTitle = UILabel()
    private let movieYear = UILabel()
    private let moviePoster = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customCellConfigure()
        movieCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customCellConfigure(){
        movieTitleCell()
        movieYearCell()
        moviePosterCell()
    }
    
    func movieCellConstraints(){
        NSLayoutConstraint.activate([
            moviePoster.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            moviePoster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            moviePoster.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            moviePoster.widthAnchor.constraint(equalToConstant: 50),
            moviePoster.heightAnchor.constraint(equalToConstant: 50),
            movieTitle.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 12),
            movieYear.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 12),
            movieYear.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 12)
        ])
    }
    
    func movieTitleCell(){
        movieTitle.font = .boldSystemFont(ofSize: 20)
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(movieTitle)
    }
    
    func movieYearCell(){
        movieYear.font = .systemFont(ofSize: 20)
        movieYear.translatesAutoresizingMaskIntoConstraints = false
        addSubview(movieYear)
    }
    
    func moviePosterCell(){
        moviePoster.contentMode = .scaleAspectFill
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        addSubview(moviePoster)
        
    }
    
    func setCellMovieValue(model: MovieModel){
        self.movieTitle.text = model.title
        self.movieYear.text = model.year
        guard let url = URL(string: model.image ) else {return}
        self.moviePoster.kf.setImage(with: url)
    }
}

