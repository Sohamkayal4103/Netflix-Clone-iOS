//
//  Errors.swift
//  MovieApp
//
//  Created by Soham Kayal on 12/30/25.
//

import Foundation


enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
            case .fileNotFound:
                return "API Configuration File not found."
            case .dataLoadingFailed(underlyingError: let error):
                return "Failed to load data from API Configuration file: \(error.localizedDescription)."
            case .decodingFailed(underlyingError: let error):
                return "Failed to decode API Configuration: \(error.localizedDescription)."
        }
    }
}

enum NetworkError: Error, LocalizedError {
    case badURLResponse(underlyingError: Error)
    case missingConfig
    case URLBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(underlyingError: let error):
            return "Bad URL Response: \(error.localizedDescription)."
        case .missingConfig:
            return "Missing API Configuration."
        case.URLBuildFailed:
            return "Failed to build URL."
        }
    }
}
