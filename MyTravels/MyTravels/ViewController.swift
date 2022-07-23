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
    var travel: Dictionary<String, String> = [:]
    var selected: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let index = self.selected {
            if index == -1 {
                self.configLocationManager()
            } else {
                self.showNote(travel: travel)
            }
        }
        let pressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.markMap))
        pressGesture.minimumPressDuration = 2
        mapView.addGestureRecognizer(pressGesture)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        
        //exibe local
        let localization = CLLocationCoordinate2D(latitude: location.coordinate.latitude , longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: localization, span: span)
        self.mapView.setRegion(region, animated: true)
    }
    
    func showNote(travel: Dictionary<String, String>) {
        if let travelLocation = travel["location"] {
            if let latitude = travel["latitude"] {
                if let longitude = travel["longitude"] {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(
                        latitude: Double(latitude)!,
                        longitude: Double(longitude)!
                    )
                    annotation.title = travelLocation
                    self.mapView.addAnnotation(annotation)
                    self.showLocation(latitude: Double(latitude)!, longitude: Double(longitude)!)
                }
            }
        }
    }
    
    func showLocation( latitude: Double, longitude: Double ){
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        print(region)
        self.mapView.setRegion(region, animated: true)
        
    }
    
    @objc func markMap(gesture:UIGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            let selectedPoint = gesture.location(in: self.mapView)
            let coordinates = self.mapView.convert(selectedPoint, toCoordinateFrom: self.mapView)
           
            var localAddress = "Endereço não encontrado"
            let location: CLLocation = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
            CLGeocoder().reverseGeocodeLocation(location) { localDetail, error in
                if error == nil {
                    if let data = localDetail?.first {
                        if let name = data.name {
                            localAddress = name
                        } else {
                            if data.thoroughfare != nil {
                                localAddress = data.thoroughfare!
                            }
                        }
                    }
                    
                    self.travel = ["location":localAddress,
                                   "latitude": String(coordinates.latitude),
                                   "longitude": String(coordinates.longitude)]
                    
                    self.showNote(travel: self.travel)
                    
                    Store().addTravel(travel: self.travel)
                }
            }
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
        let alertController = UIAlertController(
            title: "Permissão de localização",
            message: "É necessária a permissão de localização para o app funcionar",
            preferredStyle: .alert)

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

