//
//  AlbumsViewController.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let albumsView = AlbumsView()
    
    // MARK: - Public properties
    
    var presenter: AlbumsViewOutput?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = albumsView
        setupNavigation()
    }
    
    // MARK: - Private methods
    
    private func setupNavigation() {
        navigationItem.title = "Albums"
    }
    
    // MARK: - Action handlers
    
}

extension AlbumsViewController: AlbumsViewInput {
    
}
