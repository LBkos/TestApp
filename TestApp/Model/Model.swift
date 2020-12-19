//
//  Model.swift
//  TestApp
//
//  Created by Константин Лопаткин on 19.12.2020.
//

import SwiftUI
import CoreData

class Model: ObservableObject, Identifiable {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Published var image: Data = .init(count: 0)
    @Published var show: Bool = false
    @Published var name: String = ""
    @Published var number: String = ""
    @Published var email: String = ""
    @Published var error: Bool = false
    @Published var isNewData: Bool = false
    @Published var updateItem: Agent!
    
    func saveItem(context: NSManagedObjectContext) {
        
        if updateItem != nil {
            
            updateItem.name = name
            updateItem.email = email
            updateItem.number = number
            updateItem.imageD = image
            
            try? context.save()
            // removing updateItem if successfull
            updateItem = nil
            isNewData.toggle()
            return
        }
        let newItem = Agent(context: context)
        newItem.id = UUID()
        newItem.name = name
        newItem.number = number
        newItem.email = email
        newItem.imageD = image
        do {
            try context.save()
            isNewData.toggle()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func EditItem(item: Agent){
        
        updateItem = item
        // togging the newDataView....
        name = item.name!
        number = item.number!
        email = item.email ?? ""
        image = item.imageD ?? .init(count: 0)
        
        isNewData.toggle()
    }
    
    func clearData() {
        name = ""
        number = ""
        email = ""
        image = .init(count: 0)
    }
}
