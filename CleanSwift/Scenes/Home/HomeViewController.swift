//
//  HomeViewController.swift
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

protocol HomeDisplayLogic: AnyObject {
    func displaySomething(viewModel: Home.Fetch.ViewModel)
    func displaySelectHttp(viewModel: Home.SelectHttp.ViewModel)
}

class HomeViewController: UITableViewController {
    
    private var displayedHttps: [Home.Fetch.ViewModel.DiplayedHttp] = []
    
    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?
    
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
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        
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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "HTTP Status Codes"
        
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        
        fetchHttps()
    }
    
    // MARK: Fetch HTTPS
    func fetchHttps() {
        let request = Home.Fetch.Request()
        interactor?.fetchHttps(request: request)
    }
}

// MARK: - HomeDisplayLogic
extension HomeViewController: HomeDisplayLogic {
    
    func displaySomething(viewModel: Home.Fetch.ViewModel) {
        displayedHttps = viewModel.displayedHttps
        
        tableView.reloadData()
    }
    
    func displaySelectHttp(viewModel: Home.SelectHttp.ViewModel) {
        router?.routeToHttp()
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayedHttp = displayedHttps[indexPath.section]
        let statusCode = displayedHttp.statusCodes[indexPath.row]
        let request = Home.SelectHttp.Request(httpStatusCode: statusCode)
        
        interactor?.didSelectHttp(request: request)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return displayedHttps.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let displayedHttp = displayedHttps[section]
        
        return displayedHttp.statusCodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let displayedHttps = displayedHttps[indexPath.section]
        let statusCode = displayedHttps.statusCodes[indexPath.row]
        
        cell.textLabel?.text = "\(statusCode.rawValue)"
        
        return cell
    }
}
