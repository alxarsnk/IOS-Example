//
//  AlbumDetailPresenter.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation
import RealmSwift

class AlbumDetailPresenter {
    
    // MARK: - Private properties
    
    private var album: Album
    private var dataSourceType: AlbumsDataSourceType
    private var fetchedPosts: Posts = []
    private var isItemSaved: Bool = false {
        didSet {
            view?.setupSaveButton(isSaved: isItemSaved)
        }
    }
    
    private let networkService = NetworkService()
    private let dataBaseManager = DataBaseManager.shared
    
    // MARK: - Public properties
    
    weak var view: (AlbumDetailViewInput & Presentable)?
    
    init(album: Album, dataSourceType: AlbumsDataSourceType) {
        self.album = album
        self.dataSourceType = dataSourceType
    }
    
}

extension AlbumDetailPresenter: AlbumDetailViewOutput {
    
    var albumNumber: Int {
        get {
            album.id
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
        switch dataSourceType {
        case .network:
            view?.setupAnimating(isAnimating: true)
            networkService.getAlbumDetail(albumId: album.id) { [weak self] posts, error in
                guard let self = self else { return }
                self.view?.setupAnimating(isAnimating: false)
                if error != nil {
                    completion?()
                } else if let posts = posts {
                    self.fetchedPosts = posts
//                    self.album.posts = try! List<Post>(from: posts as! Decoder)
                    self.view?.reloadData()
                    completion?()
                } else {
                    completion?()
                    return
                }
            }
        case .local:
//            fetchedPosts = Array(album.posts ?? List<Post>())
            view?.reloadData()
            completion?()
        }
    }
    
    func postPressed(at indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let contoller = MainRouter.shared.createPostDetail(post: post)
        contoller.modalPresentationStyle = .fullScreen
        view?.presentViewController(contoller)
    }
    
    func checkForItem() {
        dataBaseManager.isAlbumExists(album: album) { [weak self] isExists in
            self?.isItemSaved = isExists
        }
    }
    
    func saveItem() {
        dataBaseManager.saveAlbum(album) { [weak self] in
            self?.isItemSaved.toggle()
        }
    }
    
    func deleteItem() {
        dataBaseManager.deleteAlbum(album: album) { [weak self] in
            self?.isItemSaved.toggle()
        }
    }
    
}
