//
//  HTTPViewController.swift
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

protocol HTTPDogDisplayLogic: AnyObject {
    func displayViewModel(viewModel: HTTPDog.ViewModel)
}

class HTTPDogViewController: UIViewController {
    
    private let mainView = HTTPDogView()
    
    var interactor: HTTPDogBusinessLogic?
    var router: (HTTPDogRoutingLogic & HTTPDogDataPassing)?
    
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
        
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = HTTPDogInteractor()
        let presenter = HTTPDogPresenter()
        let router = HTTPDogRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = mainView
        
        fetchHttpDog()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func fetchHttpDog() {
        let request = HTTPDog.Request.fetchHttpDogItem
        
        interactor?.doRequest(request: request)
        
        mainView.activityIndicator.startAnimating()
    }
}

// MARK: - HTTPDogDisplayLogic
extension HTTPDogViewController: HTTPDogDisplayLogic {
    
    func displayViewModel(viewModel: HTTPDog.ViewModel) {
        switch viewModel {
        case .httpDogItem(let item):
            let image = UIImage(data: item.dataImage)
            
            mainView.dogImageView.image = image
            mainView.activityIndicator.stopAnimating()
        }
    }
}
