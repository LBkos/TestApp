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
    var imageData: Data = .init()
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(items) { item in
                        ListView(image: item.imageD ?? imageData, name: item.name ?? "", number: item.number ?? "", email: item.email ?? "", newName: item.name ?? "")
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                .toolbar {
                    #if os(iOS)
                    EditButton()
                    #endif
                }
                NavigationLink(destination: AddItem()) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                    Text("Add New")
                        .font(.title3)
                }
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
