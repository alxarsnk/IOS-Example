//
//  Post.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import  Foundation

typealias Posts = [Post]

struct Post: Codable {
    
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
}
