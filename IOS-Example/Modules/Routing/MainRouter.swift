//
//  MainRouter.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import UIKit

class MainRouter {
    
    // MARK: - Shared properties
    
    static let shared  = MainRouter()
    
    // MARK: - Init
    
    private init() { }
    
    func createTabBarModule() -> UIViewController {
        return TabBarController(
            firstViewController: createAlbumsModule(),
            secondViewController: UIViewController(),
            theirdViewController: UIViewController()
        )
    }
    
    func createAlbumsModule() -> UIViewController {
        let view = AlbumsViewController()
        let presenter = AlbumsPresenter()
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
}
