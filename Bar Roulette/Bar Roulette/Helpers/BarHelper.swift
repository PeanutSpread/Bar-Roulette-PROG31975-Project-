//
//  BarHelper.swift
//  Bar Roulette
//
//  Created by Akshay Kochhar on 2021-12-12.
//
// Akshay Kochhar
// ID: 991414503
// Luke Van Rooyen
// ID: 991583099
import Foundation
import MapKit
import SwiftUI

class BarHelper : ObservableObject{
    
@Published var locationHelper = LocationHelper()
@Published var localBars = [Bar]()
    
func getNearbyLocations(){
    DispatchQueue.global().async {
    let request = MKLocalSearch.Request()
    
    request.naturalLanguageQuery = "bars"
    request.pointOfInterestFilter = .includingAll
    request.resultTypes = .pointOfInterest
        if (self.locationHelper.currentLocation != nil){
        request.region = MKCoordinateRegion(center: self.locationHelper.currentLocation!.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
            print(self.locationHelper.currentLocation?.coordinate.latitude)
    }
    let search = MKLocalSearch(request: request)
    search.start { (response, error) in
        if let response = response {
            
            let mapItems = response.mapItems
            DispatchQueue.main.async {
            mapItems.forEach { location in
                self.localBars.append(Bar(Id: UUID(), Name: location.name ?? "", BarType: "Sports Bar", Rating: 3.0, Latitude: location.placemark.coordinate.latitude, Longitude: location.placemark.coordinate.longitude, Address: location.placemark.title ?? "", Phone: "+1 (905) 842-4435", Website: "monaghans.ca"))
            }
        }
        }
    }
        print(self.localBars.count)
}
}
}
