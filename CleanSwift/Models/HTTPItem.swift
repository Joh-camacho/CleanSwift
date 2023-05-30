//
//  HttpItem.swift
//  CleanSwift
//
//  Created by Johnny Sousa on 30/05/23.
//

import Foundation

protocol HTTPItemProtocol {
    
    var responseType: String { get }
    var statusCodes: [HTTPStatusCode] { get set }
    
}

protocol HTTPDogItemProtocol: Decodable {
    
    var statusCode: Int { get }
    var title: String { get }
    var urlImage: HTTPDogURLImage { get }
    
}

struct HTTPItem: HTTPItemProtocol {
    
    let responseType: String
    var statusCodes: [HTTPStatusCode]
    
}

struct HTTPDogItem: HTTPDogItemProtocol {
    
    let statusCode: Int
    let title: String
    let urlImage: HTTPDogURLImage
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case title
        case urlImage = "image"
    }
}

struct HTTPDogURLImage: Decodable {
    let jpg: String
}
