//
//  Persistence.swift
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

struct PersistenceController {
    //singleton instance
    static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        return result
    }()
    
    let container : NSPersistentContainer
    
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "BarRoulette")
        
        if inMemory{
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError?{
                print("Unable to access BarMO. \(error)")
            }
        })
    }
    
}
