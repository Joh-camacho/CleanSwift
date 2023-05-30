//
//  HttpNetworkRequest.swift
//  CleanSwift
//
//  Created by Johnny Sousa on 30/05/23.
//

import Foundation

enum HttpDogNetworkRequest: NetworkRequest {
    
    case httpDog(statusCode: Int)
    
    var pathURL: String {
        switch self {
        case .httpDog(let statusCode):
            return "\(statusCode).json"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
}
