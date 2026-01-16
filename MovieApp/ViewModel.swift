//
//  ViewModel.swift
//  MovieApp
//
//  Created by Soham Kayal on 12/30/25.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    
    private(set) var homeStatus: FetchStatus = .notStarted
    private(set) var videoIdStatus: FetchStatus = .notStarted
    private(set) var upcomingStatus: FetchStatus = .notStarted
    
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    var trendingTv: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTv: [Title] = []
    var upcomingMovies: [Title] = []
    var heroTitle = Title.previewTitles[0]
    var videoId = ""
    
    func getTitles() async throws {
        homeStatus = .fetching
        if trendingMovies.isEmpty, trendingTv.isEmpty, topRatedMovies.isEmpty, topRatedTv.isEmpty {
            
            do {
                async let trMovies = dataFetcher.fetchTitles(for: "movie", by: "trending")
                async let trTv = dataFetcher.fetchTitles(for: "tv", by: "trending")
                async let tMovies = dataFetcher.fetchTitles(for: "movie", by: "top_rated")
                async let tTv = dataFetcher.fetchTitles(for: "tv", by: "top_rated")
                
                trendingMovies = try await trMovies
                trendingTv = try await trTv
                topRatedMovies = try await tMovies
                topRatedTv = try await tTv
                
                if let title = trendingMovies.randomElement() {
                    heroTitle = title
                }
                
                homeStatus = .success
            } catch {
                print(error)
                homeStatus = .failed(underlyingError: error)
            }
            
        }
        else {
            homeStatus = .success
        }
    }
    
    func getVideoId(for title: String) async {
        videoIdStatus = .fetching
        
        do {
            videoId = try await dataFetcher.fetchVideoId(for: title)
            videoIdStatus = .success
        } catch {
            print(error)
            videoIdStatus = .failed(underlyingError: error)
        }
    }
    
    
    func getUpcomingMovies() async  {
        upcomingStatus = .fetching
        
        do {
            upcomingMovies = try await dataFetcher.fetchTitles(for: "movie", by: "upcoming")
            upcomingStatus = .success
        } catch {
            print(error)
            upcomingStatus = .failed(underlyingError: error)
        }
    }
}
