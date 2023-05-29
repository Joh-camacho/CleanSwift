//
//  HomeModels.swift
//  CleanSwift
//
//  Created by Johnny Sousa on 26/05/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Home {
    
    // MARK: Use cases
    enum Fetch {
        struct Request {
            
        }
        
        struct Response {
            var httpStatusCodes: [HTTPStatusCode]
        }
        
        struct ViewModel {
            struct DiplayedHttp {
                var responseType: String
                var statusCodes: [HTTPStatusCode]
            }
            
            var displayedHttps: [DiplayedHttp]
        }
    }
    
    enum SelectHttp {
        struct Request {
            var httpStatusCode: HTTPStatusCode
        }
        
        struct Response {
            
        }
        
        struct ViewModel {
            
        }
    }
}