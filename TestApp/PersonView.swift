//
//  PersonView.swift
//  TestApp
//
//  Created by Константин Лопаткин on 16.10.2020.
//

import SwiftUI
import CoreData
struct PersonView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @Binding var image: Data
    @State var name: String
    @State var show: Bool = false
    @State var number: String
    @State var email: String
    var newName: String
    
    var body: some View {
        VStack {
            ImageView(width: 200, height: 200, image: $image)
            HStack {
                VStack {
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Text("Add Foto")
                    }.sheet(isPresented: self.$show) {
                        ImagePicker(show: self.$show, image: self.$image)
                    }
                    
                    TextField("name", text: $name).font(.title2)
                    TextField("number", text: $number).keyboardType(.numberPad)
                    TextField("email", text: $email).keyboardType(.emailAddress)
                    
                }
                
                .toolbar(content: {
                    Button(action: saveChanges) {
                        Text("Save")
                    }
                })
                .font(.title3)
                .padding()
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("\(name)", displayMode: .inline)
        
    }
    
    func saveChanges() {
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Agent")
        fetchRequest.predicate = NSPredicate(format: "name = %@", newName)
        
        do {
            let item = try! viewContext.fetch(fetchRequest)
            let objectUpdate = item[0] as! NSManagedObject
            objectUpdate.setValue(name, forKey: "name")
            objectUpdate.setValue(number, forKey: "number")
            objectUpdate.setValue(email, forKey: "email")
            objectUpdate.setValue(image, forKey: "imageD")
            
            do {
                try viewContext.save()
                self.presentationMode.wrappedValue.dismiss()

            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

//struct PersonView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonView(name: "rick", number: "98998765", email: "skdjfhsdf")
//    }
//}
