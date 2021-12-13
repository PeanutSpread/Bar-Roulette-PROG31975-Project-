//
//  Landmark.swift
//  Bar Roulette
//
//  Created by Akshay Kochhar on 2021-11-26.
//
// Akshay Kochhar
// ID: 991414503
// Luke Van Rooyen
// ID: 991583099
import Foundation
import MapKit

struct LandMark {
    
    let placemark: MKPlacemark
    
    var id: UUID{
        return UUID()
    }
    
    var name: String{
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
    
}
