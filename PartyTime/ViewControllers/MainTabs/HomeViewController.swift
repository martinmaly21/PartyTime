//
//  HomeViewController.swift
//
//
//  Created by Martin Maly on 2018-10-10.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController {
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let regionInMeters = CLLocationDistance(1000)
    var previousLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        // Do any additional setup after loading the view.
    }
    
    func checkLocationServices() {
        //Check if system-wide location services are enabled
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            //show alert that user needs to enbable location services
            Alert.showBasictitle(title: "Error", message: "Location services are currently disabled.", vc: self)
        }
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func centerViewOnUserLocation() {
        //Code to center the view on the user's current location
        
        mapView.mapType = .standard
        mapView.showsBuildings = true
        mapView.showsCompass = false
        
    
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
           
            mapView.setRegion(region, animated: true)
            let mapCamera = MKMapCamera()
            mapCamera.centerCoordinate = location
            mapCamera.pitch = 45
            mapCamera.altitude = 2000
            mapView.camera = mapCamera
      
        }
        
        
        
        
    }
    
    func checkLocationAuthorization() {
        //Checking the various authorization states of location services for 'PartyTime' itself.
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            //Not necessary since the app will not ask for location service authorization when the app is not open.
            break
        case .authorizedWhenInUse:
            //This is what we want! Basically, the user has enabled location services for 'PartyTime' whenever the app is running.
            //Thus, run code to show user on the map.
            startTrackingUsersLocation()
//            locationManager.startUpdatingLocation()
            break
        case .denied:
            //Occurs when user has already denied location services for the app
            //Show alert instructing them how to turn on location services in settings
            break
        case .notDetermined:
            //'PartyTime' has not asked for location yet. Therefore, this line of code is run as a pop-up asking for user's location.
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            //Write code below handling the case when location is restricted through parental controls or such.
            break
        }
    }
    
    
    
    func startTrackingUsersLocation() {

        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        previousLocation = getCenterLocationmapv(for: mapView)
        
    }
    
    
    
    
    
    
   func getCenterLocationmapv(for mapView: MKMapView) -> CLLocation {
    
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
    
    return CLLocation(latitude: latitude,longitude: longitude)
    
    }
    
    
    
}



extension HomeViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        //Code to update location depending on user changing
//        guard let location = locations.last else { return }
//        let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
//        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //This function is called whenever the authorization permission changes
        //Thus we once again check the location authorization with the function we wrote previously.
        checkLocationAuthorization()
    }
    
}


