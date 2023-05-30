//
//  HTTPInteractor.swift
//  CleanSwift
//
//  Created by Johnny Sousa on 30/05/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HTTPDogBusinessLogic {
    func doRequest(request: HTTPDog.Request)
}

protocol HTTPDogDataStore {
    
    var httpStatusCode: HTTPStatusCode? { get set }
    
}

class HTTPDogInteractor: HTTPDogDataStore {
    
    private let worker: HTTPDogWorkerLogic?
    
    var httpStatusCode: HTTPStatusCode?
    var presenter: HTTPDogPresentationLogic?
    
    init(worker: HTTPDogWorkerLogic = HTTPDogWorker()) {
        self.worker = worker
    }
}

// MARK: - HTTPDogBusinessLogic
extension HTTPDogInteractor: HTTPDogBusinessLogic {
    
    func doRequest(request: HTTPDog.Request) {
        worker?.fetchHttpDogItem(statusCode: httpStatusCode?.rawValue ?? 404) { result in
            switch result {
            case .success(let httpDogItem):
                let response = HTTPDog.Response.dataHttpDogItem(item: httpDogItem)
                
                self.presenter?.presentResponse(response: response)
            case .failure(let error):
                print("DEBUG:", error)
            }
        }
    }
}
