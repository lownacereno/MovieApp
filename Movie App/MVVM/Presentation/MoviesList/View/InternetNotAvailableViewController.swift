import UIKit

class InternetNotAvailableViewController: UIViewController {
    
    var detail : MovieModel?
    
    private let movieTitle = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initDetailViews()
    }
    
    func initDetailViews(){
        movieTitleSetup()
        movieDetailConstraints()
        setMovieValueDescription()
    }
    
    func movieDetailConstraints(){
        NSLayoutConstraint.activate([
            movieTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
 
    func movieTitleSetup(){
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.font = .boldSystemFont(ofSize: 25)
        movieTitle.numberOfLines = 0
        view.addSubview(movieTitle)
    }
    
    
    func setMovieValueDescription(){
      
        movieTitle.text.self = "no hay internet"
       
}

}
