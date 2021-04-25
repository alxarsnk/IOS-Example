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
        setupDelegates()
        presenter?.loadData(completion: nil)
    }
    
    // MARK: - Private methods
    
    private func setupNavigation() {
        navigationItem.title = "Albums"
    }
    
    private func setupDelegates() {
        albumsView.tableView.delegate = self
        albumsView.tableView.dataSource = self
        albumsView.refreshControlDelegate = self
    }
    
}

extension AlbumsViewController: AlbumsViewInput {
    
    func reloadData() {
        albumsView.tableView.reloadData()
    }
    
    func setupAnimating(isAnimating: Bool) {
        isAnimating
            ? albumsView.activityIndicator.startAnimating()
            : albumsView.activityIndicator.stopAnimating()
    }
    
}

extension AlbumsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.albums.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AlbumsCell.self)) as? AlbumsCell,
              let model = presenter?.albums[indexPath.row] else { return UITableViewCell() }
        cell.configure(with: model)
        return cell
    }
    
}

extension AlbumsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.albumPressed(at: indexPath)
    }
    
}

extension AlbumsViewController: RefreshControlDelegate {

    func refreshData(completion: @escaping () -> Void) {
        presenter?.loadData(completion: completion)
    }

}
