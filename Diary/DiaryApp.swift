//
//  DiaryApp.swift
//  Diary
//
//  Created by Вячеслав Квашнин on 20.02.2021.
//

import SwiftUI

@main
struct DiaryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
