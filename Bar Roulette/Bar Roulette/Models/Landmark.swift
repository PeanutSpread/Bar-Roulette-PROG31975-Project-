//
//  Landmark.swift
//  Bar Roulette
//
//  Created by Akshay Kochhar on 2021-11-26.
//

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
