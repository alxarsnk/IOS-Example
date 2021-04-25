//
//  AlbumsPresenter.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation

enum AlbumsDataSourceType {
    case network
    case local
}

class AlbumsPresenter {
    
    // MARK: - Private properties
    
    private let networkService = NetworkService()
    private let dataBaseManager = DataBaseManager.shared
    
    private var fetchedAlbums: Albums = []
    private var dataSourceType: AlbumsDataSourceType
    
    // MARK: - Internal properties
    
    weak var view: (AlbumsViewInput & Presentable)?
    
    // MARK: - Init
    
    init(dataSourceType: AlbumsDataSourceType) {
        self.dataSourceType = dataSourceType
    }
    
}

extension AlbumsPresenter: AlbumsViewOutput {
    
    var albums: Albums {
        get {
            fetchedAlbums
        }
        set {
            fetchedAlbums = newValue
        }
    }
    
    func loadData(completion: (() -> Void)?) {
        switch dataSourceType {
        case .network:
            view?.setupAnimating(isAnimating: true)
            networkService.getAlbums { [weak self] (albums, error) in
                guard let self = self else { return }
                self.view?.setupAnimating(isAnimating: false)
                if error != nil {
                    completion?()
                } else if let albums = albums {
                    self.fetchedAlbums = albums
                    self.view?.reloadData()
                    completion?()
                } else {
                    completion?()
                    return
                }
            }
        case .local:
            dataBaseManager.getAlbums() { [weak self] localAlbums in
                guard let self = self else { return }
                self.fetchedAlbums = localAlbums ?? []
                self.view?.reloadData()
                completion?()
            }
        }
        
    }
    
    func albumPressed(at indexPath: IndexPath) {
        let album = albums[indexPath.row]
        let controller = MainRouter.shared.createAlbumDetailModule(
            album: album,
            dataSourceType: dataSourceType
        )
        view?.showViewController(controller)
    }
    
}
