//
//  Bar.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//

import Foundation

struct Bar : Hashable{
    private var id : UUID
    private var name : String
    private var type : String
    private var rating : Double
    private var latitude : Double
    private var longitude : Double
    private var address : String
    private var phone : String
    private var website : String
    
    init (Id id : UUID, Name name : String, BarType barType : String, Rating rating : Double, Latitude latitude : Double, Longitude longitude : Double, Address address : String, Phone phone : String, Website website : String) {
        
        self.id = id
        self.name = name
        self.barType = barType
        self.rating = rating
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.phone = phone
        self.website = website
        
    }
    
    
}
