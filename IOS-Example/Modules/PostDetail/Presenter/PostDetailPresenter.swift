//
//  PostDetailPresenter.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation

class PostDetailPresenter {
    
    // MARK: - Private properties
    
    private var post: Post
    
    // MARK: - Public properties
    
    weak var view: (PostDetailViewInput & Presentable)?
    
    // MARK: - Init
    
    init(post: Post) {
        self.post = post
    }
}

extension PostDetailPresenter: PostDetailViewOutput {
    
    var postDetail: Post {
        get {
            post
        }
    }
    
}
