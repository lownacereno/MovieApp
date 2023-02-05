import UIKit

class MoviesTableViewDatasource : NSObject{
    
    weak var viewController: HomeViewController?
}

extension MoviesTableViewDatasource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewController?.movieList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieListTableViewCell
        cell.setCellMovieValue(model: (viewController?.movieList[indexPath.row])!)
        return cell
    }
}


