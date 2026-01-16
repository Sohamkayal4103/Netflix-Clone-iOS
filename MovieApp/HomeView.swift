//
//  HomeView.swift
//  MovieApp
//
//  Created by Soham Kayal on 12/24/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    let viewModel = ViewModel()
    @State private var titleDetailPath = NavigationPath()
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack(path: $titleDetailPath) {
            GeometryReader { geo in
                ScrollView(.vertical) {
                    switch viewModel.homeStatus {
                    case .notStarted:
                        EmptyView()
                    case .fetching:
                        ProgressView()
                            .frame(width: geo.size.width, height: geo.size.height)
                        
                    case .success:
                        LazyVStack {
                            AsyncImage(url: URL(string: viewModel.heroTitle.posterPath ?? "")) { image in
                                image
                                // modifiers
                                    .resizable()
                                    .scaledToFit()
                                    .overlay {
                                        LinearGradient(
                                            stops: [Gradient.Stop(color: .clear, location: 0.8),
                                                    Gradient.Stop(color: .gradient, location: 1)],
                                            startPoint: .top,
                                            endPoint: .bottom,
                                        )
                                    }
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: geo.size.width, height: geo.size.height * 0.85)
                            
                            HStack {
                                Button {
                                    titleDetailPath.append(viewModel.heroTitle)
                                } label: {
                                    Text(Constants.playString)
                                        .ghostButton()
                                }
                                
                                Button {
                                    modelContext.insert(viewModel.heroTitle)
                                    try? modelContext.save()
                                } label: {
                                    Text(Constants.downloadsstring)
                                        .ghostButton()
                                }
                            }
                            
                            HorizontalListView(header: Constants.trendingMovieString, titles: viewModel.trendingMovies) {title in
                                    titleDetailPath.append(title)
                            }
                            HorizontalListView(header: Constants.trendingTvString, titles: viewModel.trendingTv) {title in
                                titleDetailPath.append(title)
                            }
                            HorizontalListView(header: Constants.topRatedMovies, titles: viewModel.topRatedMovies) {title in
                                titleDetailPath.append(title)
                            }
                            HorizontalListView(header: Constants.topRatedTVShows, titles: viewModel.topRatedTv) {title in
                                titleDetailPath.append(title)
                            }
                        }
                    case .failed(let error):
                        if let localized = (error as NSError?)?.localizedDescription, !localized.isEmpty {
                            Text("Failed to load data due to an error: \(localized)").errorMessage().frame(width: geo.size.width, height: geo.size.height)
                        } else {
                            Text(String("Failed to load data due to an error: \(String(describing: error))")).errorMessage()
                                .frame(width: geo.size.width, height: geo.size.height)
                        }
                    }
                    
                }
                .task {
                    do {
                        try await viewModel.getTitles()
                    } catch {
                        print("Failed to fetch titles: \(error)")
                    }
                }
                .navigationDestination(for: Title.self) {title in
                        TitleDetailView(title: title)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

