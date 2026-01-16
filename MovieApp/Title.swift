//
//  Title.swift
//  MovieApp
//
//  Created by Soham Kayal on 12/30/25.
//

import SwiftData

// decodable: allows title to be created from an external data source
// identifiable: swift will automatically map the data to struct's properties if names match

struct TMDBAPIObject: Decodable {
    var results: [Title] = []
}

@Model
class Title: Decodable, Identifiable, Hashable {
    @Attribute(.unique) var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
    init(id: Int, title: String? = nil, name: String? = nil, overview: String, posterPath: String) {
        self.id = id
        self.title = title
        self.name = name
        self.overview = overview
        self.posterPath = posterPath
    }
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case name
        case overview
        case posterPath
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    }
    
    static var previewTitles = [
        Title(id: 1, title: "Bettlejuice", name: "Bettlejuice", overview: "A movie about beetlejuice", posterPath: Constants.testTitleURL),
        Title(id: 2, title: "Pulp Fiction", name: "Pulp Fiction", overview: "A movie about Pulp Fiction", posterPath: Constants.testTitleURL2),
        Title(id: 3, title: "The Dark Knight", name: "The Dark Knight", overview: "A movie about Dark Knight", posterPath: Constants.testTitleURL3),
    ]
    
}
