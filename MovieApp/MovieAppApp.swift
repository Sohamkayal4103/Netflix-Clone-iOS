//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Soham Kayal on 12/24/25.
//

import SwiftUI
import SwiftData

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Title.self)
    }
}
