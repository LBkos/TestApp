//
//  Model.swift
//  TestApp
//
//  Created by Константин Лопаткин on 18.10.2020.
//

//import Foundation
import SwiftUI
import CoreData

class Model: ObservableObject {
    
//    @Published var data: [NSManagedObject] = []
//    @Published var txt = ""
//    @Published var isUpdate = false
//    @Published var updateTxt = ""
// var selectedObj = NSManagedObject()
//    
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var name: String = ""
    @State var id: UUID = UUID()
    @State var number: String = ""
    @State var email: String = ""
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Agent.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Agent>
    
    //let context = PersistenceController.shared.container.viewContext

//     func addItem() {
//       withAnimation {
//           let newItem = Agent(context: viewContext)
//        newItem.setValue(name, forKey: "name")
//           newItem.setValue(number, forKey: "number")
//           newItem.setValue(email, forKey: "email")
//
//           do {
//               try viewContext.save()
//           } catch {
//               // Replace this implementation with code to handle the error appropriately.
//               // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//               let nsError = error as NSError
//               fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//           }
//       }
//   }


    func updateData() {
        
        
        
        
        
     //let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Agent")
//
//        do {
//            let results = try context.fetch(request) as! [NSManagedObject]
//
//            let obj = results.first { (obj) -> Bool in
//
//                if obj == selectedObj{return true}
//                else{ return false}
//
//            }
//            obj?.setValue(name, forKey: "name")
//
//
//
//            try context.save()
//        } catch {
//            print(error)
//        }
}

    
}
