//
//  ViewControllerApp.swift
//  ViewController
//
//  Created by  Rizki Maulana on 05/01/24.
//

import SwiftUI

@main
struct ViewControllerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
