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

    enum buttonPress {
        case map
        case list
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let queensCoordinate = CLLocationCoordinate2D(latitude: 44.226233, longitude: -76.495609)
    @IBOutlet weak var mapView: MKMapView!
    var listView: UITableView!
    let locationManager = CLLocationManager()
    let regionInMeters = CLLocationDistance(1000)
    var previousLocation: CLLocation?
    var lastPressedSegment: buttonPress = .map
    @IBOutlet weak var custNavBar: UIView!
   
    
    
    @IBAction func centerOnUser(_ sender: Any) {
        //TODO: center on user

    }
    
   
    @IBAction func customSegmentValueChanged(_ sender: CustomSegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            if lastPressedSegment == .map {
                break
            } else {
                
                self.listView.removeFromSuperview()
               
                
                
            lastPressedSegment = .map
            break
            }
            
        case 1:
            if lastPressedSegment == .list {
            break
            } else {
      
                self.setUpListView()
    
            lastPressedSegment = .list
            break
            }

        default:
        //code will not execute
        break
        }
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        // Do any additional setup after loading the view.
    }
    
    func setUpListView() {
        //EVENTUALLY THIS WILL BE CHANGED INTO A COLLECTION VIEW, FOR NOW IT'S OKAY
          listView = UITableView(frame: CGRect(x: 0, y: view.frame.height - mapView.frame.height, width: view.frame.width, height: mapView.frame.height))
            listView.backgroundColor = UIColor.lightGray
            listView.separatorColor = UIColor.white
            view.addSubview(listView)
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
            mapView.isPitchEnabled = false
            mapView.isRotateEnabled = false
        
    
            if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
            let mapCamera = MKMapCamera()
            mapCamera.centerCoordinate = location
            mapCamera.pitch = 80.0
            mapCamera.altitude = 400
            //Write code to direct heading between the coordinate (longitude, latitude) of user's location,
            //and coordinates of queen's uni center.
            mapCamera.heading = pointAtQueens(A: location, B: queensCoordinate)
            mapView.camera = mapCamera
        }
    }
    
    func pointAtQueens(A: CLLocationCoordinate2D, B: CLLocationCoordinate2D) -> CLLocationDirection {
        //This function returns a value (double) which is the degree value from facing the first paramater to the second
        var pointToQueens: CLLocationDirection
        let userLatitude = A.latitude * (Double.pi/180)
        let userLongitude = A.longitude * (Double.pi/180)
        let queensLatitude = B.latitude * (Double.pi/180)
        let queensLongitude = B.longitude * (Double.pi/180)
        //Formula found online to convert from longitude/latitude to degree value
        //https://www.igismap.com/formula-to-find-bearing-or-heading-angle-between-two-points-latitude-longitude/
        let X = cos(queensLatitude) * sin(queensLongitude - userLongitude)
        let Y = cos(userLatitude)   * sin(queensLatitude) - sin(userLatitude) * cos(queensLatitude) * cos(queensLongitude - userLongitude)
        pointToQueens = Double(atan2(X, Y)) * (180 / Double.pi)
        return pointToQueens
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
       // previousLocation = getCenterLocationmapv(for: mapView)
        
    }
    
    
//   func getCenterLocationmapv(for mapView: MKMapView) -> CLLocation {
//
//        let latitude = mapView.centerCoordinate.latitude
//        let longitude = mapView.centerCoordinate.longitude
//
//    return CLLocation(latitude: latitude,longitude: longitude)
//
//    }

    
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


