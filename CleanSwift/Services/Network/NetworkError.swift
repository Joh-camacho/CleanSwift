//
//  NetworkError.swift
//  CleanSwift
//
//  Created by Johnny Sousa on 30/05/23.
//

import Foundation

enum NetworkError: Error {
    case decodeError
    case noData
    case invalidURL
    case invalidStatusCode
    case networkError
}

extension NetworkError: LocalizedError {

    var errorDescription: String? {
        switch self {
        case .decodeError:
            return "Error during data decoding"
        case .noData:
            return "Data error"
        case .invalidURL:
            return "Invalid URL"
        case .invalidStatusCode:
            return "Invalid status code"
        case .networkError:
            return "An error has occurred. Please verify your connection."
        }
    }
}
