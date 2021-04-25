//
//  DataBaseManager.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation
import RealmSwift

class DataBaseManager {
    
    // MARK: - Private properties
    
    private var localRealm: Realm
    
    // MARK: - Internal properties
    
    static let shared = DataBaseManager()
    
    // MARK: - Init
    
    private init() {
        localRealm = try! Realm()
    }
    
    // MARK: - Albums
    
    func saveAlbum(_ album: Album, completion: @escaping () -> Void) {
        try! localRealm.write {
            localRealm.add(album.copy())
            completion()
        }
    }
    
    func getAlbums(completion: @escaping (Albums?) -> Void) {
        completion(Array(localRealm.objects(Album.self)))
    }
    
    func isAlbumExists(album: Album, completion: @escaping (Bool) -> Void) {
        if localRealm.objects(Album.self).first(where: { $0.id == album.id }) != nil {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func deleteAlbum(album: Album, completion: @escaping () -> Void) {
        if let deletedItem = localRealm.objects(Album.self).first(where: { $0.id == album.id }) {
            try! localRealm.write {
                localRealm.delete(deletedItem)
                completion()
            }
        }
    }
    
    // MARK: - Posts
    
    func savePosts(_ posts: Posts, completion: @escaping () -> Void) {
        try! localRealm.write {
            localRealm.add(posts.map {$0.copy()})
            completion()
        }
    }
    
    func getPosts(by albumId: Int, completion: @escaping (Posts?) -> Void) {
        completion(localRealm.objects(Post.self).filter { $0.albumId == albumId })
    }
    
    func deletePosts(by albumId: Int, completion: @escaping () -> Void) {
        getPosts(by: albumId) { [weak self] posts in
            try! self?.localRealm.write {
                self?.localRealm.delete(posts ?? [])
                completion()
            }
        }
    }
    
}

