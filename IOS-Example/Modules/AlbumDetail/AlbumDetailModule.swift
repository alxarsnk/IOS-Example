//
//  AlbumDetailModule.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation

protocol AlbumDetailViewInput: AnyObject {
    func reloadData()
    func setupAnimating(isAnimating: Bool)
    func setupSaveButton(isSaved: Bool)
}

protocol AlbumDetailViewOutput {
    var albumNumber: Int { get }
    var posts: Posts { get set }
    
    func loadData(completion: (() -> Void)?)
    func postPressed(at indexPath: IndexPath)
    func checkForItem()
    func saveItem()
    func deleteItem()
}
