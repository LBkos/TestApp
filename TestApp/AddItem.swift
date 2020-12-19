//
//  AddItem.swift
//  TestApp
//
//  Created by Константин Лопаткин on 18.10.2020.
//

import SwiftUI
import CoreData

struct AddItem: View {
    @ObservedObject var model: Model
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationView {
            VStack {
                ImageView(width: 200, height: 200, image: model.image)
                HStack {
                    VStack {
                        Button(action: {
                            model.show.toggle()
                        }) {
                            Text("Add Foto")
                        }.sheet(isPresented: $model.show) {
                            ImagePicker(show: $model.show, image: $model.image)
                        }
                        TextField("Name", text: $model.name)
                        TextField("Phone", text: $model.number).keyboardType(.numberPad)
                        TextField("E-mail", text: $model.email).keyboardType(.emailAddress)
                    }
                    .font(.system(size: 18))
                    .padding()
                }
                Button(action: {
                    model.saveItem(context: viewContext)
                }){
                    Text("Save")
                        .foregroundColor((model.name != "" && model.number != "") ? Color.blue : Color.gray)
                }.disabled((model.name != "" && model.number != "") ? false : true)
                Spacer()
            }
            .padding()
            .navigationBarTitle(model.name, displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) { Text("Cancel") })
        }
    }
}
