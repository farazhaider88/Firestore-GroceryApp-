//
//  GroceryAppApp.swift
//  GroceryApp
//
//  Created by Faraz Haider on 15/02/2021.
//

import SwiftUI
import Firebase


@main
struct GroceryAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
