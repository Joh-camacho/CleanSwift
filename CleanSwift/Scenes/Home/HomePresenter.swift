//
//  HomePresenter.swift
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

protocol HomePresentationLogic {
    func presentResponse(response: Home.Response)
}

class HomePresenter: HomePresentationLogic {
    
    weak var viewController: HomeDisplayLogic?
    
    // MARK: Present Responses
    func presentResponse(response: Home.Response) {
        switch response {
        case .dataHttpItems(let items):
            displayHttpItems(items)
        case .errorFetchHttpItems(let error):
            displayFetchError(error)
        case .selectHttp(let item):
            displayHttpItem(item)
        }
    }
}

// MARK: - Private functions
extension HomePresenter {
    
    private func displayHttpItems(_ items: [HTTPStatusCode]) {
        var httpItems: [HTTPItemProtocol] = []
        
        for item in items {
            let responseType = item.responseType.description
            
            if let index = httpItems.firstIndex(where: { $0.responseType == responseType }) {
                httpItems[index].statusCodes.append(item)
            } else {
                let httpItem = HTTPItem(responseType: responseType, statusCodes: [item])
                
                httpItems.append(httpItem)
            }
        }
        
        let viewModel = Home.ViewModel.httpItems(items: httpItems)
        
        viewController?.displayViewModel(viewModel: viewModel)
    }
    
    private func displayHttpItem(_ item: HTTPStatusCode) {
        let viewModel = Home.ViewModel.selectHttp(item: item)
        
        viewController?.displayViewModel(viewModel: viewModel)
    }
    
    private func displayFetchError(_ error: Error) {
        let viewModel = Home.ViewModel.errorFetchHttpItems(message: error.localizedDescription)
        
        viewController?.displayViewModel(viewModel: viewModel)
    }
}
