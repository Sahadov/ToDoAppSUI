//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 21/01/2025.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
