//
//  FinalPojectApp.swift
//  FinalPoject
//
//  Created by User23 on 2022/5/4.
//

import SwiftUI
import Firebase

@main
struct FinalPojectApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
