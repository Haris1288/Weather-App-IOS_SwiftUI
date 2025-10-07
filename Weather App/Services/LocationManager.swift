import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager =  CLLocationManager()
    @Published var userLocation : CLLocation?
    static let shared = LocationManager()
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    func requestLocation(){
        manager.requestWhenInUseAuthorization()
    }
    
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
            
        case .notDetermined:
            print("not Determined")
        case .restricted:
            print("Restricted")
        case .denied:
            print("Denied")
        case .authorizedAlways:
            print("Auth Always in use")
        case .authorizedWhenInUse:
            print("Auth when in use")
        @unknown default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loaction = locations.last else {return}
        self.userLocation = loaction
    }
}
