//
//  AlbumDetailPresenter.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation

class AlbumDetailPresenter {
    
    // MARK: - Private properties
    
    private var albumId: Int
    private var fetchedPosts: Posts = []
    
    private let networkService = NetworkService()
    
    // MARK: - Public properties
    
    weak var view: (AlbumDetailViewInput & Presentable)?
    
    init(albumId: Int) {
        self.albumId = albumId
    }
    
}

extension AlbumDetailPresenter: AlbumDetailViewOutput {
    
    var albumNumber: Int {
        get {
            albumId
        }
    }
    
    var posts: Posts {
        get {
            fetchedPosts
        }
        set {
            fetchedPosts = newValue
        }
    }
    
    func loadData(completion: (() -> Void)?) {
        view?.setupAnimating(isAnimating: true)
        networkService.getAlbumDetail(albumId: albumId) { [weak self] posts, error in
            guard let self = self else { return }
            self.view?.setupAnimating(isAnimating: false)
            if let error = error {
                completion?()
            } else if let posts = posts {
                self.fetchedPosts = posts
                self.view?.reloadData()
                completion?()
            } else {
                completion?()
                return
            }
        }
    }
    
    func postPressed(at indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let contoller = MainRouter.shared.createPostDetail(post: post)
        contoller.modalPresentationStyle = .fullScreen
        view?.presentViewController(contoller)
    }
    
    
}
