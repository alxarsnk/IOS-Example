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
            firstViewController: createAlbumsModule(dataSourceType: .network),
            secondViewController: createAlbumsModule(dataSourceType: .local),
            theirdViewController: UIViewController()
        )
    }
    
    func createAlbumsModule(dataSourceType: AlbumsDataSourceType) -> UIViewController {
        let view = AlbumsViewController()
        let presenter = AlbumsPresenter(dataSourceType: dataSourceType)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    func createAlbumDetailModule(album: Album, dataSourceType: AlbumsDataSourceType) -> UIViewController {
        let view = AlbumDetailViewController()
        let presenter = AlbumDetailPresenter(album: album, dataSourceType: dataSourceType)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    func createPostDetail(post: Post) -> UIViewController {
        let view = PostDetailViewController()
        let presenter = PostDetailPresenter(post: post)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
}
