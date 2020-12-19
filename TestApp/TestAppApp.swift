//
//  TestAppApp.swift
//  TestApp
//
//  Created by Константин Лопаткин on 16.10.2020.
//

import SwiftUI

@main
struct TestAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
