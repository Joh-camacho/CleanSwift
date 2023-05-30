//
//  NetworkRequest.swift
//  CleanSwift
//
//  Created by Johnny Sousa on 30/05/23.
//

import Foundation

protocol NetworkRequest {
    var baseURL: String { get }
    var pathURL: String { get }
    var method: HTTPMethod { get }
}

enum HTTPMethod: String {
    case get
}

extension NetworkRequest {
    var baseURL: String {
        "https://http.dog/"
    }
}
