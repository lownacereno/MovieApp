import UIKit

class MoviesTableViewDatasource : NSObject{
    
    weak var viewController: HomeViewController?
}

extension MoviesTableViewDatasource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewController?.movieList.count ?? 0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieListTableViewCell, let vc = viewController else {return UITableViewCell()}
         cell.setCellMovieValue(model: vc.movieList[indexPath.row])
        return cell
    }
}



