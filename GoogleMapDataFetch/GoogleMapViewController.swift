//  ViewController.swift
//  GoogleMapDataFetch
//  Created by Anisha on 27/06/23.


import UIKit
import GoogleMaps
import CoreLocation
import GooglePlaces


//class YourControllerClass: UIViewController,CLLocationManagerDelegate {
//
//    @IBOutlet weak var mapView: GMSMapView!
//    var locationManager = CLLocationManager()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //Your map initiation code
//        let mapView = GMSMapView(frame: CGRect.zero)
//        self.view = mapView
//        self.mapView?.isMyLocationEnabled = true
//
//        //Location Manager code to fetch current location
//        self.locationManager.delegate = self
//        self.locationManager.startUpdatingLocation()
//    }
//
//
//    //Location Manager delegates
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//        let location = locations.last
//        let coordinates = manager.location!.coordinate
//        let camera = GMSCameraPosition.camera(withLatitude: coordinates.latitude, longitude: coordinates.longitude, zoom: 17.0)
//
//        self.mapView?.animate(to: camera)
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
//        marker.title = "You are here"
//        marker.map = mapView
//        //Finally stop updating location otherwise it will come again and again in this delegate
//        self.locationManager.stopUpdatingLocation()
//
//    }
//
//}








































//class GoogleMapViewController: UIViewController, GMSMapViewDelegate {
//
//    let locationManager = CLLocationManager()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
////        let camera = GMSCameraPosition.camera(withLatitude: 12.9352, longitude: 77.6245, zoom: 13.0)
////        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
////        mapView.isMyLocationEnabled = true
////        view = mapView
////
////        // Creates a marker in the center of the map.
////        let marker = GMSMarker()
////        marker.position = CLLocationCoordinate2D(latitude: 12.9352, longitude: 77.6245)
////        marker.title = "Sydney"
////        marker.snippet = "Australia"
////        marker.map = mapView
//
//    }
//}
//
//extension GoogleMapViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let coordinates = manager.location!.coordinate
//        let camera = GMSCameraPosition.camera(withLatitude: coordinates.latitude, longitude: coordinates.longitude, zoom: 13.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        mapView.isMyLocationEnabled = true
//        view = mapView
//
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
//
//    }
//}



class GoogleMapViewController: UIViewController, GMSMapViewDelegate {

    let locationManager = CLLocationManager()
    var coordinates = CLLocationCoordinate2D()

    override func viewDidLoad() {
        super.viewDidLoad()
        //12.9716° N, 77.5946° E
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
        let mapview = GMSMapView(frame: CGRect.zero)
        view = mapview
        mapview.delegate = self

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        let coordinates = CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946)
//        mapView.animate(toLocation: coordinates)
//        mapView.animate(toZoom: 10)

    }
}

extension GoogleMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()

            if let mapview = view as? GMSMapView {
                mapview.isMyLocationEnabled = true
                mapview.settings.myLocationButton = true
            }
        }
    }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        coordinates = manager.location!.coordinate
//        mapView.animate(toLocation: coordinates)
//        mapView.animate(toZoom: 10)
//    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinates = manager.location!.coordinate
//        if let location = locations.first {
//            let latitude = location.coordinate.latitude
//            let longitude = location.coordinate.longitude
            if let mapview = view as? GMSMapView {
                let camera = GMSCameraPosition.camera(withLatitude: coordinates.latitude, longitude: coordinates.longitude, zoom: 10.0)
                mapview.camera = camera
                let marker = GMSMarker()
                marker.position = coordinates
                marker.title = "You are here"
                marker.map = mapview
            }
            locationManager.stopUpdatingLocation()
//        }
    }

}




