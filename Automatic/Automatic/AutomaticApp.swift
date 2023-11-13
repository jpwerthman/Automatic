//
//  AutomaticApp.swift
//  Automatic
//
//  Created by Jonny Werthman on 11/12/23.
//

import SwiftUI

@main
struct AutomaticApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
