//
//  PostDetailModule.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation

protocol PostDetailViewInput: AnyObject { }

protocol PostDetailViewOutput {
    var postDetail: Post { get }
}
