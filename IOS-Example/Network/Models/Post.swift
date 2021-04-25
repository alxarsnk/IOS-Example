//
//  Post.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import  Foundation
import RealmSwift

typealias Posts = [Post]

class Post: Object, Codable {
    
    @objc dynamic var albumId: Int = Int()
    @objc dynamic var id: Int = Int()
    @objc dynamic var title: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var thumbnailUrl: String = ""
    
    func copy() -> Post {
        let post = Post()
        post.albumId = albumId
        post.id = id
        post.title = title
        post.url = url
        post.thumbnailUrl = thumbnailUrl
        return post
    }
    
}
