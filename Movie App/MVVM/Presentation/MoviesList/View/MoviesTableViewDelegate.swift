import UIKit

class MoviesTableViewDelegate : NSObject{
    
    var viewController: HomeViewControllerProtocol?
}

extension MoviesTableViewDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController?.goToDetail(indexPath: indexPath)
    }
}

