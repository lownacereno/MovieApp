
import UIKit

class MoviesTableViewDelegate : NSObject{
    
    weak var viewController: HomeViewController?
}

extension MoviesTableViewDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La tabla fue seleccionada")
        let model = viewController?.movieList[indexPath.row]
        let movieDetail = MovieDetailViewController()
        movieDetail.detail = model
        viewController?.navigationController?.pushViewController(movieDetail, animated: true)        
    }
    
}

