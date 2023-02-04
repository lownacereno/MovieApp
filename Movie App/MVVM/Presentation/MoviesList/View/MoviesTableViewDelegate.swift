
import UIKit

class MoviesTableViewDelegate : NSObject{
    
    weak var viewController: HomeViewController?
}

extension MoviesTableViewDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La tabla fue seleccionada")
    }
    
}

