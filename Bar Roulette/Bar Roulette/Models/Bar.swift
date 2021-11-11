//
//  Bar.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//

import Foundation

class Bar {
    private var name : String
    private var barType : String
    private var rating : Double
    private var latitude : Double
    private var longitude : Double
    private var address : String
    private var phone : String
    private var website : String
    
    init (Name name : String, BarType barType : String, Rating rating : Double, Latitude latitude : Double, Longitude longitude : Double, Address address : String, Phone phone : String, Website website : String) {
        
        self.name = name
        self.barType = barType
        self.rating = rating
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.phone = phone
        self.website = website
        
    }
    
    func getName() -> String{
        return self.name
    }
    
    func getBarType() -> String{
        return self.barType
    }
    
    func getRating() -> Double{
        return self.rating
    }
    
    func getLatitude() -> Double{
        return self.latitude
    }
    
    func getLongitude() -> Double {
        return self.longitude
    }
    
    func getAddress() -> String{
        return self.address
    }
    
    func getPhone() -> String{
        return self.phone
    }
    
    func getWebsite() -> String{
        return self.website
    }
    
}
