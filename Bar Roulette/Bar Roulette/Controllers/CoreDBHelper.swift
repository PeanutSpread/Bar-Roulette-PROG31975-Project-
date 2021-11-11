//
//  CoreDBHelper.swift
//  Bar Roulette
//
//  Created by Akshay Kochhar on 2021-11-10.
//


import Foundation
import CoreData
//MVC - Controller

class CoreDBHelper : ObservableObject{
    
    @Published var barList = [BarMO]()
    
    private let ENTITY_NAME = "BarMO"
    private let MOC : NSManagedObjectContext
    
    //singleton instance
    private static var shared: CoreDBHelper?
    
    static func getInstance() -> CoreDBHelper{
        if shared == nil{
            shared = CoreDBHelper(context: PersistenceController.preview.container.viewContext)
        }
        return shared!
    }
    
    init(context: NSManagedObjectContext) {
        self.MOC = context
    }
    
    func insertBar(newBar: Bar){
        do{
            
            let barTobeInserted = NSEntityDescription.insertNewObject(forEntityName: self.ENTITY_NAME, into: self.MOC) as! BarMO
            
            barTobeInserted.name = newBar.name
            
            
            if self.MOC.hasChanges{
                try self.MOC.save()
                print(#function, "Order successfully added to DB")
            }
            
        }catch let error as NSError{
            print(#function, "Could not insert book successfully \(error)")
        }
    }
    
    func getAllBars(){
        let fetchRequest = NSFetchRequest<BarMO>(entityName: self.ENTITY_NAME)
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "id", ascending: true)]
        
        do{
            let result = try self.MOC.fetch(fetchRequest)
            print(#function, "Number of records fetched : \(result.count)")
            self.barList.removeAll()
            self.barList.insert(contentsOf: result, at: 0)
            print(#function, "Result from DB \(result)")
            
        }catch let error as NSError{
            print(#function, "Couldn't fetch data from DB \(error)")
        }
    }
    
    private func searchOrder(barID : UUID) -> BarMO?{
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY_NAME)
        let predicateID = NSPredicate(format: "id == %@", barID as CVarArg)

        fetchRequest.predicate = predicateID
        
        do{
            let result = try self.MOC.fetch(fetchRequest)
            
            if result.count > 0{
                return result.first as? BarMO
            }
            
        }catch let error as NSError{
            print(#function, "Unable to search for given ID \(error)")
        }
        
        return nil
    }
    
    func deleteOrder(barID : UUID){
        let searchResult = self.searchOrder(barID: barID)
        
        if (searchResult != nil){
            
            
            do{
        
                self.MOC.delete(searchResult!)
                
                try self.MOC.save()
                
                print(#function, "Data deleted successfully")
                
            }catch let error as NSError{
                print(#function, "Unable to search for given ID \(error)")
            }
            
        }else{
            print(#function, "No matching record found for given orderID \(barID)")
        }
    }
    
    func updateBar(updatedBar: BarMO){
        let searchResult = self.searchOrder(barID: updatedBar.id as UUID)
        
        if (searchResult != nil){
            do{
                
                let barToUpdate = searchResult!
                //orderToUpdate.roast = updatedOrder.roast
                //orderToUpdate.amount = updatedOrder.amount
                //orderToUpdate.size = updatedOrder.size
                
                try self.MOC.save()
                
                print(#function, "Order details updated successfully")
                
            }catch let error as NSError{
                print(#function, "Unable to search for given ID \(error)")
            }
        }else{
            print(#function, "No matching record found for given orderID \(updatedBar.id)")
        }
    }
    

}

