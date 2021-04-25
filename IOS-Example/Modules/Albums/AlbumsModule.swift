//
//  AlbumsModule.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation

protocol AlbumsViewInput: AnyObject {
    func reloadData()
    func setupAnimating(isAnimating: Bool)
}

protocol AlbumsViewOutput {
    var albums: Albums { get set }
    
    func loadData(completion: (() -> Void)?)
    func albumPressed(at indexPath: IndexPath)
}
