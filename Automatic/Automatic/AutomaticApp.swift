//
//  AutomaticApp.swift
//  Automatic
//
//  Created by Jonny Werthman on 11/12/23.
//

import SwiftUI




<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
@main
struct AutomaticApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
                   // Use the CalendarViewControllerWrapper as a bridge between SwiftUI and UIKit
                   ContentView()
                       .environment(\.managedObjectContext, persistenceController.container.viewContext)
               }
    }
}
