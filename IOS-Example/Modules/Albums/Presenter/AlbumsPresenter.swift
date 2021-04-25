//
//  AlbumsPresenter.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation

class AlbumsPresenter {
    
    // MARK: - Private properties
    
    private let networkService = NetworkService()
    
    private var fetchedAlbums: Albums = []
    
    // MARK: - Internal properties
    
    weak var view: (AlbumsViewInput & Presentable)?
    
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
        view?.setupAnimating(isAnimating: true)
        networkService.getAlbums { [weak self] (albums, error) in
            guard let self = self else { return }
            self.view?.setupAnimating(isAnimating: false)
            if let error = error {
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
    }
    
    func albumPressed(at indexPath: IndexPath) {
        
    }
    
}
