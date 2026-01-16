//
//  ContentView.swift
//  MovieApp
//
//  Created by Soham Kayal on 12/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab(Constants.homestring,systemImage: Constants.homeIconString) {
                HomeView()
            }
            Tab(Constants.upcomingstring,systemImage: Constants.upcomingIconString) {
                UpcomingView()
            }
            Tab(Constants.searchString,systemImage: Constants.searchIconString) {
                SearchView()
            }
            Tab(Constants.downloadsstring,systemImage: Constants.downloadsIconString) {
                DownloadView()
            }
        }
        .onAppear {
            if let config = APIConfig.shared {
                print(config.tmdbAPIKey)
                print(config.tmdbBaseURL)
            }
        }
    }
}

#Preview {
    ContentView()
}
