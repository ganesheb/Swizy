//
//  SwizyApp.swift
//  Swizy
//
//  Created by Ganesh Ekatata Buana on 26/07/22.
//

import SwiftUI

@main
struct SwizyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
