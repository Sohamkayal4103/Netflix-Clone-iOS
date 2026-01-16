//
//  Constants.swift
//  MovieApp
//
//  Created by Soham Kayal on 12/24/25.
//

import Foundation
import SwiftUI

struct Constants {
    static let homestring = "Home"
    static let upcomingstring = "Upcoming"
    static let searchString = "Search"
    static let downloadsstring = "Download"
    static let playString = "Play"
    static let trendingMovieString = "Trending Movies"
    static let trendingTvString = "Trending TV Shows"
    static let topRatedMovies = "Top Rated Movies"
    static let topRatedTVShows = "Top Rated TV Shows"
    static let movieSearchString = "Movie Search"
    static let TVSearchString = "TV Search"
    static let moviePlaceholderString = "Search for a movie"
    static let tvPlaceholderString = "Search for a TV Show"
    
    static let homeIconString = "house"
    static let upcomingIconString = "play.circle"
    static let searchIconString = "magnifyingglass"
    static let downloadsIconString = "arrow.down.to.line"
    static let tvIconString = "tv"
    static let movieIconString = "movieclapper"
    
    static let testTitleURL = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"
    static let testTitleURL2 = "https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
    static let testTitleURL3 = "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
    
    static let posterURLStart = "https://image.tmdb.org/t/p/w500"
    
    static func addPosterPath(to titles: inout [Title]) {
        for index in titles.indices {
            let path = titles[index].posterPath ?? ""
            titles[index].posterPath = Constants.posterURLStart + path
        }
    }
}

enum YoutubeURLStrings: String {
    case trailer = "trailer"
    case queryShorten = "q"
    case space = " "
    case key = "key"
}

extension Text {
    func ghostButton() -> some View {
        self
            .frame(width: 100 ,height: 50)
            .bold()
            .foregroundStyle(.buttonText)
            .background(
                RoundedRectangle(cornerRadius: 20,style: .continuous)
                    .stroke(.buttonBorder,lineWidth: 5)
            )
    }
}

extension Text {
    func errorMessage() -> some View {
        self
            .foregroundStyle(Color.red)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 10.0))
    }
}
