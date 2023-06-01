//
//  UIViewController+Extension.swift
//  CleanSwift
//
//  Created by Johnny Sousa on 30/05/23.
//

import UIKit

extension UIViewController {
    
    func presentErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            alertController.dismiss(animated: true)
        }
        
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
}
