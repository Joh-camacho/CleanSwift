//
//  HTTPView.swift
//  CleanSwift
//
//  Created by Johnny Sousa on 30/05/23.
//

import UIKit

struct HTTPDogItemView {
    
    let dataImage: Data
    
}

class HTTPDogView: UIView {
    
    lazy var dogImageView: UIImageView = {
        let dogImageView = UIImageView()
        
        dogImageView.contentMode = .scaleAspectFit
        dogImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return dogImageView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        return activityIndicator
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(dogImageView)
        addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dogImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dogImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dogImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dogImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: dogImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: dogImageView.centerYAnchor),
        ])
    }
}
