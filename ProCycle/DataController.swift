//
//  DataController.swift
//  ProCycle
//
//  Created by mvitoriapereirac on 26/05/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CycleInfo")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    lazy var managedContext: NSManagedObjectContext = self.container.viewContext
    
    func saveContext() {
            guard managedContext.hasChanges else { return }
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }

}

struct CycleInfo {
    let phaseDescription: String
    let phaseExpandedDescription: String
    let phaseName: String 
    
}
