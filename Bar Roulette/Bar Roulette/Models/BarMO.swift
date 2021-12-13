//
//  BarMO.swift
//  Bar Roulette
//
//  Created by Akshay Kochhar on 2021-11-10.
//
// Akshay Kochhar
// ID: 991414503
// Luke Van Rooyen
// ID: 991583099
import Foundation
import CoreData

@objc(BarMO)
final class BarMO : NSManagedObject{
    @NSManaged var id : UUID
    @NSManaged var name : String
    @NSManaged var barType : String
    @NSManaged var rating : Double
    @NSManaged var latitude : Double
    @NSManaged var longitude : Double
    @NSManaged var address : String
    @NSManaged var phone : String
    @NSManaged var website : String
}

extension BarMO {
    func convertToBar() -> Bar {
        Bar(Id : id, Name : name, BarType : barType, Rating : rating, Latitude : latitude, Longitude : longitude, Address : address, Phone : phone, Website : website)
    }
}
