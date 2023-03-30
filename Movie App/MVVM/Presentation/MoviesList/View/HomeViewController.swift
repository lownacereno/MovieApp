import UIKit

class HomeViewController : UIViewController, HomeViewControllerProtocol, UISearchBarDelegate{
    
    var movieList : [MovieModel] = []
    var originalMovieList : [MovieModel] = []
    let tableView = UITableView()
    private let dataSource : MoviesTableViewDatasource?
    private let delegate : MoviesTableViewDelegate?
    private let viewModel = HomeViewModel(dataService: MoviesDataService())
    private let errorInternetConection = UILabel()
    private var errorButton = UIButton()
    private var searchBarView = UISearchBar()
    
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
        searchBarView.delegate = self
        tableView.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: false)
        reloadView()
    }
    
    private func initMovieListViews(){
        movieListSetup()
        movieSearchBarSetup()
        movieListConstraints()
        searchBar(searchBarView, textDidChange: "")
        viewModel.getMovies()
    }
    
    private func initErrorViews(){
        errorSetup()
        errorButtonSetup()
        errorMovieConstraints()
    }
    
    private func errorMovieConstraints(){
        NSLayoutConstraint.activate([
            errorInternetConection.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            errorInternetConection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            errorInternetConection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            errorButton.topAnchor.constraint(equalTo: errorInternetConection.bottomAnchor, constant: 100),
            errorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            errorButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func movieListConstraints(){
        NSLayoutConstraint.activate([
            searchBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBarView.heightAnchor.constraint(equalToConstant: 50),
            tableView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func errorSetup(){
        errorInternetConection.translatesAutoresizingMaskIntoConstraints = false
        errorInternetConection.font = .boldSystemFont(ofSize: 20)
        errorInternetConection.numberOfLines = 0
        errorInternetConection.textAlignment = .justified
        errorInternetConection.text = "Disculpe, en estos momentos no tiene conexión a internet por lo que no podemos mostrarle más información."
        view.addSubview(errorInternetConection)
    }
    
    private func errorButtonSetup(){
        errorButton.translatesAutoresizingMaskIntoConstraints = false
        errorButton.backgroundColor = .init(red: 60/255.0, green: 64/255.0, blue: 72/255.0, alpha: 1)
        errorButton.layer.cornerRadius = 15
        errorButton.setTitle("Volver a intentar", for: .normal)
        errorButton.addTarget(self, action: #selector(reloadView), for: .touchDown)
        view.addSubview(errorButton)
    }
    
    private func movieSearchBarSetup(){
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.backgroundColor = .white
        view.addSubview(searchBarView)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        movieList = originalMovieList
        movieList = searchText.isEmpty ? originalMovieList : movieList.filter{$0.title.contains(searchText)}
        tableView.reloadData()
    }
    
    private func movieListSetup(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func goToDetail(indexPath: IndexPath) {
        let model = movieList[indexPath.row]
        let movieDetail = MovieDetailViewController()
        movieDetail.detail = model
        navigationController?.pushViewController(movieDetail, animated: true)
    }
    
    func checkConectivity() -> Bool {
        if Conectivity.isConectedToInternet{
            return true
        }else{
            return false
        }
    }
    
    @objc func reloadView(){
        if checkConectivity(){
            initMovieListViews()
            self.navigationItem.title = "Películas en cartelera"
            viewModel.moviesDownloaded = { [self] in
                self.movieList = viewModel.movieList.sorted{
                    $0.getReleaseStateAsDate().compare($1.getReleaseStateAsDate()) == .orderedDescending
                }
                self.originalMovieList = movieList
                print(viewModel.movieList.count)
                tableView.reloadData()
            }
        }else{
            initErrorViews()
        }
    }
}

