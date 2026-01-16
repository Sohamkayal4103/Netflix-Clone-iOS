//
//  YoutubeSearchResponse.swift
//  MovieApp
//
//  Created by Soham Kayal on 1/11/26.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [ItemProperties]?
}

struct ItemProperties: Codable {
    let id: IdProperties?
}


struct IdProperties: Codable {
    let videoId: String?
}


