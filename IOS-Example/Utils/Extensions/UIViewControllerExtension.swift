//
//  UIViewControllerExtension.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import UIKit

extension UIViewController: Presentable {
    
    func showViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentViewController(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: {})
    }
    
}
