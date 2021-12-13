//
//  Details.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-12-11.
//

/* {"type":"FeatureCollection","features":[{"type":"Feature","properties":{"feature_type":"details","website":"https://monaghans.ca/","name":"Monaghan's Sports Pub & Grill","contact":{"phone":"+1-905-842-4435"},"payment_options":{"cash":true,"visa":true,"mastercard":true,"discover_card":true,"american_express":true},"categories":["catering","catering.restaurant"],"datasource":{"sourcename":"openstreetmap","attribution":"© OpenStreetMap contributors","license":"Open Database Licence","url":"https://www.openstreetmap.org/copyright"},"housenumber":"1289","street":"Marlborough Court","city":"Oakville","county":"Halton Region","state":"Ontario","postcode":"L6H 2R9","country":"Canada","country_code":"ca","formatted":"Monaghan's Sports Pub & Grill, 1289 Marlborough Court, Oakville, ON L6H 2R9, Canada","address_line1":"Monaghan's Sports Pub & Grill","address_line2":"1289 Marlborough Court, Oakville, ON L6H 2R9, Canada","lat":43.470721,"lon":-79.6945137,"place_id":"51ef0797e972ec53c0591f6ff39540bc4540f00103f901a895fa7e0100000092031d4d6f6e616768616e27732053706f727473205075622026204772696c6c"},"geometry":{"type":"Point","coordinates":[-79.6945137,43.470721001]}}]}
*/

import Foundation
import UIKit

struct Details : Codable {
    var type : String
    
    struct feature : Codable {
        var type : String
        struct Properties : Codable {
            var feature_type : String
            var website : String?
            var name : String?
            
            struct Contact : Codable {
                var phone : String
            }
            var contact : Contact?
            
            struct PaymentOptions : Codable {
                var cash : Bool
                var visa : Bool
                var mastercard : Bool
                var discover_card : Bool
                var american_express : Bool
            }
            var payment_options : PaymentOptions?
            
            var categories : [String]?
            
            struct Datasource : Codable {
                var sourcename : String
                var attribution : String
                var license : String
                var url : String
            }
            var datasource : Datasource?
            
            var housenumber : String?
            var street : String?
            var city : String?
            var county : String?
            var state : String?
            var postcode : String?
            var country : String?
            var country_code : String?
            var formatted : String?
            var address_line1 : String?
            var address_line2 : String?
            var range : Int?
            var lat : Double
            var lon : Double
            var area : Int?
            var place_id : String?
        }
        var properties : Properties
        
    }
    var features: [feature]
}



