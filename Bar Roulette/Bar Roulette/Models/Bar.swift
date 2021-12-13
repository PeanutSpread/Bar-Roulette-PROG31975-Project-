//
//  Bar.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//
// Akshay Kochhar
// ID: 991414503
// Luke Van Rooyen
// ID: 991583099
import Foundation

struct Bar : Hashable{
    var id : UUID
    var name : String
    var barType : String
    var rating : Double
    var latitude : Double
    var longitude : Double
    var address : String
    var phone : String
    var website : String
    
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
