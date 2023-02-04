import Foundation
import UIKit

class HomeViewController : UIViewController {
    
    private let tableView = UITableView()
    private let dataSource : MoviesTableViewDatasource?
    private let delegate : MoviesTableViewDelegate?
    private let viewModel = HomeViewModel(dataService: MoviesDataService())
    var movieList : [MovieModel] = []
    
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
        
        initViews()
        viewModel.getMovies()
        
        viewModel.moviesDownloaded = { [self] in
            self.movieList = viewModel.movieList
            print(viewModel.movieList.count)
            tableView.reloadData()
            
        }
    }
    
    func initViews(){
        movieListSetup()
        movieListConstraints()
    }
    
    func movieListConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func movieListSetup(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

