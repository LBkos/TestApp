//
//  AddItem.swift
//  TestApp
//
//  Created by Константин Лопаткин on 18.10.2020.
//

import SwiftUI
import CoreData

struct AddItem: View {
    @Environment(\.presentationMode) var presentationMode
    @State var image: Data = .init(count: 0)
    @State var show: Bool = false
    @State var name: String = ""
    @State var number: String = ""
    @State var email: String = ""
    @State var error: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    
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
                    if error == true {
                        Text("Поле Name или Phone не заполнено!")
                    }
                    TextField("Name", text: $name)
                    TextField("Phone", text: $number).keyboardType(.numberPad)
                    TextField("E-mail", text: $email).keyboardType(.emailAddress)
                }
                .font(.system(size: 18))
                .padding()
            }
            Spacer()
            
        }
        .padding()
        .navigationBarTitle("\(name)", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            if self.name == "" || self.number == "" {
                self.error = true
            } else {
                addItem()
            }
        }) {
            
            Text("Save")
        })
        
    }
    private func addItem() {
        
        let newItem = Agent(context: viewContext)
        newItem.id = UUID()
        newItem.name = name
        newItem.number = number
        newItem.email = email
        newItem.imageD = image
        
        do {
            try viewContext.save()
            self.presentationMode.wrappedValue.dismiss()
            
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
}

