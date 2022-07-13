//
//  ViewController.swift
//  locationApp
//
//  Created by José Roberto Bognar Junior on 28/06/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var labelSpeed: UILabel!
    @IBOutlet weak var labelLat: UILabel!
    @IBOutlet weak var labelLong: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last!
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        labelLong.text = "\(longitude )"
        labelLat.text = "\(latitude )"
        labelSpeed.text = "\(userLocation.speed )"
        
        let deltaLat: CLLocationDegrees = 0.01
        let deltaLon: CLLocationDegrees = 0.01
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let area: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLat, longitudeDelta: deltaLon)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: area)
        mapView.setRegion(region, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { localDetail, error in
            if error == nil {
                if let data = localDetail?.first {
                    var thoroughfare = ""
                    if data.thoroughfare != nil {
                        thoroughfare = data.thoroughfare!
                    }
                    
                    var subThoroughfare = ""
                    if data.subThoroughfare != nil {
                        subThoroughfare = data.subThoroughfare!
                    }
                    
                    var locality = ""
                    if data.locality != nil {
                        locality = data.locality!
                    }
                    
                    var postalCode = ""
                    if data.postalCode != nil {
                        postalCode = data.postalCode!
                    }
                    
                    var country = ""
                    if data.country != nil {
                        country = data.country!
                    }
                    
                    self.labelAddress.text = thoroughfare + " - "
                                              + subThoroughfare + " / "
                                              + locality + " / "
                                              + country
                }
                
            }
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let accuracyAuthorization = manager.accuracyAuthorization
        switch accuracyAuthorization {
        case .fullAccuracy:
            break
        case .reducedAccuracy:
            self.configAlert()
            break
        default:
            break
        }
    }
    
    func configAlert() {
        let alertController = UIAlertController(title: "Permissão de localização", message: "É necessária a permissão de localização para o app funcionar", preferredStyle: .alert)
        let configAction = UIAlertAction(title: "Abrir configurações", style: .default, handler: { (alertConfig) in
            if let config = NSURL(string: UIApplicationOpenNotificationSettingsURLString) {
                UIApplication.shared.open(config as URL)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alertController.addAction(configAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }


}

