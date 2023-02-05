import UIKit
import CoreLocation

class SplashScreen: UIViewController, CLLocationManagerDelegate{
    
    private let icon = UIImageView()
    var timer = Timer()
    var locationManager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        initViews()
        view.backgroundColor = .black
    }
    
    func initViews(){
        moviePosterCell()
        splashScreenConstraints()
        setMovieIcon()
        requesLocationPermission()
    }
    
    func splashScreenConstraints(){
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 250),
            icon.heightAnchor.constraint(equalToConstant: 250)
        ]) }
    
    func moviePosterCell(){
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(icon)
    }
    
    func requesLocationPermission(){
        
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.notDetermined || status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted {
            self.locationManager.requestWhenInUseAuthorization()
        }else{
            splashTimer()
        }
    }
    
    func splashTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) {timer in
            let viewController = HomeViewController(dataSourceTable: MoviesTableViewDatasource(), delegateTable: MoviesTableViewDelegate())
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func setMovieIcon(){
        icon.image = UIImage(named: "icon")
    }
    
    internal func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            splashTimer()
            break
        case .authorizedWhenInUse:
            splashTimer()
            break
        default: break
        }
    }
}
