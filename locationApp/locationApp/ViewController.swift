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
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
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

