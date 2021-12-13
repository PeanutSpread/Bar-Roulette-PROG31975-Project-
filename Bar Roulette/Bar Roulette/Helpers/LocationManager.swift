////
////  LocationManager.swift
////  Bar Roulette
////
////  Created by Akshay Kochhar on 2021-12-12.
////
///// Akshay Kochhar
// ID: 991414503
// Luke Van Rooyen
// ID: 991583099
//
//import Foundation
//import MapKit
//
//class LocationManager: NSObject, ObservableObject {
//
//    private let locationManager = CLLocationManager()
//    var location: CLLocation? = nil
//
//    override init(){
//        super.init()
//        self.locationManager.delegate = self
//        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        self.locationManager.distanceFilter = kCLDistanceFilterNone
//        self.locationManager.startUpdatingLocation()
//    }
//
//}
//
//extension LocationManager: CLLocationManagerDelegate {
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
//        print(status)
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
//        guard let location = locations.last else {
//            return
//        }
//
//        self.location = location
//    }
//}
