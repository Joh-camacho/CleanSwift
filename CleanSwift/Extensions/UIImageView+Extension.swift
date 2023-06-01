//
//  UIImageView+Extension.swift
//  CleanSwift
//
//  Created by Johnny Sousa on 31/05/23.
//

import UIKit

extension UIImageView {
    
    func downloadedFrom(url: URL, completion: @escaping (Result<UIImage, Error>) -> () = { _ in }) {
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.loadData(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NetworkError.invalidStatusCode))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            guard let image = UIImage(data: data) else {
                completion(.failure(NetworkError.decodeError))
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
                
                completion(.success(image))
            }
        }
    }
    
    func downloadedFrom(link: String, completion: @escaping (Result<UIImage, Error>) -> () = { _ in }) {
        guard let url = URL(string: link) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        downloadedFrom(url: url, completion: completion)
    }
}
