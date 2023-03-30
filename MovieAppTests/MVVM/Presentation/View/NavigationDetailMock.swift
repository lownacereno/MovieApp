@testable import Movie_App
import UIKit

class NavigationDetailMock: HomeViewControllerProtocol{
 
    
    var success = false
    var isConected = false
    
    
    func goToDetail(indexPath: IndexPath){
        success = true
    }
}
