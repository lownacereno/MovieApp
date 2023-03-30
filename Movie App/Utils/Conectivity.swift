import UIKit
import Alamofire

struct Conectivity{
    
    static let shared = NetworkReachabilityManager()
    static var isConectedToInternet : Bool { return ((self.shared?.isReachable) != nil)}
}
