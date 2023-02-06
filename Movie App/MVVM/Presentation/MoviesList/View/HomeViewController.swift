import Foundation
import UIKit
import Alamofire

struct Conectivity{
    static let shared = NetworkReachabilityManager()!
    static var isConectedToInternet : Bool { return self.shared.isReachable}
}

class HomeViewController : UIViewController, HomeViewControllerProtocol{
    
    var movieList : [MovieModel] = []
    private let tableView = UITableView()
    private let dataSource : MoviesTableViewDatasource?
    private let delegate : MoviesTableViewDelegate?
    private let viewModel = HomeViewModel(dataService: MoviesDataService())
    private let errorInternetConection = UILabel()
    private var errorButton = UIButton()
    
    init(dataSourceTable: MoviesTableViewDatasource, delegateTable: MoviesTableViewDelegate){
        self.dataSource = dataSourceTable
        self.delegate = delegateTable
        super.init(nibName: nil, bundle: nil)
        self.dataSource?.viewController = self
        self.delegate?.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: false)
        reloadView()
    }
    
    func initErrorViews(){
        errorSetup()
        errorButtonSetup()
        movieListConstraints()
    }
    
    func movieListConstraints(){
        NSLayoutConstraint.activate([
            errorInternetConection.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            errorInternetConection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            errorInternetConection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            errorButton.topAnchor.constraint(equalTo: errorInternetConection.bottomAnchor, constant: 100),
            errorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            errorButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func errorSetup(){
        errorInternetConection.translatesAutoresizingMaskIntoConstraints = false
        errorInternetConection.font = .boldSystemFont(ofSize: 20)
        errorInternetConection.numberOfLines = 0
        errorInternetConection.textAlignment = .justified
        errorInternetConection.text = "Disculpe, en estos momentos no tiene conexión a internet por lo que no podemos mostrarle más información."
        view.addSubview(errorInternetConection)
    }
    
    func errorButtonSetup(){
        errorButton.translatesAutoresizingMaskIntoConstraints = false
        errorButton.backgroundColor = .init(red: 60/255.0, green: 64/255.0, blue: 72/255.0, alpha: 1)
        errorButton.layer.cornerRadius = 15
        errorButton.setTitle("Recargar vista", for: .normal)
        errorButton.addTarget(self, action: #selector(reloadView), for: .touchDown)
        view.addSubview(errorButton)
    }
    
    func movieListSetup(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "cell")
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func goToDetail(indexPath: IndexPath) {
        let model = movieList[indexPath.row]
        let movieDetail = MovieDetailViewController()
        movieDetail.detail = model
        navigationController?.pushViewController(movieDetail, animated: true)
    }
    
    func checkConectivity() -> Bool {
        if Conectivity.isConectedToInternet{
            print("esta conectado")
            return true
        }else{
            print("no esta conectado")
            return false
        }
    }
    
    @objc func reloadView(){
        if checkConectivity(){
            movieListSetup()
            viewModel.getMovies()
            self.navigationItem.title = "Movies"
            viewModel.moviesDownloaded = { [self] in
                self.movieList = viewModel.movieList
                print(viewModel.movieList.count)
                tableView.reloadData()
            }
        }else{
            initErrorViews()
        }
        
    }
}

