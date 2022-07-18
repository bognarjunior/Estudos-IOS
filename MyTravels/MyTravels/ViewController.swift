//
//  ViewController.swift
//  MyTravels
//
//  Created by José Roberto Bognar Junior on 13/07/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configLocationManager()
        let pressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.markMap))
        pressGesture.minimumPressDuration = 2
        mapView.addGestureRecognizer(pressGesture)
        
    }
    
    @objc func markMap(gesture:UIGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            let selectedPoint = gesture.location(in: self.mapView)
            let coordinates = self.mapView.convert(selectedPoint, toCoordinateFrom: self.mapView)
           
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(coordinates.latitude), longitude: CLLocationDegrees(coordinates.longitude))
            annotation.title = "Pressionado"
            annotation.subtitle = "Aqui"
            
            mapView.addAnnotation(annotation)
        }
    }
    
    
    func configLocationManager() {
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

