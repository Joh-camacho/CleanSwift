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

struct HTTPItem: HTTPItemProtocol {
    
    let responseType: String
    var statusCodes: [HTTPStatusCode]
    
}
