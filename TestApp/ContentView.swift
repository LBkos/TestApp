//
//  ContentView.swift
//  TestApp
//
//  Created by Константин Лопаткин on 16.10.2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Agent.name, ascending: true)], animation: .default)
    private var items: FetchedResults<Agent>
    @StateObject var model = Model()
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(items) { item in
                        HStack {
                            ImageView(width: 50, height: 50, image: item.imageD ?? .init(count: 0))
                            Text(item.name!)
                            Spacer()
                            Button(action: {
                                model.EditItem(item: item)
                            }){
                                Image(systemName: "info.circle")
                            }
                            .padding()
                            .sheet(isPresented: $model.isNewData, content: {
                                AddItem(model: model)
                            })
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    #if os(iOS)
                    EditButton()
                    #endif
                }
                Button(action: {
                    model.clearData()
                    model.isNewData.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                    Text("Add New")
                        .font(.title3)
                }
                .sheet(isPresented: $model.isNewData, content: {
                    AddItem(model: model)
                })
                .padding()
            }
            .navigationBarTitle("Contragents")
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        
    }
}
