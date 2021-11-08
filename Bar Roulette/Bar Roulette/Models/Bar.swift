//
//  Bar.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//

import Foundation

class Bar {
    private var name : String
    private var type : String
    private var rating : Double
    private var latitude : Double
    private var longitude : Double
    private var address : String
    private var phone : String
    private var website : String
    
    init (Name name : String, Type type : String, Rating rating : Double, Latitude latitude : Double, Longitude longitude : Double, Address address : String, Phone phone : String, Website website : String) {
        
        self.name = name
        self.type = type
        self.rating = rating
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.phone = phone
        self.website = website
        
    }
    
    
}
