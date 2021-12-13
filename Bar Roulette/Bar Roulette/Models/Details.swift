//
//  Details.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-12-11.
//

/* {"type":"FeatureCollection","features":[{"type":"Feature","properties":{"feature_type":"details","website":"https://monaghans.ca/","name":"Monaghan's Sports Pub & Grill","contact":{"phone":"+1-905-842-4435"},"payment_options":{"cash":true,"visa":true,"mastercard":true,"discover_card":true,"american_express":true},"categories":["catering","catering.restaurant"],"datasource":{"sourcename":"openstreetmap","attribution":"© OpenStreetMap contributors","license":"Open Database Licence","url":"https://www.openstreetmap.org/copyright"},"housenumber":"1289","street":"Marlborough Court","city":"Oakville","county":"Halton Region","state":"Ontario","postcode":"L6H 2R9","country":"Canada","country_code":"ca","formatted":"Monaghan's Sports Pub & Grill, 1289 Marlborough Court, Oakville, ON L6H 2R9, Canada","address_line1":"Monaghan's Sports Pub & Grill","address_line2":"1289 Marlborough Court, Oakville, ON L6H 2R9, Canada","lat":43.470721,"lon":-79.6945137,"place_id":"51ef0797e972ec53c0591f6ff39540bc4540f00103f901a895fa7e0100000092031d4d6f6e616768616e27732053706f727473205075622026204772696c6c"},"geometry":{"type":"Point","coordinates":[-79.6945137,43.470721001]}}]}
*/
// Akshay Kochhar
// ID: 991414503
// Luke Van Rooyen
// ID: 991583099
import Foundation
import UIKit
import DeveloperToolsSupport

struct Details: Codable {
    var total: Int
    struct Buisness: Codable {
        var rating: Double
        var price: String
        var phone: String
        var id: String
        var alias: String
        var is_closed: Bool
        
        struct Category: Codable {
            var alias: String
            var title: String
        }
        var categories: [Category]
        
        var review_count: Int
        var name: String
        var url: String
        
        struct Coordinates: Codable {
            var latitude: Decimal
            var longitude: Decimal
        }
        var coordinates: Coordinates
        
        var image_url: String
        
        struct Location: Codable {
            var city: String
            var country: String
            var address2: String
            var address3: String
            var state: String
            var address: String
            var zip_code: String
        }
        var location: Location
        
        var distance: Double
        var transactions: [String]
    }
    var buisinesses: [Buisness]
    
    struct Region: Codable {
        struct Center: Codable {
            var latitude: Decimal
            var longitude: Decimal
        }
        var center: Center
    }
    var reigon: Region
    
    
}



